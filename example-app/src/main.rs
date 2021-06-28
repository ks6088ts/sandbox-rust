use example_lib::{module_a, module_b};

fn main() {
    module_a::hello();
    module_b::hello();
    module_b::module_c::hello();
}
