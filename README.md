# NavigationController-s-translucent
类似QQ个人资料的导航栏透明，在手势返回时，导航栏可以根据返回百分比呈现不同的透明度。
Use direct:
1.import "UIViewController+translucent.h" in your VC.
2.use self.alphaValue = xxx in viewWillAppear to change navigationVC's alpha.
