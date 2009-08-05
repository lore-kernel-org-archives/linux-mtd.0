Received: from koko.iders.ca ([206.45.72.61])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYjp9-0004Jc-Oj
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 16:58:52 +0000
Received: from [200.123.101.231] (zen.iders.ca [200.123.101.231])
	by koko.iders.ca (Postfix) with ESMTP id 100E33E400A
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Aug 2009 11:58:34 -0500 (CDT)
Message-ID: <4A79BA39.1090705@iders.ca>
Date: Wed, 05 Aug 2009 11:58:33 -0500
From: Andrew McKay <amckay@iders.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd-utils version for Linux 2.6.20.4
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm wondering if there's a particular version of mtd-utils I should be using 
with Linux 2.6.20.4.  I'm trying to debug a NAND issue by doing straight binary 
transactions with the mtdblock device.  I'm writing 1 block of data to NAND 
using dd:

dd if=/dev/urandom of=/dev/mtdblock12 bs=262144 count=1

Note that the NAND part is 4K page and 218byte spare area, though MTD is 
treating it as 128byte spare area.

I added code to the MTD layer to dump ECC information to the terminal like so:

nand_write_page_swecc
eccsize: 256
eccbytes: 3
eccsteps: 16
copying aa into eccpos[0] (80)
copying 95 into eccpos[1] (81)
copying a7 into eccpos[2] (82)
copying f0 into eccpos[3] (83)
copying cf into eccpos[4] (84)
copying 3 into eccpos[5] (85)
copying a5 into eccpos[6] (86)
copying a5 into eccpos[7] (87)
copying 97 into eccpos[8] (88)
copying 95 into eccpos[9] (89)
copying 66 into eccpos[10] (90)
copying 6b into eccpos[11] (91)
copying f0 into eccpos[12] (92)
copying f3 into eccpos[13] (93)
copying c3 into eccpos[14] (94)
copying 95 into eccpos[15] (95)
copying 9a into eccpos[16] (96)
copying 67 into eccpos[17] (97)
copying fc into eccpos[18] (98)
copying f into eccpos[19] (99)
copying 3 into eccpos[20] (100)
copying f0 into eccpos[21] (101)
copying c3 into eccpos[22] (102)
copying f3 into eccpos[23] (103)
copying 99 into eccpos[24] (104)
copying 65 into eccpos[25] (105)
copying 9b into eccpos[26] (106)
copying 99 into eccpos[27] (107)
copying 6a into eccpos[28] (108)
copying 97 into eccpos[29] (109)
copying 0 into eccpos[30] (110)
copying fc into eccpos[31] (111)
copying f into eccpos[32] (112)
copying 69 into eccpos[33] (113)
copying 9a into eccpos[34] (114)
copying 5b into eccpos[35] (115)
copying fc into eccpos[36] (116)
copying cf into eccpos[37] (117)
copying c3 into eccpos[38] (118)
copying c3 into eccpos[39] (119)
copying 30 into eccpos[40] (120)
copying f into eccpos[41] (121)
copying 3c into eccpos[42] (122)
copying f into eccpos[43] (123)
copying c3 into eccpos[44] (124)
copying 96 into eccpos[45] (125)
copying a9 into eccpos[46] (126)
copying 57 into eccpos[47] (127)

With a logic analyzer I verified that this data is being written out at the end 
of the page program command.  However when I read back the data using nanddump, 
it shows me that the OOB area is a 0xFF.

Dumping data starting at 0x00000000 and ending at 0x80000000...
0x00000000: 6a 4a 4c 4c ea c4 94 e2 75 f0 03 3c 79 67 e7 af
0x00000010: 20 61 0a 19 b8 69 b1 b2 5b ce 52 f6 ff 98 a4 59
0x00000020: 29 45 f3 e5 e9 e3 83 ba 1f f4 72 24 9e 00 40 ef
0x00000030: 3a d5 00 17 33 32 0b c1 49 33 07 75 21 d4 f2 d8
0x00000040: 7d e2 89 72 dc 41 bd 15 49 dd 2e d5 a8 c4 02 7e
0x00000050: e8 60 6f 26 9c c2 c3 60 0d 7e 31 4e 81 ad c6 61
0x00000060: 81 93 eb e0 75 4d 70 bd 5e b3 82 a8 da ec 8d 4f
0x00000070: 2f 8a 47 18 7c 05 a8 7b 92 b4 da 8b 28 2a 3f 7b
[SNIP]
0x00000f80: c6 6e 73 52 66 cd 52 4a f4 9b 91 88 18 22 ce 07
0x00000f90: 1d 73 c9 53 fd 4c aa 4c b9 ac 7b 5d 05 98 e5 a7
0x00000fa0: ec 15 c9 26 23 22 86 7f e6 74 73 ce a8 16 7c b7
0x00000fb0: cb bd 63 37 e4 b1 51 17 be ad 99 79 1b 1b ea 7c
0x00000fc0: 60 f6 87 1f 56 f2 62 2e 2a ab 8c 45 f2 9c c3 30
0x00000fd0: b7 c8 22 54 be f3 49 9a a0 f8 b8 0d 4a 88 7d 0b
0x00000fe0: 22 e0 1c 92 95 bc 97 10 31 b1 d5 05 06 b9 30 7d
0x00000ff0: b4 d1 30 8e 4d 84 6a f9 05 88 61 96 b7 10 c2 9f
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

I had a look with the logic analyzer during the read, and I am seeing the ECC 
information at the tail end of the page read command.

Could this be caused by a new version of mtd-utils (from the head of the git 
repository late last week) trying to work with a MTD NAND driver from a 2.6.20.4 
kernel?  If so, what version of mtd-utils would work with that era of kernel?  I 
realize it's an older kernel, but we're replacing NAND parts on a project that 
is using that kernel, and moving to a new kernel is not going to be a trivial task.

Any hints or advice would be greatly appreciated.

Thanks,
Andrew McKay
Iders Inc.
