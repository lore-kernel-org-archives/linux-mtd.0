Received: from mail9.teraoka.com.sg ([152.101.95.36] helo=mail.teraoka.com.sg)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Ynf3Z-0002ru-NH
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 03:22:35 +0000
From: "Tee Zhen Cong" <zc.tee@teraoka.com.sg>
To: "'Jeff Lauruhn \(jlauruhn\)'" <jlauruhn@micron.com>,
 "'Han Xu'" <xhnjupt@gmail.com>
References: <000c01d08261$9726b7c0$c5742740$@teraoka.com.sg>
 <CA+EcR20vND89+wk5ZTODJ4NoaSC0rrWsV+bXTWbpyZ9Y72aFiA@mail.gmail.com>
 <0D23F1ECC880A74392D56535BCADD7357DEBE4C1@NTXBOIMBX03.micron.com>
 <000201d082e5$032f7d70$098e7850$@teraoka.com.sg>
 <0D23F1ECC880A74392D56535BCADD7357DEBE709@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7357DEBE709@NTXBOIMBX03.micron.com>
Subject: RE: nandtest error
Date: Thu, 30 Apr 2015 11:21:51 +0800
Message-ID: <001701d082f4$cedfa9e0$6c9efda0$@teraoka.com.sg>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-sg
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jeff,
Done with the test. The NAND cannot survive one write-read test.
Upon format (ubiformat -y /dev/mtd2),
I am able to attach the ubifs (ubiattach /dev/ubi_ctrl -m 2) , 
Create a volumn (ubimkvol /dev/ubi0 -N rootfs -m),
make a ubifs volumn (mkfs.ubifs -x none /dev/ubi0_0), 
and mount it (mount /dev/ubi0_0 tmp). Everything looks fine.
[   32.506172] UBI: attaching mtd2 to ubi0
[   32.506184] UBI: physical eraseblock size:   2097152 bytes (2048 KiB)
[   32.506191] UBI: logical eraseblock size:    2080768 bytes
[   32.506198] UBI: smallest flash I/O unit:    8192
[   32.506205] UBI: VID header offset:          8192 (aligned 8192)
[   32.506212] UBI: data offset:                16384
[   42.274362] UBI: max. sequence number:       46
[   42.293327] UBI: attached mtd2 to ubi0
[   42.293337] UBI: MTD device name:            "fs"
[   42.293344] UBI: MTD device size:            4086 MiB
[   42.293350] UBI: number of good PEBs:        2037
[   42.293356] UBI: number of bad PEBs:         6
[   42.293362] UBI: number of corrupted PEBs:   0
[   42.293368] UBI: max. allowed volumes:       128
[   42.293373] UBI: wear-leveling threshold:    4096
[   42.293379] UBI: number of internal volumes: 1
[   42.293385] UBI: number of user volumes:     1
[   42.293391] UBI: available PEBs:             0
[   42.293396] UBI: total number of reserved PEBs: 2037
[   42.293402] UBI: number of PEBs reserved for bad PEB handling: 20
[   42.293409] UBI: max/mean erase counter: 2/0
[   42.293415] UBI: image sequence number:  55069091
[   42.295379] UBI: background thread "ubi_bgt0d" started, PID 2752
[   42.295402] nand_erase_nand: start = 0x0000aee00000, len = 2097152
[   58.193726] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[   58.193740] UBIFS: file system size:   4167778304 bytes (4070096 KiB,
3974 MiB, 2003 LEBs)
[   58.193751] UBIFS: journal size:       18726913 bytes (18288 KiB, 17 MiB,
9 LEBs)
[   58.193760] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   58.193767] UBIFS: default compressor: none
[   58.193774] UBIFS: reserved for root:  0 bytes (0 KiB)

However, after writing a big file into it, umount, shut down the system,
reboot, attach and mount again, errors come in.
[   88.607123] UBI: attaching mtd2 to ubi0
[   88.607135] UBI: physical eraseblock size:   2097152 bytes (2048 KiB)
[   88.607142] UBI: logical eraseblock size:    2080768 bytes
[   88.607149] UBI: smallest flash I/O unit:    8192
[   88.607156] UBI: VID header offset:          8192 (aligned 8192)
[   88.607162] UBI: data offset:                16384
[   89.088632] UBI warning: process_eb: valid VID header but corrupted EC
header at PEB 102
[   89.464258] UBI warning: process_eb: valid VID header but corrupted EC
header at PEB 181
[   90.338711] UBI error: check_corruption: PEB 238 contains corrupted VID
header, and the data does not contain all 0xFF, this may be a non-UBI PEB or
a severe VID header corruption which requires manual inspection
[   90.966022] UBI error: check_corruption: PEB 243 contains corrupted VID
header, and the data does not contain all 0xFF, this may be a non-UBI PEB or
a severe VID header corruption which requires manual inspection
[   91.251299] UBI warning: process_eb: valid VID header but corrupted EC
header at PEB 303
[   92.301930] UBI warning: process_eb: valid VID header but corrupted EC
header at PEB 524
[   93.182756] UBI warning: process_eb: valid VID header but corrupted EC
header at PEB 706
[   93.563780] UBI warning: process_eb: valid VID header but corrupted EC
header at PEB 785
[   99.801844] UBI error: check_what_we_have: 2 PEBs are corrupted and
preserved
[   99.801855] Corrupted PEBs are: 243 238
[   99.802116] UBI: max. sequence number:       657
[   99.818215] UBI warning: print_rsvd_warning: cannot reserve enough PEBs
for bad PEB handling, reserved 18, need 20
[   99.818228] UBI warning: print_rsvd_warning: 2 PEBs are corrupted and not
used
[   99.821040] UBI: attached mtd2 to ubi0
[   99.821049] UBI: MTD device name:            "fs"
[   99.821056] UBI: MTD device size:            4086 MiB
[   99.821062] UBI: number of good PEBs:        2037
[   99.821068] UBI: number of bad PEBs:         6
[   99.821074] UBI: number of corrupted PEBs:   2
[   99.821080] UBI: max. allowed volumes:       128
[   99.821086] UBI: wear-leveling threshold:    4096
[   99.821092] UBI: number of internal volumes: 1
[   99.821097] UBI: number of user volumes:     1
[   99.821103] UBI: available PEBs:             0
[   99.821109] UBI: total number of reserved PEBs: 2035
[   99.821115] UBI: number of PEBs reserved for bad PEB handling: 18
[   99.821122] UBI: max/mean erase counter: 4/1
[   99.821128] UBI: image sequence number:  1633046215
[   99.824082] UBI: background thread "ubi_bgt0d" started, PID 3378
[  101.914146] UBI warning: ubi_eba_copy_leb: read data back from PEB 1632
and it is different
[  101.914165] UBI error: wear_leveling_worker: error -22 while moving PEB
102 to PEB 1632
[  101.914176] UBI warning: ubi_ro_mode: switch to read-only mode
[  101.914185] UBI error: do_work: work failed with error code -22
[  101.914194] UBI error: ubi_thread: ubi_bgt0d: work failed with error code
-22
[  111.897572] UBIFS: read-only UBI device
[  111.897588] UBIFS error (pid 3382): mount_ubifs: cannot mount read-write
- read-only media
[  111.960844] UBIFS: read-only UBI device
[  113.793022] UBIFS: recovered master node from LEB 1
[  113.793552] UBIFS: recovery needed
[  115.360341] UBIFS: recovery deferred
[  115.360360] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[  115.360366] UBIFS: mounted read-only
[  115.360375] UBIFS: file system size:   4167778304 bytes (4070096 KiB,
3974 MiB, 2003 LEBs)
[  115.360385] UBIFS: journal size:       18726913 bytes (18288 KiB, 17 MiB,
9 LEBs)
[  115.360395] UBIFS: media format:       w4/r0 (latest is w4/r0)
[  115.360402] UBIFS: default compressor: none
[  115.360408] UBIFS: reserved for root:  0 bytes (0 KiB)

With the error, I can only mount the ubifs in read only. It seems like still
there is something wrong with the integration. Any idea why is this
happening?
Thanks.

Regards,
zc





-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
Jeff Lauruhn (jlauruhn)
Sent: Thursday, 30 April, 2015 10:06 AM
To: Tee Zhen Cong; 'Han Xu'
Cc: linux-mtd@lists.infradead.org
Subject: RE: nandtest error

Hello zc;
The MT29F16G08CBACA is a 70 series part (25nm), 24 bit/1080 bytes of ECC vs
MT29F32G08CBADA 80 series (20nm) 40 bits/1117 bytes of ECC, these are very
different parts.  ECC of 40 bits/1117 bytes will correct 320 bits per page
and 81920 bits per block so if I read this correctly 31 of 81920 bits have
flipped in this case.  My point here is that with ECC correction this device
will be good past the 3000 P/E cycles guaranteed, but if you look at any raw
NAND without ECC correction you will very likely see some flipped bits.
This is normal NAND behavior, especially on smaller nodes.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
Tee Zhen Cong
Sent: Wednesday, April 29, 2015 6:29 PM
To: Jeff Lauruhn (jlauruhn); 'Han Xu'
Cc: linux-mtd@lists.infradead.org
Subject: RE: nandtest error

Hi Jeff,
The flipped bits is found in the first 2Mbytes (1st block) of the NAND. It
stops at the first block where errors are detected. I am not so sure what is
happening in the nandtest application. It seems like a standard linux test
tool for nand where many ppl use. So I use it for my test as well.
As far as I see, it erase, write then read back the NAND block by block, and
see if the read back bytes are the same with the written bytes.
In my opinion, the flipped bits is not normal. I got another board with a
useable 16GBit NAND (MT29F16G08CBACA). Using the nandtest application, it
returns successful without any flipped bit. Same kernel, same software. Only
different NAND.

Regards,
zc

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
Jeff Lauruhn (jlauruhn)
Sent: Thursday, 30 April, 2015 5:12 AM
To: Han Xu; Tee Zhen Cong
Cc: linux-mtd@lists.infradead.org
Subject: RE: nandtest error

When you read the data back are you reading the raw data?    Some amount of
bit flipping is normal NAND Flash behavior.  ECC correction is required on
all contemporary NAND to some degree to correct bit flips.  This Micron
device is designed to return a "FAIL" status only when the number of bad
bits in any page exceeds 40bits/1117 bytes.   

I need to understand what nandtest is actually doing.  If I read this right,
if found 32 flipped bits in a 32 gigabit device.  That's actually very good.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
Han Xu
Sent: Wednesday, April 29, 2015 11:36 AM
To: Tee Zhen Cong
Cc: linux-mtd@lists.infradead.org
Subject: Re: nandtest error

On Wed, Apr 29, 2015 at 4:48 AM, Tee Zhen Cong <zc.tee@teraoka.com.sg>
wrote:
> Hi all,
> I am using imx6SOLO to interface with a new 32Gb NAND flash from 
> MICRON, MT29F32G08CBADA.
> After applying the patch to truncate the remaining bytes out of the 
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
Please add  fsl,use-minimum-ecc = <1>; in dts nand portion.

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
> However, when I tried to perform nandtest in my system, I always get 
> the error where some of the bytes read back is not the same as written in.
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
> It seems like for the bytes with error, there are always 1 bit errors, 
> and the bit location is random. If I tried to perform nandtest several 
> time, the address of the error bytes are different as well.
>
> I am using linux kernel version 3.0.35. Anybody has any idea why is 
> this happening? Is there any setting that I need to tweak to make it work?
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
