#  Recipe App

## Description
   With the recipe app, users will be able to explore a wide rage of recipes from different origins and also view a video detailing all the steps of the recipes.
   
## Features
    1. Displays a list of all the available recipes with their name and cusine type.
    2. Once the user taps on a recipe, the app takes them to a detail page where they can view a video of the recipe.

## Demo

Video Recording: ScreenRecording_01-17-2025 16-31-28_1.MP4.zip

Screenshots: 

![Image](https://github.com/user-attachments/assets/4af60d91-5978-4f3b-8bc5-ba0a05c57a0f)

![Image](https://github.com/user-attachments/assets/899ab5f5-2179-40ce-a30d-f1f672df6ff2)


### Focus Areas: 
    For this project I focus on 2 things:
    1. UI: I wanted the list of recipes to look good an appealing to the user. At the same time I wanted to display all the crusial/important information for each list item - which in this case was the name and cusine of the recipe. So for the first creen itself user has enough information to make a decision.
    2. Caching: Once I implemented the list and the network calls, I profiled the app. While scrolling down the list, I could see network calls being made. Which was obvious as we are polling more data. But even when scroll up, I could see a lot of network traffic. This was happening cause I wasn't caching the images. So when I scroll up, even though we have used the images before, the app was still making network calls to download the images. 
        So I created a "ImageLoader" component which maked the network call to download the images and also created a cache to store the images. This significantly reduced the network traffic.

### Time Spent: 
    In terms of days it took me approximately a week to complete the project (with other work commitments). Here's the time distribusion:
    
    1. Creating the list view and setting up the UI with dummy data - 1.5 hr
    2. Creating the detail view - 1 hr
    3. Creating model and view model with network calls - 2 hr
    4. Creating cache and profiling - 1.5 hr
    5. Unit tests - 0.5 hr
    
    Total: 6.5 hr

### Trade-offs and Decisions: 
    1. I created a separate component for the image "RAUrlImageView". I could have used AsyncImage but I won't be able to cache the images in that case so I created this component. AsyncImage could have saved time but would have costed more in terms of network calls. 

### Weakest Part of the Project: 
    1. I could have spent more time in make the detail view better. Maybe by creating a custome video play or defining a UI/UX a bit more.
    2. Could have cleaned the Recipe model a bit more to remove unused data. For instance, I am not using the sourceURL parameter anywhere.
    3. Can reduce the number of network calls more. If this were a production app, I would have spent more time on improving the cache, maybe cache the whole recipe object instead of just the image. 

### Additional Information:
    1. I was hoping to make the image fill up the whole "imageCard". But not sure if it's the shape/size of the image, it wasn't working. So I cliped it's shape to a circle.

