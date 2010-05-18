Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OELfN-00050Z-CF
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 12:12:58 +0000
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: Fix the bug that nandwrite can't write the yaffs2 image correctly
Date: Tue, 18 May 2010 20:23:08 +0800
Message-Id: <1274185390-3066-1-git-send-email-stanley.miao@windriver.com>
Cc: yaffs@lists.aleph1.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Many people encountered this problerm, creating a image by mkyaffs2image,
then write it into a nand falsh with nandwrite, then mounted failed.

This is because mkyaffs2image didn't know the oob layout of a NAND flash,
so it put the yaffs2 tags at the offset 0 of oob area, nandwrite didn't
put it at right position when writing oobdata.

Stanley.
