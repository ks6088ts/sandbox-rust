pub fn hello() {
    println!("hello c");
}
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hello() {
        hello();
    }
}
