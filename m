Received: from web61208.mail.yahoo.com ([216.155.196.132])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrveC-0005AC-Pd
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 05:04:18 -0500
Message-ID: <20050121100407.61148.qmail@web61208.mail.yahoo.com>
Date: Fri, 21 Jan 2005 02:04:07 -0800 (PST)
From: matrix lau <matrix_lau@yahoo.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501141051450.17331@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2k Page support for the mtd driver
Reply-To: matrix_lau@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have enable the debug msg as follow:

First mount after program : it's ok

root@work:/project/rootdisk# mount -t jffs2
/dev/mtdblock/2 ./disk
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00000000
OOB at 00000000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00000000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00020000
OOB at 00020000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00020000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00040000
OOB at 00040000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00040000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00060000
OOB at 00060000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00060000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00080000
OOB at 00080000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00080000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 000a0000
OOB at 000a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x000a0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 000c0000
OOB at 000c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x000c0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 000e0000
OOB at 000e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x000e0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00100000
OOB at 00100000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00100000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00120000
OOB at 00120000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00120000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00140000
OOB at 00140000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00140000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00160000
OOB at 00160000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00160000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00180000
OOB at 00180000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00180000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 001a0000
OOB at 001a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x001a0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 001c0000
OOB at 001c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x001c0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 001e0000
OOB at 001e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x001e0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00200000
OOB at 00200000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00200000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00220000
OOB at 00220000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00220000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00240000
OOB at 00240000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00240000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00260000
OOB at 00260000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00260000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00280000
OOB at 00280000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00280000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 002a0000
OOB at 002a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x002a0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 002c0000
OOB at 002c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x002c0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 002e0000
OOB at 002e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x002e0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00300000
OOB at 00300000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00300000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00320000
OOB at 00320000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00320000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00340000
OOB at 00340000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00340000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00360000
OOB at 00360000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00360000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00380000
OOB at 00380000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00380000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 003a0000
OOB at 003a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x003a0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 003c0000
OOB at 003c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x003c0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 003e0000
OOB at 003e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x003e0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00400000
OOB at 00400000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00400000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00420000
OOB at 00420000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00420000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00440000
OOB at 00440000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00440000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00460000
OOB at 00460000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00460000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00480000
OOB at 00480000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00480000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 004a0000
OOB at 004a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x004a0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 004c0000
OOB at 004c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x004c0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 004e0000
OOB at 004e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x004e0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00500000
OOB at 00500000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00500000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00520000
OOB at 00520000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00520000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00540000
OOB at 00540000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00540000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00560000
OOB at 00560000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00560000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00580000
OOB at 00580000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00580000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 005a0000
OOB at 005a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x005a0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 005c0000
OOB at 005c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x005c0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 005e0000
OOB at 005e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x005e0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00600000
OOB at 00600000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00600000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00620000
OOB at 00620000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00620000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00640000
OOB at 00640000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00640000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00660000
OOB at 00660000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00660000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00680000
OOB at 00680000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00680000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 006a0000
OOB at 006a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x006a0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 006c0000
OOB at 006c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x006c0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 006e0000
OOB at 006e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x006e0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00700000
OOB at 00700000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00700000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00720000
OOB at 00720000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00720000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00740000
OOB at 00740000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00740000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00760000
OOB at 00760000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00760000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00780000
OOB at 00780000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00780000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 007a0000
OOB at 007a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x007a0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 007c0000
OOB at 007c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x007c0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 007e0000
OOB at 007e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x007e0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00800000
OOB at 00800000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00800000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00820000
OOB at 00820000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00820000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00840000
OOB at 00840000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00840000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00860000
OOB at 00860000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00860000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00880000
OOB at 00880000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00880000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 008a0000
OOB at 008a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x008a0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 008c0000
OOB at 008c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x008c0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 008e0000
OOB at 008e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x008e0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00900000
OOB at 00900000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00900000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00920000
OOB at 00920000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00920000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00940000
OOB at 00940000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00940000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00960000
OOB at 00960000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00960000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00980000
OOB at 00980000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x00980000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 009a0000
OOB at 009a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x009a0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 009c0000
OOB at 009c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x009c0000 is not formatted. It
will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 009e0000
OOB at 009e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
JFFS2: Erase block at 0x009e0000 is not formatted. It
will be erased
root@work:/project/rootdisk# cd disk
root@work:/project/rootdisk/disk# ls
bin  dev  etc  lib  lost+found  mnt  netpetf  proc 
root  sbin  tmp  usr  var
root@work:/project/rootdisk/disk# cd ..

Unmount the disk here and mount again

root@work:/project/rootdisk# umount ./disk
root@work:/project/rootdisk# mount -t jffs2
/dev/mtdblock/2 ./disk
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00000000
OOB at 00000000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00000000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00020000
OOB at 00020000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00020000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00040000
OOB at 00040000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00040000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00060000
OOB at 00060000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00060000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00080000
OOB at 00080000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00080000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 000a0000
OOB at 000a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x000a0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 000c0000
OOB at 000c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x000c0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 000e0000
OOB at 000e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x000e0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00100000
OOB at 00100000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00100000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00120000
OOB at 00120000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00120000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00140000
OOB at 00140000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00140000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00160000
OOB at 00160000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00160000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00180000
OOB at 00180000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00180000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 001a0000
OOB at 001a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x001a0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 001c0000
OOB at 001c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x001c0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 001e0000
OOB at 001e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x001e0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00200000
OOB at 00200000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00200000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00220000
OOB at 00220000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00220000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00240000
OOB at 00240000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00240000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00260000
OOB at 00260000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00260000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00280000
OOB at 00280000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x00280000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 002a0000
OOB at 002a0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x002a0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 002c0000
OOB at 002c0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x002c0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 002e0000
OOB at 002e0000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
CLEANMARKER node found at 0x002e0000 has totlen 0xc !=
normal 0x0
jffs2_check_nand_cleanmarker(): Cleanmarker node not
detected in block at 00300000
OOB at 00300000 was 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
mtd->read(0x400 bytes from 0x300000) returned -74
mount: wrong fs type, bad option, bad superblock on
/dev/mtdblock/2,
       or too many mounted file systems
root@work:/project/rootdisk#

Why the above error message appear?
I also try to mount it as read only and it's ok no
matter how many time I did the mount/umount.  So it
seems something was written to the Flash and corrupt
the file system if it is mounted as rw, Could you
please help? 

Thanks in advance,

Matrix
 
--- "Artem B. Bityuckiy" <dedekind@infradead.org>
wrote:

> As always, the first step is to switch the JFFS2
> debug level at 1 and 
> provide logs...
> 
> Possibly enabling MTD debugging may be useful
> either, but at the first 
> step at least JFFS2 output is OK. 
> 
> On Fri, 14 Jan 2005, matrix lau wrote:
> > Hi.
> > 
> > I am using the 2K page nand flash [NAND device:
> > Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND
> > 128MiB 3,3V 8-bit)] in the ARM system, and the
> nand
> > driver was modified according to the NAND
> controller.
> > 
> > Now, I face a problem in mounting the JFFS2
> system.
> > After program the JFFS2 to the mtdblock/2 by the
> > following cmd: dd if=JFFS2_FILE of=/dev/mtdblock/2
> > bs=128, then I mount it, the first time, it's ok.
> > 
> > However after umount then I mount it again, it
> can't
> > be mount again and with the following message: 
> > 
> > mount: wrong fs type, bad option, bad superblock
> on
> > /dev/mtdblock/2, or too many mounted file systems
> > 
> > I try with the 512 page device and it's ok, but
> > problems exists in 2Kpage nand.
> > 
> > 
> > Can any one help in the above issue?
> > 
> > Thanks
> > Matrix
> > 
> > __________________________________________________
> > Do You Yahoo!?
> > Tired of spam?  Yahoo! Mail has the best spam
> protection around 
> > http://mail.yahoo.com 
> > 
> >
>
______________________________________________________
> > Linux MTD discussion mailing list
> >
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - 250MB free storage. Do more. Manage less. 
http://info.mail.yahoo.com/mail_250
