StoryboardWarp
==============

##Introduction
Provide more convenient function between multiple storyboard of jump in Swift.

##Use

1. For example, if the project has two stroyboard call **Main.storyboard** and **S1.storyboard**. **Main.storybord** has viewcontroller 'ViewController' embed in **UINavigationController**, a button has text '**goto S1**' on the viewcontroller.
![StoryboardWarp Use Image 1](http://antinomy.qiniudn.com/StoryboardWarp_1.png "Image_1")

2. **S1.stroyboard** has a **initial viewcontroller**
![StoryboardWarp Use Image 2](http://antinomy.qiniudn.com/StoryboardWarp_2.png "Image_2")

3. Create new viewcontroller in **Main.storyboard**.Then add attribute *(Choose added viewcontroller, in Utilities panel -> Identity inspector -> User Defined Runtime Attributes)* Key Path: **target**, Type: **String**, Value: **S1**.
![StoryboardWarp Use Image 3](http://antinomy.qiniudn.com/StoryboardWarp_3.png "Image_3")

4. Link button '**goto S1**' and new viewcontroller like below
![StoryboardWarp Use Image 4](http://antinomy.qiniudn.com/StoryboardWarp_4.png "Image_4")

5. Refer to the Project '**Example**' for details.

##Contact
Follow me on Twitter ([@MelodicGin](https://twitter.com/MelodicGin)) or Weibo ([@风微漾gin](http://weibo.com/gin7758258/))

##License

StoryboardWarp is available under the MIT license. See the LICENSE file for more info.