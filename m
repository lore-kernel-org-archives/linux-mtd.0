Received: from p02c12o148.mxlogic.net ([208.65.145.81])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ODx1r-0000PC-2Q
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 09:54:35 +0000
From: Doron Tsur <doront@mellanox.co.il>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 17 May 2010 12:54:16 +0300
Subject: '0's during write to NAND mtd stress , on a PPC 460EX system
Message-ID: <1EEC75D0B27041449A1EEA2927D1B14536437915EE@MTLMAIL.mtl.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kernel version: 2.6.27

NAND HW:IC memory nand flash SLC SMT 16GBIT 2K Page size 48TSOP1

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mtdblock6          256000    179332     76668  71% /
/dev/mtdblock8          102400      3096     99304   4% /config
/dev/mtdblock9          409600      9872    399728   3% /var


CPU: PPC 460EX


Scenario:

1. Initialize mtd partition to 0's [using dd] .
2. Perform copying to mtd partition by tar extract to a mounted mtd device.
3. Extracted files are verified using md5 sum.

When running this script in a loop, after ~ 1day I get Nulls bytes on 1 fil=
e, thus failing md5 verification.

I tried activating "CONFIG_JFFS2_FS_WBUF_VERIFY=3Dy" kernel flag; It seems =
to reduce probability, but not solve the issue.

Can you review logs below and provide a lead?

Since I extract files to 2 partitions, I can compare valid to non-valid fil=
e.
"cmp -l" values are in octal base:

 508929 124   0
 508930 347   0
 508931 140   0
 508932  46   0
 508933 174   0
 508935  72   0
...
511991  53   0
 511992   5   0
 511993 200   0
 511994   1   0
 511996  64   0
 511997 177   0
 511998 343   0
 511999 373   0
 512000 170   0

Full log of write failure below.

=3D=3D Calling writeimage to image system
Write verify error (ECC corrected) at 05a83800. Wrote:
00000000: 7b f3 2a de 95 15 c5 b2 0d ef 7e a1 7c d7 d8 a7
00000010: c8 48 3e 2e 74 c4 75 dd 8c d3 03 1f 72 3e 2d bb
00000020: d2 ec 3d 41 09 cc d5 28 1f 3f af 7c dc 8b fd 47
00000030: fe 1f 1f 39 7e e4 43 e3 5c 00 b3 95 68 3f f8 09
00000040: db ec 03 ec 1f 51 b6 81 79 2e b3 21 9e 5a e4 f5
00000050: d6 86 78 1e c1 bb b7 39 c7 2a 96 46 60 a2 b1 0d
00000060: f0 fb 12 6d bd 34 0d 3e 64 8a f8 e0 63 3e 84 bb
00000070: 81 05 ee 2b c5 09 37 f0 67 8c 3d c0 d8 0f 8c bd
00000080: cc 11 eb 38 b8 70 6d 97 69 4d 3f 6a 5a d9 7a 13
00000090: 18 c7 ad f3 f8 3f 5f 2f 6a 17 f9 80 8d c7 9e 45
000000a0: 2e 82 ec b3 c0 0b 35 08 9c ca 81 93 07 38 79 81
000000b0: 93 0f 38 f9 95 16 04 18 a3 f4 b8 e3 62 7e d9 3f
000000c0: 5b e0 33 2a 80 bb 81 18 b6 db dd b3 52 13 0e 03
000000d0: 0b c1 a5 c7 b6 89 73 79 9d e4 08 af 3d 60 64 df
000000e0: f9 90 6d de ab 3d da fa cb b7 3e db 1c 44 76 fe
000000f0: 8f 39 28 2b ca c1 41 c4 b5 ed ee 1c ec bb 51 94
00000100: 03 e6 20 e7 a0 d9 c8 4e cf 7d ba 1c bc fc 26 72
00000110: 30 5a c4 83 26 a5 0b 6d cc 01 d6 02 c6 9c eb b4
00000120: 3f 49 b5 fd e7 68 0f b4 22 0e 4e 24 c0 87 46 f0
00000130: a2 b9 bf 95 6a fa 27 49 ef 9f a1 06 e8 46 04 ba
00000140: 11 03 6f f6 43 0f 42 e0 92 db b2 c0 97 9f 40 43
00000150: 2e 83 23 37 c1 99 db f5 b8 33 3e 4e 42 0f 8e 45
00000160: 53 5a bb 91 fb d7 2d fb fc 02 de fd b3 c2 32 81
00000170: ab 1c 6f b1 be b7 36 d6 ac 1f 54 9a 8e 4d 1e 23
00000180: 97 f9 48 7f 9a ee 4b bd eb b8 ac 63 0f 76 d8 75
00000190: da 20 df e5 5d af bd 62 ea a3 da 6d 23 bb 50 1d
000001a0: 3e 8d 3a 85 5e 81 97 66 f8 c7 42 83 3a 76 97 e2
000001b0: d9 4f ed f6 99 0c 45 87 34 b2 bf 06 3e 31 af 44
000001c0: cf 72 ab d0 07 0c 3a 67 71 1f a2 37 33 72 7f 3d
000001d0: 20 f4 7a 48 eb e9 fa 3d ce 6e 21 17 72 7c 48 1f
000001e0: a5 6e 3d 53 52 16 d7 fe 36 57 9f c9 e7 a5 af 1f
000001f0: 6d 91 cf db c3 b8 37 f5 dd 95 b8 ef 79 8f 5c 1f
00000200: d5 33 da 32 ef c7 9e df ca 75 4b ef a8 f5 cf b2
00000210: 4f e2 1c d5 1b 19 d9 7f cc f0 d8 c8 2e 4e 02 c7
00000220: 36 e8 5d 48 dc ab c8 71 0a f9 4f 21 ff 29 e4 1a
00000230: f7 6c 03 34 30 02 0d 8c a1 b6 e2 a8 ad fd a8 ad
00000240: 04 6a ab 11 b5 d5 84 da 6a 2e d2 c0 16 ae 2f b6
00000250: c3 b5 bf 21 9e 76 c4 43 f0 6d bb 9a af ed 98 e0
00000260: 7e 53 bb ac fa 0e ff bd dc b3 b8 93 ca 81 b5 07
00000270: f7 92 17 77 ac 0f 77 93 bf 1e ef 3a 26 a8 04 18
00000280: bf c0 bd 46 b8 47 e8 7b 9b e8 45 a0 6b a2 a7 42
00000290: 5d ab fe 57 dc 5d f6 cf 17 d6 7a 91 08 ee 0e e9
000002a0: 53 6e 08 7d 4a 03 df 29 38 cf 89 a6 68 1a cf 40
000002b0: 24 85 fe 65 07 f9 45 cf 34 9e df 8f 71 40 8d f9
000002c0: 7d 50 8d f7 60 1c 52 e3 10 c6 35 6a 2c fb 70 e9
000002d0: 87 d7 9e cb 0a 3f 84 0f 63 eb 3e e0 5c 27 3c 24
000002e0: 38 14 74 92 58 8f 7e a7 eb f0 4b b2 97 83 af b8
000002f0: eb 27 55 6f d0 24 f6 a2 7f 31 72 37 4f 86 5f a4
00000300: 12 eb 30 73 50 0b 45 87 69 10 ff 35 8c 25 2f d6
00000310: b9 f4 3c 72 9f 88 6b 1f 9c 91 71 ae 5e 66 ac 75
00000320: b6 03 6d 33 f2 cb 4f a1 76 50 23 74 51 d8 06 57
00000330: d9 b6 b4 fb 6f d5 93 e4 b8 c7 6c 40 8e 96 d2 df
00000340: 15 7d 40 ef 1d bd 07 62 31 f2 63 27 55 ef 71 99
00000350: 71 c0 1a 07 fe 94 22 a6 8b 78 ba 70 97 b5 77 a5
00000360: cf cb de 1c 7d b8 fd e5 d7 cd 3a d4 7b 5d 80 28
00000370: 4e 5f f9 13 eb 8c b8 43 86 56 bd 1b fc 7f 0e fe
00000380: 37 c6 b5 f7 df 46 1f b2 bc 61 2e 86 b9 2f 60 ee
00000390: aa 8c 6d e5 ad 8d 36 e2 b4 ab 8a cf 06 27 2f dc
000003a0: 3d 57 3b ac e6 7a ee 9e 7b 74 46 cd b5 d3 d6 31
000003b0: ef a7 d6 2f d4 ca 7f d5 2f d4 d4 9a 7e c1 47 6b
000003c0: 58 e9 d7 54 41 bf 6e 4d 4a 6c b4 04 ea f9 61 d9
000003d0: 07 ff fd 9b d6 31 68 96 1c 1f 10 fa 25 c7 51 eb
000003e0: 79 e8 d7 09 d6 af e9 47 84 7e e5 a0 5f c7 a1 5f
000003f0: 07 a1 5f d0 22 fe 3e 80 7e 3d 67 64 e7 8f 84 cf
00000400: 40 bf a0 83 c0 a7 39 fc 23 c1 bd 46 a5 5f 09 89
00000410: 9b 36 84 e7 26 bc 9f 56 bc 1a ed 9a c7 7e c9 ab
00000420: c3 d0 1c f0 4a 3b 15 d7 e6 a3 42 5b 84 0f 8b 47
00000430: e4 73 e9 13 a1 51 3e 68 14 ef 91 eb 59 a3 be 2f
00000440: 35 6a 7e 8b 5a 5f a7 d6 df 58 d3 28 e8 a2 8d 6f
00000450: 07 68 ec 5e a1 91 d9 0f 1e f8 ac 34 8a f9 6f cf
00000460: 67 85 bd 38 3d 71 5b f4 b2 c3 34 c4 76 f9 9d bd
00000470: 93 bf df de 57 df 75 d4 ed bc 04 dd 16 df 74 d3
00000480: 2f 4a dd a6 8d 39 81 6e 6b bd 71 6d ee 61 a5 29
00000490: 8b 47 5b c4 f7 26 a5 af 90 ef 68 8b d0 a9 45 f4
000004a0: db 05 9d 7a 2d 59 2f eb 90 75 aa eb fa 2b f2 db
000004b0: 0f 35 e2 4c dd f9 cd 04 9d fa 0d 9f f9 1f 01 04
000004c0: cc 57 33 60 ee 06 08 30 00 1d a3 05 c8 ff ff ff
000004d0: 19 85 e0 02 00 00 03 79 d7 aa 3d ec 00 00 05 44
000004e0: 00 00 00 b9 00 00 81 ed 00 00 00 00 00 08 14 00
000004f0: 49 af ee a6 49 af ee a6 49 af ee a6 00 08 10 00
00000500: 00 00 03 35 00 00 04 00 06 00 00 00 bc df 41 48
00000510: b1 8c c2 0f 78 5e 4c 53 5d 68 53 67 18 7e 4e 12
00000520: d7 16 b3 91 8b 08 c5 64 25 c5 6c 18 56 8c c3 0e
00000530: 4e 49 61 e7 b8 5e 04 8e 0c 85 0a ee 6a 2d ce ce
00000540: 9b 81 82 c2 a7 fd 92 ef 3b 4d fc 19 ec a2 49 3a
00000550: 46 69 6b 93 fd 84 c1 e6 18 b8 c1 46 59 a9 38 61
00000560: d0 1b a1 c3 9f 15 6c 62 d0 29 51 f0 67 7a d3 ed
00000570: 9c bd df 39 b9 f0 ea 7d 78 cf f3 be ef f3 3e ef
00000580: 77 c4 c8 1a cb e2 ed 47 96 eb 66 c5 37 6d 26 ee
00000590: 6d 32 e1 e5 06 ae 52 6e d0 9e c4 70 a6 01 1c 1f
000005a0: 83 34 a7 b4 38 c5 84 31 05 43 c6 10 4f 4b c0 5c
000005b0: 76 3f 22 9c e8 e0 43 84 93 1d bc 8f f0 ce 0e 56
000005c0: fc 81 0e 1e b4 33 e8 ce 5f b9 c4 ec 14 a2 22 b9
000005d0: ca 72 a9 60 5d 1c 59 67 e2 6c 8b bd 2f 43 fd e9
000005e0: 82 d7 f7 50 7a 91 e2 05 24 a5 8d 6e d1 da 64 f9
000005f0: 89 39 96 bf 7a 89 89 73 2d 66 b9 2f 9e 74 78 bb
00000600: d3 9f 63 0b f1 46 f3 1b f4 8d 78 96 73 eb a4 5e
00000610: 40 17 2f f6 1d e3 45 6d 86 17 af ed 57 79 5e fc
00000620: 32 6a 39 7f 95 78 f0 da 01 de 13 ac 1b 36 7a 87
00000630: 12 80 0e 80 f7 d4 7e 18 4a 41 db 0b f7 1f f1 e1
00000640: 1a f5 ff ef 84 9c 43 c4 9b b7 63 95 7a 5e bc ab
00000650: 34 2b bd 96 b3 fe 81 9a 2d de 5d 65 c6 b2 3b 4d
00000660: 3e 9d 17 87 d7 99 ae 74 9e 51 da 9e 99 5c c4 4e
00000670: 99 53 a8 7a da df 58 f5 b4 fb ba 9f bf e3 eb 76
00000680: 98 f2 d6 72 9d 1f e5 12 22 fa 24 0c 5d a2 47 79
00000690: 60 b9 b5 5c 87 33 6a c7 60 10 27 91 a9 21 2c be
000006a0: 6a d3 ec 8d 1e aa eb b5 fb 11 97 5b 11 39 98 ea
000006b0: 72 46 81 61 f2 90 d9 16 40 b9 90 bd 15 dd b2 8d
000006c0: b0 ea 3f 9e c2 2b 25 13 e1 69 0d 91 92 86 e8 74
000006d0: 13 bd 25 aa a5 fd 7e c9 df 5b 62 fa 18 42 34 77
000006e0: 42 af 62 44 6f 68 b3 59 ed ce cf 99 86 eb 5a ee
000006f0: bf 27 f0 5a 6d 6c a6 df 5d e1 dd 81 fa de 45 6c
00000700: a9 5c 86 2e fe 08 d4 a9 d7 88 ec 73 1f e7 24 de
00000710: ac 68 48 70 16 63 72 02 11 b1 f2 34 5a b6 11 29
00000720: 5f 46 6f b9 89 78 a5 89 e1 72 0d d1 4a 3f 92 15
00000730: 13 3b 2b e3 18 a8 d8 d8 5d a9 61 b0 64 23 cc 37
00000740: f6 30 fe c5 0e c6 7f 7a 8b f1 17 19 da ed c6 6f
00000750: e9 82 01 73 21 f0 bb 14 88 c8 45 d0 bd 6e 7d a2
00000760: bc 30 16 82 71 95 23 ce 6c ba 10 26 0e fe b4 9c
00000770: fb 77 39 57 3e 6b df 5b 4e fb 80 28 90 77 ce 83
00000780: 1c cf c5 58 07 1f e7 93 a4 cd af 1b d7 0f a3 6b
00000790: 6a 59 86 f8 a9 be 63 62 48 9b 51 77 cd 7f fd 1d
000007a0: d3 ab 81 4f ad cd e6 6c 7a 81 de c1 e9 18 a3 b7
000007b0: f4 6d 7a ce 7b 7b d5 5d 41 8a 65 cc 8b d9 15 98
000007c0: f3 5a 32 df 5a 62 22 74 85 a9 7f c5 72 5a 67 bc
000007d0: 3b 5d d0 f6 93 d6 88 7f 9f 9b b4 03 e5 e6 b5 91
000007e0: 7c 9d 7a fb fe 7e 4c fe 16 f5 46 60 3e ab 35 0f
000007f0: 66 aa ae eb eb fb 3b e7 c7 87 af 66 81 a3 a4 93
Read back:
00000000: 7b f3 2a de 95 15 c5 b2 0d ef 7e a1 7c d7 d8 a7
00000010: c8 48 3e 2e 74 c4 75 dd 8c d3 03 1f 72 3e 2d bb
00000020: d2 ec 3d 41 09 cc d5 28 1f 3f af 7c dc 8b fd 47
00000030: fe 1f 1f 39 7e e4 43 e3 5c 00 b3 95 68 3f f8 09
00000040: db ec 03 ec 1f 51 b6 81 79 2e b3 21 9e 5a e4 f5
00000050: d6 86 78 1e c1 bb b7 39 c7 2a 96 46 60 a2 b1 0d
00000060: f0 fb 12 6d bd 34 0d 3e 64 8a f8 e0 63 3e 84 bb
00000070: 81 05 ee 2b c5 09 37 f0 67 8c 3d c0 d8 0f 8c bd
00000080: cc 11 eb 38 b8 70 6d 97 69 4d 3f 6a 5a d9 7a 13
00000090: 18 c7 ad f3 f8 3f 5f 2f 6a 17 f9 80 8d c7 9e 45
000000a0: 2e 82 ec b3 c0 0b 35 08 9c ca 81 93 07 38 79 81
000000b0: 93 0f 38 f9 95 16 04 18 a3 f4 b8 e3 62 7e d9 3f
000000c0: 5b e0 33 2a 80 bb 81 18 b6 db dd b3 52 13 0e 03
000000d0: 0b c1 a5 c7 b6 89 73 79 9d e4 08 af 3d 60 64 df
000000e0: f9 90 6d de ab 3d da fa cb b7 3e db 1c 44 76 fe
000000f0: 8f 39 28 2b ca c1 41 c4 b5 ed ee 1c ec bb 51 94
00000100: 03 e6 20 e7 a0 d9 c8 4e cf 7d ba 1c bc fc 26 72
00000110: 30 5a c4 83 26 a5 0b 6d cc 01 d6 02 c6 9c eb b4
00000120: 3f 49 b5 fd e7 68 0f b4 22 0e 4e 24 c0 87 46 f0
00000130: a2 b9 bf 95 6a fa 27 49 ef 9f a1 06 e8 46 04 ba
00000140: 11 03 6f f6 43 0f 42 e0 92 db b2 c0 97 9f 40 43
00000150: 2e 83 23 37 c1 99 db f5 b8 33 3e 4e 42 0f 8e 45
00000160: 53 5a bb 91 fb d7 2d fb fc 02 de fd b3 c2 32 81
00000170: ab 1c 6f b1 be b7 36 d6 ac 1f 54 9a 8e 4d 1e 23
00000180: 97 f9 48 7f 9a ee 4b bd eb b8 ac 63 0f 76 d8 75
00000190: da 20 df e5 5d af bd 62 ea a3 da 6d 23 bb 50 1d
000001a0: 3e 8d 3a 85 5e 81 97 66 f8 c7 42 83 3a 76 97 e2
000001b0: d9 4f ed f6 99 0c 45 87 34 b2 bf 06 3e 31 af 44
000001c0: cf 72 ab d0 07 0c 3a 67 71 1f a2 37 33 72 7f 3d
000001d0: 20 f4 7a 48 eb e9 fa 3d ce 6e 21 17 72 7c 48 1f
000001e0: a5 6e 3d 53 52 16 d7 fe 36 57 9f c9 e7 a5 af 1f
000001f0: 6d 91 cf db c3 b8 37 f5 dd 95 b8 ef 79 8f 5c 1f
00000200: d5 33 da 32 ef c7 9e df ca 75 4b ef a8 f5 cf b2
00000210: 4f e2 1c d5 1b 19 d9 7f cc f0 d8 c8 2e 4e 02 c7
00000220: 36 e8 5d 48 dc ab c8 71 0a f9 4f 21 ff 29 e4 1a
00000230: f7 6c 03 34 30 02 0d 8c a1 b6 e2 a8 ad fd a8 ad
00000240: 04 6a ab 11 b5 d5 84 da 6a 2e d2 c0 16 ae 2f b6
00000250: c3 b5 bf 21 9e 76 c4 43 f0 6d bb 9a af ed 98 e0
00000260: 7e 53 bb ac fa 0e ff bd dc b3 b8 93 ca 81 b5 07
00000270: f7 92 17 77 ac 0f 77 93 bf 1e ef 3a 26 a8 04 18
00000280: bf c0 bd 46 b8 47 e8 7b 9b e8 45 a0 6b a2 a7 42
00000290: 5d ab fe 57 dc 5d f6 cf 17 d6 7a 91 08 ee 0e e9
000002a0: 53 6e 08 7d 4a 03 df 29 38 cf 89 a6 68 1a cf 40
000002b0: 24 85 fe 65 07 f9 45 cf 34 9e df 8f 71 40 8d f9
000002c0: 7d 50 8d f7 60 1c 52 e3 10 c6 35 6a 2c fb 70 e9
000002d0: 87 d7 9e cb 0a 3f 84 0f 63 eb 3e e0 5c 27 3c 24
000002e0: 38 14 74 92 58 8f 7e a7 eb f0 4b b2 97 83 af b8
000002f0: eb 27 55 6f d0 24 f6 a2 7f 31 72 37 4f 86 5f a4
00000300: 12 eb 30 73 50 0b 45 87 69 10 ff 35 8c 25 2f d6
00000310: b9 f4 3c 72 9f 88 6b 1f 9c 91 71 ae 5e 66 ac 75
00000320: b6 03 6d 33 f2 cb 4f a1 76 50 23 74 51 d8 06 57
00000330: d9 b6 b4 fb 6f d5 93 e4 b8 c7 6c 40 8e 96 d2 df
00000340: 15 7d 40 ef 1d bd 07 62 31 f2 63 27 55 ef 71 99
00000350: 71 c0 1a 07 fe 94 22 a6 8b 78 ba 70 97 b5 77 a5
00000360: cf cb de 1c 7d b8 fd e5 d7 cd 3a d4 7b 5d 80 28
00000370: 4e 5f f9 13 eb 8c b8 43 86 56 bd 1b fc 7f 0e fe
00000380: 37 c6 b5 f7 df 46 1f b2 bc 61 2e 86 b9 2f 60 ee
00000390: aa 8c 6d e5 ad 8d 36 e2 b4 ab 8a cf 06 27 2f dc
000003a0: 3d 57 3b ac e6 7a ee 9e 7b 74 46 cd b5 d3 d6 31
000003b0: ef a7 d6 2f d4 ca 7f d5 2f d4 d4 9a 7e c1 47 6b
000003c0: 58 e9 d7 54 41 bf 6e 4d 4a 6c b4 04 ea f9 61 d9
000003d0: 07 ff fd 9b d6 31 68 96 1c 1f 10 fa 25 c7 51 eb
000003e0: 79 e8 d7 09 d6 af e9 47 84 7e e5 a0 5f c7 a1 5f
000003f0: 07 a1 5f d0 22 fe 3e 80 7e 3d 67 64 e7 8f 84 cf
00000400: 40 bf a0 83 c0 a7 39 fc 23 c1 bd 46 a5 5f 09 89
00000410: 9b 36 84 e7 26 bc 9f 56 bc 1a ed 9a c7 7e c9 ab
00000420: c3 d0 1c f0 4a 3b 15 d7 e6 a3 42 5b 84 0f 8b 47
00000430: e4 73 e9 13 a1 51 3e 68 14 ef 91 eb 59 a3 be 2f
00000440: 35 6a 7e 8b 5a 5f a7 d6 df 58 d3 28 e8 a2 8d 6f
00000450: 07 68 ec 5e a1 91 d9 0f 1e f8 ac 34 8a f9 6f cf
00000460: 67 85 bd 38 3d 71 5b f4 b2 c3 34 c4 76 f9 9d bd
00000470: 93 bf df de 57 df 75 d4 ed bc 04 dd 16 df 74 d3
00000480: 2f 4a dd a6 8d 39 81 6e 6b bd 71 6d ee 61 a5 29
00000490: 8b 47 5b c4 f7 26 a5 af 90 ef 68 8b d0 a9 45 f4
000004a0: db 05 9d 7a 2d 59 2f eb 90 75 aa eb fa 2b f2 db
000004b0: 0f 35 e2 4c dd f9 cd 04 9d fa 0d 9f f9 1f 01 04
000004c0: cc 57 33 60 ee 06 08 30 00 1d a3 05 c8 ff ff ff
000004d0: 19 85 e0 02 00 00 03 79 d7 aa 3d ec 00 00 05 44
000004e0: 00 00 00 b9 00 00 81 ed 00 00 00 00 00 08 14 00
000004f0: 49 af ee a6 49 af ee a6 49 af ee a6 00 08 10 00
00000500: 00 00 03 35 00 00 04 00 06 00 00 00 bc df 41 48
00000510: b1 8c c2 0f 78 5e 4c 53 5d 68 53 67 18 7e 4e 12
00000520: d7 16 b3 91 8b 08 c5 64 25 c5 6c 18 56 8c c3 0e
00000530: 4e 49 61 e7 b8 5e 04 8e 0c 85 0a ee 6a 2d ce ce
00000540: 9b 81 82 c2 a7 fd 92 ef 3b 4d fc 19 ec a2 49 3a
00000550: 46 69 6b 93 fd 84 c1 e6 18 b8 c1 46 59 a9 38 61
00000560: d0 1b a1 c3 9f 15 6c 62 d0 29 51 f0 67 7a d3 ed
00000570: 9c bd df 39 b9 f0 ea 7d 78 cf f3 be ef f3 3e ef
00000580: 77 c4 c8 1a cb e2 ed 47 96 eb 66 c5 37 6d 26 ee
00000590: 6d 32 e1 e5 06 ae 52 6e d0 9e c4 70 a6 01 1c 1f
000005a0: 83 34 a7 b4 38 c5 84 31 05 43 c6 10 4f 4b c0 5c
000005b0: 76 3f 22 9c e8 e0 43 84 93 1d bc 8f f0 ce 0e 56
000005c0: fc 81 0e 1e b4 33 e8 ce 5f b9 c4 ec 14 a2 22 b9
000005d0: ca 72 a9 60 5d 1c 59 67 e2 6c 8b bd 2f 43 fd e9
000005e0: 82 d7 f7 50 7a 91 e2 05 24 a5 8d 6e d1 da 64 f9
000005f0: 89 39 96 bf 7a 89 89 73 2d 66 b9 2f 9e 74 78 bb
00000600: d3 9f 63 0b f1 46 f3 1b f4 8d 78 96 73 eb a4 5e
00000610: 40 17 2f f6 1d e3 45 6d 86 17 af ed 57 79 5e fc
00000620: 32 6a 39 7f 95 78 f0 da 01 de 13 ac 1b 36 7a 87
00000630: 12 80 0e 80 f7 d4 7e 18 4a 41 db 0b f7 1f f1 e1
00000640: 1a f5 ff ef 84 9c 43 c4 9b b7 63 95 7a 5e bc ab
00000650: 34 2b bd 96 b3 fe 81 9a 2d de 5d 65 c6 b2 3b 4d
00000660: 3e 9d 17 87 d7 99 ae 74 9e 51 da 9e 99 5c c4 4e
00000670: 99 53 a8 7a da df 58 f5 b4 fb ba 9f bf e3 eb 76
00000680: 98 f2 d6 72 9d 1f e5 12 22 fa 24 0c 5d a2 47 79
00000690: 60 b9 b5 5c 87 33 6a c7 60 10 27 91 a9 21 2c be
000006a0: 6a d3 ec 8d 1e aa eb b5 fb 11 97 5b 11 39 98 ea
000006b0: 72 46 81 61 f2 90 d9 16 40 b9 90 bd 15 dd b2 8d
000006c0: b0 ea 3f 9e c2 2b 25 13 e1 69 0d 91 92 86 e8 74
000006d0: 13 bd 25 aa a5 fd 7e c9 df 5b 62 fa 18 42 34 77
000006e0: 42 af 62 44 6f 68 b3 59 ed ce cf 99 86 eb 5a ee
000006f0: bf 27 f0 5a 6d 6c a6 df 5d e1 dd 81 fa de 45 6c
00000700: a9 5c 86 2e fe 08 d4 a9 d7 88 ec 73 1f e7 24 de
00000710: ac 68 48 70 16 63 72 02 11 b1 f2 34 5a b6 11 21
00000720: 5f 46 6f b9 89 78 a5 89 e1 72 0d d1 4a 3f 92 15
00000730: 13 3b 2b e3 18 a8 d8 d8 5d a9 61 b0 64 23 cc 37
00000740: f6 30 fe c5 0e c6 7f 7a 8b f1 17 19 da ed c6 6f
00000750: e9 82 01 73 21 f0 bb 14 88 c8 45 d0 bd 6e 7d a2
00000760: bc 30 16 82 71 95 23 ce 6c ba 10 26 0e fe b4 9c
00000770: fb 77 39 57 3e 6b df 5b 4e fb 80 28 90 77 ce 83
00000780: 1c cf c5 58 07 1f e7 93 a4 cd af 1b d7 0f a3 6b
00000790: 6a 59 86 f8 a9 be 63 62 48 9b 51 77 cd 7f fd 1d
000007a0: d3 ab 81 4f ad cd e6 6c 7a 81 de c1 e9 18 a3 b7
000007b0: f4 6d 7a ce 7b 7b d5 5d 41 8a 65 cc 8b d9 15 98
000007c0: f3 5a 32 df 5a 62 22 74 85 a9 7f c5 72 5a 67 bc
000007d0: 3b 5d d0 f6 93 d6 88 7f 9f 9b b4 03 e5 e6 b5 91
000007e0: 7c 9d 7a fb fe 7e 4c fe 16 f5 46 60 3e ab 35 0f
000007f0: 66 a2 ae eb eb fb 3b e7 c7 87 af 66 81 a3 a4 93
Recovery of wbuf succeeded to 05a60000
Write of 889 bytes at 0x05a83cd0 failed. returned -5, retlen 0
Not marking the space at 0x05a83cd0 as dirty because the flash driver retur=
ned retlen zero
Empty flash at 0x05a8404c ends at 0x05a84f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84f1c: 0xff=
ff instead
Empty flash at 0x05a84f20 ends at 0x05a84ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84ff0: 0xff=
f7 instead
Empty flash at 0x05a84ff4 ends at 0x05a85f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85f1c: 0xff=
ff instead
Empty flash at 0x05a85f20 ends at 0x05a85ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85ff0: 0xff=
f7 instead
Empty flash at 0x05a85ff4 ends at 0x05a86f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86f1c: 0xff=
ff instead
Empty flash at 0x05a86f20 ends at 0x05a86ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86ff0: 0xff=
f7 instead
Empty flash at 0x05a86ff4 ends at 0x05a87f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87f1c: 0xff=
ff instead
Empty flash at 0x05a87f20 ends at 0x05a87ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87ff0: 0xff=
f7 instead
Empty flash at 0x05a87ff4 ends at 0x05a88f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88f1c: 0xff=
ff instead
Empty flash at 0x05a88f20 ends at 0x05a88ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88ff0: 0xff=
f7 instead
Further such events for this erase block will not be printed
Empty flash at 0x05a88ff4 ends at 0x05a89f1c
Empty flash at 0x05a89f20 ends at 0x05a89ff0
Empty flash at 0x05a89ff4 ends at 0x05a8af1c
Empty flash at 0x05a8af20 ends at 0x05a8aff0
Empty flash at 0x05a8aff4 ends at 0x05a8bf1c
Empty flash at 0x05a8bf20 ends at 0x05a8bff0
Empty flash at 0x05a8bff4 ends at 0x05a8cf1c
Empty flash at 0x05a8cf20 ends at 0x05a8cff0
Empty flash at 0x05a8cff4 ends at 0x05a8df1c
Empty flash at 0x05a8df20 ends at 0x05a8dff0
Empty flash at 0x05a8dff4 ends at 0x05a8ef1c
Empty flash at 0x05a8ef20 ends at 0x05a8eff0
Empty flash at 0x05a8eff4 ends at 0x05a8ff1c
Empty flash at 0x05a8ff20 ends at 0x05a8fff0
Empty flash at 0x05a8fff4 ends at 0x05a90f1c
Empty flash at 0x05a90f20 ends at 0x05a90ff0
Empty flash at 0x05a90ff4 ends at 0x05a91f1c
Empty flash at 0x05a91f20 ends at 0x05a91ff0
Empty flash at 0x05a91ff4 ends at 0x05a92f1c
Empty flash at 0x05a92f20 ends at 0x05a92ff0
Empty flash at 0x05a92ff4 ends at 0x05a93f1c
Empty flash at 0x05a93f20 ends at 0x05a93ff0
Empty flash at 0x05a93ff4 ends at 0x05a94f1c
Empty flash at 0x05a94f20 ends at 0x05a94ff0
Empty flash at 0x05a94ff4 ends at 0x05a95f1c
Empty flash at 0x05a95f20 ends at 0x05a95ff0
Empty flash at 0x05a95ff4 ends at 0x05a96f1c
Empty flash at 0x05a96f20 ends at 0x05a96ff0
Empty flash at 0x05a96ff4 ends at 0x05a97f1c
Empty flash at 0x05a97f20 ends at 0x05a97ff0
Empty flash at 0x05a97ff4 ends at 0x05a98f1c
Empty flash at 0x05a98f20 ends at 0x05a98ff0
Empty flash at 0x05a98ff4 ends at 0x05a99f1c
Empty flash at 0x05a99f20 ends at 0x05a99ff0
Empty flash at 0x05a99ff4 ends at 0x05a9af1c
Empty flash at 0x05a9af20 ends at 0x05a9aff0
Empty flash at 0x05a9aff4 ends at 0x05a9bf1c
Empty flash at 0x05a9bf20 ends at 0x05a9bff0
Empty flash at 0x05a9bff4 ends at 0x05a9cf1c
Empty flash at 0x05a9cf20 ends at 0x05a9cff0
Empty flash at 0x05a9cff4 ends at 0x05a9df1c
Empty flash at 0x05a9df20 ends at 0x05a9dff0
Empty flash at 0x05a9dff4 ends at 0x05a9ef1c
Empty flash at 0x05a9ef20 ends at 0x05a9eff0
Empty flash at 0x05a9eff4 ends at 0x05a9ff1c
Empty flash at 0x05a9ff20 ends at 0x05a9fff0
Empty flash at 0x05a8404c ends at 0x05a84f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84f1c: 0xff=
ff instead
Empty flash at 0x05a84f20 ends at 0x05a84ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84ff0: 0xff=
f7 instead
Empty flash at 0x05a84ff4 ends at 0x05a85f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85f1c: 0xff=
ff instead
Empty flash at 0x05a85f20 ends at 0x05a85ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85ff0: 0xff=
f7 instead
Empty flash at 0x05a85ff4 ends at 0x05a86f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86f1c: 0xff=
ff instead
Empty flash at 0x05a86f20 ends at 0x05a86ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86ff0: 0xff=
f7 instead
Empty flash at 0x05a86ff4 ends at 0x05a87f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87f1c: 0xff=
ff instead
Empty flash at 0x05a87f20 ends at 0x05a87ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87ff0: 0xff=
f7 instead
Empty flash at 0x05a87ff4 ends at 0x05a88f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88f1c: 0xff=
ff instead
Empty flash at 0x05a88f20 ends at 0x05a88ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88ff0: 0xff=
f7 instead
Further such events for this erase block will not be printed
Empty flash at 0x05a88ff4 ends at 0x05a89f1c
Empty flash at 0x05a89f20 ends at 0x05a89ff0
Empty flash at 0x05a89ff4 ends at 0x05a8af1c
Empty flash at 0x05a8af20 ends at 0x05a8aff0
Empty flash at 0x05a8aff4 ends at 0x05a8bf1c
Empty flash at 0x05a8bf20 ends at 0x05a8bff0
Empty flash at 0x05a8bff4 ends at 0x05a8cf1c
Empty flash at 0x05a8cf20 ends at 0x05a8cff0
Empty flash at 0x05a8cff4 ends at 0x05a8df1c
Empty flash at 0x05a8df20 ends at 0x05a8dff0
Empty flash at 0x05a8dff4 ends at 0x05a8ef1c
Empty flash at 0x05a8ef20 ends at 0x05a8eff0
Empty flash at 0x05a8eff4 ends at 0x05a8ff1c
Empty flash at 0x05a8ff20 ends at 0x05a8fff0
Empty flash at 0x05a8fff4 ends at 0x05a90f1c
Empty flash at 0x05a90f20 ends at 0x05a90ff0
Empty flash at 0x05a90ff4 ends at 0x05a91f1c
Empty flash at 0x05a91f20 ends at 0x05a91ff0
Empty flash at 0x05a91ff4 ends at 0x05a92f1c
Empty flash at 0x05a92f20 ends at 0x05a92ff0
Empty flash at 0x05a92ff4 ends at 0x05a93f1c
Empty flash at 0x05a93f20 ends at 0x05a93ff0
Empty flash at 0x05a93ff4 ends at 0x05a94f1c
Empty flash at 0x05a94f20 ends at 0x05a94ff0
Empty flash at 0x05a94ff4 ends at 0x05a95f1c
Empty flash at 0x05a95f20 ends at 0x05a95ff0
Empty flash at 0x05a95ff4 ends at 0x05a96f1c
Empty flash at 0x05a96f20 ends at 0x05a96ff0
Empty flash at 0x05a96ff4 ends at 0x05a97f1c
Empty flash at 0x05a97f20 ends at 0x05a97ff0
Empty flash at 0x05a97ff4 ends at 0x05a98f1c
Empty flash at 0x05a98f20 ends at 0x05a98ff0
Empty flash at 0x05a98ff4 ends at 0x05a99f1c
Empty flash at 0x05a99f20 ends at 0x05a99ff0
Empty flash at 0x05a99ff4 ends at 0x05a9af1c
Empty flash at 0x05a9af20 ends at 0x05a9aff0
Empty flash at 0x05a9aff4 ends at 0x05a9bf1c
Empty flash at 0x05a9bf20 ends at 0x05a9bff0
Empty flash at 0x05a9bff4 ends at 0x05a9cf1c
Empty flash at 0x05a9cf20 ends at 0x05a9cff0
Empty flash at 0x05a9cff4 ends at 0x05a9df1c
Empty flash at 0x05a9df20 ends at 0x05a9dff0
Empty flash at 0x05a9dff4 ends at 0x05a9ef1c
Empty flash at 0x05a9ef20 ends at 0x05a9eff0
Empty flash at 0x05a9eff4 ends at 0x05a9ff1c
Empty flash at 0x05a9ff20 ends at 0x05a9fff0
Empty flash at 0x05a8404c ends at 0x05a84f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84f1c: 0xff=
ff instead
Empty flash at 0x05a84f20 ends at 0x05a84ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84ff0: 0xff=
f7 instead
Empty flash at 0x05a84ff4 ends at 0x05a85f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85f1c: 0xff=
ff instead
Empty flash at 0x05a85f20 ends at 0x05a85ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85ff0: 0xff=
f7 instead
Empty flash at 0x05a85ff4 ends at 0x05a86f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86f1c: 0xff=
ff instead
Empty flash at 0x05a86f20 ends at 0x05a86ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86ff0: 0xff=
f7 instead
Empty flash at 0x05a86ff4 ends at 0x05a87f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87f1c: 0xff=
ff instead
Empty flash at 0x05a87f20 ends at 0x05a87ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87ff0: 0xff=
f7 instead
Empty flash at 0x05a87ff4 ends at 0x05a88f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88f1c: 0xff=
ff instead
Empty flash at 0x05a88f20 ends at 0x05a88ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88ff0: 0xff=
f7 instead
Further such events for this erase block will not be printed
Empty flash at 0x05a88ff4 ends at 0x05a89f1c
Empty flash at 0x05a89f20 ends at 0x05a89ff0
Empty flash at 0x05a89ff4 ends at 0x05a8af1c
Empty flash at 0x05a8af20 ends at 0x05a8aff0
Empty flash at 0x05a8aff4 ends at 0x05a8bf1c
Empty flash at 0x05a8bf20 ends at 0x05a8bff0
Empty flash at 0x05a8bff4 ends at 0x05a8cf1c
Empty flash at 0x05a8cf20 ends at 0x05a8cff0
Empty flash at 0x05a8cff4 ends at 0x05a8df1c
Empty flash at 0x05a8df20 ends at 0x05a8dff0
Empty flash at 0x05a8dff4 ends at 0x05a8ef1c
Empty flash at 0x05a8ef20 ends at 0x05a8eff0
Empty flash at 0x05a8eff4 ends at 0x05a8ff1c
Empty flash at 0x05a8ff20 ends at 0x05a8fff0
Empty flash at 0x05a8fff4 ends at 0x05a90f1c
Empty flash at 0x05a90f20 ends at 0x05a90ff0
Empty flash at 0x05a90ff4 ends at 0x05a91f1c
Empty flash at 0x05a91f20 ends at 0x05a91ff0
Empty flash at 0x05a91ff4 ends at 0x05a92f1c
Empty flash at 0x05a92f20 ends at 0x05a92ff0
Empty flash at 0x05a92ff4 ends at 0x05a93f1c
Empty flash at 0x05a93f20 ends at 0x05a93ff0
Empty flash at 0x05a93ff4 ends at 0x05a94f1c
Empty flash at 0x05a94f20 ends at 0x05a94ff0
Empty flash at 0x05a94ff4 ends at 0x05a95f1c
Empty flash at 0x05a95f20 ends at 0x05a95ff0
Empty flash at 0x05a95ff4 ends at 0x05a96f1c
Empty flash at 0x05a96f20 ends at 0x05a96ff0
Empty flash at 0x05a96ff4 ends at 0x05a97f1c
Empty flash at 0x05a97f20 ends at 0x05a97ff0
Empty flash at 0x05a97ff4 ends at 0x05a98f1c
Empty flash at 0x05a98f20 ends at 0x05a98ff0
Empty flash at 0x05a98ff4 ends at 0x05a99f1c
Empty flash at 0x05a99f20 ends at 0x05a99ff0
Empty flash at 0x05a99ff4 ends at 0x05a9af1c
Empty flash at 0x05a9af20 ends at 0x05a9aff0
Empty flash at 0x05a9aff4 ends at 0x05a9bf1c
Empty flash at 0x05a9bf20 ends at 0x05a9bff0
Empty flash at 0x05a9bff4 ends at 0x05a9cf1c
Empty flash at 0x05a9cf20 ends at 0x05a9cff0
Empty flash at 0x05a9cff4 ends at 0x05a9df1c
Empty flash at 0x05a9df20 ends at 0x05a9dff0
Empty flash at 0x05a9dff4 ends at 0x05a9ef1c
Empty flash at 0x05a9ef20 ends at 0x05a9eff0
Empty flash at 0x05a9eff4 ends at 0x05a9ff1c
Empty flash at 0x05a9ff20 ends at 0x05a9fff0
Empty flash at 0x05a8404c ends at 0x05a84f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84f1c: 0xff=
ff instead
Empty flash at 0x05a84f20 ends at 0x05a84ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84ff0: 0xff=
f7 instead
Empty flash at 0x05a84ff4 ends at 0x05a85f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85f1c: 0xff=
ff instead
Empty flash at 0x05a85f20 ends at 0x05a85ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85ff0: 0xff=
f7 instead
Empty flash at 0x05a85ff4 ends at 0x05a86f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86f1c: 0xff=
ff instead
Empty flash at 0x05a86f20 ends at 0x05a86ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86ff0: 0xff=
f7 instead
Empty flash at 0x05a86ff4 ends at 0x05a87f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87f1c: 0xff=
ff instead
Empty flash at 0x05a87f20 ends at 0x05a87ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87ff0: 0xff=
f7 instead
Empty flash at 0x05a87ff4 ends at 0x05a88f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88f1c: 0xff=
ff instead
Empty flash at 0x05a88f20 ends at 0x05a88ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88ff0: 0xff=
f7 instead
Further such events for this erase block will not be printed
Empty flash at 0x05a88ff4 ends at 0x05a89f1c
Empty flash at 0x05a89f20 ends at 0x05a89ff0
Empty flash at 0x05a89ff4 ends at 0x05a8af1c
Empty flash at 0x05a8af20 ends at 0x05a8aff0
Empty flash at 0x05a8aff4 ends at 0x05a8bf1c
Empty flash at 0x05a8bf20 ends at 0x05a8bff0
Empty flash at 0x05a8bff4 ends at 0x05a8cf1c
Empty flash at 0x05a8cf20 ends at 0x05a8cff0
Empty flash at 0x05a8cff4 ends at 0x05a8df1c
Empty flash at 0x05a8df20 ends at 0x05a8dff0
Empty flash at 0x05a8dff4 ends at 0x05a8ef1c
Empty flash at 0x05a8ef20 ends at 0x05a8eff0
Empty flash at 0x05a8eff4 ends at 0x05a8ff1c
Empty flash at 0x05a8ff20 ends at 0x05a8fff0
Empty flash at 0x05a8fff4 ends at 0x05a90f1c
Empty flash at 0x05a90f20 ends at 0x05a90ff0
Empty flash at 0x05a90ff4 ends at 0x05a91f1c
Empty flash at 0x05a91f20 ends at 0x05a91ff0
Empty flash at 0x05a91ff4 ends at 0x05a92f1c
Empty flash at 0x05a92f20 ends at 0x05a92ff0
Empty flash at 0x05a92ff4 ends at 0x05a93f1c
Empty flash at 0x05a93f20 ends at 0x05a93ff0
Empty flash at 0x05a93ff4 ends at 0x05a94f1c
Empty flash at 0x05a94f20 ends at 0x05a94ff0
Empty flash at 0x05a94ff4 ends at 0x05a95f1c
Empty flash at 0x05a95f20 ends at 0x05a95ff0
Empty flash at 0x05a95ff4 ends at 0x05a96f1c
Empty flash at 0x05a96f20 ends at 0x05a96ff0
Empty flash at 0x05a96ff4 ends at 0x05a97f1c
Empty flash at 0x05a97f20 ends at 0x05a97ff0
Empty flash at 0x05a97ff4 ends at 0x05a98f1c
Empty flash at 0x05a98f20 ends at 0x05a98ff0
Empty flash at 0x05a98ff4 ends at 0x05a99f1c
Empty flash at 0x05a99f20 ends at 0x05a99ff0
Empty flash at 0x05a99ff4 ends at 0x05a9af1c
Empty flash at 0x05a9af20 ends at 0x05a9aff0
Empty flash at 0x05a9aff4 ends at 0x05a9bf1c
Empty flash at 0x05a9bf20 ends at 0x05a9bff0
Empty flash at 0x05a9bff4 ends at 0x05a9cf1c
Empty flash at 0x05a9cf20 ends at 0x05a9cff0
Empty flash at 0x05a9cff4 ends at 0x05a9df1c
Empty flash at 0x05a9df20 ends at 0x05a9dff0
Empty flash at 0x05a9dff4 ends at 0x05a9ef1c
Empty flash at 0x05a9ef20 ends at 0x05a9eff0
Empty flash at 0x05a9eff4 ends at 0x05a9ff1c
Empty flash at 0x05a9ff20 ends at 0x05a9fff0
=3D=3D System successfully imaged
Empty flash at 0x05a8404c ends at 0x05a84f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84f1c: 0xff=
ff instead
Empty flash at 0x05a84f20 ends at 0x05a84ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84ff0: 0xff=
f7 instead
Empty flash at 0x05a84ff4 ends at 0x05a85f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85f1c: 0xff=
ff instead
Empty flash at 0x05a85f20 ends at 0x05a85ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85ff0: 0xff=
f7 instead
Empty flash at 0x05a85ff4 ends at 0x05a86f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86f1c: 0xff=
ff instead
Empty flash at 0x05a86f20 ends at 0x05a86ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86ff0: 0xff=
f7 instead
Empty flash at 0x05a86ff4 ends at 0x05a87f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87f1c: 0xff=
ff instead
Empty flash at 0x05a87f20 ends at 0x05a87ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87ff0: 0xff=
f7 instead
Empty flash at 0x05a87ff4 ends at 0x05a88f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88f1c: 0xff=
ff instead
Empty flash at 0x05a88f20 ends at 0x05a88ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88ff0: 0xff=
f7 instead
Further such events for this erase block will not be printed
Empty flash at 0x05a88ff4 ends at 0x05a89f1c
Empty flash at 0x05a89f20 ends at 0x05a89ff0
Empty flash at 0x05a89ff4 ends at 0x05a8af1c
Empty flash at 0x05a8af20 ends at 0x05a8aff0
Empty flash at 0x05a8aff4 ends at 0x05a8bf1c
Empty flash at 0x05a8bf20 ends at 0x05a8bff0
Empty flash at 0x05a8bff4 ends at 0x05a8cf1c
Empty flash at 0x05a8cf20 ends at 0x05a8cff0
Empty flash at 0x05a8cff4 ends at 0x05a8df1c
Empty flash at 0x05a8df20 ends at 0x05a8dff0
Empty flash at 0x05a8dff4 ends at 0x05a8ef1c
Empty flash at 0x05a8ef20 ends at 0x05a8eff0
Empty flash at 0x05a8eff4 ends at 0x05a8ff1c
Empty flash at 0x05a8ff20 ends at 0x05a8fff0
Empty flash at 0x05a8fff4 ends at 0x05a90f1c
Empty flash at 0x05a90f20 ends at 0x05a90ff0
Empty flash at 0x05a90ff4 ends at 0x05a91f1c
Empty flash at 0x05a91f20 ends at 0x05a91ff0
Empty flash at 0x05a91ff4 ends at 0x05a92f1c
Empty flash at 0x05a92f20 ends at 0x05a92ff0
Empty flash at 0x05a92ff4 ends at 0x05a93f1c
Empty flash at 0x05a93f20 ends at 0x05a93ff0
Empty flash at 0x05a93ff4 ends at 0x05a94f1c
Empty flash at 0x05a94f20 ends at 0x05a94ff0
Empty flash at 0x05a94ff4 ends at 0x05a95f1c
Empty flash at 0x05a95f20 ends at 0x05a95ff0
Empty flash at 0x05a95ff4 ends at 0x05a96f1c
Empty flash at 0x05a96f20 ends at 0x05a96ff0
Empty flash at 0x05a96ff4 ends at 0x05a97f1c
Empty flash at 0x05a97f20 ends at 0x05a97ff0
Empty flash at 0x05a97ff4 ends at 0x05a98f1c
Empty flash at 0x05a98f20 ends at 0x05a98ff0
Empty flash at 0x05a98ff4 ends at 0x05a99f1c
Empty flash at 0x05a99f20 ends at 0x05a99ff0
Empty flash at 0x05a99ff4 ends at 0x05a9af1c
Empty flash at 0x05a9af20 ends at 0x05a9aff0
Empty flash at 0x05a9aff4 ends at 0x05a9bf1c
Empty flash at 0x05a9bf20 ends at 0x05a9bff0
Empty flash at 0x05a9bff4 ends at 0x05a9cf1c
Empty flash at 0x05a9cf20 ends at 0x05a9cff0
Empty flash at 0x05a9cff4 ends at 0x05a9df1c
Empty flash at 0x05a9df20 ends at 0x05a9dff0
Empty flash at 0x05a9dff4 ends at 0x05a9ef1c
Empty flash at 0x05a9ef20 ends at 0x05a9eff0
Empty flash at 0x05a9eff4 ends at 0x05a9ff1c
Empty flash at 0x05a9ff20 ends at 0x05a9fff0
-- Writing Host ID: f44b68e95cf2
=3D=3D Calling imgverify to verify manufactured system
Empty flash at 0x05a8404c ends at 0x05a84f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84f1c: 0xff=
ff instead
Empty flash at 0x05a84f20 ends at 0x05a84ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a84ff0: 0xff=
f7 instead
Empty flash at 0x05a84ff4 ends at 0x05a85f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85f1c: 0xff=
ff instead
Empty flash at 0x05a85f20 ends at 0x05a85ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a85ff0: 0xff=
f7 instead
Empty flash at 0x05a85ff4 ends at 0x05a86f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86f1c: 0xff=
ff instead
Empty flash at 0x05a86f20 ends at 0x05a86ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a86ff0: 0xff=
f7 instead
Empty flash at 0x05a86ff4 ends at 0x05a87f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87f1c: 0xff=
ff instead
Empty flash at 0x05a87f20 ends at 0x05a87ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a87ff0: 0xff=
f7 instead
Empty flash at 0x05a87ff4 ends at 0x05a88f1c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88f1c: 0xff=
ff instead
Empty flash at 0x05a88f20 ends at 0x05a88ff0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05a88ff0: 0xff=
f7 instead
Further such events for this erase block will not be printed
Empty flash at 0x05a88ff4 ends at 0x05a89f1c
Empty flash at 0x05a89f20 ends at 0x05a89ff0
Empty flash at 0x05a89ff4 ends at 0x05a8af1c
Empty flash at 0x05a8af20 ends at 0x05a8aff0
Empty flash at 0x05a8aff4 ends at 0x05a8bf1c
Empty flash at 0x05a8bf20 ends at 0x05a8bff0
Empty flash at 0x05a8bff4 ends at 0x05a8cf1c
Empty flash at 0x05a8cf20 ends at 0x05a8cff0
Empty flash at 0x05a8cff4 ends at 0x05a8df1c
Empty flash at 0x05a8df20 ends at 0x05a8dff0
Empty flash at 0x05a8dff4 ends at 0x05a8ef1c
Empty flash at 0x05a8ef20 ends at 0x05a8eff0
Empty flash at 0x05a8eff4 ends at 0x05a8ff1c
Empty flash at 0x05a8ff20 ends at 0x05a8fff0
Empty flash at 0x05a8fff4 ends at 0x05a90f1c
Empty flash at 0x05a90f20 ends at 0x05a90ff0
Empty flash at 0x05a90ff4 ends at 0x05a91f1c
Empty flash at 0x05a91f20 ends at 0x05a91ff0
Empty flash at 0x05a91ff4 ends at 0x05a92f1c
Empty flash at 0x05a92f20 ends at 0x05a92ff0
Empty flash at 0x05a92ff4 ends at 0x05a93f1c
Empty flash at 0x05a93f20 ends at 0x05a93ff0
Empty flash at 0x05a93ff4 ends at 0x05a94f1c
Empty flash at 0x05a94f20 ends at 0x05a94ff0
Empty flash at 0x05a94ff4 ends at 0x05a95f1c
Empty flash at 0x05a95f20 ends at 0x05a95ff0
Empty flash at 0x05a95ff4 ends at 0x05a96f1c
Empty flash at 0x05a96f20 ends at 0x05a96ff0
Empty flash at 0x05a96ff4 ends at 0x05a97f1c
Empty flash at 0x05a97f20 ends at 0x05a97ff0
Empty flash at 0x05a97ff4 ends at 0x05a98f1c
Empty flash at 0x05a98f20 ends at 0x05a98ff0
Empty flash at 0x05a98ff4 ends at 0x05a99f1c
Empty flash at 0x05a99f20 ends at 0x05a99ff0
Empty flash at 0x05a99ff4 ends at 0x05a9af1c
Empty flash at 0x05a9af20 ends at 0x05a9aff0
Empty flash at 0x05a9aff4 ends at 0x05a9bf1c
Empty flash at 0x05a9bf20 ends at 0x05a9bff0
Empty flash at 0x05a9bff4 ends at 0x05a9cf1c
Empty flash at 0x05a9cf20 ends at 0x05a9cff0
Empty flash at 0x05a9cff4 ends at 0x05a9df1c
Empty flash at 0x05a9df20 ends at 0x05a9dff0
Empty flash at 0x05a9dff4 ends at 0x05a9ef1c
Empty flash at 0x05a9ef20 ends at 0x05a9eff0
Empty flash at 0x05a9eff4 ends at 0x05a9ff1c
Empty flash at 0x05a9ff20 ends at 0x05a9fff0
FAILED-HASH: ./lib/libcrypto.so.0.9.8b
FAILED: 1 of 8656 files (0 missing) did not verify.
*** Image location 1 verification failed.
*** Could not verify manufactured system
