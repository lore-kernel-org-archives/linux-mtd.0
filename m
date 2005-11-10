Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ea4wg-0000fb-1m
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2005 00:26:09 -0500
Received: by zproxy.gmail.com with SMTP id i11so429553nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Nov 2005 21:25:57 -0800 (PST)
Message-ID: <51d250110511092125s2bbc4decy425c94964fff7fd2@mail.gmail.com>
Date: Thu, 10 Nov 2005 10:55:56 +0530
From: yonathana wodeselia <yonathanaw@gmail.com>
To: dwmw2@shinybook.infradead.org, ben@simtec.co.uk,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: 
Subject: samsung nand timing issues or oob ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi friends ,
               I have a samsung 0x76 id,  128M , 512 page chip sitting
on gpio on a pxa , I have been trying to get nandwrite and nanddump
work on the mtd. Kernel is 2.6.12.1 . My driver is attached below. I
notice some inconsistency
[root@device yoni]#insmod driver.ko
Using driver.ko
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 364 at 0x005b0000
Creating 1 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x00000000-0x00200000 : "Filesystem on nand"
mtd: Giving out device 3 to Filesystem on nand

[root@device yoni]#rmmod driver
[root@device yoni]#insmod driver.ko
Using manav.ko
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
3,3V 8-bit)
Scanning device for bad blocks
Creating 1 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x00000000-0x00200000 : "Filesystem on nand"
mtd: Giving out device 4 to Filesystem on nand

Once it detects bad blocks and then it doesnt .My this->chip_delay =3D
50; and have tried it till 20
How do i verify that the basic driver is working. have tried nandwrite
with p option  the file am writing is -rw-r--r--    1 root     root  =20
     4221 Jan  1 00:10 test
Usually do a nandwrite -p /dev/mtd3 test.txt and i  get
 /nandwrite -p -y /dev/mtd3 test
MTD_open
MTD_ioctl
MTD_ioctl
Use -f option to enforce legacy placement on autoplacement enablMTD_close
ed mtd device

and nanddump
 ./nanddump -p -l 4000 /dev/mtd3
MTD_open
MTD_ioctl
Block size 16384, page size 512, OOB size 16MTD_ioctl

Dumping data starting at 0x00000000 and ending at 0x00000fa0..MTD_read
.
0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0MTD_ioctl
x00000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00MTD_read
000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000050MTD_ioctl
: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000060: fMTD_read
f ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000002a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000002b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000002c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000002d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000002e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000002f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000003a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000003b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000003c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000003d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000003e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000003f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000410: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000420: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000430: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000440: ff ff ff ff ff ff ff ff ff ff ff MTD_ioctl
ff ff ff ff ff
0x00000450: ff ff ff ff ff ff ff ff ff ff ff ff MTD_read
ff ff ff ff
0x00000460: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000470: ff ff ff ff ff ff ff ff ff ff ff ff ff ff MTD_ioctl
ff ff
0x00000480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff MTD_read
ff
0x00000490: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000004a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000004b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000004c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000004d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000004e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000004f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000510: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000520: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000530: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000540: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000550: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000570: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000590: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000005a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000005b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000005c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000005d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000005e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000005f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000610: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000620: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000630: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000640: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000650: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000660: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000670: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000690: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000006a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000006b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000006c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000006d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000006e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000006f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000710: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000720: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000730: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000740: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000750: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000760: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000770: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000790: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000810: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000820: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000830: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000840: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000850: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000860: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
MTD_ioctl0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

0x00000880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0xMTD_read
00000890: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000008a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000008MTD_ioctl
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000008c0:MTD_read
 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000008d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000008e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000008f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000910: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000920: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000930: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000940: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000950: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000960: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000970: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000990: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000009a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000009b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000009c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000009d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000009e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000009f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000a90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000aa0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ab0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ac0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ad0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ae0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000af0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000b90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ba0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000bb0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000bc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000bd0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000be0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000bf0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000c90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ca0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000cb0: ffMTD_ioctl
 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000cc0: ff ffMTD_read
 ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000cd0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ce0: ff ff ff ffMTD_ioctl
 ff ff ff ff ff ff ff ff ff ff ff ff
0x00000cf0: ff ff ff ff ffMTD_close
 ff ff ff ff ff ff ff ff ff ff ff
0x00000d00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000d90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000da0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000db0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000dc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000dd0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000de0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000df0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000e90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ea0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000eb0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ec0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ed0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ee0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ef0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000f90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000fa0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000fb0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000fc0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000fd0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000fe0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000ff0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

Where is the data that is being written ?
What am am thinking is that maybe the oob structure is not been
initilised properly. what i see is the following oob placements
defined in nand_base
/* Define default oob placement schemes for large and small page devices */
static struct nand_oobinfo nand_oob_8 =3D {
        .useecc =3D MTD_NANDECC_AUTOPLACE,
        .eccbytes =3D 3,
        .eccpos =3D {0, 1, 2},
        .oobfree =3D { {3, 2}, {6, 2} }
};

static struct nand_oobinfo nand_oob_16 =3D {
        .useecc =3D MTD_NANDECC_AUTOPLACE,
        .eccbytes =3D 6,
        .eccpos =3D {0, 1, 2, 3, 6, 7},
        .oobfree =3D { {8, 8} }
};

static struct nand_oobinfo nand_oob_64 =3D {
        .useecc =3D MTD_NANDECC_AUTOPLACE,
        .eccbytes =3D 24,
        .eccpos =3D {
                40, 41, 42, 43, 44, 45, 46, 47,
                48, 49, 50, 51, 52, 53, 54, 55,
                56, 57, 58, 59, 60, 61, 62, 63},
        .oobfree =3D { {2, 38} }
};

Which one would be right to choose for a yaffs file system and a jffs2
file system .I am thinking that these might be not be right  , cause i
read dat these samsung k9f1208 chips are already being used in
places.Are there any low level tools available out there for me to use
to verify if data is being written and in a proper way. Any help will
be highly appreciated , am at total loss of speech and thoughts here
..
 The driver below
/*
 *  drivers/mtd/nand/spia.c
 *
 *  Copyright (C) 2000 Steven J. Hill (sjhill@realitydiluted.com)
 *
 *
 *      10-29-2001 TG   change to support hardwarespecific access
 *                      to controllines (due to change in nand.c)
 *                      page_cache added
 *
 * $Id: spia.c,v 1.21 2003/07/11 15:12:29 dwmw2 Exp $
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *  Overview:
 *   This is a device driver for the NAND flash device found on the
 *   SPIA board which utilizes the Toshiba TC58V64AFT part. This is
 *   a 64Mibit (8MiB x 8 bits) NAND flash device.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>
#include <asm/sizes.h>
#include <asm/arch-pxa/pxa-regs.h>
/*
 * MTD structure for SPIA board
 */
static struct mtd_info *spia_mtd =3D NULL;

/*
 * Values specific to the SPIA board (used with EP7212 processor)
 */
#define SPIA_IO_BASE    0xd0000000      /* Start of EP7212 IO address space=
 */
#define SPIA_FIO_BASE   0x06000000      /* Address where flash is mapped */
#define SPIA_PEDR       0x0080          /*
                                         * IO offset to Port E data registe=
r
                                         * where the CLE, ALE and NCE pins
                                         * are wired to.
                                         */
#define SPIA_PEDDR      0x00c0          /*
                                         * IO offset to Port E data directi=
on
                                         * register so we can control the I=
O
                                         * lines.
                                         */

/*
 * Module stuff
 */

static int spia_fio_base =3D SPIA_FIO_BASE;


/*
 * Define partitions for flash device
 */
const static struct mtd_partition partition_info[] =3D {
        { name: "Filesystem on nand",
                offset: 0,
                size:   2 * SZ_1M},
};
#define NUM_PARTITIONS 1


/*
 *      hardware specific access to control-lines
*/
static void spia_hwcontrol(struct mtd_info *mtd, int cmd){

    switch(cmd){

        case NAND_CTL_SETCLE: GPSR2 =3D 0x80000;   break;
        case NAND_CTL_CLRCLE:GPCR2 =3D 0x80000;   break;

        case NAND_CTL_SETALE: GPSR2 =3D 0x100000; break;
        case NAND_CTL_CLRALE: GPCR2 =3D 0x100000;  break;

        case NAND_CTL_SETNCE: GPCR2 =3D 0x20000; break;
        case NAND_CTL_CLRNCE: GPSR2 =3D 0x20000; break;
    }
}

/*
 * Main initialization routine
 */
int __init spia_init (void)
{
        struct nand_chip *this;
        GPSR2 =3D 0x60000;
        GPDR2 |=3D 0x1e0000;

        GPCR2 =3D 0x20000;
        /* Allocate memory for MTD device structure and private data */
        spia_mtd =3D kmalloc (sizeof(struct mtd_info) + sizeof (struct nand=
_chip),
                                GFP_KERNEL);
        if (!spia_mtd) {
                printk ("Unable to allocate SPIA NAND MTD device structure.=
\n");
                return -ENOMEM;
        }

        /* Get pointer to private data */
        this =3D (struct nand_chip *) (&spia_mtd[1]);

        /* Initialize structures */
        memset((char *) spia_mtd, 0, sizeof(struct mtd_info));
        memset((char *) this, 0, sizeof(struct nand_chip));
spia_fio_base=3D(unsigned long)ioremap(spia_fio_base,SZ_1K);       =20
//??? cache _nocache roblems
        /* Link the private data with the MTD structure */
        spia_mtd->priv =3D this;

        /*
         * Set GPIO Port E control register so that the pins are configured
         * to be outputs for controlling the NAND flash.
         */

        /* Set address of NAND IO lines */
        this->IO_ADDR_R =3D spia_fio_base;
        this->IO_ADDR_W =3D spia_fio_base;
        /* Set address of hardware control function */
        this->hwcontrol =3D spia_hwcontrol;
        /* 15 us command delay time */
        this->chip_delay =3D 50;                                       =20
     // timing issues
        this->eccmode =3D NAND_ECC_SOFT;

        /* Scan to find existence of the device */
        if (nand_scan (spia_mtd, 1)) {
                kfree (spia_mtd);
                return -ENXIO;
        }

        /* Allocate memory for internal data buffer */
        this->data_buf =3D kmalloc (sizeof(u_char) * (spia_mtd->oobblock
+ spia_mtd->oobsize), GFP_KERNEL);
        if (!this->data_buf) {
                printk ("Unable to allocate NAND data buffer for SPIA.\n");
                kfree (spia_mtd);
                return -ENOMEM;
        }

        /* Register the partitions */
        add_mtd_partitions(spia_mtd, partition_info, NUM_PARTITIONS);

        /* Return happy */
        return 0;
}
module_init(spia_init);

/*
 * Clean up routine
 */
#ifdef MODULE
static void __exit spia_cleanup (void)
{
        struct nand_chip *this =3D (struct nand_chip *) &spia_mtd[1];

        /* Unregister the device */
        del_mtd_device (spia_mtd);

        /* Free internal data buffer */
        kfree (this->data_buf);

        /* Free the MTD device structure */
        kfree (spia_mtd);
}
module_exit(spia_cleanup);
#endif

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com");
MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on SPIA board"=
);

Is there a cache / fill buffer that is leaking somewhere , I have seen
drivers that implement this ?? arnt nandwrite and nanddump low level
mtd tools ?
regards,
Yoni
