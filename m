Received: from [63.144.37.162] (helo=mh02.bioace.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rkxG-00045V-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 20:57:46 +0100
Received: from bioace.net (unknown [192.168.10.179])
	by mh02.bioace.net (Postfix) with ESMTP id 7288F40230
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 15:57:05 -0400 (EDT)
Message-ID: <3D88DA8E.212465C5@bioace.net>
Date: Wed, 18 Sep 2002 15:57:03 -0400
From: Carl Przybylek <carlp@bioace.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS1/2 with DiskOnChip
Content-Type: text/plain; charset=us-ascii
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

Sorry I accidentally hit send....

I keep getting these ECC needs a full sector write when trying to put a
jffs1/2 image onto an m-sys disk on chip.   Seems at first the latest
mtd source did not link into the kernel correctly, Ive fixed that and I
still keep getting the errors.  If someone can answer the following
questions or has put a jffs2 filesytem on DiskOnChip I would greatly
appreciate a list of the steps you followed to get it to work.

Ive went through and ensured the following are configured in the
kernel.  I do have a question about the CONFIG_MTD_NAND_YOURBOARD=y
option.  Ive noticed the inti_doc2000 calls are defined so I assume I
dont need to follow the procedure in
http://www.linux-mtd.infradead.org/tech/nand.html to add my device.
However, I dont see an option for CONFIG_MTD_NAND_DOC2000.  Is this
enabled by the CONFIG_MTD_DOC2000 option?

CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_YOURBOARD=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_NAND=y

Also Ive notice an option CONFIG_MTD_NAND_ECC_JFFS2 in the nand.c file.
I dont see this defined in any other code, do I need to enable this
config option in the kernel as well?

Im also confused as to whether I need to worry about the nftla system
before I add the jffs2 system.  It seems from the howto that I only need
to eraseall /dev/mtd0 and then cp jffs2.image /dev/mtd0 and I should be
good to go.  Everytime I try to cp to the dev/mtd0 device i keep getting
an ECC error.

Thanks
Carl Przybylek
