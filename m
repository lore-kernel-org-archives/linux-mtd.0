Received: from mail.kmu-office.ch ([178.209.48.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWZiZ-0005OP-0P
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 00:46:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Mon, 31 Aug 2015 17:45:47 -0700
From: Stefan Agner <stefan@agner.ch>
To: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com
Cc: Bhuvanchandra DV <bhuvanchandradv@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS errors when file-system is full
In-Reply-To: <55CAF568.5090704@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
 <55ADE35F.6050808@nod.at> <55AF41DD.2060902@gmail.com>
 <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at> <55C3379E.50000@gmail.com>
 <55C4A695.7060608@nod.at> <e3d338cfd875b941061d5ac3da9f29c0@agner.ch>
 <55CAF568.5090704@nod.at>
Message-ID: <812d355821f585decf92a66628caef7b@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, Hi Richard,

On 2015-08-12 00:27, Richard Weinberger wrote:
> Stefan,
> 
> Am 12.08.2015 um 09:01 schrieb Stefan Agner:
>> Hi Richard,
>>
>> [also added Brian to the discussion, since he had a look into that
>> driver before]
> 
> Good idea, maybe Brian has an idea.
> 
<snip>
>> I worked on the driver since quite some time, currently v10 is in
>> review. With this issue in mind, I went through the driver however I
>> currently can't see an issue.
>>
>> The error position is always page aligned, but at different pages. We
>> printed the reread buffers once: It seems that one page lands on flash
>> twice. My guess is that the second page doesn't get transmitted
>> properly, while the new column/row gets transmitted and
>> NAND_CMD_PAGEPROG executed... Hence the same buffer would be written to
>> the device again.
>>
>> The NFC IP in Vybrid (vf610) has a higher level programming model which
>> takes care of the command sequencing. Therefore some callbacks are not
>> actually sending a command to the device (e.g. NAND_CMD_SEQIN) since
>> this will be done one command later, on in NAND_CMD_PAGEPROG. Now, of
>> course, the driver relies heavily on not being interrupted by other
>> requests in between, (also not read!) but I thought that this is taken
>> care of by the MTD subsystem? So for me it is a bit hard to spot the
>> error since I'm always unsure whether the assumptions regarding
>> locking/exclusiveness between the calls is really guaranteed...
> 
> NAND access is serialized using nand_get_device() and nand_release_device()
> in nand_base.c, so serialization should be fine.

I did some more testing with v11 of this driver, and it seems when I
continuously reset the system, I get read errors from time to time. The
read errors end up in various errors, I have seen ubifs_read_node: bad
node type or ubifs_tnc_read_node: bad key in node. However, particularly
often and interesting are ubifs_decompress: cannot decompress errors,
such as this one. It seems that same page is read twice (or has been
written twice, see data pattern at offset 0x00000000 and 0x00000800).

[   13.929731] using random host ethernet address
[   13.945658] UBIFS error (ubi0:0 pid 139): ubifs_decompress: cannot
decompress 3347 bytes, compressor lzo, error -22
[   13.966268] UBIFS error (ubi0:0 pid 139): read_block: bad data node
(block 35, inode 3485)
[   13.984795]  magic          0x6101831
[   13.993549]  crc            0xecfdbd78
[   14.002194]  node_type      1 (data node)
[   14.011041]  group_type     0 (no node group)
[   14.020268]  sqnum          19753
[   14.028382]  len            3395
[   14.036360]  key            (3485, data, 35)
[   14.045398]  size           4096
[   14.053239]  compr_typ      1
[   14.060847]  data size      3347
[   14.068649]  data:
[   14.075012]  00000000: 4e 4a 20 38 46 22 49 c2 f3 07 23 43 ea 02 22
79 44 92 b2 fc f7 c9 ff 00 28 cd d0 41 46 38 46 04
[   14.094736]  00000020: f0 61 fb 00 28 c7 d0 01 20 d7 e7 0d f1 4a 01
20 46 fc f7 42 fe 17 49 38 46 79 44 fc f7 3b 5f 04
[   14.114594]  00000040: b9 d0 21 9d 04 4d 5c 04 00 0b b3 d0 ea e7 06
ac 28 46 2e 23 13 a9 22 46 de f7 c8 ef 00 28 a9 d0
[   14.134439]  00000060: bd f8 4a 50 22 46 0b 4d 06 c5 96 0c 05 23 0d
0e 9b 55 0c 96 54 07 00 01 9a d0 d1 e7 00 bf ea 18
[   14.154374]  00000080: 01 00 ec 05 01 00 aa 11 01 00 3e 4d 01 70 4e
01 b8 17 0c 00 00 13 10 b5 18 20 fc f7 02 fc 04 46
[   14.174888]  000000a0: 48 b1 00 21 de f7 b8 ef 0b 38 01 28 20 46 00
d9 10 bd fc f7 00 fc 00 20 10 bd 70 4e 04 82 b0 06
[   14.195415]  000000c0: 03 ef fb 04 09 02 b8 b1 01 ad 28 5c 0e 01 aa
ef 01 21 7c 00 02 ac ef 29 46 20 5c 00 00 03 9c ef
[   14.216087]  000000e0: 06 46 28 46 0b 3e de f7 a8 ef 01 2e 20 46 01
d9 02 b0 70 45 08 df 0e 2c 20 f9 5f 0f 10 b5 04 56
[   14.237440]  00000100: 04 a0 ef 04 06 05 bd e8 10 40 fc f7 d3 bb ed
02 96 27 4d 00 c9 4c 02 05 0a f0 b2 bb 0a f0 b0 bb
[   14.259392]  00000120: ff 00 70 b5 30 8d 0f b1 4d 0f e0 cc 0f 07 84
ef 0d 4b 7b 44 1b 68 6b b9 ad 0f 82 27 ed 01 82 8d
[   14.282059]  00000140: 0f 06 8c 0f bc 13 04 80 ef ec e7 fc f7 9c 54
10 01 f4 e7 8c 5a 7c 1d 6d 0e 7a 27 cd 01 8f 8c 0e
[   14.305453]  00000160: 00 0b 80 bb 28 4b 2d e9 f0 43 7b 44 0d 46 85
b0 19 68 04 46 17 46 00 29 3f d0 02 ae 01 20 31 5c
[   14.329611]  00000180: 05 00 0c e8 ed 03 9b 44 f6 d3 50 02 9a c1 f2
62 00 83 fb 00 01 db 17 00 92 c3 eb a1 1c cd f8 04
[   14.354038]  000001a0: c0 47 03 58 f9 17 44 03 00 0f 08 4f f4 7a 70
87 fb 08 89 4f f4 4a 4e c3 f6 9a 3e c1 eb a9 13 99
[   14.378463]  000001c0: 18 02 91 00 fb 13 73 00 fb 03 c3 4c 00 00 07
f3 73 45 03 93 07 dd 4f f4 4e 50 30 bd 0e 02 42 e9
[   14.402888]  000001e0: 6c bf 03 d8 fc 05 4a 06 49 74 b3 01 79 44 00
90 77 12 89 fe 00 85 04 46 5d 0a b8 4c 6f 06 30 b5
[   14.427312]  00000200: a3 b0 02 ac 80 23 1a 6d bc 21 05 11 01 56 a1
5a e9 0d 8e 28 05 02 aa 5d 39 ea 04 73 07 a9 bf bd
[   14.451740]  00000220: f8 08 00 00 20 01 38 6e 0e a8 bf 05 1d 23 5e
07 2d 48 77 fb 78 44 c7 0f 70 f7 da ea 0c 69 09 00
[   14.476159]  00000240: 28 3e d0 02 af 01 ae 0d f1 0c 0a 4d f5 09 0d
36 51 55 64 c7 0d 99 90 4d 44 ea 0c 16 00 07 48 bb
[   14.500578]  00000260: 34 68 3c b3 e3 7a 2e 2b f1 d0 df f7 f2 e8 0a
22 39 46 83 46 05 60 04 4c 19 4e ff ea db 05 0a 30
[   14.524997]  00000280: 6c a6 00 09 e2 d1 3b 68 00 2b df d0 1b 78 00
33 18 bf 01 23 02 28 d8 bf 43 f0 01 03 00 2b d5 5c
[   14.549417]  000002a0: c6 66 78 84 42 05 29 cf 4c 08 01 e2 e8 cc e7
66 02 b2 ea b5 c8 04 45 7f 0a 04 1a 06 1e 09 db 03
[   14.573840]  000002c0: 2d f5 dd 03 24 4d 19 34 4c 0f 04 e8 ac 42 f9
db ed e7 5e 66 65 f4 5e 29 12 1d ef 4f 02 ac 88 46
[   14.598270]  000002e0: 61 07 46 0d 9f 23 94 87 7e 3a 45 4d 56 1f ea
7d 0f 4a 28 10 db 04 02 06 8c ea 04 1e 3a db 54 d0
[   14.622702]  00000300: 03 47 fe ac e8 31 04 e6 44 78 04 87 f8 58 b3
02 98 05 de 89 8e e8 28 3d 11 10 5f 89 8c fd 04 6d
[   14.647120]  00000320: c2 00 04 5e 02 1b fc 33 4a 21 84 ce 7e 51 ce
fd 76 70 e3 e7 0d 1b 23 c5 83 28 46 2b 4f db 04 12
[   14.671542]  00000340: 02 fe f7 a6 fe 03 54 00 02 a3 fe c6 e7 02 5e
0c 78 e8 65 05 ce 4e b3 60 e8 5c 21 4e 8e 62 fd 4c
[   14.695969]  00000360: 7f 4f 39 f2 fb 1f 45 ee 3b 4e 0a 00 90 6e 0a
a4 fd 7e 05 60 e8 75 13 5c 95 06 b3 86 08 56 e8 0c
[   14.720402]  00000380: 1d 6e 02 32 ea 04 1b 7e 00 2e ea 04 01 0b 01
28 01 d9 df f7 4a e8 ff f7 23 ff 41 46 7c c9 09 2a
[   14.744829]  000003a0: ea 0d 4b eb 58 1c 68 df f7 2c e8 64 45 02 c3
fb 0a 49 3a 4d 54 03 86 49 b2 e8 7e a8 aa e8 6c 19
[   14.769250]  000003c0: 09 93 e7 74 5a 01 00 02 1c 01 00 d2 1b bd af
96 5d 00 1e 44 7c 03 5a 68 0a b1 98 68 46 53 b5 87
[   14.793675]  000003e0: 07 53 aa 01 a9 0c ad 02 df f7 04 ea d8 4d ff
06 06 37 90 02 45 3f 08 0d 1e 90 22 d7 2a 38 e9 01
[   14.818112]  00000400: 94 01 03 04 90 11 4b 01 20 5d b2 99 04 0f 04
8a 42 58 60 0d d0 0e 5f 08 98 60 07 23 c4 28 07 05
[   14.842540]  00000420: aa 04 a9 03 a8 df f7 fa e9 46 8a d0 db 04 33
05 9b 9a 42 ee d1 03 9a 04 5c 00 03 ea d1 05 9b d0
[   14.866968]  00000440: 1a 44 42 02 20 e5 e7 8a 60 4c 88 4e 00 42 60
8e 39 4f dd 5d c0 16 21 cc 2a 08 b5 ff c2 4d 7d 44
[   14.891389]  00000460: 04 46 60 bb c1 54 91 0d 01 f0 27 fb 08 b1 03
78 53 b9 be 4a 30 46 be 49 6c 60 04 f0 f7 85 fc 20
[   14.915812]  00000480: 46 5d 9c 45 01 0d f1 38 08 22 25 22 3c 07 1e
46 f8 b1 04 02 00 06 fb f7 bd ff 04 46 18 bb b5 4b
[   14.940236]  000004a0: 30 46 b5 49 eb 58 79 44 1a 68 f0 f7 6d fc 6e
04 4e f8 f5 06 af 4c 09 01 af 49 00 24 b5 09 5e 27
[   14.964667]  000004c0: 35 01 a7 55 06 aa 27 d4 00 00 01 52 fc cb e7
a8 4c 0c ab 04 93 0d f1 28 09 03 93 7c 44 d8 5c 5b
[   14.989089]  000004e0: 0b 0d f1 70 0b 94 e8 03 00 0d f1 58 0a a1 4a
05 a9 93 07 36 7a 44 89 44 02 02 df f8 7c e2 83 5c
[   15.013520]  00000500: 00 00 05 58 46 06 9b fe 44 df f8 70 c2 9c 49
fc 44 ca f8 04 e0 ca f8 08 30 79 44 01 0c 0c c0 07
[   15.037952]  00000520: 92 ca f8 00 20 3c aa ca f8 10 10 05 4e 01 14
40 04 4a 02 6a e9 11 21 58 57 2e 6c e9 59 0d d2 9a
[   15.062376]  00000540: 64 37 05 6e e9 7b 68 48 46 04 93 67 01 a0 42
74 0d c2 98 74 04 54 73 5c 59 0d 24 e9 b0 f1 00 0b
[   15.086789]  00000560: c0 f2 cb 80 7b d1 85 48 02 21 64 b6 05 06 e8
41 1c 04 46 2c d0 65 3d de 0c 69 07 ef 03 9d 28 68
[   15.111200]  00000580: de f7 34 ef 20 54 81 44 8a 01 e9 01 30 1e 4f
03 04 00 01 55 01 0a 54 01 02 17 d0 68 68 02 4d 01
[   15.135616]  000005a0: 04 4c 01 02 11 d0 75 4c ff 5e b1 05 99 07 b4
7c 44 02 47 46 2e e9 51 9d 47 36 5f 00 04 f1 09 45
[   15.160036]  000005c0: 7b f6 44 49 06 de f7 84 ef de f7 f8 ee 05 9e
59 fa fb 0d dc 28 44 4e 05 8a fa 66 4a 39 46 07 9b
[   15.184456]  000005e0: fe 59 3c fc 7c 08 76 08 0c e9 75 11 45 05 9c
d0 06 0d f0 ee 75 0f 41 8c 01 04 ea ee 03 9b 18 68
[   15.208856]  00000600: 42 8d 01 e4 4c 01 0e 58 68 43 1c 3f f4 2f af
de f7 dc ee 2b e7 de f7 c8 c5 0c c9 c7 0c 59 fa 4f
[   15.233260]  00000620: 2b 87 01 0b fc cd 55 ef 04 5d 1c c4 06 0f 9c
60 5e 1c c0 ee 5e 66 33 c9 0f 04 30 63 60 46 84 62
[   15.257677]  00000640: 39 d4 77 21 44 36 00 03 28 f6 dc 09 ac 04 e0
de f7 9c ee 03 68 04 2b 06 d1 00 22 21 46 6d 2d ce
[   15.282095]  00000660: 04 34 00 04 30 f3 d0 23 68 5a 06 04 d1 c3 f3
07 23 01 24 00 2b a1 d0 12 ac 20 5c c8 03 16 ff 78
[   15.306514]  00000680: b3 03 9d 65 09 21 85 10 ac 5c 08 01 f7 dc 04
99 77 f4 00 f8 63 44 9b 0c 28 dd 21 68 30 46 2a 4b
[   15.330933]  000006a0: 2a 4a 00 91 7b 44 2a d6 52 be fb 05 83 7f 45
18 66 c5 18 68 c7 18 f8 f9 22 2b 04 03 02 aa fb 6c
[   15.355353]  000006c0: e7 0d 45 4d 1e 27 a4 09 02 1d fb e1 e7 1b 44
02 03 1b 4a 1c 49 7b 44 b4 09 06 97 fb d7 e7 b8 58
[   15.379770]  000006e0: 01 00 14 5d 74 0a 4e 00 3c cc 0d 34 c0 5e 76
66 ad 0e 01 90 1a 21 4d 26 cb 5c be 4e 01 92 49 0d
[   15.404184]  00000700: 02 b4 5d 01 ba 4d 00 c2 4d 00 c8 4d 00 a8 4e
00 ec 19 0d 00 fa 4d 00 98 4e 00 b8 18 0d 00 30 5d
[   15.428592]  00000720: 00 22 5e 05 de 17 0e 01 c6 aa 0d 01 68 4d 02
1a 4f 02 d4 ac 00 7e 6f 41 b2 9c 6f 00 15 12 a9 01
[   15.453004]  00000740: aa 80 23 01 93 de f7 ae ef 04 46 28 bb bd f8
48 50 02 2d 6e d0 0a 2d 34 d0 01 2d 0c d0 16 20 01
[   15.477423]  00000760: f0 fc fa 40 23 fc 24 6d 19 44 21 85 2e 32 6f
67 81 9d f8 01 d5 02 0f 12 2b 45 d1 04 c6 58 83 5c
[   15.501854]  00000780: 28 02 88 fe 37 49 38 54 91 09 fc f7 81 ff 00
28 45 d1 de f7 da ed b6 a1 db fa b7 a1 6b f9 30 54
[   15.526284]  000007a0: a1 fd ab 1e 0d 4f 20 ad 09 06 21 1f 25 08 08
21 4c cf 02 fc f7 65 fe 22 5c d8 0b 2e 23 14 a9 de
[   15.550708]  000007c0: f7 fa ef 00 28 db d0 bd f8 11 00 00 ff ff ff
ff 31 18 10 06 78 bd fd ec 29 4d 00 00 00 00 00 00
[   15.575161]  000007e0: 43 0d 00 00 01 00 00 00 9d 0d 00 00 23 00 00
20 00 00 00 00 00 00 00 00 00 10 00 00 01 00 00 00
[   15.599574]  00000800: 4e 4a 20 38 46 22 49 c2 f3 07 23 43 ea 02 22
79 44 92 b2 fc f7 c9 ff 00 28 cd d0 41 46 38 46 04
[   15.623982]  00000820: f0 61 fb 00 28 c7 d0 01 20 d7 e7 0d f1 4a 01
20 46 fc f7 42 fe 17 49 38 46 79 44 fc f7 3b 5f 04
[   15.648391]  00000840: b9 d0 21 9d 04 4d 5c 04 00 0b b3 d0 ea e7 06
ac 28 46 2e 23 13 a9 22 46 de f7 c8 ef 00 28 a9 d0
[   15.672803]  00000860: bd f8 4a 50 22 46 0b 4d 06 c5 96 0c 05 23 0d
0e 9b 55 0c 96 54 07 00 01 9a d0 d1 e7 00 bf ea 18
[   15.697224]  00000880: 01 00 ec 05 01 00 aa 11 01 00 3e 4d 01 70 4e
01 b8 17 0c 00 00 13 10 b5 18 20 fc f7 02 fc 04 46
[   15.721638]  000008a0: 48 b1 00 21 de f7 b8 ef 0b 38 01 28 20 46 00
d9 10 bd fc f7 00 fc 00 20 10 bd 70 4e 04 82 b0 06
[   15.746057]  000008c0: 03 ef fb 04 09 02 b8 b1 01 ad 28 5c 0e 01 aa
ef 01 21 7c 00 02 ac ef 29 46 20 5c 00 00 03 9c ef
[   15.770460]  000008e0: 06 46 28 46 0b 3e de f7 a8 ef 01 2e 20 46 01
d9 02 b0 70 45 08 df 0e 2c 20 f9 5f 0f 10 b5 04 56
[   15.794871]  00000900: 04 a0 ef 04 06 05 bd e8 10 40 fc f7 d3 bb ed
02 96 27 4d 00 c9 4c 02 05 0a f0 b2 bb 0a f0 b0 bb
[   15.819271]  00000920: ff 00 70 b5 30 8d 0f b1 4d 0f e0 cc 0f 07 84
ef 0d 4b 7b 44 1b 68 6b b9 ad 0f 82 27 ed 01 82 8d
[   15.843677]  00000940: 0f 06 8c 0f bc 13 04 80 ef ec e7 fc f7 9c 54
10 01 f4 e7 8c 5a 7c 1d 6d 0e 7a 27 cd 01 8f 8c 0e
[   15.868091]  00000960: 00 0b 80 bb 28 4b 2d e9 f0 43 7b 44 0d 46 85
b0 19 68 04 46 17 46 00 29 3f d0 02 ae 01 20 31 5c
[   15.892508]  00000980: 05 00 0c e8 ed 03 9b 44 f6 d3 50 02 9a c1 f2
62 00 83 fb 00 01 db 17 00 92 c3 eb a1 1c cd f8 04
[   15.916944]  000009a0: c0 47 03 58 f9 17 44 03 00 0f 08 4f f4 7a 70
87 fb 08 89 4f f4 4a 4e c3 f6 9a 3e c1 eb a9 13 99
[   15.941369]  000009c0: 18 02 91 00 fb 13 73 00 fb 03 c3 4c 00 00 07
f3 73 45 03 93 07 dd 4f f4 58 52 01 31 cc f2 65 42
[   15.965789]  000009e0: 02 91 1a 44 03 92 32 46 ac 19 00 0b 34 ef 6e
38 18 bf 01 20 05 b0 bd e8 f0 83 68 46 02 ae de f7
[   15.990200]  00000a00: b0 ed 9d e8 04 10 cb e7 36 5f 17 0a f0 2e 07
2c b5 83 b0 05 08 69 54 05 00 15 22 ef 18 b9 05 4b
[   16.014615]  00000a20: 01 22 7b 44 1a 60 ff f7 6f fc 01 20 03 b0 5d
f8 04 fb 00 bf 7e 59 01 00 02 48 78 44 04 30 0a f0
[   16.039016]  00000a40: 09 4d 1c 66 29 3d 00 05 5d 01 56 5c 01 44 1e
07 41 84 b0 07 46 0e 46 68 46 90 57 4e f1 fc 6d 04
[   16.063418]  00000a60: 99 05 46 98 b3 f6 b9 23 49 68 94 4f 02 fc fd
f8 b1 39 4c 2b 04 fc f7 f7 fd d0 b1 31 54 50 00 04
[   16.087846]  00000a80: 42 46 fe f7 83 fc 06 1e 19 db 2a 46 00 21 fa
f7 eb f9 04 46 10 b3 66 04 f6 fc 0d 2f 04 76 16 81
[   16.112265]  00000aa0: 14 d6 07 dd fd 04 9f 04 df d1 12 49 40 46 00
54 5e 01 f0 f7 85 f9 7d 04 e2 4c 4a bd 04 0c 46 03
[   16.136680]  00000ac0: 22 46 66 03 78 f9 0f 0e e0 e7 09 27 3e 00 70
f9 05 bc 30 47 0d b6 fb e5 4e 47 f2 02 0d 2a a4 4c
[   16.161078]  00000ae0: 00 02 8c a6 00 00 72 4d 00 62 4c 00 4c 17 05
4f 8b b0 8b 46 92 46 06 44 63 06 12 fa aa 4d 7d 44
[   16.185476]  00000b00: 29 46 07 4e 22 da eb 04 24 02 00 28 5b d0 a7
84 68 06 de f7 d2 eb 18 b1 00 20 0b 67 0e 8f a3 49
[   16.209879]  00000b20: 05 15 79 0c 40 01 f0 fc f9 81 4c 04 00 03 00
f0 ed 80 df f8 7c 82 03 ad 01 27 f8 44 00 e0 01 37
[   16.234264]  00000b40: 19 21 3b 44 1c 7f 46 94 ee 29 44 10 00 02 04
f0 e7 f9 00 28 f2 d1 04 46 78 1c 80 00 fc f7 72 fa
[   16.258658]  00000b60: 00 90 7d 06 da 00 03 00 02 9b 1f 1f 05 e0 fb
f7 33 fa 01 34 47 f8 04 0f a8 b1 19 21 23 cd 07 76
[   16.283053]  00000b80: cd 07 c9 4c 07 0b ed d1 00 2c 5c d1 48 46 01
34 fb f7 1d fa 64 05 0f 00 28 e9 d1 01 90 00 98 fc
[   16.307455]  00000ba0: f7 5f fa 81 49 50 46 01 9a 67 1e f7 f8 03 cd
14 7d cc 14 04 aa f9 7b 49 79 44 80 87 09 a4 f9 79
[   16.331868]  00000bc0: 4d 01 07 8c 01 04 9e f9 57 b1 77 4b 50 47 25
21 46 7b 5f 04 26 f9 02 c4 07 00 02 00 28 08 bf b8
[   16.356280]  00000be0: f1 00 0f 0c bf 01 22 00 22 18 d0 18 f1 00 04
4d 49 24 0e 05 0c bf 0f 6a 04 f0 01 0a 50 29 40 02
[   16.380695]  00000c00: 95 80 52 0d 3e 2c 0e 30 ab 80 05 5b ff 0b 75
fe cb f8 07 53 00 28 65 5c 8f 04 6c e7 62 4a 50 46
[   16.405110]  00000c20: 3b 45 51 7a 5e 0a fa f8 0e 15 63 e7 04 2a 6c
36 02 e4 fb 01 9b 04 86 26 89 80 4d 19 93 05 07 59
[   16.429589]  00000c40: c4 02 02 36 d0 56 49 28 44 02 7d 3d e5 0d 9f
9b 05 04 5a 54 95 64 02 5d 3f fc 06 03 53 d0 7d 99
[   16.453997]  00000c60: dc 07 42 9b 18 68 74 03 07 57 d0 4b 4a 1c 46
00 9f 7a 44 45 67 90 06 9d 0d e0 7f 0b 42 fd 81 4c
[   16.478408]  00000c80: 1b 02 fc f7 c8 f9 b9 7e 17 d0 57 9e 24 3f d0
0e 19 25 fb 0d 39 41 57 27 06 46 03 57 0d e8 d1 3c
[   16.502812]  00000ca0: 44 26 b6 49 5e f8 06 0e 00 24 0e 0c ba fb 45
18 40 7f 29 b7 f9 db 04 02 07 30 00 2b 99 d1 03 20
[   16.527231]  00000cc0: 06 e7 33 4f 24 4a 46 49 8d 24 94 4c 19 04 fd
e6 2f 49 02 46 50 9c 4b 02 40 f8 ed e7 2d 5d 03 11
[   16.551655]  00000ce0: 95 03 85 57 03 ee e6 2a 27 66 01 31 f8 6c 16
02 82 f9 ce e7 dd 4e 14 48 46 5d 25 99 06 4a 1e fa
[   16.576084]  00000d00: 05 bd c5 d5 5e 70 0f 05 46 80 b1 64 17 04 7b
fb bf e7 1c
[   16.596997] UBIFS error (ubi0:0 pid 139): do_readpage: cannot read
page 35 of inode 3485, error -22

I checked the code regarding glitches on read/write side which could
lead to page number not getting updated or something along this line, so
far I could not nail the issue.

Brian, with the pattern above in mind, do you see possible issues in the
driver?

--
Stefan
