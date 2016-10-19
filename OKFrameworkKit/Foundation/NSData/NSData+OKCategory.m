//
//  NSData+OKCategory
//
//  Copyright © 2016年 OK Inc. All rights reserved.
//

#import "NSData+OKCategory.h"
#import <CommonCrypto/CommonCrypto.h>
#import <Availability.h>
#import <zlib.h>

@implementation NSData (OKCategory)

- (NSString *)ok_APNSToken {
    
    return [[[[self description]
              stringByReplacingOccurrencesOfString:@"<" withString:@""]
             stringByReplacingOccurrencesOfString:@">" withString:@""]
            stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)ok_UTF8String {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)ok_hexadecimalString {

    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];

    if (!dataBuffer)
        return [NSString string];

    NSUInteger      dataLength = [self length];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];

    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];

    return [NSString stringWithString:hexString];
}

@end

#pragma mark - 加密 解密

@implementation NSData (OKEncrypt)

#pragma mark - MD2 MD4 MD5加密

- (NSString *)ok_MD2Encryption {
    
    unsigned char digest[CC_MD2_DIGEST_LENGTH];
    CC_MD2(self.bytes, (CC_LONG)self.length, digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_MD2_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}

- (NSString *)ok_MD4Encryption {
    
    unsigned char digest[CC_MD4_DIGEST_LENGTH];
    CC_MD4(self.bytes, (CC_LONG)self.length, digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_MD4_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}

- (NSString *)ok_MD5Encryption {
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}


- (NSData *)ok_MD2DataEncryption {
    
    unsigned char digest[CC_MD2_DIGEST_LENGTH];
    CC_MD2(self.bytes, (CC_LONG)self.length, digest);

    return [NSData dataWithBytes:digest length:CC_MD2_DIGEST_LENGTH];
}

- (NSData *)ok_MD4DataEncryption {
    
    unsigned char digest[CC_MD4_DIGEST_LENGTH];
    CC_MD4(self.bytes, (CC_LONG)self.length, digest);

    return [NSData dataWithBytes:digest length:CC_MD4_DIGEST_LENGTH];
}

- (NSData *)ok_MD5DataEncryption {

    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, digest);

    return [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
}

#pragma mark - SHA1 SHA224 SHA256 SHA384 SHA512加密

- (NSString *)ok_SHA1Encryption {
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}

- (NSString *)ok_SHA224Encryption {
    
    uint8_t digest[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_SHA224_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}

- (NSString *)ok_SHA256Encryption {
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256([self bytes], (CC_LONG)[self length], digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}

- (NSString *)ok_SHA384Encryption {
    
    uint8_t digest[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_SHA384_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}

- (NSString *)ok_SHA512Encryption {
    
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512([self bytes], (CC_LONG)[self length], digest);

    NSMutableString *strBuffer = [NSMutableString string];
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; ++i) {
        [strBuffer appendFormat:@"%02x", (unsigned int)digest[i]];
    }
    return strBuffer;
}

- (NSData *)ok_SHA1DataEncryption {
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);

    return [NSData dataWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
}

- (NSData *)ok_SHA224DataEncryption {
    
    uint8_t digest[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, digest);

    return [NSData dataWithBytes:digest length:CC_SHA224_DIGEST_LENGTH];
}

- (NSData *)ok_SHA256DataEncryption {
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256([self bytes], (CC_LONG)[self length], digest);

    return [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
}

- (NSData *)ok_SHA384DataEncryption {
    
    uint8_t digest[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, digest);

    return [NSData dataWithBytes:digest length:CC_SHA384_DIGEST_LENGTH];
}

- (NSData *)ok_SHA512DataEncryption {
    
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512([self bytes], (CC_LONG)[self length], digest);

    return [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
}


- (nullable NSData *)ok_encryptedWithAESUsingKey:(NSString *)key {
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

- (nullable NSData *)ok_decryptedWithAESUsingKey:(NSString *)key {
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}

- (NSData *)ok_encryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv {

    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];

    size_t        dataMoved;
    NSMutableData *encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];

    CCCryptorStatus result = CCCrypt(kCCEncrypt,
                                     kCCAlgorithm3DES,
                                     kCCOptionPKCS7Padding,
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     self.bytes,
                                     self.length,
                                     encryptedData.mutableBytes,
                                     encryptedData.length,
                                     &dataMoved);

    if (result == kCCSuccess) {
        encryptedData.length = dataMoved;
        return encryptedData;
    }

    return nil;
}

- (NSData *)ok_decryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv {

    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];

    size_t        dataMoved;
    NSMutableData *decryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSize3DES];

    CCCryptorStatus result = CCCrypt(kCCDecrypt,
                                     kCCAlgorithm3DES,
                                     kCCOptionPKCS7Padding,
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     self.bytes,
                                     self.length,
                                     decryptedData.mutableBytes,
                                     decryptedData.length,
                                     &dataMoved);

    if (result == kCCSuccess) {
        decryptedData.length = dataMoved;
        return decryptedData;
    }

    return nil;
}

@end

#pragma mark - Base64编码

@implementation NSData (OKBase64)

#pragma mark BASE64编码

- (NSString *)ok_base64EncodedString {
    return [self base64EncodedStringWithOptions:0];
}

#pragma mark BASE64反编码

+ (NSString *)ok_Base64DecodedString:(NSString *)base64String {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

#pragma mark BASE64编码

- (NSData *)ok_base64Encoded {
    return [self base64EncodedDataWithOptions:0];
}

#pragma mark BASE64反编码

- (NSData *)ok_Base64Decoded {
    return [[NSData alloc] initWithBase64EncodedData:self options:0];
}

+ (NSData *)ok_dataWithBase64EncodedString:(NSString *)string {
    if (![string length]) return nil;
    NSData *decoded = nil;
#if __MAC_OS_X_VERSION_MIN_REQUIRED < __MAC_10_9 || __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    if (![NSData instancesRespondToSelector:@selector(initWithBase64EncodedString:options:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        decoded = [[self alloc] initWithBase64Encoding:[string stringByReplacingOccurrencesOfString:@"[^A-Za-z0-9+/=]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [string length])]];
#pragma clang diagnostic pop
    } else
#endif
    {
        decoded = [[self alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    }
    return [decoded length] ? decoded : nil;
}

- (NSString *)ok_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth {
    if (![self length]) return nil;
    NSString *encoded = nil;
#if __MAC_OS_X_VERSION_MIN_REQUIRED < __MAC_10_9 || __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    if (![NSData instancesRespondToSelector:@selector(base64EncodedStringWithOptions:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        encoded = [self base64Encoding];
#pragma clang diagnostic pop

    } else
#endif
    {
        switch (wrapWidth) {
            case 64:
            {
                return [self base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            }
            case 76:
            {
                return [self base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
            }
            default:
            {
                encoded = [self base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
            }
        }
    }
    if (!wrapWidth || wrapWidth >= [encoded length]) {
        return encoded;
    }
    wrapWidth = (wrapWidth / 4) * 4;
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < [encoded length]; i += wrapWidth) {
        if (i + wrapWidth >= [encoded length]) {
            [result appendString:[encoded substringFromIndex:i]];
            break;
        }
        [result appendString:[encoded substringWithRange:NSMakeRange(i, wrapWidth)]];
        [result appendString:@"\r\n"];
    }
    return result;
}

@end
