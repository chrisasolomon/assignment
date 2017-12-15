# assignment

As per your instructions, I did what I could with the time I had available. The result is a skeleton of a program, with no polish applied. I mostly succeded in ensuring that all the program components had access to the information they needed to complete their tasks. To that end, I concentrated on moving the String data through the structure, leaving the pictures for when there was more time.

Now, again, as requested, here's how I would do the rest.

The application, as submitted, is not functioning correctly. So I would start by resolving an issue in presenting a detail view. It has something to do with mismatch in frame dimentions between presented and presenting views. I might present the detail view modally, or perhaps by way of a UINavigationController. At the very least I would use an icon for the dismiss button.

If I had my way, I would probably strip the JSON loading functionality out of the main View Controller, do it behind a splash screen with a loading spinner. It ended up there out of expediency. For the Loading Spinner, start and make visible before, or at the beginning of loadJSON(), then stop and make invisible from the completion handler. 

I would size the Collection View Cells, and add AutoLayout constraints so that they actually line up with both edges of the screen.

Download the pictures, put them in UIImages. Preload them after fetching the JSON data, and either store them in an array alongside the array of Persons - [Person], OR add a picture field to struct Person, if it didn't screw up the JSON decoding, OR use an extention to add a picture field to struct Person, again, if it didn't screw up the JSON decoding.

Place and tint the star appropriately.

In the ViewController.prepareForSegue(), pass the whole Person struct into the Detail View Controller, instead of passing Person fields one by one, then assign the Person fields to the local outlets at the destination. Requires an init() function to deal with uninitialized local Person variable upon launch.

In the Detail View, either put the description or the entire Detail View inside a Scroll View, so the user can scroll through a long description or a large picture.

Include many, many more comments.
