// Commads here
use std::process::Command;
use yansi::Paint as _;

// Testing out simple system commands
pub fn func1() {
    let tx1 = "
---
ls -al Command output 
---
    ";

    let output = Command::new("ls")
        .arg("-al")
        .output()
        .expect("Failed to execute process");

    println!("{}", tx1.green());
    println!("status: {}", output.status);
    println!("stdout: {}", String::from_utf8_lossy(&output.stdout));
    println!("stderr: {}", String::from_utf8_lossy(&output.stderr));
}

// Hyperfine Command test
pub fn func2() {
    let tx1 = "
---
Hyperfine Testing
---
    ";

    let output = Command::new("ls")
        .arg("-al")
        .output()
        .expect("Failed to execute process");

    println!("{}", tx1.green());
    println!("status: {}", output.status);
    println!("stdout: {}", String::from_utf8_lossy(&output.stdout));
    println!("stderr: {}", String::from_utf8_lossy(&output.stderr));
}
