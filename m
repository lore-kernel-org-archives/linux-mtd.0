Received: from mail-oi0-f51.google.com ([209.85.218.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zcz3o-0004Ba-Re
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 17:03:03 +0000
Received: by oiev17 with SMTP id v17so29821241oie.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 10:02:35 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 18 Sep 2015 13:02:34 -0400
Message-ID: <CA+-FG62pYmr2ygk4F0kd5pLy-+jLcPtt2GbWVkFkT_HydLNJBg@mail.gmail.com>
Subject: UBIFS corruptions on NOR Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a custom board based on Freescale Vybrid Platform with a
SPI-NOR flash S25fl128s (16MiB). When using UBIFS on this flash part,
I see corruptions after UBIFS is mounted. See error/further below:

What could be the cause of these corruptions?

Thanks a lot,
Roshni

Kernel Version - 3.13

mtdinfo:
# mtdinfo -a
Count of MTD devices:           1
Present MTD devices:            mtd0
Sysfs interface supported:      yes

mtd0
Name:                           RFS
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          256 (16777216 bytes, 16.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true

# mtdinfo -u /dev/mtd0
mtd0
Name:                           RFS
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          256 (16777216 bytes, 16.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true
Default UBI VID header offset:  64
Default UBI data offset:        128
Default UBI LEB size:           65408 bytes, 63.9 KiB
Maximum UBI volumes count:      128

Kernel Log Snippet: Flash Chip Detection

fsl-quadspi 40044000.quadspi: s25fl128s (16384 Kbytes)
1 ofpart partitions found on MTD device 40044000.quadspi
Creating 1 MTD partitions on "40044000.quadspi":
0x000000000000-0x000001000000 : "RFS"


Kernel Log Snippet: First power up - UBIFS mount / error

UBI: attaching mtd0 to ubi0
UBI: scanning is finished
UBI: attached mtd0 (name "RFS", size 16 MiB) to ubi0
UBI: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
UBI: min./max. I/O unit sizes: 1/256, sub-page size 1
UBI: VID header offset: 64 (aligned 64), data offset: 128
UBI: good PEBs: 256, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence
number: 1295970766
UBI: available PEBs: 0, total reserved PEBs: 256, PEBs reserved for
bad PEB handling: 0
UBI: background thread "ubi_bgt0d" started, PID 643
snvs_rtc 400a7034.snvs-rtc-lp: setting system clock to 1970-01-01
00:00:00 UTC (0)
ALSA device list:
  No soundcards found.
UBIFS: background thread "ubifs_bgt0_0" started, PID 646
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8
bytes/256 bytes
UBIFS: FS size: 15828736 bytes (15 MiB, 242 LEBs), journal size 784896
bytes (0 MiB, 12 LEBs)
UBIFS: reserved for root: 747629 bytes (730 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID
3CA0626F-A51A-4ECF-831D-BAA1E530F9CE, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:13.
Freeing unused kernel memory: 324K (8067a000 - 806cb000)
UBIFS error (pid 1): ubifs_decompress: cannot decompress 3278 bytes,
compressor lzo, error -22
UBIFS error (pid 1): read_block: bad data node (block 64, inode 336)
        magic          0x6101831
        crc            0xaf2c50e0
        node_type      1 (data node)
        group_type     0 (no node group)
        sqnum          7296
        len            3326
        key            (336, data, 64)
        size           4096
        compr_typ      1
        data size      3278
        data:
        00000000: 00 00 37 9a b5 00 eb 01 00 70 e3 f5 fe ff 1a 7f fe
ff ea 64 c4 1b e5 18 20 94 e5 00 10 dc e5 04
        00000020: 50 8c e2 02 00 53 e1 01 20 83 32 14 20 84 35 00 10
c3 35 01 02 00 2a 06 01 78 e3 74 fe ff 0a 01
        00000040: 80 88 e2 64 54 0b e5 e9 fe ff ea 90 c4 1b e5 34 30
a0 e3 94 e4 1b e5 9c e3 33 e0 24 30 93 15 8c
        00000060: 14 1b 15 64 04 1b 05 83 c1 91 17 00 c0 90 05 04 00
80 02 64 04 0b 05 00 00 5c e3 a0 00 00 0a fc
        00000080: 14 1b e5 80 24 1b e5 53 00 51 e2 01 00 a0 13 00 00
52 e3 00 00 a0 13 00 00 50 e3 7b 00 00 0a 78
        000000a0: 34 1b e5 01 00 73 e3 70 00 00 0a 0c 00 a0 e1 03 2e
1c 03 0c 5c e1 74 c4 1b 95 08 80 8c 90 7d fe
        000000c0: ff 9a 3c 2d 6c 01 02 ed fd ff ea 2c 2d 4c 00 01 e8
fd ff ea 7c 11 01 00 10 a0 e3 7c 1a 03 80 14
        000000e0: 0b e5 a3 e3 bc 38 00 a4 74 04 0b e5 8e ff ff ea 78
24 1b e5 42 7e 4b e2 08 70 47 e2 28 04 0b e5
        00000100: 44 c4 0b e5 00 00 52 e3 04 00 87 e5 37 00 00 ba 01
0a 52 e3 2a 00 00 8a 78 c4 1b e5 0e 30 8c e2
        00000120: 00 c0 a0 e3 07 30 c3 e3 80 c4 0b e5 03 d0 4d e0 08
c0 8d e2 11 1d 4b e2 0c 00 a0 e1 78 24 1b e5
        00000140: 07 30 a0 e1 04 10 41 e2 24 c5 0b e5 c9 07 01 eb 01
00 70 e3 74 04 0b e5 24 c5 1b e5 72 ff ff 1a
        00000160: c3 fd ff ea 78 e4 1b e5 80 c4 0b e5 01 00 7e e3 00
30 a0 13 01 30 a0 03 05 00 5e e3 01 30 83 c3
        00000180: 00 00 53 e3 09 00 00 1a 64 c2 9f e5 80 04 1b e5 0c
c0 8f e0 74 04 0b e5 63 ff ff ea 54 32 2c 3c
        000001a0: 05 00 37 b0 fd ff ea 44 c2 9f e5 06 e0 a0 e3 74 e4
0b e5 0c c0 8f e0 59 ff ff ea 02 00 a0 e1 3e
        000001c0: 72 02 eb 00 00 50 e3 d0 ff ff 1a 78 04 1b e5 09 56
ff eb 00 c0 50 e2 a3 fd ff 0a 01 e0 a0 e3 80
        000001e0: e4 0b e5 d0 ff ff ea 11 5d 4b e2 00 7f 3f 50 45 e2
6c 17 01 05 10 a0 e1 6d 25 9a 2d ec 02 02 95
        00000200: fd ff 0a 28 9c 47 03 53 e3 d2 01 00 1a 6c 49 6c 25
01 01 20 83 e2 6c 24 05 be 01 00 8a 0e 30 82
        00000220: e2 32 7c 04 6c 30 7c 0a 7c 0b 6c 0b 01 83 07 01 eb
7c 55 01 2e ff ff ea 2c 4c 09 00 01 55 e1 1d
        00000240: 00 00 8a 04 c5 1b e5 05 80 88 e0 00 00 5c e3 0f 9c
54 04 57 e3 0d 00 00 da 07 7c 14 dc 54 07 b5
        00000260: 00 c0 a0 e3 07 30 c3 e3 80 c4 0b e5 03 d0 4d e0 08
c0 8d e2 11 1d 4b e2 0c 00 a0 e1 78 24 1b e5
        00000280: 07 30 a0 e1 04 10 41 e2 24 c5 0b e5 c9 07 01 eb 01
00 70 e3 74 04 0b e5 24 c5 1b e5 72 ff ff 1a
        000002a0: c3 fd ff ea 78 e4 1b e5 80 c4 0b e5 01 00 7e e3 00
30 a0 13 01 30 a0 03 05 00 5e e3 01 30 83 c3
        000002c0: 00 00 53 e3 09 00 00 1a 64 c2 9f e5 80 04 1b e5 0c
c0 8f e0 74 04 0b e5 63 ff ff ea 54 32 2c 3c
        000002e0: 05 00 37 b0 fd ff ea 44 c2 9f e5 06 e0 a0 e3 74 e4
0b e5 0c c0 8f e0 59 ff ff ea 02 00 a0 e1 3e
        00000300: 72 02 eb 00 00 50 e3 d0 ff ff 1a 78 04 1b e5 09 56
ff eb 00 c0 50 e2 a3 fd ff 0a 01 e0 a0 e3 80
        00000320: e4 0b e5 d0 ff ff ea 11 5d 4b e2 00 7f 3f 50 45 e2
6c 17 01 05 10 a0 e1 6d 25 9a 2d ec 02 02 95
        00000340: fd ff 0a 28 9c 47 03 53 e3 d2 01 00 1a 6c 49 6c 25
01 01 20 83 e2 6c 24 05 be 01 00 8a 0e 30 82
        00000360: e2 32 7c 04 6c 30 7c 0a 7c 0b 6c 0b 01 83 07 01 eb
7c 55 01 2e ff ff ea 2c 4c 09 00 01 55 e1 1d
        00000380: 00 00 8a 04 c5 1b e5 05 80 88 e0 00 00 5c e3 0f 9c
54 04 57 e3 0d 00 00 da 07 7c 14 dc 54 07 b5
        000003a0: 81 00 eb 01 00 70 e3 bb fd bd 53 14 31 7c 0a 00 20
0a 00 00 8a 08 80 80 e0 74 d4 1b e5 f0 fd ff
        000003c0: ea 1c 01 9f e5 ce 27 00 e3 18 11 9f e5 18 31 9f e5
00 00 8f e0 01 10 8f e0 03 30 8f e0 f9 98 ff
        000003e0: eb 08 31 2c 7c 05 03 a4 fd ff ea f8 00 ac 06 03 f4
10 9f e5 f4 30 2c cc 00 02 ec 98 ff eb 90 6c
        00000400: 90 00 00 19 70 a0 e3 94 04 1b e5 00 30 a0 e3 97 0c
27 e0 2c 20 97 e5 02 11 a0 e1 0e 10 81 e2 07
        00000420: 10 c1 e3 01 d0 4d e0 08 10 8d e2 3f 00 00 ea 08 3b
0f 00 40 3a 0f 00 64 6d 0f 00 3c 01 00 00 d8
        00000440: 6b 0f 00 0c 6b 0f 00 fc 6a 0f 00 60 46 0f 00 64 2f
00 00 04 2f 00 00 24 7c 0d 00 f4 2e 00 00 10
        00000460: 7c 0d 00 98 6a 0f 00 d4 7b 0d 00 a0 2e 00 00 b0 37
0f 00 98 37 0f 00 10 37 0f 00 00 36 0f 00 9c
        00000480: 64 0f 00 30 64 0f 00 e0 31 0f 00 b4 75 0d 00 6c 28
00 00 8c 05 00 00 44 28 00 00 60 31 0f 00 a4
        000004a0: bc 0d 00 d0 bc 0d 00 7c bd 0d 00 c0 bc 0d 00 b0 bc
0d 00 5c bd 0d 00 c4 2e 0f 00 68 2e 0f 00 54
        000004c0: 2e 0f 00 28 0c 0e 00 74 2d 0f 00 04 ba 0d 00 18 b8
0d 00 08 b8 0d 00 b4 b8 0d 00 14 2c 0f 00 a8
        000004e0: b7 0d 00 d4 b7 0d 00 80 b8 0d 00 e8 27 0f 00 7c b3
0d 00 a8 b3 0d 00 54 b4 0d 00 00 26 0f 00 ec
        00000500: 25 0f 00 d4 b1 0d 00 70 b1 0d 00 1c b2 0d 00 40 31
0f 00 58 30 0f 00 24 00 97 e5 8c c4 1b e5 00
        00000520: 00 83 e0 80 01 8c e0 03 01 81 e7 01 30 83 8c bb 04
f7 ff ff 1a 14 30 94 8c be 8c bd 00 0d 10 83
        00000540: 32 25 20 a0 33 14 10 84 35 00 20 c3 35 15 01 00 2a
0c 30 d7 e5 08 00 13 e3 10 01 00 0a 2a ac 00
        00000560: 00 06 04 01 00 2a 01 10 83 e2 23 20 a0 e3 14 10 84
e5 02 50 a0 e3 00 20 c3 e5 7c 05 03 a3 03 b0
        00000580: e1 09 00 2c bc 00 02 01 10 83 32 27 29 6c 01 7c 07
6c 05 06 01 50 85 e2 40 00 13 e3 c4 31 bd 00
        000005a0: 2b 29 be 00 d5 00 ac 11 7c 05 02 20 00 13 e3 08 31
bd 00 2d 29 bc 00 01 bd 00 00 2a 6c 05 0a 10
        000005c0: 10 97 e5 30 00 51 e3 57 00 00 0a 0d cc 19 32 ed 00
49 29 ed 00 c0 cc 07 01 04 00 97 e5 6c 77 04
        000005e0: 78 00 00 1a 00 30 97 9d d1 2a 31 dd 01 2e 29 ee 00
67 00 6c e4 00 08 75 e3 ab fc ff 0a 41 ce 4b
        00000600: e2 00 00 97 e5 0c c0 4c e2 0a 20 a0 e3 0c 10 a0 e1
6d 53 74 6c 8e 00 0d 50 85 e2 8d f8 ff eb 09
        00000620: 20 a0 e1 08 90 a0 e1 07 80 a0 e1 06 70 a0 e1 00 60
a0 e1 0a 00 00 ea 8c 2d 0e 00 94 e5 01 10 d6
        00000640: e4 00 00 53 e1 01 00 83 32 14 00 bd f0 2d cc 0c 01
31 00 00 0a 6c 1c 00 0c 74 c4 1b e5 0c 00 56
        00000660: e1 f1 ff ff 3a 07 60 a0 e1 08 70 a0 e1 09 80 a0 e1
02 90 a0 e1 08 10 6e 18 51 e3 2f 3d 06 20 28
        00000680: 5d 1f 27 df 09 7e fc ff 9c 09 7d cc 2d 2f 1f 0f 55
e1 23 9c 78 03 85 e0 ff fc ff ea 7e d4 8a b3
        000006a0: ac 7f 6f c4 6f fc ff af 16 20 94 e5 8c 49 29 7d 01
0a de 29 9e ff bc 06 02 20 25 0b e5 7b cc 07
        000006c0: 07 20 25 1b e5 cb ff ff 1a 07 60 bd 15 5d cd 0b 73
dc 03 09 f0 ff ff 1a 58 fc ff ea 71 10 ef e6
        000006e0: 6d 0e 6d dc 02 02 d2 ff ff 1a 52 6e 0e 33 1f 2b 6c
1b 00 01 4d fc ff ea 24 03 1f e5 e9 27 00 e3
        00000700: 28 13 1f e5 28 33 1f 2b 7c 11 01 e1 97 ff eb 7c 08
02 2e 10 a0 e3 5a cc 09 05 92 ff ff 1a 3f fc
        00000720: ff ea 7c 35 9f 34 c0 4c e2 7c 34 7c 35 6c 35 07 23
f8 ff eb 00 20 65 e0 02 c0 6e cb 0b e5 2e cd
        00000740: 06 0c 2d cc 06 01 05 10 d6 e7 2e cd 06 31 ce 2c c4
ff ac 2c 7c d8 01 05 30 8c e0 6c 37 05 03 00
        00000760: 5c e1 ef ff ff 8a 6c 20 2a ec 06 08 61 ff ff ea 10
00 13 e3 42 ff ff 2b ec 0d 6d 69 20 29 cd 09
        00000780: 08 29 6d 0c 37 cc 2c 02 2d 10 a0 e3 22 dd 1b 3c 7c
2b dc 2a 02 20 10 a0 e3 1c dc 02 02 f1 ff ff
        000007a0: 1a 01 dc 02 02 2b 10 a0 e3 16 dc 02 03 24 ff ff 1a
fb fb ac 35 02 49 10 a0 e3 10 dc 02 02 39 ff
        000007c0: ff 1a f5 dc 02 6d 38 0a dc 02 6c 38 02 c7 ff ff 1a
8d cc 0f 02 23 10 a0 e3 03 cc 03 01 e9 fb ff
        000007e0: 0a 6c 83 6c 7d 07 f8 fe ff ea 01 50 a0 e3 f6 fe ac
0b 03 25 10 a0 e3 f9 b2 ac 48 02 e4 fe ff 1a
        00000800: de cc 0b 02 27 10 a0 e3 f3 dc 02 22 6c 2a 03 d8 fb
ff ea ec 34 2c 9c 07 02 d3 fb ff ea fc 2d 4e
        00000820: 00 ce fb ac ee 6e 13 60 70 bc ee 6c 13 01 3a fe ff
1a 6c f1 7c 02 01 29 54 ff eb 7c ef 7e 02 c2
        00000840: fb 28 0c 1e 04 37 fe ff ea 48 05 1f 9c d2 03 4c 15
1f e5 4c 35 2c dc 08 00 0c 53 97 ff eb 02 60
        00000860: a0 e1 00 c0 e0 e3 70 24 0b e5 88 c4 0b e5 b0 24 0b
e5 90 24 0b e5 a8 24 22 ac 22 00 34 56 e3 1a
        00000880: 3d 4d e2 00 20 a0 e3 08 d0 43 e2 94 34 0b e5 50 24
0b e5 26 01 00 1a 88 c4 1b e5 01 00 7c e3 e7
        000008a0: 00 00 0a 60 c4 1b e5 58 c4 0b e5 00 30 dc e5 00 00
53 e3 f0 00 00 0a 00 70 a0 e3 45 ee 4b e2 8c
        000008c0: 84 0b e5 6c f4 00 06 84 a4 0b e5 1a 6d a0 e3 80 94
0b e5 07 a0 a0 e1 98 74 0b e5 07 90 a0 e1 22
        000008e0: 6c 21 07 0e 80 a0 e1 94 54 1b e5 78 44 6d 0e 00 9c
70 06 09 40 85 e0 07 10 a0 e1 04 6c 89 00 02
        00000900: 30 a0 e1 7b 72 00 eb 18 40 94 e5 01 a0 8a e2 00 70
87 e0 58 6f 05 30 d4 e5 7c 0d 00 12 12 00 00
        00000920: 0a 34 00 a0 e3 90 0a 09 e0 09 00 56 e1 ee ff ff 8a
86 20 a0 e1 0f 20 82 e2 0f 20 c2 e3 08 10 82
        00000940: e2 9c e4 00 05 00 8d e2 02 10 80 e0 01 00 55 e1 05
10 a0 e1 06 20 82 00 00 50 a0 e1 6c 20 7c 5f
        00000960: 00 40 73 e7 00 eb df ff ff ea 50 24 1b e5 98 a4 0b
e5 8c 84 1b e5 02 00 57 e1 02 70 a0 31 94 54
        00000980: 0b e5 7e 03 77 e3 78 44 1b e5 84 a4 1b e5 80 94 1b
e5 74 74 0b e5 dd 00 00 8a 74 c4 1b e5 0c 52
        000009a0: a0 e1 01 0a 55 e3 ce 00 00 8a 0e 50 85 e2 07 50 c5
e3 05 d0 24 0c 27 05 8c c4 0b e5 74 e4 1b e5
        000009c0: 6c d6 00 20 3c 10 94 e5 8e c1 8c e0 04 10 11 e2 ff
10 a0 13 84 c4 0b e5 0e c1 a0 e1 84 e4 1b e5
        000009e0: 0c 20 a0 e1 78 c4 0b e5 0c 70 8e e0 07 00 a0 e1 1f
e8 00 eb 98 c4 23 cc 2a 00 05 e3 32 00 00 0a
        00000a00: 08 07 1f e5 00 60 a0 e3 d4 44 0b e5 06 c0 a0 e1 dc
a4 7c 25 09 8f e0 e4 94 0b e5 80 04 0b e5 00
        00000a20: a0 bc 28 00 0b e0 84 0b e5 98 44 1b e5 84 94 1b e5
09 00 00 ea 28 20 95 e5 24 30 95 e5 03 21 87
        00000a40: e7 30 27 2c 00 00 03 89 e7 01 60 86 e2 34 50 85 e2
04 00 56 e1 16 00 00 0a 20 30 95 9c c1 02 03
        00000a60: c1 87 17 1c 29 2f 00 2c 10 95 22 fe 2f e3 f2 7c 7c
04 00 51 e3 ea ff ff 0a 7c 09 00 06 05 00 a0
        00000a80: e1 00 20 9a e5 08 e0 95 e5 03 31 a0 e1 0e 81 92 e7
03 20 87 e0 22 1c 26 05 03 30 89 e0 38 ff 2f
        00000aa0: e1 22 2c 26 00 02 e4 ff ff ea e0 84 1b e5 d4 44 1b
e5 dc a4 1b e5 e4 94 1b e5 6c 26 22 0c 26 00
        00000ac0: 08 c0 fb ff 0a 11 3d 4b e2 e0 27 1f e5 0c 30 43 e2
f4 8b 9f ed 08 30 43 e2 8c 64 22 4c 31 00 20
        00000ae0: 0b e5 00 50 a0 e3 78 34 1b e5 07 c1 00 e3 02 20 8f
e0 80 24 0b e5 05 20 97 e7 05 00 52 e3 12 00
        00000b00: 00 ca 03 00 52 e3 2b 00 00 aa 01 00 52 e3 23 00 00
ca 22 7e 2d 21 00 7c 01 00 0e 72 e3 2d 00 00
        00000b20: 1a 3c 30 94 e5 04 00 13 e3 3a 00 00 1a 7c 03 9f e5
42 27 00 e3 78 13 9f e5 78 33 2c bc 25 00 01
        00000b40: 90 96 ff eb 01 0c 52 e3 28 00 00 0a 1d 00 00 da 02
0c 52 23 7f 28 01 0b 52 22 7c 28 07 0a 0c 00
        00000b60: 52 e1 19 00 00 1a 54 22 1c 2e 00 22 20 82 e2 07 20
c2 e3 d0 00 c2 e1 08 20 82 e2 54 24 0b e5 f0
        00000b80: 00 c6 e1 04 50 85 e2 08 60 86 e2 05 00 53 e1 d5 ff
ff 1a 89 fb ff ea 54 24 1b e5 00 10 92 e5 04
        00000ba0: dc 04 04 00 10 86 e5 f4 ff ff 9c 02 00 12 04 10 82
e2 54 14 0b e5 00 20 92 e5 00 20 86 e5 ee ff
        00000bc0: ff ea 07 00 52 e3 e5 ff ff da 02 0b 12 e3 f5 ff ff
1a 22 9f 2e 00 10 90 9d 2f 1e 6f f6 8b 86 ed
        00000be0: 7c 29 3a 1c 02 04 dc ff ff ea 9c 02 9f 8c c4 05 60
a4 00 eb 94 32 9f e5 23 9c 34 0e 30 99 e7 04
        00000c00: 30 93 e5 2c c0 93 e5 28 30 93 e5 a8 34 ac 76 0d 01
30 43 e2 73 30 ef e6 fd 00 53 e3 00 c0 a0 83
        00000c20: 7c 80 00 0a 09 ff ff ea 98 34 0b e5 03 50 a0 e1 74
34 0b e5 49 ff ff ea 23 21 42 e2 02 21 91 e7
        00000c40: 6c 2c 09 dc ff ff 0a 84 14 1b e5 05 20 91 e7 22 8d
38 0e cc 22 00 02 02 d0 4d e0 80 24 1b e5 08
        00000c60: 00 8d e2 00 00 86 e5 05 e0 97 e7 7c 1b 09 23 e1 4e
e2 0e e1 92 e7 20 35 0b e5 7d 43 0e 6c 5d 06
        00000c80: e4 0b e5 32 ff 2f e1 20 35 24 8c 39 01 ae ff ff ea
6f 4a 26 6f 02 23 7c 31 01 2c ff ff 1a 7f 01
        00000ca0: f1 52 ff 9c 01 00 12 70 04 0b e5 8c 04 0b 15 2b ff
ff 1a 27 fb ff ea c0 21 9f e5 4b 10 a0 e3 03
        00000cc0: 60 a0 e1 02 20 9f e7 02 10 89 e7 11 00 00
UBIFS error (pid 1): do_readpage: cannot read page 64 of inode 336, error -22
init started: BusyBox v1.23.1 (2015-03-12 01:57:33 EDT)
UBIFS error (pid 650): ubifs_decompress: cannot decompress 2938 bytes,
compressor lzo, error -22
UBIFS error (pid 650): read_block: bad data node (block 79, inode 336)
        magic          0x6101831
        crc            0x9637b14b
        node_type      1 (data node)
        group_type     0 (no node group)
        sqnum          7323
        len            2986
        key            (336, data, 79)
        size           4096
        compr_typ      1
        data size      2938
        data:
        00000000: 00 22 08 60 14 e2 22 00 00 1a 21 0c 14 e3 8c c1 1b
e5 10 06 00 0a 00 00 5c e3 a8 0a 00 1a 58 31
        00000020: 1b e5 04 20 83 e2 58 21 0b e5 00 30 93 e5 98 31 0b
e5 98 c1 1b e5 7c 03 0b f0 0e 00 0a 19 0e a0
        00000040: e3 d6 1a ff eb 98 41 6c 02 0d 50 e3 00 70 a0 e1 00
00 84 e5 70 0a 00 0a ac c1 6c 02 00 0c 5c e3
        00000060: cc 08 00 0a 00 30 9c e5 20 00 53 e3 c9 08 00 0a 01
20 83 e2 03 10 a0 e1 64 40 a0 e3 6c 04 05 a4
        00000080: 41 0b e5 02 10 81 e2 8c 08 00 0d 20 8c e5 01 41 8c
e7 01 00 78 e3 c4 05 00 0a 04 30 99 e5 08 20
        000000a0: 99 e5 02 00 53 e1 58 13 00 2a 6c 07 06 04 20 89 e5
00 80 d3 e5 88 7c 0b 00 5f 30 a0 e3 f0 50 4b
        000000c0: e2 f0 30 0b e5 04 30 85 e5 88 10 a0 e1 34 20 9c 74
c1 1b e5 03 30 9f e7 03 40 8c e7 84 7f 32 80
        000000e0: a0 e3 7c 56 07 00 40 e0 03 84 41 0b 05 24 fe ac 37
ec 07 0a 06 30 c4 e3 01 3a 83 e3 80 31 0b e5
        00000100: b4 cc 03 0d 08 00 14 e3 04 01 00 1a 02 00 14 e3 97
05 00 0a 7c 63 6e 08 03 08 30 6c 0c 04 00 20
        00000120: a0 e3 00 a0 83 7c 65 05 e5 70 21 0b e5 a4 fc ff 8d
43 00 cc 13 09 40 40 84 e3 80 41 0b e5 9d fe
        00000140: ff ea 6e 16 86 03 2c 7e 0b 31 12 2c 7c 0b 01 25 00
58 e3 7c 2e 01 24 12 00 1a ec 08 00 53 8f fc
        00000160: ff ea 88 4c 0e 00 00 4c 0e 00 f8 7f 0e 00 3c 01 00
00 8c f4 0d 00 48 4a 0e 00 14 48 0e 00 04 48
        00000180: 0e 00 78 15 0e 00 94 47 0e 00 40 45 0e 00 68 44 0e
00 d8 3d 0e 00 88 39 0e 00 38 38 0e 00 94 35
        000001a0: 0e 00 14 67 0e 00 f4 66 0e 00 0c 34 0e 00 10 2f 0e
00 e4 2e 0e 00 bc 2d 0e 00 a0 2d 0e 00 01 00
        000001c0: 78 e3 6b 2d 5e 02 d8 11 2c 5c 02 6c 12 7c 5c 7c 20
05 01 c0 4c c2 68 c1 0b c5 7c 19 00 10 db 11
        000001e0: 00 0a 2d 10 58 e2 00 20 71 e2 01 20 b2 e0 2b 00 58
e3 02 30 a0 11 01 30 82 03 00 00 53 e3 cd 03
        00000200: be 59 d8 21 7c 45 01 5c e3 cd 11 2c fd 03 f7 2d 9d
01 68 7f 6a a0 8a e2 6c 4b 05 01 40 44 c2 68
        00000220: 41 0b c5 6c 7e 00 06 78 20 ef e6 38 30 9c e5 02 31
93 e7 6e 00 53 e3 8b 06 00 0a 69 00 53 e3 6c
        00000240: 5d 7c 12 09 30 20 58 e2 00 30 72 e2 02 30 b3 e0 b4
cc 03 0d 08 00 14 e3 04 01 00 1a 02 00 14 e3
        00000260: 97 05 00 0a 7c 63 6e 08 03 08 30 6c 0c 04 00 20 a0
e3 00 a0 83 7c 65 05 e5 70 21 0b e5 a4 fc ff
        00000280: 8d 43 00 cc 13 09 40 40 84 e3 80 41 0b e5 9d fe ff
ea 6e 16 86 03 2c 7e 0b 31 12 2c 7c 0b 01 25
        000002a0: 00 58 e3 7c 2e 01 24 12 00 1a ec 08 00 53 8f fc ff
ea 88 4c 0e 00 00 4c 0e 00 f8 7f 0e 00 3c 01
        000002c0: 00 00 8c f4 0d 00 48 4a 0e 00 14 48 0e 00 04 48 0e
00 78 15 0e 00 94 47 0e 00 40 45 0e 00 68 44
        000002e0: 0e 00 d8 3d 0e 00 88 39 0e 00 38 38 0e 00 94 35 0e
00 14 67 0e 00 f4 66 0e 00 0c 34 0e 00 10 2f
        00000300: 0e 00 e4 2e 0e 00 bc 2d 0e 00 a0 2d 0e 00 01 00 78
e3 6b 2d 5e 02 d8 11 2c 5c 02 6c 12 7c 5c 7c
        00000320: 20 05 01 c0 4c c2 68 c1 0b c5 7c 19 00 10 db 11 00
0a 2d 10 58 e2 00 20 71 e2 01 20 b2 e0 2b 00
        00000340: 58 e3 02 30 a0 11 01 30 82 03 00 00 53 e3 cd 03 be
59 d8 21 7c 45 01 5c e3 cd 11 2c fd 03 f7 2d
        00000360: 9d 01 68 7f 6a a0 8a e2 6c 4b 05 01 40 44 c2 68 41
0b c5 6c 7e 00 06 78 20 ef e6 38 30 9c e5 02
        00000380: 31 93 e7 6e 00 53 e3 8b 06 00 0a 69 00 53 e3 6c 5d
7c 12 09 30 20 58 e2 00 30 72 e2 02 30 b3 e0
        000003a0: 6f 14 00 30 a0 9c 0f 03 51 05 00 0a 6c 41 6c 92 0f
54 e3 d0 0d 00 0a 64 41 1b e5 30 30 a0 e3 00
        000003c0: 30 c4 e5 2a 9e 11 be 0d 31 bc 03 dc 06 fc 10 7c 0c
6c 0b 05 a0 07 00 0a 88 41 1b e5 ad 12 94 8c
        000003e0: 12 00 03 78 00 53 e3 65 30 a0 13 01 60 a0 13 bc 31
0b 15 36 05 00 1a 6c 7c 4f 04 00 5c e3 2c 14
        00000400: 00 0a bc 85 0f 78 e3 64 c1 1b e5 80 30 c4 e3 02 3b
83 e3 01 80 cc e5 7e 4e 64 16 2c 4e 04 55 16
        00000420: 31 2c 02 dc 6b 09 02 0e 00 da 01 c0 4c e2 70 30 a0
e3 6c 8d 09 02 60 a0 e3 bc 31 0b e5 1a 05 00
        00000440: ea 7e 13 01 00 3c 1e 12 2f 07 6c 70 01 5c e3 d4 11
30 2c 0b 2a 9e 17 ca 11 bd 36 01 fd 90 00 bc
        00000460: 90 01 58 19 ff eb bc 7b 01 50 e3 a8 01 6c 3a 01 8c
e5 b6 11 28 de 17 aa 11 28 de 17 a7 11 28 dc
        00000480: 17 36 1e 12 51 07 2c ed 03 ef 2d 1c 12 9c 40 04 30
8a e2 a2 06 00 0a 8c 43 08 00 54 e3 03 a0 a0
        000004a0: d1 1c 00 00 da 7c 37 01 02 40 8a e2 6c c5 01 01 a0
44 e2 7c 1f 6c c6 00 12 02 50 4c e2 0a 00 00
        000004c0: 2a 00 00 55 e3 01 10 83 e2 04 10 89 e5 00 00 d3 e5
99 08 00 da 01 30 a0 e1 01 40 84 e2 7c 04 01
        000004e0: 01 50 45 e2 7c 06 00 0c f4 ff ff 3a 09 00 a0 e1 11
78 00 eb 01 00 70 e3 e4 10 00 1a 44 33 1f e5
        00000500: 00 80 a0 e1 74 41 dc 89 02 30 94 e7 60 31 7c e1 00
06 a0 e3 70 31 0b e5 aa fb ff ea 70 31 1b e5
        00000520: 0a 00 53 e3 f4 fd ff 1a 94 31 6c 4c 04 53 e3 f1 fd
ff 0a 78 6c ad 00 37 00 54 e3 04 70 a0 c1 02
        00000540: 71 e0 d3 00 10 d0 e5 01 00 58 e1 42 01 00 1a 68 41
0b e5 00 60 a0 e1 64 21 1b e5 00 a0 65 e0 6c
        00000560: 41 1b e5 05 00 54 e1 32 07 00 0a 05 80 c2 e7 01 50
85 e2 01 10 d6 e5 05 30 8a e0 00 00 51 e3 47
        00000580: 00 7c 35 00 0a 57 e3 49 00 00 0a 04 10 99 e5 08 00
99 e5 00 00 51 e1 10 07 00 2a 01 00 81 e2 04
        000005a0: 00 6c d3 0b d1 e5 01 10 f6 e5 01 c0 8c e2 01 70 47
e2 6c 0d 05 e9 ff ff 0a 6c 41 0b e5 6c 26 05
        000005c0: 64 21 0b e5 03 20 a0 e1 7c 09 01 4e 10 00 1a 8c 2a
0d 50 45 e2 07 40 a0 c1 6c 01 1b e5 05 00 50
        000005e0: e1 84 7c 36 04 00 54 e3 64 31 1b e5 7c 5d 6f 7b 05
80 c3 9d 11 0f 6c 0f 6c f2 05 10 99 e5 01 00
        00000600: 53 e1 26 6c 34 fe 2a 80 d3 9c 0e 00 2e a6 fd ff ea
88 01 1b e5 88 30 a0 e1 34 10 90 e5 b3 30 91
        00000620: e1 01 0a 13 e3 e6 ff ff 1a ac fd ff ea 90 04 1f e5
60 11 1b e5 74 21 1b e5 00 30 9f e7 03 10 82
        00000640: e7 99 fd ff ea 01 00 50 e3 a6 13 00 1a 6c 37 01 04
70 87 e2 6c 5b 6c 6c 8d 5b 01 ac 3c 7c 3b 7e
        00000660: 35 f4 00 30 5c 0c 01 5d fe ff ea 7c 1c 6c 1c 6c 1d
05 c7 ff ff ea 9c 71 1b e5 7c 01 6c 1e 6c 03
        00000680: 00 02 05 40 a0 e1 78 11 1b e5 02 00 51 e1 04 50 a0
21 89 fd ff 2a 7c 1b 09 01 30 62 e0 04 50 83
        000006a0: e0 07 00 00 0a 7c 0e 01 78 10 ef e6 7c 40 00 03 ec
21 0b e5 f0 c1 0b e5 10 79 00 eb f0 c1 1b e5
        000006c0: ec 21 1b e5 78 7c 92 0a 80 42 e2 08 00 54 e1 0e 00
00 2a 02 60 bc 48 05 0c a0 a0 e1 01 10 76 e5
        000006e0: fc 06 05 03 79 00 eb 04 00 56 e1 6c 06 01 f8 ff ff
1a 7c 06 0d 04 30 62 e0 01 30 83 e2 03 80 88
        00000700: e0 03 c0 8a e0 7c 52 05 00 80 d8 e5 69 fd ff 1a 9c
82 0c 0a 14 e3 80 00 00 0a 28 00 58 e3 7e 00
        00000720: 00 1a 7c 5a 6c 1e 7c 29 7c 1e 02 38 40 90 e5 8a 2d
9c 18 6c 3d 04 78 30 ef e6 03 31 94 9c a1 03
        00000740: 70 00 00 1a 88 11 22 1c 22 04 78 e3 38 40 91 e5 62
2d 3d 17 57 37 fc 00 03 a0 e1 03 30 94 e7 6d
        00000760: a9 5f 6d 08 21 ec 08 01 92 e5 2e 02 2c 6d 0e 5c 37
0c 01 07 94 e7 6c 00 53 e3 4f 00 00 1a 7d 2a
        00000780: 28 2d dd 00 45 2d dd 00 29 8c dc 03 8c e2 45 00 00
1a ee b3 e5 0c 28 6e 16 01 50 be b3 2a fd 6c
        000007a0: 3b 7c 6a 01 54 e3 02 0d bc 7f 6c 57 6f b8 00 80 c4
6d 5b c5 ec 25 6c 56 6c c5 7d 25 05 2d 9c 08
        000007c0: 01 02 c0 8a e2 6c 0a 01 cc fc ff ea 7c 34 6e 3b 16
77 ac 7d 6c 7c 6c 3c 05 f5 ff ff 1a 30 37 1f
        000007e0: e5 7c 04 2e cc 0f 7c 7c 6e d9 e5 fc dc 35 06 0b 14
e3 f5 0c 00 1a 0a 30 ad 81 e2 6c fe 00 22 c1
        00000800: 1b e5 55 1f 4b e2 70 21 1b e5 64 01 1b e5 40 40 1c
e2 12 00 00 0a 80 30 0c e2 3c 87 ff eb 08 fd
        00000820: ff ea 01 c0 83 e2 01 50 d3 e5 7c c1 0b e5 ce fb ff
ea 64 7c cb 0b 30 d4 e5 2b 00 53 e3 2d 00 53
        00000840: 13 e7 fc ff 9c 27 01 55 0f 00 0a ec 51 09 02 80 a0
e3 6e 78 00 eb f6 fb ff ea 22 4c 26 7c 09 02
        00000860: 3f 87 ff eb f4 cc 0e 7c 01 00 01 69 87 ff eb e0 11
0b e5 ef fc ff ea 00 00 56 e3 4c 00 00 9c 4a
        00000880: 03 04 00 14 e3 24 03 28 fe 22 75 07 30 cc 17 02 b0
00 c3 e1 84 7c 10 25 bc 22 6c a3 05 84 41 0b
        000008a0: e5 72 fa ff ea 7c 18 00 18 f4 17 ff eb f5 fb ff ea
48 38 1f e5 05 0d 4b e2 00 10 a0 e3 03 30 8f
        000008c0: e0 bc 30 93 e5 33 ff 2f e1 eb fb ff ea 60 c8 1f e5
09 20 7e 60 93 e7 6c 04 04 0c c0 8f e0 b8 30
        000008e0: 9c 9c 03 06 00 20 99 e5 ff f9 ff ea 70 cc 6b 7c 19
0b 3a 78 00 eb c2 fb ff ea 78 21 1b e5 d9 fe
        00000900: ae 32 b2 76 28 3c 06 04 08 ff ff 1a b0 38 1f 28 2e
27 30 9c ac af 03 00 54 e3 9e fe ff 23 5c 2f
        00000920: 02 21 0c 1c e3 08 22 ae 29 41 1b 23 9c 29 00 03 00
00 94 e5 07 10 60 e0 41 01 5c e1 02 00 00 0a
        00000940: ab 17 ff eb 00 22 af 2c 00 84 15 9c 1b cc 35 6c dc
ec 1c 02 39 fa ff ea 08 dc 02 01 35 fc ff ea
        00000960: 27 9d 27 03 30 9d 04 e0 9c ef 04 83 e5 04 c0 83 e5
b2 22 fc 2f 09 c1 1b e5 04 00 1c e3 e7 02 00
        00000980: 0a 8c 7c 27 03 00 54 e3 a7 ff ff 23 ac 28 03 01 00
5c e3 88 12 bc 02 09 a0 c1 1b e5 07 31 44 e2
        000009a0: 03 31 8c e0 22 4e 35 f0 20 6c c8 08 93 e5 a0 ff ff
ea 08 40 1c e2 23 29 8d 30 54 25 8e 30 0d 10
        000009c0: 30 fc 01 7c 16 bc ee 09 5c e3 03 10 00 0a 64 00 a0
e3 75 17 30 2e 1e f3 0f 28 2e 1e e7 0f 28 2f
        000009e0: 1e e4 0f 00 27 0c 36 ed f1 ac 7c d4 04 20 8c e5 64
c0 a0 e3 22 8c 31 7f 0b 01 c1 80 23 1d 36 e0
        00000a00: 2d 7e 30 c6 0b 2c ec 15 22 4c 26 6c bd 22 5c 28 04
34 20 9c e5 b3 30 92 23 dd 35 2b 6c 4f 00 0e
        00000a20: c1 1b e5 70 71 0b e5 88 61 1b e5 21 5c 0c e2 68 71
1b e5 a8 c1 1b e5 68 51 0b e5 04 50 a0 e1 a4
        00000a40: 9c 25 04 55 e3 0b 00 00 1a 68 7c 8d 09 30 8c e2 00
80 cc e5 00 00 52 e3 05 6c 3a 01 c1 1b e5 8c
        00000a60: 7c e4 04 00 9c e5 04 10 80 e0 6c ce 03 b2 06 00 0a
03 c0 6c d8 09 57 e3 01 00 00 da 01 70 57 e2
        00000a80: a8 06 dc 93 dd d2 fb 22 2c 29 29 5f 1a 34 10 96 9c
d1 6c 14 7c d1 22 5c 38 05 e0 ff ff 0a 70 71
        00000aa0: 1b e5 22 fc 39 7f c2 a8 c1 0b 8c b7 7c 6d 05 01 a0
4a e2 93 77 00 eb 6e 8c b0 f9 28 9c 09 6c 17
        00000ac0: 06 00 40 cc e5 01 40 8c e2 09 de 13 00 00 24 7c 33
0a 04 10 60 e0 0c 00 51 e1 03 00 00 0a 0e cc
        00000ae0: 4e 05 98 c1 1b 15 00 00 8c 15 22 fc 31 22 ec 34 22
bf 20 a8 41 0b 9c e4 7c 38 05 84 c1 0b e5 9a
        00000b00: f9 ff ea 7c 30 6c dd 07 00 60 a0 13 0c 40 a0 11 10
00 7e 35 94 e5 6c 8d 06 0a 00 00 0a 08 70 84
        00000b20: e2 00 8c a1 08 97 e5 01 50 85 e2 00 00 93 e5 10 6c
0c 00 03 20 94 e5 04 30 97 e4 05 00 52 e1 00
        00000b40: 60 83 e5 f6 ff ff 8a 04 40 7c 06 00 18 54 e3 ee ff
ff 1a 00 00 e0 e3 20 d0 4b e2 f0 8f bd e8 80
        00000b60: 11 1b e5 08 60 11 e2 24 00 00 1a 21 0c 11 e3 a2 04
00 0a 8c 21 1b e5 11 00 00
UBIFS error (pid 650): do_readpage: cannot read page 79 of inode 336, error -22


Kernel Log: Subsequent power up

UBI: attaching mtd0 to ubi0
UBI: scanning is finished
UBI: attached mtd0 (name "RFS", size 16 MiB) to ubi0
UBI: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
UBI: min./max. I/O unit sizes: 1/256, sub-page size 1
UBI: VID header offset: 64 (aligned 64), data offset: 128
UBI: good PEBs: 256, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence
number: 1295970766
UBI: available PEBs: 0, total reserved PEBs: 256, PEBs reserved for
bad PEB handling: 0
UBI: background thread "ubi_bgt0d" started, PID 643
snvs_rtc 400a7034.snvs-rtc-lp: setting system clock to 1970-01-01
00:00:00 UTC (0)
ALSA device list:
  No soundcards found.
UBIFS: recovery needed
UBIFS: background thread "ubifs_bgt0_0" started, PID 646
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8
bytes/256 bytes
UBIFS: FS size: 15828736 bytes (15 MiB, 242 LEBs), journal size 784896
bytes (0 MiB, 12 LEBs)
UBIFS: reserved for root: 747629 bytes (730 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID
3CA0626F-A51A-4ECF-831D-BAA1E530F9CE, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:13.
Freeing unused kernel memory: 324K (8067a000 - 806cb000)
UBIFS error (pid 1): ubifs_read_node: bad node type (0 but expected 2)
UBIFS error (pid 1): ubifs_read_node: bad node at LEB 11:51096, LEB
mapping status 1
Not a node, first 24 bytes:
00000000: a0 00 00 00 00 02 00 00 01 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00                          ........................
CPU: 0 PID: 1 Comm: swapper Not tainted 3.13.9-00032-g0177644-dirty Parker
Backtrace:
[<80012a00>] (dump_backtrace+0x0/0x110) from [<80012d3c>] (show_stack+0x20/0x24)
 r6:00000001 r5:0000000b r4:0000c798 r3:00000000
[<80012d1c>] (show_stack+0x0/0x24) from [<804d374c>] (dump_stack+0x24/0x28)
[<804d3728>] (dump_stack+0x0/0x28) from [<801fb4e4>]
(ubifs_read_node+0x298/0x300)
[<801fb24c>] (ubifs_read_node+0x0/0x300) from [<8021d348>]
(ubifs_tnc_read_node+0x174/0x1f8)
[<8021d1d4>] (ubifs_tnc_read_node+0x0/0x1f8) from [<801fc5b8>]
(tnc_read_node_nm+0xd4/0x1ec)
 r9:87ba4c00 r8:00000000 r7:8782f1b8 r6:8782f000 r5:87ba4c00
r4:87004c48
[<801fc4e4>] (tnc_read_node_nm+0x0/0x1ec) from [<801ff3b4>]
(ubifs_tnc_locate+0x18c/0x1d4)
 r7:8782f1b8 r6:87891d28 r5:00000001 r4:8782f000
[<801ff228>] (ubifs_tnc_locate+0x0/0x1d4) from [<801ffad0>]
(ubifs_tnc_lookup_nm+0x38/0x224)
[<801ffa98>] (ubifs_tnc_lookup_nm+0x0/0x224) from [<801f20bc>]
(ubifs_lookup+0xb8/0x258)
[<801f2004>] (ubifs_lookup+0x0/0x258) from [<800d998c>] (lookup_real+0x30/0x5c)
[<800d995c>] (lookup_real+0x0/0x5c) from [<800da508>] (__lookup_hash+0x48/0x50)
 r5:874f96e8 r4:00000011
[<800da4c0>] (__lookup_hash+0x0/0x50) from [<800dae28>] (lookup_slow+0x48/0xb4)
 r5:87891dd8 r4:87891e80
[<800dade0>] (lookup_slow+0x0/0xb4) from [<800db8ac>]
(link_path_walk+0x324/0x904)
 r7:00000000 r6:87891dd0 r5:87891dd8 r4:87891e80
[<800db588>] (link_path_walk+0x0/0x904) from [<800de65c>]
(path_openat+0x394/0x5dc)
[<800de2c8>] (path_openat+0x0/0x5dc) from [<800df80c>] (do_filp_open+0x3c/0x98)
[<800df7d0>] (do_filp_open+0x0/0x98) from [<800d5a40>] (open_exec+0x40/0x108)
 r7:806d6c18 r6:806d6b90 r5:00000000 r4:87890038
[<800d5a00>] (open_exec+0x0/0x108) from [<800d7228>] (do_execve+0x180/0x630)
 r7:806d6c18 r6:806d6b90 r5:00000000 r4:87890038
[<800d70a8>] (do_execve+0x0/0x630) from [<800086ec>]
(try_to_run_init_process+0x30/0x60)
[<800086bc>] (try_to_run_init_process+0x0/0x60) from [<804d0730>]
(kernel_init+0xd8/0x128)
 r5:804d0658 r4:80711b80
[<804d0658>] (kernel_init+0x0/0x128) from [<8000f598>] (ret_from_fork+0x14/0x20)
 r4:00000000 r3:00000000
Starting init: /sbin/init exists but couldn't execute it (error -22)
UBIFS error (pid 1): ubifs_decompress: cannot decompress 3278 bytes,
compressor lzo, error -22
UBIFS error (pid 1): read_block: bad data node (block 64, inode 336)
        magic          0x6101831
        crc            0xaf2c50e0
        node_type      1 (data node)
        group_type     0 (no node group)
        sqnum          7296
        len            3326
        key            (336, data, 64)
        size           4096
        compr_typ      1
        data size      3278
        data:
        00000000: 00 00 37 9a b5 00 eb 01 00 70 e3 f5 fe ff 1a 7f fe
ff ea 64 c4 1b e5 18 20 94 e5 00 10 dc e5 04
        00000020: 50 8c e2 02 00 53 e1 01 20 83 32 14 20 84 35 00 10
c3 35 01 02 00 2a 06 01 78 e3 74 fe ff 0a 01
        00000040: 80 88 e2 64 54 0b e5 e9 fe ff ea 90 c4 1b e5 34 30
a0 e3 94 e4 1b e5 9c e3 33 e0 24 30 93 15 8c
        00000060: 14 1b 15 64 04 1b 05 83 c1 91 17 00 c0 90 05 04 00
80 02 64 04 0b 05 00 00 5c e3 a0 00 00 0a fc
        00000080: 14 1b e5 80 24 1b e5 53 00 51 e2 01 00 a0 13 00 00
52 e3 00 00 a0 13 00 00 50 e3 7b 00 00 0a 78
        000000a0: 34 1b e5 01 00 73 e3 70 00 00 0a 0c 00 a0 e1 03 10
a0 e1 24 c5 0b e5 39 e4 00 eb 24 c5 1b e5 00
        000000c0: ff 9a 3c 2d 6c 01 02 ed fd ff ea 2c 2d 4c 00 01 e8
fd ff ea 7c 11 01 00 10 a0 e3 7c 1a 03 80 14
        000000e0: 0b e5 a3 e3 bc 38 00 a4 74 04 0b e5 8e ff ff ea 78
24 1b e5 42 7e 4b e2 08 70 47 e2 28 04 0b e5
        00000100: 44 c4 0b e5 00 00 52 e3 04 00 87 e5 37 00 00 ba 01
0a 52 e3 2a 00 00 8a 78 c4 1b e5 0e 30 8c e2
        00000120: 00 c0 a0 e3 07 30 c3 e3 80 c4 0b e5 03 d0 4d e0 08
c0 8d e2 11 1d 4b e2 0c 00 a0 e1 78 24 1b e5
        00000140: 07 30 a0 e1 04 10 41 e2 24 c5 0b e5 c9 07 01 eb 01
00 70 e3 74 04 0b e5 24 c5 1b e5 72 ff ff 1a
        00000160: c3 fd ff ea 78 e4 1b e5 80 c4 0b e5 01 00 7e e3 00
30 a0 13 01 30 a0 03 05 00 5e e3 01 30 83 c3
        00000180: 00 00 53 e3 09 00 00 1a 64 c2 9f e5 80 04 1b e5 0c
c0 8f e0 74 04 0b e5 63 ff ff ea 54 32 2c 3c
        000001a0: 05 00 37 b0 fd ff ea 44 c2 9f e5 06 e0 a0 e3 74 e4
0b e5 0c c0 8f e0 59 ff ff ea 02 00 a0 e1 3e
        000001c0: 72 02 eb 00 00 50 e3 d0 ff ff 1a 78 04 1b e5 09 56
ff eb 00 c0 50 e2 a3 fd ff 0a 01 e0 a0 e3 80
        000001e0: e4 0b e5 d0 ff ff ea 11 5d 4b e2 00 7f 3f 50 45 e2
6c 17 01 05 10 a0 e1 6d 25 9a 2d ec 02 02 95
        00000200: fd ff 0a 28 9c 47 03 53 e3 d2 01 00 1a 6c 49 6c 25
01 01 20 83 e2 6c 24 05 be 01 00 8a 0e 30 82
        00000220: e2 32 7c 04 6c 30 7c 0a 7c 0b 6c 0b 01 83 07 01 eb
7c 55 01 2e ff ff ea 2c 4c 09 00 01 55 e1 1d
        00000240: 00 00 8a 04 c5 1b e5 05 80 88 e0 00 00 5c e3 0f 9c
54 04 57 e3 0d 00 00 da 07 7c 14 dc 54 07 b5
        00000260: 00 c0 a0 e3 07 30 c3 e3 80 c4 0b e5 03 d0 4d e0 08
c0 8d e2 11 1d 4b e2 0c 00 a0 e1 78 24 1b e5
        00000280: 07 30 a0 e1 04 10 41 e2 24 c5 0b e5 c9 07 01 eb 01
00 70 e3 74 04 0b e5 24 c5 1b e5 72 ff ff 1a
        000002a0: c3 fd ff ea 78 e4 1b e5 80 c4 0b e5 01 00 7e e3 00
30 a0 13 01 30 a0 03 05 00 5e e3 01 30 83 c3
        000002c0: 00 00 53 e3 09 00 00 1a 64 c2 9f e5 80 04 1b e5 0c
c0 8f e0 74 04 0b e5 63 ff ff ea 54 32 2c 3c
        000002e0: 05 00 37 b0 fd ff ea 44 c2 9f e5 06 e0 a0 e3 74 e4
0b e5 0c c0 8f e0 59 ff ff ea 02 00 a0 e1 3e
        00000300: 72 02 eb 00 00 50 e3 d0 ff ff 1a 78 04 1b e5 09 56
ff eb 00 c0 50 e2 a3 fd ff 0a 01 e0 a0 e3 80
        00000320: e4 0b e5 d0 ff ff ea 11 5d 4b e2 00 7f 3f 50 45 e2
6c 17 01 05 10 a0 e1 6d 25 9a 2d ec 02 02 95
        00000340: fd ff 0a 28 9c 47 03 53 e3 d2 01 00 1a 6c 49 6c 25
01 01 20 83 e2 6c 24 05 be 01 00 8a 0e 30 82
        00000360: e2 32 7c 04 6c 30 7c 0a 7c 0b 6c 0b 01 83 07 01 eb
7c 55 01 2e ff ff ea 2c 4c 09 00 01 55 e1 1d
        00000380: 00 00 8a 04 c5 1b e5 05 80 88 e0 00 00 5c e3 0f 9c
54 04 57 e3 0d 00 00 da 07 7c 14 dc 54 07 b5
        000003a0: 81 00 eb 01 00 70 e3 bb fd bd 53 14 31 7c 0a 00 20
0a 00 00 8a 08 80 80 e0 74 d4 1b e5 f0 fd ff
        000003c0: ea 1c 01 9f e5 ce 27 00 e3 18 11 9f e5 18 31 9f e5
00 00 8f e0 01 10 8f e0 03 30 8f e0 f9 98 ff
        000003e0: eb 08 31 2c 7c 05 03 a4 fd ff ea f8 00 ac 06 03 f4
10 9f e5 f4 30 2c cc 00 02 ec 98 ff eb 90 6c
        00000400: 90 00 00 19 70 a0 e3 94 04 1b e5 00 30 a0 e3 97 0c
27 e0 2c 20 97 e5 02 11 a0 e1 0e 10 81 e2 07
        00000420: 10 c1 e3 01 d0 4d e0 08 10 8d e2 3f 00 00 ea 08 3b
0f 00 40 3a 0f 00 64 6d 0f 00 3c 01 00 00 d8
        00000440: 6b 0f 00 0c 6b 0f 00 fc 6a 0f 00 60 46 0f 00 64 2f
00 00 04 2f 00 00 24 7c 0d 00 f4 2e 00 00 10
        00000460: 7c 0d 00 98 6a 0f 00 d4 7b 0d 00 a0 2e 00 00 b0 37
0f 00 98 37 0f 00 10 37 0f 00 00 36 0f 00 9c
        00000480: 64 0f 00 30 64 0f 00 e0 31 0f 00 b4 75 0d 00 6c 28
00 00 8c 05 00 00 44 28 00 00 60 31 0f 00 a4
        000004a0: bc 0d 00 d0 bc 0d 00 7c bd 0d 00 c0 bc 0d 00 b0 bc
0d 00 5c bd 0d 00 c4 2e 0f 00 68 2e 0f 00 54
        000004c0: 2e 0f 00 28 0c 0e 00 74 2d 0f 00 04 ba 0d 00 18 b8
0d 00 08 b8 0d 00 b4 b8 0d 00 14 2c 0f 00 a8
        000004e0: b7 0d 00 d4 b7 0d 00 80 b8 0d 00 e8 27 0f 00 7c b3
0d 00 a8 b3 0d 00 54 b4 0d 00 00 26 0f 00 ec
        00000500: 25 0f 00 d4 b1 0d 00 70 b1 0d 00 1c b2 0d 00 40 31
0f 00 58 30 0f 00 24 00 97 e5 8c c4 1b e5 00
        00000520: 00 83 e0 80 01 8c e0 03 01 81 e7 01 30 83 8c bb 04
f7 ff ff 1a 14 30 94 8c be 8c bd 00 0d 10 83
        00000540: 32 25 20 a0 33 14 10 84 35 00 20 c3 35 15 01 00 2a
0c 30 d7 e5 08 00 13 e3 10 01 00 0a 2a ac 00
        00000560: 00 06 04 01 00 2a 01 10 83 e2 23 20 a0 e3 14 10 84
e5 02 50 a0 e3 00 20 c3 e5 7c 05 03 a3 03 b0
        00000580: e1 09 00 2c bc 00 02 01 10 83 32 27 29 6c 01 7c 07
6c 05 06 01 50 85 e2 40 00 13 e3 c4 31 bd 00
        000005a0: 2b 29 be 00 d5 00 ac 11 7c 05 02 20 00 13 e3 08 31
bd 00 2d 29 bc 00 01 bd 00 00 2a 6c 05 0a 10
        000005c0: 10 97 e5 30 00 51 e3 57 00 00 0a 0d cc 19 32 ed 00
49 29 ed 00 c0 cc 07 01 04 00 97 e5 6c 77 04
        000005e0: 78 00 00 1a 00 30 97 9d d1 2a 31 dd 01 2e 29 ee 00
67 00 6c e4 00 08 75 e3 ab fc ff 0a 41 ce 4b
        00000600: e2 00 00 97 e5 0c c0 4c e2 0a 20 a0 e3 0c 10 a0 e1
6d 53 74 6c 8e 00 0d 50 85 e2 8d f8 ff eb 09
        00000620: 20 a0 e1 08 90 a0 e1 07 80 a0 e1 06 70 a0 e1 00 60
a0 e1 0a 00 00 ea 8c 2d 0e 00 94 e5 01 10 d6
        00000640: e4 00 00 53 e1 01 00 83 32 14 00 bd f0 2d cc 0c 01
31 00 00 0a 6c 1c 00 0c 74 c4 1b e5 0c 00 56
        00000660: e1 f1 ff ff 3a 07 60 a0 e1 08 70 a0 e1 09 80 a0 e1
02 90 a0 e1 08 10 6e 18 51 e3 2f 3d 06 20 28
        00000680: 5d 1f 27 df 09 7e fc ff 9c 09 7d cc 2d 2f 1f 0f 55
e1 23 9c 78 03 85 e0 ff fc ff ea 7e d4 8a b3
        000006a0: ac 7f 6f c4 6f fc ff af 16 20 94 e5 8c 49 29 7d 01
0a de 29 9e ff bc 06 02 20 25 0b e5 7b cc 07
        000006c0: 07 20 25 1b e5 cb ff ff 1a 07 60 bd 15 5d cd 0b 73
dc 03 09 f0 ff ff 1a 58 fc ff ea 71 10 ef e6
        000006e0: 6d 0e 6d dc 02 02 d2 ff ff 1a 52 6e 0e 33 1f 2b 6c
1b 00 01 4d fc ff ea 24 03 1f e5 e9 27 00 e3
        00000700: 28 13 1f e5 28 33 1f 2b 7c 11 01 e1 97 ff eb 7c 08
02 2e 10 a0 e3 5a cc 09 05 92 ff ff 1a 3f fc
        00000720: ff ea 7c 35 9f 34 c0 4c e2 7c 34 7c 35 6c 35 07 23
f8 ff eb 00 20 65 e0 02 c0 6e cb 0b e5 2e cd
        00000740: 06 0c 2d cc 06 01 05 10 d6 e7 2e cd 06 31 ce 2c c4
ff ac 2c 7c d8 01 05 30 8c e0 6c 37 05 03 00
        00000760: 5c e1 ef ff ff 8a 6c 20 2a ec 06 08 61 ff ff ea 10
00 13 e3 42 ff ff 2b ec 0d 6d 69 20 29 cd 09
        00000780: 08 29 6d 0c 37 cc 2c 02 2d 10 a0 e3 22 dd 1b 3c 7c
2b dc 2a 02 20 10 a0 e3 1c dc 02 02 f1 ff ff
        000007a0: 1a 01 dc 02 02 2b 10 a0 e3 16 dc 02 03 24 ff ff 1a
fb fb ac 35 02 49 10 a0 e3 10 dc 02 02 39 ff
        000007c0: ff 1a f5 dc 02 6d 38 0a dc 02 6c 38 02 c7 ff ff 1a
8d cc 0f 02 23 10 a0 e3 03 cc 03 01 e9 fb ff
        000007e0: 0a 6c 83 6c 7d 07 f8 fe ff ea 01 50 a0 e3 f6 fe ac
0b 03 25 10 a0 e3 f9 b2 ac 48 02 e4 fe ff 1a
        00000800: de cc 0b 02 27 10 a0 e3 f3 dc 02 22 6c 2a 03 d8 fb
ff ea ec 34 2c 9c 07 02 d3 fb ff ea fc 2d 4e
        00000820: 00 ce fb ac ee 6e 13 60 70 bc ee 6c 13 01 3a fe ff
1a 6c f1 7c 02 01 29 54 ff eb 7c ef 7e 02 c2
        00000840: fb 28 0c 1e 04 37 fe ff ea 48 05 1f 9c d2 03 4c 15
1f e5 4c 35 2c dc 08 00 0c 53 97 ff eb 02 60
        00000860: a0 e1 00 c0 e0 e3 70 24 0b e5 88 c4 0b e5 b0 24 0b
e5 90 24 0b e5 a8 24 22 ac 22 00 34 56 e3 1a
        00000880: 3d 4d e2 00 20 a0 e3 08 d0 43 e2 94 34 0b e5 50 24
0b e5 26 01 00 1a 88 c4 1b e5 01 00 7c e3 e7
        000008a0: 00 00 0a 60 c4 1b e5 58 c4 0b e5 00 30 dc e5 00 00
53 e3 f0 00 00 0a 00 70 a0 e3 45 ee 4b e2 8c
        000008c0: 84 0b e5 6c f4 00 06 84 a4 0b e5 1a 6d a0 e3 80 94
0b e5 07 a0 a0 e1 98 74 0b e5 07 90 a0 e1 22
        000008e0: 6c 21 07 0e 80 a0 e1 94 54 1b e5 78 44 6d 0e 00 9c
70 06 09 40 85 e0 07 10 a0 e1 04 6c 89 00 02
        00000900: 30 a0 e1 7b 72 00 eb 18 40 94 e5 01 a0 8a e2 00 70
87 e0 58 6f 05 30 d4 e5 7c 0d 00 12 12 00 00
        00000920: 0a 34 00 a0 e3 90 0a 09 e0 09 00 56 e1 ee ff ff 8a
86 20 a0 e1 0f 20 82 e2 0f 20 c2 e3 08 10 82
        00000940: e2 9c e4 00 05 00 8d e2 02 10 80 e0 01 00 55 e1 05
10 a0 e1 06 20 82 00 00 50 a0 e1 6c 20 7c 5f
        00000960: 00 40 73 e7 00 eb df ff ff ea 50 24 1b e5 98 a4 0b
e5 8c 84 1b e5 02 00 57 e1 02 70 a0 31 94 54
        00000980: 0b e5 7e 03 77 e3 78 44 1b e5 84 a4 1b e5 80 94 1b
e5 74 74 0b e5 dd 00 00 8a 74 c4 1b e5 0c 52
        000009a0: a0 e1 01 0a 55 e3 ce 00 00 8a 0e 50 85 e2 07 50 c5
e3 05 d0 24 0c 27 05 8c c4 0b e5 74 e4 1b e5
        000009c0: 6c d6 00 20 3c 10 94 e5 8e c1 8c e0 04 10 11 e2 ff
10 a0 13 84 c4 0b e5 0e c1 a0 e1 84 e4 1b e5
        000009e0: 0c 20 a0 e1 78 c4 0b e5 0c 70 8e e0 07 00 a0 e1 1f
e8 00 eb 98 c4 23 cc 2a 00 05 e3 32 00 00 0a
        00000a00: 08 07 1f e5 00 60 a0 e3 d4 44 0b e5 06 c0 a0 e1 dc
a4 7c 25 09 8f e0 e4 94 0b e5 80 04 0b e5 00
        00000a20: a0 bc 28 00 0b e0 84 0b e5 98 44 1b e5 84 94 1b e5
09 00 00 ea 28 20 95 e5 24 30 95 e5 03 21 87
        00000a40: e7 30 27 2c 00 00 03 89 e7 01 60 86 e2 34 50 85 e2
04 00 56 e1 16 00 00 0a 20 30 95 9c c1 02 03
        00000a60: c1 87 17 1c 29 2f 00 2c 10 95 22 fe 2f e3 f2 7c 7c
04 00 51 e3 ea ff ff 0a 7c 09 00 06 05 00 a0
        00000a80: e1 00 20 9a e5 08 e0 95 e5 03 31 a0 e1 0e 81 92 e7
03 20 87 e0 22 1c 26 05 03 30 89 e0 38 ff 2f
        00000aa0: e1 22 2c 26 00 02 e4 ff ff ea e0 84 1b e5 d4 44 1b
e5 dc a4 1b e5 e4 94 1b e5 6c 26 22 0c 26 00
        00000ac0: 08 c0 fb ff 0a 11 3d 4b e2 e0 27 1f e5 0c 30 43 e2
f4 8b 9f ed 08 30 43 e2 8c 64 22 4c 31 00 20
        00000ae0: 0b e5 00 50 a0 e3 78 34 1b e5 07 c1 00 e3 02 20 8f
e0 80 24 0b e5 05 20 97 e7 05 00 52 e3 12 00
        00000b00: 00 ca 03 00 52 e3 2b 00 00 aa 01 00 52 e3 23 00 00
ca 22 7e 2d 21 00 7c 01 00 0e 72 e3 2d 00 00
        00000b20: 1a 3c 30 94 e5 04 00 13 e3 3a 00 00 1a 7c 03 9f e5
42 27 00 e3 78 13 9f e5 78 33 2c bc 25 00 01
        00000b40: 90 96 ff eb 01 0c 52 e3 28 00 00 0a 1d 00 00 da 02
0c 52 23 7f 28 01 0b 52 22 7c 28 07 0a 0c 00
        00000b60: 52 e1 19 00 00 1a 54 22 1c 2e 00 22 20 82 e2 07 20
c2 e3 d0 00 c2 e1 08 20 82 e2 54 24 0b e5 f0
        00000b80: 00 c6 e1 04 50 85 e2 08 60 86 e2 05 00 53 e1 d5 ff
ff 1a 89 fb ff ea 54 24 1b e5 00 10 92 e5 04
        00000ba0: dc 04 04 00 10 86 e5 f4 ff ff 9c 02 00 12 04 10 82
e2 54 14 0b e5 00 20 92 e5 00 20 86 e5 ee ff
        00000bc0: ff ea 07 00 52 e3 e5 ff ff da 02 0b 12 e3 f5 ff ff
1a 22 9f 2e 00 10 90 9d 2f 1e 6f f6 8b 86 ed
        00000be0: 7c 29 3a 1c 02 04 dc ff ff ea 9c 02 9f 8c c4 05 60
a4 00 eb 94 32 9f e5 23 9c 34 0e 30 99 e7 04
        00000c00: 30 93 e5 2c c0 93 e5 28 30 93 e5 a8 34 ac 76 0d 01
30 43 e2 73 30 ef e6 fd 00 53 e3 00 c0 a0 83
        00000c20: 7c 80 00 0a 09 ff ff ea 98 34 0b e5 03 50 a0 e1 74
34 0b e5 49 ff ff ea 23 21 42 e2 02 21 91 e7
        00000c40: 6c 2c 09 dc ff ff 0a 84 14 1b e5 05 20 91 e7 22 8d
38 0e cc 22 00 02 02 d0 4d e0 80 24 1b e5 08
        00000c60: 00 8d e2 00 00 86 e5 05 e0 97 e7 7c 1b 09 23 e1 4e
e2 0e e1 92 e7 20 35 0b e5 7d 43 0e 6c 5d 06
        00000c80: e4 0b e5 32 ff 2f e1 20 35 24 8c 39 01 ae ff ff ea
6f 4a 26 6f 02 23 7c 31 01 2c ff ff 1a 7f 01
        00000ca0: f1 52 ff 9c 01 00 12 70 04 0b e5 8c 04 0b 15 2b ff
ff 1a 27 fb ff ea c0 21 9f e5 4b 10 a0 e3 03
        00000cc0: 60 a0 e1 02 20 9f e7 02 10 89 e7 11 00 00
UBIFS error (pid 1): do_readpage: cannot read page 64 of inode 336, error -22
