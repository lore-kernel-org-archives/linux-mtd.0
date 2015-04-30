Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ynqph-0005vZ-H2
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 15:57:02 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Tee Zhen Cong <zc.tee@teraoka.com.sg>, "'Han Xu'" <xhnjupt@gmail.com>
Subject: RE: nandtest error
Date: Thu, 30 Apr 2015 15:56:36 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7357DEBE7F3@NTXBOIMBX03.micron.com>
References: <000c01d08261$9726b7c0$c5742740$@teraoka.com.sg>
 <CA+EcR20vND89+wk5ZTODJ4NoaSC0rrWsV+bXTWbpyZ9Y72aFiA@mail.gmail.com>
 <0D23F1ECC880A74392D56535BCADD7357DEBE4C1@NTXBOIMBX03.micron.com>
 <000201d082e5$032f7d70$098e7850$@teraoka.com.sg>
 <0D23F1ECC880A74392D56535BCADD7357DEBE709@NTXBOIMBX03.micron.com>
 <001c01d0831c$619ac400$24d04c00$@teraoka.com.sg>
In-Reply-To: <001c01d0831c$619ac400$24d04c00$@teraoka.com.sg>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Awesome!  Great news.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: Tee Zhen Cong [mailto:zc.tee@teraoka.com.sg]=20
Sent: Thursday, April 30, 2015 1:05 AM
To: Jeff Lauruhn (jlauruhn); 'Han Xu'
Cc: linux-mtd@lists.infradead.org
Subject: RE: nandtest error

Hi Jeff,
It's related to the ECC strength issue limitation as mentioned by Han Xu. I=
 changed some parameter so that the ECC strength calculated is less than 40=
, and the problem is solved.

Thanks Han Xu for the hint, and thanks Jeff for the explanation!

Regards,
zc

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Jeff Lauruhn (jlauruhn)
Sent: Thursday, 30 April, 2015 10:06 AM
To: Tee Zhen Cong; 'Han Xu'
Cc: linux-mtd@lists.infradead.org
Subject: RE: nandtest error

Hello zc;
The MT29F16G08CBACA is a 70 series part (25nm), 24 bit/1080 bytes of ECC vs=
 MT29F32G08CBADA 80 series (20nm) 40 bits/1117 bytes of ECC, these are very=
 different parts.  ECC of 40 bits/1117 bytes will correct 320 bits per page=
 and 81920 bits per block so if I read this correctly 31 of 81920 bits have=
 flipped in this case.  My point here is that with ECC correction this devi=
ce will be good past the 3000 P/E cycles guaranteed, but if you look at any=
 raw NAND without ECC correction you will very likely see some flipped bits=
.
This is normal NAND behavior, especially on smaller nodes.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Tee Zhen Cong
Sent: Wednesday, April 29, 2015 6:29 PM
To: Jeff Lauruhn (jlauruhn); 'Han Xu'
Cc: linux-mtd@lists.infradead.org
Subject: RE: nandtest error

Hi Jeff,
The flipped bits is found in the first 2Mbytes (1st block) of the NAND. It =
stops at the first block where errors are detected. I am not so sure what i=
s happening in the nandtest application. It seems like a standard linux tes=
t tool for nand where many ppl use. So I use it for my test as well.
As far as I see, it erase, write then read back the NAND block by block, an=
d see if the read back bytes are the same with the written bytes.
In my opinion, the flipped bits is not normal. I got another board with a u=
seable 16GBit NAND (MT29F16G08CBACA). Using the nandtest application, it re=
turns successful without any flipped bit. Same kernel, same software. Only =
different NAND.

Regards,
zc

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Jeff Lauruhn (jlauruhn)
Sent: Thursday, 30 April, 2015 5:12 AM
To: Han Xu; Tee Zhen Cong
Cc: linux-mtd@lists.infradead.org
Subject: RE: nandtest error

When you read the data back are you reading the raw data?    Some amount of
bit flipping is normal NAND Flash behavior.  ECC correction is required on =
all contemporary NAND to some degree to correct bit flips.  This Micron dev=
ice is designed to return a "FAIL" status only when the number of bad
bits in any page exceeds 40bits/1117 bytes.  =20

I need to understand what nandtest is actually doing.  If I read this right=
, if found 32 flipped bits in a 32 gigabit device.  That's actually very go=
od.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Han Xu
Sent: Wednesday, April 29, 2015 11:36 AM
To: Tee Zhen Cong
Cc: linux-mtd@lists.infradead.org
Subject: Re: nandtest error

On Wed, Apr 29, 2015 at 4:48 AM, Tee Zhen Cong <zc.tee@teraoka.com.sg>
wrote:
> Hi all,
> I am using imx6SOLO to interface with a new 32Gb NAND flash from=20
> MICRON, MT29F32G08CBADA.
> After applying the patch to truncate the remaining bytes out of the=20
> power-of-2, imx6SOLO is able to detect and recognize the NAND flash.
> [    0.346874] ONFI flash detected
> [    0.347012] ONFI param page 0 valid
> [    0.347019] nand: onfi confirmed
>  [    0.347035] NAND device: Manufacturer ID: 0x2c, Chip ID: 0x44 (Micron
> MT29F32G08CBADAWP)
>  [    0.349811] Bad block table found at page 524032, version 0x01
>  [    0.352254] Bad block table found at page 523776, version 0x01
>  [    0.354979] Creating 3 MTD partitions on "gpmi-nand":
> [    0.354991] 0x000000000000-0x000000600000 : "kobs-ng"
> [    0.355750] 0x000000600000-0x000000a00000 : "kernel"
> [    0.356404] 0x000000a00000-0x000100000000 : "fs"
> [    0.357165] ---------------------------------------
> [    0.357173]        NFC Geometry (used by BCH)
> [    0.357179] ---------------------------------------
> [    0.357185] ECC Strength           : 56

The default ecc value beyond the the BCH capability(upto 40bit).
Please add  fsl,use-minimum-ecc =3D <1>; in dts nand portion.

> [    0.357190] Page Size in Bytes     : 8936
> [    0.357195] Metadata Size in Bytes : 10
> [    0.357200] ECC Chunk Size in Bytes: 1024
> [    0.357205] ECC Chunk Count        : 8
> [    0.357210] Payload Size in Bytes  : 8192
> [    0.357215] Auxiliary Size in Bytes: 20
> [    0.357220] Auxiliary Status Offset: 12
> [    0.357225] Block Mark Byte Offset : 7545
> [    0.357230] Block Mark Bit Offset  : 0
> [    0.357329] GPMI NAND driver registered. (IMX)
>
> However, when I tried to perform nandtest in my system, I always get=20
> the error where some of the bytes read back is not the same as written in=
.
>> nandtest /dev/mtd2
> ECC corrections: 0
> ECC failures   : 0
> Bad blocks     : 6
> BBT blocks     : 0
> 00000000: checking...
> compare failed. seed 1667286349
> Byte 0x23ff is 4f should be 47
> Byte 0x882d is db should be d9
> Byte 0x1602a is 2f should be 2d
> Byte 0x39c1d is 8c should be 88
> Byte 0x66815 is 62 should be 60
> Byte 0x70833 is fb should be db
> Byte 0x7742b is 34 should be 35
> Byte 0x8601c is ab should be aa
> Byte 0x9c80a is b7 should be b3
> Byte 0xb141c is 59 should be 49
> Byte 0xc700f is c5 should be c7
> Byte 0xcc03c is de should be d6
> Byte 0xe1c02 is 3e should be 7e
> Byte 0xe6c13 is bc should be fc
> Byte 0xea016 is 67 should be 6f
> Byte 0xf0441 is 73 should be 72
> Byte 0xf4026 is 59 should be 58
> Byte 0xfc410 is 76 should be 56
> Byte 0x114c40 is c6 should be c4
> Byte 0x117c1e is 42 should be 40
> Byte 0x13c037 is ea should be e2
> Byte 0x151c08 is 74 should be 75
> Byte 0x16603b is 52 should be 50
> Byte 0x182824 is b7 should be b3
> Byte 0x187832 is 88 should be 89
> Byte 0x191c40 is 48 should be 40
> Byte 0x1b7002 is 47 should be c7
> Byte 0x1cf80c is 03 should be 01
> Byte 0x1d0c24 is 10 should be 90
> Byte 0x1d1c3b is 82 should be c2
> Byte 0x1ea83d is c7 should be 87
>
> It seems like for the bytes with error, there are always 1 bit errors,=20
> and the bit location is random. If I tried to perform nandtest several=20
> time, the address of the error bytes are different as well.
>
> I am using linux kernel version 3.0.35. Anybody has any idea why is=20
> this happening? Is there any setting that I need to tweak to make it work=
?
> Thanks.
>
> Regards,
> zc
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
