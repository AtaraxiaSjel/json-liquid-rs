fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args: Vec<String> = std::env::args().collect();
    if args.len() < 3 {
        return Err("Too few arguments provided!".into());
    }
    let json_data = std::fs::read_to_string(args.get(1).unwrap())?;
    let json_template = serde_json::from_str(args.get(2).unwrap())?;
    let json = serde_json::from_str(&json_data)?;

    let template = liquid_json::LiquidJson::new(json_template);
    let result = template.render(&json)?;

    println!("{}", serde_json::to_string_pretty(&result)?);
    Ok(())
}
