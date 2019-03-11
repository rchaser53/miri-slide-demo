use std::mem;
fn access_uninitialize() {
    unsafe {
        let mut uninit_vec: Vec<u32> = mem::uninitialized();
        uninit_vec.push(1);
    }
}
