Received: from venus.billgatliff.com ([209.251.101.201])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOPiu-0005pU-0g
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 04:25:08 +0000
Received: from [192.168.2.10] (adsl-75-23-81-96.dsl.peoril.sbcglobal.net
	[75.23.81.96])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by venus.billgatliff.com (Postfix) with ESMTP id 76D71A40B2
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jul 2008 23:25:07 -0500 (CDT)
Message-ID: <48913EA3.9080603@billgatliff.com>
Date: Wed, 30 Jul 2008 23:25:07 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Node CRC failures in latest mainline git?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guys:


I pulled from Linus' tree yesterday, and all of a sudden I'm seeing a _ton_ of
these:

JFFS2 notice: (224) jffs2_get_inode_nodes: Node header CRC failed at 0x263a0fc.
{1985,c002,00000046,32fe3396}

An older kernel (three or four weeks ago) continues to work fine on the same board.

The target is a PXA270 with a Spansion 29GL512N.  The kernel was built with
arm-linux-gnueabi-gcc (GCC) 4.2.4 (Debian 4.2.4-3).  There haven't been any
changes in the mtd-related parts of the kernel, other than what's come in from
Linus.

It looks like the most recent mtd-related commit is this:

$ git-log drivers/mtd
commit 9ee08c2df47c10ba624ff05a6c0f2500748bcb69
Merge: eaf0ba5... 3d45955...
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Jul 26 20:30:56 2008 -0700

    Merge git://git.infradead.org/mtd-2.6

    * git://git.infradead.org/mtd-2.6: (57 commits)
      [MTD] [NAND] subpage read feature as a way to increase performance.
      CPUFREQ: S3C24XX NAND driver frequency scaling support.
      [MTD][NAND] au1550nd: remove unused variable
      [MTD] jedec_probe: Fix SST 16-bit chip detection
      [MTD][MTDPART] Fix a division by zero bug
      [MTD][MTDPART] Cleanup and document the erase region handling
      [MTD][MTDPART] Handle most checkpatch findings
      [MTD][MTDPART] Seperate main loop from per-partition code in add_mtd_partiti
      [MTD] physmap: resume already suspended chips on failure to suspend
      [MTD] physmap: Fix suspend/resume/shutdown bugs.
      [MTD] [NOR] Fix -ETIMEO errors in CFI driver
      [MTD] [NAND] fsl_elbc_nand: fix section mismatch with CONFIG_MTD_OF_PARTS=y
      [JFFS2] Use .unlocked_ioctl
      [MTD] Fix const assignment in the MTD command line partitioning driver
      [MTD] [NOR] gen_probe: No debug message when debugging is disabled
      [MTD] [NAND] remove __PPC__ hardcoded address from DiskOnChip drivers
      [MTD] [MAPS] Remove the bast-flash driver.
      [MTD] [NAND] fsl_elbc_nand: ecclayout cleanups
      [MTD] [NAND] fsl_elbc_nand: implement support for flash-based BBT
      [MTD] [NAND] fsl_elbc_nand: fix OOB workability for large page NAND chips
      ...


Were I more competent with git, I would figure out how to bisect down to the
patch that caused the problem.  That's still a bit out of my skillset at the
moment, unfortunately--- I've done bisects successfully in the past, but for
some reason I just can't get git to play along this time...


Thanks!


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
