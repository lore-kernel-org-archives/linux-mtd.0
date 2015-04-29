Received: from mail9.teraoka.com.sg ([152.101.95.36] helo=mail.teraoka.com.sg)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YnObW-0002gx-Ti
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2015 09:48:31 +0000
Received: from localhost ([127.0.0.1]) by mail.teraoka.com.sg
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2015 17:49:33 +0800
From: "Tee Zhen Cong" <zc.tee@teraoka.com.sg>
To: <linux-mtd@lists.infradead.org>
Subject: nandtest error
Date: Wed, 29 Apr 2015 17:48:02 +0800
Message-ID: <000c01d08261$9726b7c0$c5742740$@teraoka.com.sg>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-sg
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I am using imx6SOLO to interface with a new 32Gb NAND flash from MICRON,
MT29F32G08CBADA.
After applying the patch to truncate the remaining bytes out of the
power-of-2, imx6SOLO is able to detect and recognize the NAND flash.
[    0.346874] ONFI flash detected
[    0.347012] ONFI param page 0 valid
[    0.347019] nand: onfi confirmed
 [    0.347035] NAND device: Manufacturer ID: 0x2c, Chip ID: 0x44 (Micron
MT29F32G08CBADAWP)
 [    0.349811] Bad block table found at page 524032, version 0x01
 [    0.352254] Bad block table found at page 523776, version 0x01
 [    0.354979] Creating 3 MTD partitions on "gpmi-nand":
[    0.354991] 0x000000000000-0x000000600000 : "kobs-ng"
[    0.355750] 0x000000600000-0x000000a00000 : "kernel"
[    0.356404] 0x000000a00000-0x000100000000 : "fs"
[    0.357165] ---------------------------------------
[    0.357173]        NFC Geometry (used by BCH)
[    0.357179] ---------------------------------------
[    0.357185] ECC Strength           : 56
[    0.357190] Page Size in Bytes     : 8936
[    0.357195] Metadata Size in Bytes : 10
[    0.357200] ECC Chunk Size in Bytes: 1024
[    0.357205] ECC Chunk Count        : 8
[    0.357210] Payload Size in Bytes  : 8192
[    0.357215] Auxiliary Size in Bytes: 20
[    0.357220] Auxiliary Status Offset: 12
[    0.357225] Block Mark Byte Offset : 7545
[    0.357230] Block Mark Bit Offset  : 0
[    0.357329] GPMI NAND driver registered. (IMX)

However, when I tried to perform nandtest in my system, I always get the
error where some of the bytes read back is not the same as written in.
> nandtest /dev/mtd2
ECC corrections: 0
ECC failures   : 0
Bad blocks     : 6
BBT blocks     : 0
00000000: checking...
compare failed. seed 1667286349
Byte 0x23ff is 4f should be 47
Byte 0x882d is db should be d9
Byte 0x1602a is 2f should be 2d
Byte 0x39c1d is 8c should be 88
Byte 0x66815 is 62 should be 60
Byte 0x70833 is fb should be db
Byte 0x7742b is 34 should be 35
Byte 0x8601c is ab should be aa
Byte 0x9c80a is b7 should be b3
Byte 0xb141c is 59 should be 49
Byte 0xc700f is c5 should be c7
Byte 0xcc03c is de should be d6
Byte 0xe1c02 is 3e should be 7e
Byte 0xe6c13 is bc should be fc
Byte 0xea016 is 67 should be 6f
Byte 0xf0441 is 73 should be 72
Byte 0xf4026 is 59 should be 58
Byte 0xfc410 is 76 should be 56
Byte 0x114c40 is c6 should be c4
Byte 0x117c1e is 42 should be 40
Byte 0x13c037 is ea should be e2
Byte 0x151c08 is 74 should be 75
Byte 0x16603b is 52 should be 50
Byte 0x182824 is b7 should be b3
Byte 0x187832 is 88 should be 89
Byte 0x191c40 is 48 should be 40
Byte 0x1b7002 is 47 should be c7
Byte 0x1cf80c is 03 should be 01
Byte 0x1d0c24 is 10 should be 90
Byte 0x1d1c3b is 82 should be c2
Byte 0x1ea83d is c7 should be 87

It seems like for the bytes with error, there are always 1 bit errors, and
the bit location is random. If I tried to perform nandtest several time, the
address of the error bytes are different as well.

I am using linux kernel version 3.0.35. Anybody has any idea why is this
happening? Is there any setting that I need to tweak to make it work?
Thanks.

Regards,
zc
