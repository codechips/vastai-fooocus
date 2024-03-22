# vast.ai-fooocus

Docker image to run Fooocus on [Vast.ai](https://cloud.vast.ai/?ref_id=118093).

## Description

What's included in this image?

- Latest Fooocus 2.3.0 [link](https://github.com/lllyasviel/Fooocus)
- Filebrowser [link](https://filebrowser.org/)
- JuggernautXL V9 + RunDiffusion Photo 2 [link](https://civitai.com/models/133005/juggernaut-xl)

## How to run Fooocus on Vast.ai

Below are instructions on how to run this Docker image on Vast.ai

### 1. Use my Vast.ai template

Click on the [template link](https://cloud.vast.ai/?ref_id=118093&creator_id=118093&name=vastai-fooocus) to view it on Vast.ai

### 2. Edit the template

Both Fooocus and Filebrowser are protected by credentials by default. The username for both is `admin`.

Make sure to change your password in template by editing `LOGIN_PASSWORD` environment variable passed to Docker on start!

Example `LOGIN_PASSWORD=sUp3r$3kr3t!`

There is a custom Fooocus preset called `next` that uses **JuggernautXL V9** model. If you want to start Foocus with this preset change `FOOOCUS_PRESET` environment variable to `next`.

Example `FOOOCUS_PRESET=next`

Other valid presets are `anime`, `lcm`, `lightning`, `realistic`, `sai` or `default`

### 3. Create a Vast.ai instance

Find an instance close to your location (filter by continent) so you get a low ping.

Filter by GPU. If you just want to play around RTX3090 is enough.

Launch the instance and go to Instances in Vast.ai.

The Docker image is large (7GB) so it will take around 7-8 minutes to start the instance.

### 4. Login to Fooocus and Filebrowser

When the instance is up (when you see **\>\_CONNECT** button) click on the instance IP address on the top and check what ports 3000 and 4000 are mapped to.

Filebrowser listens on port 4000 and Fooocus on port 3000.

Copy the instance IP together with the port and paste it into your browser.

Start with the Filebrowser because Foocus needs longer time to start (it needs to download models on upstart).

Once you log in to Filebrowser you will see a `logs` directory. In there you will file a `foooocus.log` file. Open it to see the progress of the model downloads.

When you see in the log file that JuggernautXL (or some other model) is downloaded you can finally login to Fooocus (port: 3000) in your browser.

### 5. Destroy the instance

When you are done with you work you can either destroy or stop the instance (so you don't waste your money).

### Screenshots

![Vast.ai template view](screenshots/vastai-fooocus-template.jpg?raw=true "Vast.ai template view")
![Filebrowser](screenshots/vastai-fooocus-filebrowser.jpg?raw=true "Filebrowser running on the instance")
![Vast.ai instance view](screenshots/vastai-fooocus-instance.jpg?raw=true "Vast.ai instance view")
![Vast.ai instance ports](screenshots/vastai-fooocus-ports.jpg?raw=true "Vast.ai instance ports")

## FAQ

### Will my work be persisted when the instance is destroyed?

No. Make sure to download it using Filebrowser (or `scp` if you are 1337).

### I can't access Fooocus WebUI for some reason

It can be one of two. Something went wrong during instance creation or Fooocus is still loading. Check `logs/fooocus.log` file in the Filebrowser for debugging.

### Will this image run on RunPod too?

Probably not but I haven't try.

## TODO

- Build Docker images using GH actions
- Create multiple Fooocus version images and Cuda versions
- Add custom provision script
- Put Fooocus behind a reverse proxy

## LICENCE

MIT
