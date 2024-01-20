use whichlang::{detect_language};

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn detect(input: *const u8) -> i32 {
    // Safety: Assuming input is a null-terminated string
    let cstr = unsafe { std::ffi::CStr::from_ptr(input as *const i8) };

    // Convert the C string to a Rust string
    if let Ok(s) = cstr.to_str() {
        let lang = detect_language(s);

        return lang as i32
    }

    // Return a default language if conversion fails
    return 0;
}
