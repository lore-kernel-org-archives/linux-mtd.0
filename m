Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTlxt-0006kQ-Mq
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 05:05:43 +0000
From: "Shah, Minal" <minal.shah@ti.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: MTD utils v1.5.0: MEMERASE64 ioctl failed error
Date: Wed, 9 Oct 2013 05:05:11 +0000
Message-ID: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Mukherjee, Somnath" <somnath@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Parikh, Urmil" <urmil@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Resending this email as it got rejected, being in HTML format.

Hi Mike,
I am using MTD utils version 1.5.0 for DRA7 (Vayu) platform.

I have bad blocks in some of my NAND partitions which I am not able to eras=
e from linux kernel.
Using "-N" option in flash_eraseall ideally should have allowed erasing the=
 bad block but I land up in "MEMERASE64 ioctl failed" error.=20
The reason for this error seems that "OFFS64_IOCTLS_SUPPORTED" is not set.
I haven't yet digged in detail to see why this ioctl fails but can you plea=
se tell me the possible reasons for the same?=20

Please see the logs below for reference.

root@dra7xx-evm:~# flash_eraseall /dev/mtd0
flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please use =
it
flash_erase: Skipping bad block at 00000000
Erasing 128 Kibyte @ 0 -- 100 % complete

root@dra7xx-evm:~# flash_eraseall -N /dev/mtd0
flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please use =
it
Erasing 128 Kibyte @ 0 --=A0 0 % complete [ 2298.842498] nand_erase_nand: a=
ttempt to erase a bad block at page 0x00000000
libmtd: error!: MEMERASE64 ioctl failed for eraseblock 0 (mtd0)
=A0=A0=A0=A0=A0=A0=A0 error 5 (Input/output error)
flash_erase: error!: /dev/mtd0: MTD Erase failure
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error 5 (Input/output error)
Erasing 128 Kibyte @ 0 -- 100 % complete

root@dra7xx-evm:~# flash_eraseall -N -u /dev/mtd0
flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please use =
it
Erasing 128 Kibyte @ 0 --=A0 0 % complete libmtd: error!: MEMUNLOCK ioctl f=
ailed for eraseblock 0 (mtd0)
=A0=A0=A0=A0=A0=A0=A0 error 95 (Operation not supported)
flash_erase: error!: /dev/mtd0: MTD unlock failure
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error 95 (Operation not supported)
Erasing 128 Kibyte @ 0 -- 100 % complete

root@dra7xx-evm:~# mtd_debug erase /dev/mtd0 0 131072
[ 1932.902496] nand_erase_nand: attempt to erase a bad block at page 0x0000=
0000
MEMERASE: Input/output error


root@dra7xx-evm:~# nanddump -n -o -p -s 0x0 -l 0x800 --bb=3Ddumpbad /dev/mt=
d0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...
0x00000000: 52 ff 00 ff 60 ff b3 ff 63 ff a9 ff 55 ff a6 ff
0x00000010: ba ff c3 ff 38 ff b8 ff b0 ff a5 ff 04 ff 3e ff
0x00000020: 51 ff a3 ff 81 ff 53 ff 07 ff 8f ff 75 ff 01 ff
0x00000030: c8 ff da ff 6b ff 6d ff d5 ff 70 ff df ff 27 ff
0x00000040: 70 ff 40 ff da ff d3 ff e9 ff 2f ff 79 ff a3 ff
0x00000050: f3 ff b1 ff 5b ff a3 ff 57 ff 60 ff e1 ff a8 ff
0x00000060: 03 ff 62 ff fb ff 0b ff f2 ff 70 ff 0c ff ba ff
0x00000070: 4b ff 77 ff 28 ff 20 ff e8 ff 07 ff 47 ff 58 ff
0x00000080: 47 ff 21 ff 2c ff 30 ff 51 ff a5 ff d3 ff 44 ff
0x00000090: 57 ff 2f ff e7 ff ae ff 8f ff c8 ff 56 ff 92 ff
0x000000a0: 2a ff 52 ff 9d ff 1c ff c2 ff aa ff d7 ff 0d ff
0x000000b0: 21 ff ff ff 2d ff 09 ff 06 ff 74 ff 62 ff 4e ff
0x000000c0: 96 ff 8e ff 7e ff e7 ff 33 ff 52 ff 2b ff 8a ff
0x000000d0: 81 ff 12 ff 38 ff 10 ff da ff 8f ff a2 ff 04 ff
0x000000e0: e1 ff 40 ff 21 ff a3 ff ea ff f8 ff b1 ff 0b ff
0x000000f0: f7 ff de ff 15 ff fd ff 53 ff 77 ff 4b ff e9 ff
0x00000100: 05 ff ca ff d0 ff 38 ff 1c ff fb ff c3 ff 9d ff
0x00000110: 0d ff fb ff ad ff e7 ff 8a ff 4f ff eb ff 6b ff
0x00000120: 8f ff 0c ff 0f ff 79 ff 04 ff c0 ff 85 ff fb ff
0x00000130: 9e ff 9a ff f9 ff f1 ff 11 ff 44 ff da ff 16 ff
0x00000140: 0e ff aa ff 4e ff 2a ff a5 ff 11 ff c7 ff b2 ff
0x00000150: 0d ff 74 ff 99 ff 97 ff c4 ff 85 ff 03 ff 53 ff
0x00000160: 91 ff 12 ff cd ff 96 ff d2 ff 52 ff 91 ff 70 ff
0x00000170: ec ff 8a ff 62 ff fd ff cf ff 3c ff 13 ff dd ff
0x00000180: e7 ff 61 ff 08 ff 8c ff 73 ff cf ff 3f ff 80 ff
0x00000190: 44 ff d8 ff 17 ff 08 ff 5d ff 1a ff 5b ff ef ff
0x000001a0: 2c ff 28 ff 85 ff fe ff 7a ff 16 ff 6f ff 66 ff
0x000001b0: a1 ff d1 ff 63 ff 70 ff 0d ff 76 ff 4d ff f4 ff
0x000001c0: d8 ff 55 ff 81 ff 4b ff 25 ff c0 ff cb ff 69 ff
0x000001d0: 98 ff e2 ff 71 ff f6 ff fd ff cc ff e5 ff 29 ff
0x000001e0: f5 ff 6a ff 28 ff 6f ff 80 ff 97 ff d6 ff 21 ff
0x000001f0: 68 ff 39 ff 91 ff 75 ff b0 ff df ff 6a ff 88 ff
0x00000200: 34 ff eb ff d3 ff 59 ff ab ff 9e ff c2 ff 43 ff
0x00000210: 80 ff 33 ff 39 ff 7d ff 00 ff 1e ff a7 ff f5 ff
0x00000220: 88 ff cf ff 64 ff 09 ff 66 ff 3a ff 2a ff ce ff
0x00000230: 74 ff bc ff 43 ff 24 ff 9b ff ad ff ac ff cf ff
0x00000240: 98 ff 7f ff 29 ff 43 ff 1d ff eb ff 87 ff 9d ff
0x00000250: 1f ff c0 ff 1b ff 1f ff df ff c2 ff 14 ff 67 ff
0x00000260: 91 ff 78 ff 70 ff f7 ff b3 ff 9b ff c5 ff 27 ff
0x00000270: 57 ff 08 ff 4b ff f2 ff b6 ff f7 ff c1 ff 4e ff
0x00000280: 76 ff ea ff 92 ff 93 ff d6 ff 19 ff 30 ff f5 ff
0x00000290: d9 ff 4b ff 14 ff b8 ff 0d ff 28 ff 20 ff 9e ff
0x000002a0: a0 ff 90 ff 95 ff 53 ff 2b ff 5a ff 7a ff 82 ff
0x000002b0: 63 ff c5 ff 74 ff 19 ff bc ff 36 ff 67 ff 32 ff
0x000002c0: 20 ff f9 ff c5 ff f6 ff 12 ff f6 ff eb ff ec ff
0x000002d0: 41 ff ff ff a4 ff 4f ff 27 ff c4 ff ed ff c8 ff
0x000002e0: 55 ff 83 ff 1b ff 80 ff dd ff 96 ff 03 ff 40 ff
0x000002f0: 5b ff 77 ff 59 ff 18 ff ad ff c1 ff 4a ff ce ff
0x00000300: ba ff 10 ff c4 ff cd ff 06 ff b0 ff b9 ff 47 ff
0x00000310: af ff 5d ff 96 ff d7 ff 22 ff 84 ff 9f ff 77 ff
0x00000320: 07 ff ba ff f7 ff e4 ff 50 ff fa ff 25 ff ac ff
0x00000330: 72 ff 7e ff c4 ff 1f ff 3f ff 0e ff ed ff fa ff
0x00000340: 1e ff b2 ff c7 ff 24 ff 62 ff 80 ff 6c ff 11 ff
0x00000350: dd ff 02 ff e8 ff ff ff 86 ff 87 ff 76 ff 8d ff
0x00000360: 42 ff 6e ff 72 ff 92 ff 68 ff 97 ff 3e ff da ff
0x00000370: 15 ff 02 ff fa ff 55 ff 11 ff e7 ff 4f ff 2f ff
0x00000380: 99 ff 16 ff 54 ff fb ff 96 ff c0 ff 0d ff 73 ff
0x00000390: c2 ff f5 ff 73 ff 49 ff 7d ff e9 ff d6 ff bf ff
0x000003a0: 57 ff 48 ff 51 ff c0 ff df ff 90 ff 9a ff f5 ff
0x000003b0: 92 ff 94 ff 4a ff a3 ff 7c ff 99 ff d3 ff 15 ff
0x000003c0: af ff 27 ff 11 ff 45 ff e7 ff 1e ff b8 ff a9 ff
0x000003d0: 13 ff 2b ff f2 ff 90 ff 15 ff c9 ff 4f ff 6c ff
0x000003e0: 11 ff a1 ff 2c ff f1 ff 31 ff c7 ff e6 ff c3 ff
0x000003f0: 5b ff 30 ff 67 ff d7 ff c9 ff 3a ff ed ff 78 ff
0x00000400: 61 ff fe ff bd ff 48 ff 1c ff 75 ff f1 ff 2f ff
0x00000410: a1 ff e4 ff c0 ff b6 ff ad ff 0f ff 22 ff be ff
0x00000420: b0 ff 4f ff af ff e1 ff 16 ff 95 ff a5 ff 71 ff
0x00000430: c5 ff 0c ff 49 ff 8e ff 46 ff 36 ff 06 ff a7 ff
0x00000440: 34 ff c3 ff ef ff 50 ff 39 ff e0 ff 7f ff da ff
0x00000450: c4 ff 3f ff 90 ff 71 ff 4f ff b2 ff 30 ff ff ff
0x00000460: 01 ff df ff e1 ff 17 ff 75 ff 86 ff 89 ff 3a ff
0x00000470: 92 ff d2 ff c9 ff d8 ff 08 ff cf ff 7f ff 3c ff
0x00000480: 93 ff 6e ff 8c ff cc ff 4e ff 0b ff a6 ff 13 ff
0x00000490: 4b ff 36 ff 84 ff 9a ff e8 ff b4 ff 99 ff ea ff
0x000004a0: 94 ff 7a ff 01 ff 09 ff 00 ff 8a ff 43 ff 92 ff
0x000004b0: 5c ff 0c ff 6a ff 64 ff dc ff e9 ff a0 ff 6f ff
0x000004c0: 57 ff 2c ff 3b ff a6 ff 38 ff e1 ff b9 ff 83 ff
0x000004d0: 17 ff 3d ff 1d ff ff ff f2 ff b6 ff e9 ff 86 ff
0x000004e0: 31 ff eb ff 8f ff 31 ff 75 ff d2 ff c4 ff d2 ff
0x000004f0: df ff 2e ff 36 ff bb ff 18 ff d7 ff 2a ff 6f ff
0x00000500: 03 ff 65 ff 15 ff 3b ff 46 ff ce ff be ff 5d ff
0x00000510: 0c ff db ff 5c ff fe ff 92 ff 46 ff 84 ff c3 ff
0x00000520: 31 ff 13 ff f4 ff a6 ff e5 ff b8 ff 78 ff c4 ff
0x00000530: e7 ff af ff 7f ff ff ff 86 ff a9 ff 6e ff 89 ff
0x00000540: 0e ff 84 ff c5 ff 54 ff 52 ff 83 ff b1 ff 5e ff
0x00000550: 5f ff 0e ff 5c ff f1 ff 54 ff e0 ff b4 ff 85 ff
0x00000560: f3 ff a8 ff 2b ff d9 ff 61 ff a4 ff 9d ff 48 ff
0x00000570: 53 ff 1d ff 47 ff d9 ff c6 ff b5 ff 62 ff d5 ff
0x00000580: 39 ff 27 ff 29 ff 8c ff ab ff db ff ea ff 0a ff
0x00000590: e9 ff 47 ff fb ff 3d ff 27 ff af ff c2 ff 1b ff
0x000005a0: 57 ff ed ff f4 ff b8 ff 91 ff 91 ff 00 ff e4 ff
0x000005b0: ae ff 47 ff bd ff 75 ff fd ff 20 ff 4a ff 36 ff
0x000005c0: 47 ff 73 ff c2 ff f2 ff 4e ff ad ff fc ff 37 ff
0x000005d0: f4 ff f7 ff 74 ff 1b ff a6 ff 36 ff 36 ff fe ff
0x000005e0: 24 ff 2a ff b6 ff b5 ff bc ff b7 ff 9a ff 6a ff
0x000005f0: fe ff 57 ff df ff fb ff 77 ff 29 ff 32 ff bf ff
0x00000600: 9d ff f4 ff b1 ff eb ff a1 ff ae ff 23 ff 95 ff
0x00000610: a5 ff 97 ff b1 ff 4c ff ce ff e7 ff 4a ff f2 ff
0x00000620: 12 ff 00 ff a7 ff ce ff b7 ff 41 ff 38 ff b6 ff
0x00000630: 99 ff 18 ff b1 ff 10 ff 41 ff e3 ff cf ff de ff
0x00000640: d8 ff 81 ff ca ff 79 ff 2f ff ed ff 0f ff d4 ff
0x00000650: 84 ff c0 ff 20 ff 52 ff a7 ff 6a ff 44 ff b9 ff
0x00000660: 6b ff ec ff 87 ff 22 ff 2d ff c0 ff d8 ff c6 ff
0x00000670: d8 ff 8a ff d7 ff 19 ff 6d ff a6 ff f8 ff 45 ff
0x00000680: 27 ff c2 ff bf ff 56 ff af ff ce ff 2b ff 33 ff
0x00000690: 8e ff 4b ff 86 ff 35 ff b6 ff ca ff ef ff 21 ff
0x000006a0: b6 ff 76 ff 43 ff e4 ff 36 ff 1c ff aa ff 0e ff
0x000006b0: a6 ff 81 ff 28 ff 13 ff 28 ff 20 ff 59 ff 4f ff
0x000006c0: e2 ff 18 ff a6 ff 91 ff e6 ff d1 ff c4 ff 74 ff
0x000006d0: 1c ff 4a ff a9 ff d2 ff 15 ff 98 ff f3 ff cb ff
0x000006e0: 0f ff 37 ff af ff 45 ff 53 ff 5a ff 54 ff f9 ff
0x000006f0: db ff 7c ff 0c ff 03 ff 9c ff 65 ff 53 ff 7e ff
0x00000700: 7d ff f9 ff 0f ff 63 ff ca ff d3 ff d7 ff e6 ff
0x00000710: 1e ff 81 ff b9 ff 33 ff 19 ff ac ff fe ff 28 ff
0x00000720: e3 ff ae ff 6e ff 36 ff 08 ff c2 ff 2f ff e3 ff
0x00000730: 3e ff 3c ff e7 ff da ff a1 ff 3a ff 58 ff 1f ff
0x00000740: 33 ff 67 ff 82 ff fd ff 3a ff 5a ff e3 ff 58 ff
0x00000750: db ff 9c ff 8b ff f4 ff 49 ff 8a ff 1d ff 2c ff
0x00000760: 38 ff 8b ff 63 ff 40 ff 4d ff 92 ff 23 ff 8b ff
0x00000770: ce ff 0a ff 65 ff 70 ff 44 ff bd ff 8f ff 77 ff
0x00000780: 24 ff 11 ff 74 ff 5e ff 6b ff 58 ff b7 ff 46 ff
0x00000790: f4 ff 42 ff 3b ff 3d ff cc ff 58 ff 6a ff 04 ff
0x000007a0: e3 ff cd ff 44 ff 30 ff 5f ff 68 ff bb ff 2e ff
0x000007b0: 72 ff 20 ff 9e ff b7 ff dd ff 2d ff 2e ff 01 ff
0x000007c0: 3e ff a3 ff 5f ff aa ff fb ff 16 ff f0 ff ef ff
0x000007d0: 59 ff 2b ff 2d ff 25 ff 83 ff 97 ff 2a ff 66 ff
0x000007e0: 64 ff 6e ff 96 ff c3 ff d6 ff 51 ff f1 ff 49 ff
0x000007f0: 71 ff 8f ff 00 ff 4e ff bc ff 2e ff 4f ff fb ff
=A0 OOB Data: d1 ff af ff a5 ff cc ff c5 ff 95 ff bc ff 1e ff
=A0 OOB Data: c1 ff e9 ff 44 ff 44 ff 80 ff 6e ff ab ff e4 ff
=A0 OOB Data: dc ff 41 ff a7 ff b3 ff 93 ff 99 ff fc ff 04 ff
=A0 OOB Data: 28 ff fc ff 53 ff e5 ff 2a ff a2 ff e0 ff fc ff



Regards,
Minal
+91-80-2519-3129
