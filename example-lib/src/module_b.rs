pub mod module_c;

pub fn hello() {
    println!("hello b")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hello() {
        hello();
    }
}
