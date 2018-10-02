Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7KdY-00042t-GJ
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 13:22:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id o18-v6so2198378wmc.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2018 06:22:42 -0700 (PDT)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 2 Oct 2018 15:22:29 +0200
Message-ID: <CAOf5uwku9Nx5-5h77yCtYwNxKHfZSfD+Dk3Fe41Ry45Lf+MdNw@mail.gmail.com>
Subject: GPMI IMX6ull timeout on dma
To: Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I have a strange problem on booting an imx6ull system. The problem is
not systematic and seems that it depends on how bootloader is using
the nand on first stage boot. BTW kernel can not always pass to go to
edo time 5 (even 4). If I power off and power on the unit the nand
work properly.

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.17.0-rc1 (michael@panicking) (gcc
version 6.4.0 (Buildroot 2018.02-rc2-00006-g39101b7)) #2 SMP Tue Oct 2
08:24:58 CEST 2018

[    1.612357] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    1.618905] nand: Micron MT29F2G08ABAEAH4
[    1.623126] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    2.651940] gpmi-nand 1806000.gpmi-nand: DMA timeout, last DMA :2
[    2.658146] gpmi-nand 1806000.gpmi-nand: Show GPMI registers :
[    2.664203] gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x20830002
[    2.670474] gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000000
[    2.676849] gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
[    2.683217] gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
[    2.689482] gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
[    2.695840] gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
[    2.702202] gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x01c6800c
[    2.708470] gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00010101
[    2.714826] gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0xe0000000
[    2.721093] gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x23023336
[    2.727450] gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x000001ee
[    2.733812] gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0xff000001
[    2.740078] gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x00000000
[    2.746437] gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x05020000
[    2.752794] gpmi-nand 1806000.gpmi-nand: Show BCH registers :
[    2.758626] gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x00000100
[    2.764982] gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000010
[    2.771247] gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
[    2.777604] gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
[    2.783961] gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
[    2.790226] gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
[    2.796582] gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x00000000
[    2.802942] gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00000000
[    2.809208] gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0x030a2080
[    2.815564] gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x083e2080
[    2.821924] gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x070a4080
[    2.828191] gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0x10da4080
[    2.834546] gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x070a4080
[    2.840813] gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x10da4080
[    2.847170] gpmi-nand 1806000.gpmi-nand: offset 0x0e0 : 0x070a4080
[    2.853527] gpmi-nand 1806000.gpmi-nand: offset 0x0f0 : 0x10da4080
[    2.859794] gpmi-nand 1806000.gpmi-nand: offset 0x100 : 0x00000000
[    2.866153] gpmi-nand 1806000.gpmi-nand: offset 0x110 : 0x00000000
[    2.872513] gpmi-nand 1806000.gpmi-nand: offset 0x120 : 0x00000000
[    2.878779] gpmi-nand 1806000.gpmi-nand: offset 0x130 : 0x00000000
[    2.885135] gpmi-nand 1806000.gpmi-nand: offset 0x140 : 0x00000000
[    2.891401] gpmi-nand 1806000.gpmi-nand: offset 0x150 : 0x20484342
[    2.897759] gpmi-nand 1806000.gpmi-nand: offset 0x160 : 0x01000000
[    2.904117] gpmi-nand 1806000.gpmi-nand: offset 0x170 : 0x00000000
[    2.910400] gpmi-nand 1806000.gpmi-nand: BCH Geometry :
[    2.910400] GF length              : 13
[    2.910400] ECC Strength           : 8
[    2.910400] Page Size in Bytes     : 2110
[    2.910400] Metadata Size in Bytes : 10
[    2.910400] ECC Chunk Size in Bytes: 512
[    2.910400] ECC Chunk Count        : 4
[    2.910400] Payload Size in Bytes  : 2048
[    2.910400] Auxiliary Size in Bytes: 16
[    2.910400] Auxiliary Status Offset: 12
[    2.910400] Block Mark Byte Offset : 1999
[    2.910400] Block Mark Bit Offset  : 0
[    2.958231] gpmi-nand 1806000.gpmi-nand: Chip: 0, Error -110

What bootloader do is just attach the ubi and then boot the image

ubi0: attaching mtd1
ubi0: scanning is finished
ubi0: attached mtd1 (name "mtd=5", size 231 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 1844, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 4, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 4/2, WL threshold: 4096, image sequence number: 0
ubi0: available PEBs: 2, total reserved PEBs: 1842, PEBs reserved for
bad PEB handling: 36
Read 0 bytes from volume kernel to 82800000
No size specified -> Using max size (16887808)
## Loading kernel from FIT Image at 82800000 ...
   Using 'conf@2' configuration
   Verifying Hash Integrity ... OK
   Trying 'kernel@1' kernel subimage
     Description:  kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x828000ac
     Data Size:    6685920 Bytes = 6.4 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x80008000
     Entry Point:  0x80008000
     Hash algo:    sha1
     Hash value:   4646b0eea535d8ea9e2f7167bdeedc7668b2a948
   Verifying Hash Integrity ... sha1+ OK
## Loading fdt from FIT Image at 82800000 ...
   Using 'conf@2' configuration
   Trying 'fdt@2' fdt subimage
     Description:  imx6ull-bammi.dtb
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x82e67730
     Data Size:    28667 Bytes = 28 KiB
     Architecture: ARM
     Hash algo:    sha1
     Hash value:   1cf147576a30eb901a6306172f9385d6a6b65753
   Verifying Hash Integrity ... sha1+ OK
   Booting using the fdt blob at 0x82e67730
   Loading Kernel Image ... OK
   Using Device Tree in place at 82e67730, end 82e7172a
   Using Device Tree in place at 82e67730, end 82e7472a

Any idea?

Michael
