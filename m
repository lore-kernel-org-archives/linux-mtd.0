Received: from avanto.mpei.ac.ru ([193.233.71.179] helo=avanto.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWBau-0007an-Ha
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 05:38:55 -0500
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1CWBax-0001CE-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Nov 2004 13:38:55 +0300
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Mon, 22 Nov 2004 13:39:15 +0300
References: <200411221211.12394.skorinkod@mosk.ru>
	<41A1BE40.2000106@colleduc.ee>
In-Reply-To: <41A1BE40.2000106@colleduc.ee>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200411221339.15109.skorinkod@mosk.ru>
Subject: Re: mkfs.ext3 - segmentation fault
Reply-To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 22 November 2004 13:24, you wrote:
> Dmitry Skorinko wrote:
> <snip>
>
> >EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]
>
> <snip>
>
> >Help, plz.  Thanks.
>
> I fixed this in the CVS about two weeks ago and sent a note about the
> fix to the list. Try the current CVS.

try current cvs and have same :((   :

-skip-
nand_read_oob: from = 0x00027c00, len = 8
nand_read_oob: from = 0x00027e00, len = 8
INFTL: deleting empty VUC 2
Deleting EUN 9 from VUC 2
INFTL: INFTL_formatblock(inftl=c126e200,block=9)
nand_erase: start = 0x00024000, len = 16384
nand_isbad_bbt(): bbt info for offs 0x00024000: (block 0) 0x09
Unable to handle kernel NULL pointer dereference at virtual address 00000100
 printing eip:
c803f846
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: diskonchip reed_solomon nand nand_ids nand_ecc mtdpart 
inftl mtd_blkdevs mtdcore ipv6 af_packet 8139too mii crc32 usbkbd usbcore rtc 
ext3 jbd ide_generic sis5513 ide_disk ide_core unix
CPU:    0
EIP:    0060:[<c803f846>]    Not tainted
EFLAGS: 00010246   (2.6.8mymtd26)
EIP is at mtd_erase_callback+0x6/0x40 [mtdpart]
eax: 00000000   ebx: 00000000   ecx: 0000000e   edx: c126e304
esi: 00000140   edi: c126e304   ebp: 00000000   esp: c620fdd0
ds: 007b   es: 007b   ss: 0068
Process inftld (pid: 749, threadinfo=c620e000 task=c620d790)
Stack: c80dfa4d c126e304 00000009 c126e200 c126e334 00000000 00000000 00000020
       c80df831 c6211400 c126e304 00000000 c8032971 c6211400 c126e304 c6260004
       c126e200 00000009 c620fe5c c126e304 c126e200 00000009 c8031a64 c8031a6e
Call Trace:
 [<c80dfa4d>] nand_erase_nand+0x20d/0x230 [nand]
 [<c80df831>] nand_erase+0x11/0x20 [nand]
 [<c8032971>] INFTL_formatblock+0x71/0x140 [inftl]
 [<c8031a64>] INFTL_trydeletechain+0x214/0x280 [inftl]
 [<c8031a6e>] INFTL_trydeletechain+0x21e/0x280 [inftl]
 [<c8031c7c>] INFTL_deleteblock+0x1ac/0x1c0 [inftl]
 [<c80320b9>] inftl_writeblock+0x429/0x440 [inftl]
 [<c01f42f7>] __end_that_request_first+0x1c7/0x1e0
 [<c800d0b4>] gcc2_compiled.+0xb4/0x100 [mtd_blkdevs]
 [<c800d25d>] mtd_blktrans_thread+0x15d/0x1c0 [mtd_blkdevs]
 [<c800d100>] mtd_blktrans_thread+0x0/0x1c0 [mtd_blkdevs]
 [<c01174d0>] default_wake_function+0x0/0x20
 [<c01174d0>] default_wake_function+0x0/0x20
 [<c0104279>] kernel_thread_helper+0x5/0xc
Code: 81 b8 00 01 00 00 f0 f7 03 c8 75 1a 8b 4a 0c 83 f9 ff 74 09

Dmitry
