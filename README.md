# Some details

## How to start new python project

1. Need to create a venv, don't matter it will be from `poetry` or `pip`, 
you need to create a link (`ln -s path_to_venv_folder path_to_venv_in_local_project`).

2. After that, you can work with this virtual environment BUT! 
DO NOT START NVIM from that (I don't know why..., but NVIM become a crazy from evironment)

3. After you prepare your environment, you need to add a several libs:
- `debugpy` (for debbuging), 
- `black` (for formatting)

4. Create a `pyrightconfig.json` file, with this content:
```json
{
  "venvPath": "venv",
  "venv": "."
}
```
First, it's folder name of venv folder, second key, it's a path to venv folder

5. In `pyproject.toml` you can setup some features, like formatter work, tests and other, my config for formatter is:
```yaml
# for formatter
[tool.black]
exclude = '''
    (^|/)(\..*|venv|build|dist)/
'''
skip-string-normalization = true
color = true

# for pytest
[tool.pytest.ini_options]
markers = [
    "test_mark_name_1: first test",
    "test_mark_name_2: second test",
]
DJANGO_SETTINGS_MODULE = "project_name.settings"
python_files = "test*.py"
filterwarnings =[
    "ignore::DeprecationWarning"
]
addopts = "-vv -v --cov=. --cov-report=term  --cov-report=html" 
addopts = "-vv -v" # for development

```


6. Now, you can use debbuger and start the projects:
- Start Django: Leader + F3
- Start main.py: Leader + F1
- Start current file: Leader + F2


# How to start rust projects

... In development ...


