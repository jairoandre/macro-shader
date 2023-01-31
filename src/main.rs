use std::fs;

use macroquad::{
    prelude::*,
};

#[macroquad::main("shader")]
async fn main() {
    let vertex_shader = fs::read_to_string("assets/vertex.glsl").unwrap();
    let fragment_shader = fs::read_to_string("assets/fragment.glsl").unwrap();
    let material = load_material(
        vertex_shader.as_str(),
        fragment_shader.as_str(),
        MaterialParams {
            uniforms: vec![("Proportion".to_owned(), UniformType::Float1)],
            ..Default::default()
        },
    ).unwrap();
    loop {
        clear_background(BLACK);
        material.set_uniform("Proportion", screen_width() / screen_height());
        gl_use_material(material);
        draw_rectangle(0.0, 0.0, screen_width(), screen_height(), WHITE);
        gl_use_default_material();
        next_frame().await
    }
}
