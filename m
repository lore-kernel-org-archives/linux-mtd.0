Received: from admc.win.mvl.intelos.net ([216.12.7.113] helo=bifrost.admc.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17UFSQ-00025I-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Jul 2002 00:40:47 +0100
Received: from admc.com (gw.admc.com [192.168.100.246])
	by bifrost.admc.com (8.11.2/8.11.2) with ESMTP id g6FNeF401887
	for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2002 19:40:15 -0400
Message-ID: <3D335D5D.3090201@admc.com>
Date: Mon, 15 Jul 2002 19:40:13 -0400
From: Blaine Simpson <blaine.simpson@admc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: fdisk won't save changes
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I would much appreciate it if somebody experienced with MTD could point
out something I'm doing wrong, direct me toward a solution, or,
alternatively, confirm that the mtd drivers are just not up to
production use for DOC2000.


Linux kernel 2.4.18
Have built many kernels with all relevant features turned on
188M DOC2000

If I build my kernel with the nftlcore.c v. 1.86, upon bootup I get:

     Jul 15 22:43:39 vox kernel: ftl_cs: FTL header not found.
     Jul 15 22:43:39 vox kernel: NFTL driver: nftlcore.c $Revision: 1.86 
$, nftlm
ount.c $Revision: 1.25 $
     Jul 15 22:43:39 vox kernel: Could not find valid boot record
     Jul 15 22:43:39 vox kernel: Could not mount NFTL device
and /dev/nftla is not usable at all.


If I boot with a kernel with nftlcore v. 1.82, I  get:

     Jul 15 23:11:47 vox kernel: ftl_cs: FTL header not found.
     Jul 15 23:11:47 vox kernel: NFTL driver: nftlcore.c $Revision: 1.82 
$, nftlm
ount.c $Revision: 1.25 $
     Jul 15 23:11:47 vox kernel: Cannot calculate an NFTL geometry to 
match size
of 0x3bf60.
     Jul 15 23:11:47 vox kernel: Using C:1023 H:16 S:15 (== 0x3bf10 sects)
     Jul 15 23:11:47 vox kernel:  nftla: unknown partition table


I can then actually run fdisk on /dev/nftla, but when fdisk tries to save
my changes, entries like this appear in my sys log:

     Jul 15 23:30:41 vox kernel: Argh! No free blocks found! LastFreeEUN 
= 7679,
FirstEUN = 0
     Jul 15 23:30:41 vox kernel: No Virtual Unit Chains available for 
folding. Fa
iling request
     Jul 15 23:30:41 vox kernel: Argh! No free blocks found! LastFreeEUN 
= 7679,
FirstEUN = 0
     Jul 15 23:30:41 vox kernel: Cannot make free space.
     Jul 15 23:30:41 vox kernel: NFTL_writeblock(): Cannot find block to 
write to
     Jul 15 23:30:41 vox kernel: end_request: I/O error, dev 5d:00 
(unknown), sec
tor 14
     Jul 15 23:30:44 vox kernel:  nftla: nftla1 < nftla5 >
     Jul 15 23:30:44 vox kernel:  nftla: nftla1 < nftla5 >

(An associate of mine has had very similar problems when trying to work
with CF-- fdisk will not save changes properly).


Her'es my nftldump /dev/mtd0 output:

     NFTL Media Header found at offset 0x00010000:
     NumEraseUnits:    9214
     FirstPhysicalEUN: 2
     Formatted Size:   295796736
     UnitSizeFactor:   0xff
     Second NFTL Media Header found at offset 0x00018000
     Unit 2 is free
     Unit 3 is free
     EraseMark not present in unit 4: ffff
     Unit 4 is free
     Unit 5 is free
     Unit 6 is free
     Unit 7 is free
     Unit 8 is free
     Unit 9 is free
     Unit 10 is free
     Unit 11 is free
     Unit 12 is in chain 2 and is not a replacement
     Unit 13 is free
     Unit 14 is in chain 3 and is not a replacement
     Unit 15 is free
     ...
     Unit 5932 is free
     Memory fault

Help!
