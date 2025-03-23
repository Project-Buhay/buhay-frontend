# Buhay Frontend

A Flutter-based application providing user-friendly route planning system.

## Overview
- [Buhay Frontend](#buhay-frontend)
  - [Overview](#overview)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [macOS Setup](#macos-setup)
    - [Windows Setup](#windows-setup)
  - [Running the App](#running-the-app)
  - [Contributing](#contributing)


## Prerequisites
- FVM-Flutter
- Android Studio



## Installation
The following are based from the [Developer Docs](https://docs.google.com/document/d/1uRG7_ixBq6qiYxcPjxTsgFeEvqFMlDZ9RML6kRRRwPc/edit?usp=sharing).

### macOS Setup
1. **Install FVM via Homebrew**  
   ```
   brew tap leoafarias/fvm
   brew install fvm
   ```

2. Restart your terminal to ensure the new commands are recognized.
   
3. Check FVM version:
    ```
    fvm --version
    ```

4. Install a specific Flutter version (e.g., 3.19.6):
    ```
    fvm install 3.19.6
    ```

5. Run Flutter Doctor via FVM:
    ```
    fvm spawn 3.19.6 doctor --verbose
    ```

6. Set a global FVM version (optional):
    ```
    fvm global 3.19.6
    ```

7. Update your PATH (e.g., in ~/.zshrc or ~/.bashrc):
    ```
    nano ~/.zshrc
    # Add the following line at the end:
    export PATH="/path:$PATH"
    ```

    Replace /path with the correct path to your FVM bin or your chosen Flutter SDK directory if needed.

8. Switch Flutter versions (e.g., 3.24.5):
    ```
    fvm use 3.24.5
    ```

9. List installed Flutter versions:
    ```
    fvm list
    ```

10. Verify Flutter version:
    ```
    fvm flutter --version
    ```


### Windows Setup 
1. Install Chocolatey from its [official site](https://chocolatey.org/install). To check if installation is successful:
    ```
    choco -v
    ```

2. If you encounter any issues,
   - Check if you have installed any packages using choco, you might need to reinstall them later on.
     - Run `choco list`
     - Take note of the packages installed. You might need to reinstall them if you’re using them in any of your programs.
     - Kindly search online on how to reinstall the packages.
   - Uninstall chocolatey (assuming you have no prior installations made using chocolatey).
     - Run powershell as administrator
     - Run the command cd C:\programdata
     - Run ls check if chocolatey directory is there
     - Run rm chocolatey then enter.
     - If above command does not work try Remove-Item C:\programdata\chocolatey -Recurse -Force
   - Install chocolatey.


3. Install FVM:
    ```
    choco install fvm
    ```

4. Restart your terminal.

5. Check FVM version:
    ```
    fvm --version
    ```

6. Install a specific Flutter version:
    ```
    fvm install 3.19.6
    ```

7. Run Flutter Doctor:
    ```
    fvm spawn 3.19.6 doctor --verbose
    ```

8. Set a global FVM version:
    ```
    fvm global 3.19.6
    ```

9. Update Environment Variables
    - Open “Environment Variables” on Windows
    - Click Path → Edit
    - Change the Flutter path to:
    ```
    C:\Users\{Username}\fvm\default\bin
    ```

10. Switch Flutter versions:
    ```
    fvm use 3.24.5
    ```

11. List installed Flutter versions:
    ```
    fvm list
    ```

12. Verify Flutter version:
    ```
    fvm flutter --version
    ```

    > [!NOTE]  
    > 3.24.5 version should be `LOCAL` and 3.19.6 version should be `GLOBAL`.


<br>


## Running the App
1. Clone the repository
    ```
    git clone <to-be-inserted>
    cd <buhay-frontend>
    ```

2. To use API keys securely, **create a `.env` file** in the root of the project (alongside `pubspec.yaml`) with the following parameters for the API keys.
    ```
    to-be-added-by-the-dev
    ```

3. Install dependencies
    ```
    fvm flutter pub get
    ```

4. Generate `env.g.dart` file
    ```
    fvm dart run build_runner build --delete-conflicting-outputs
    ```

5. **Important Step!** To avoid error in the next step, go to `android/local.properties`, and add the following parameters for the API keys (to be filled by the developer).
    ```
    APPWRITE_PROJECT_ID=
    GOOGLE_MAPS_API_KEY_1=
    ```

    > [!NOTE]
    > There's no quotation marks when inputting the API key.

6. Open Android Studio, and open the directory of the repository.

7. Search for Flutter in `File/Settings/Plugins` and install it!

8. Under Flutter Device Selection dropdown, boot up `Medium Phone API 36 (mobile)`. If you don't see this, try to refresh the dropdown. To check if this is live and ready, go to `Tools/Device Manager`. 
   
    > [!NOTE]
    > If you are having trouble, restart the mobile, then perform a `Cold Boot`!

9.  Run the app in the terminal! See the app running in `Running Devices`.
    ```
    fvm flutter run
    ```

    > [!NOTE]
    > If you are going to actually use the app with its functionality in the backend, make sure to also run the backend locally!


<br>

## Contributing
1. Fetch the latest changes from the remote repository.
    ```
    git fetch
    git checkout main
    git pull
    ```

2. After pulling the latest changes, create a feature branch:
    ```
    # Create a new branch for your feature or fix
    git checkout -b feature/awesome-feature
    ```

    Example:
    ```
    git checkout -b feature/login-page # or 
    git checkout -b bugfix/overflow-issue
    ```

3. From that same branch, make your changes.
    ```
    # Add your changes
    git add .

    # Commit with a meaningful message
    git commit -m "feat: add awesome feature"

    # Push the changes to your branch
    git push origin feature/awesome-feature
    ```

4. Finally, open up a **Pull Request** targeting the main branch! Add a descriptive title and a summary of your changes! The PR would automatically then require a review before merging it to main.