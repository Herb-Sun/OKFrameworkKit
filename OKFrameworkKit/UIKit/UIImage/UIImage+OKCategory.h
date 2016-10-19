//
//  UIImage+OKCategory
//
//  Copyright © 2016年 OK Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OKCategory)

/**
 *  @brief 保存相册
 *
 *  @param completeBlock 成功回调
 *  @param failBlock 出错回调
 */
- (void)ok_savedPhotosAlbumWithCompleteBlock:(void (^)())completeBlock failBlock:(void (^)(NSError *))failBlock;

/**
 *  @brief 根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)ok_imageWithColor:(UIColor *)color;

+ (UIImage *)ok_screenshots;
+ (UIImage *)ok_screenshotsWithoutStateBar;
+ (UIImage *)ok_imageFromView:(UIView *)theView;
+ (UIImage *)ok_imageFromView:(UIView *)theView atFrame:(CGRect)r;

/**
 *  @brief blur a image
 *
 *  @param blurAmount 0.0 ~ 1.0
 *
 *  @return image with blured
 */
- (UIImage *)ok_blurredImage:(CGFloat)blurAmount;

/// 缩小图片到合适的尺寸
- (UIImage *)ok_scaleToSize:(CGSize)newSize;

/**
 *  @brief  取图片某一点的颜色
 *
 *  @param point 某一点
 *
 *  @return 颜色
 */
- (UIColor *)ok_colorAtPoint:(CGPoint)point;

/**
 *  @brief  取某一像素的颜色
 *
 *  @param point 一像素
 *
 *  @return 颜色
 */
- (UIColor *)ok_colorAtPixel:(CGPoint)point;

/**
 *  @brief  返回该图片是否有透明度通道
 *
 *  @return 是否有透明度通道
 */
- (BOOL)ok_hasAlphaChannel;

/**
 *  @brief 给图片加alpha
 *
 *  @return 加了alpha的image
 */
- (UIImage *)ok_imageWithAlpha;

/**
 *  @brief  获得灰度图
 *
 *  @param sourceImage 图片
 *
 *  @return 获得灰度图片
 */
+ (UIImage *)ok_covertToGrayImageFromImage:(UIImage *)sourceImage;


/**
 *  @brief  合并两个图片
 *
 *  @param firstImage  一个图片
 *  @param secondImage 二个图片
 *
 *  @return 合并后图片
 */
+ (UIImage *)ok_mergeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage;

/// 给图片加圆角和边框
- (UIImage *)ok_roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;

/**
 *  @brief 用icon font 生成图片
 *
 *  @param font         icon font
 *  @param iconNamed    icon name
 *  @param tintColor    icon color [default to black]
 *  @param clipToBounds 是否切角
 *  @param fontSize     fontsize
 *
 *  @return image
 */
+ (UIImage *)ok_iconWithFont:(UIFont *)font
                       named:(NSString *)iconNamed
               withTintColor:(UIColor *)tintColor
                clipToBounds:(BOOL)clipToBounds
                     forSize:(CGFloat)fontSize;

@end
