// Utils function being called in main.rs

use cfonts::*;
use yansi::Paint as _;

pub fn ut11() {
    println!("{}", "ut11".green());
}

// Banner function here
pub fn ban1() {
    let mytext = "Hyerfine TEsting";

    say(Options {
        text: String::from(mytext),
        font: Fonts::FontTiny,
        colors: vec![Colors::Candy],
        letter_spacing: 2,
        line_height: 2,
        independent_gradient: true,
        transition_gradient: true,
        ..Options::default()
    });
}
