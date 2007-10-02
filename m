Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Icdth-0006Ak-C3
	for linux-mtd@lists.infradead.org; Tue, 02 Oct 2007 10:18:36 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1IcdqI-0000sh-9I
	for linux-mtd@lists.infradead.org; Tue, 02 Oct 2007 09:15:02 +0000
Received: from 81-86-64-114.dsl.pipex.com ([81.86.64.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2007 09:15:02 +0000
Received: from chris by 81-86-64-114.dsl.pipex.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2007 09:15:02 +0000
To: linux-mtd@lists.infradead.org
From: Chris Paulson-Ellis <chris@edesix.com>
Subject: [PATCH] mtd: fix mtdconcat for subpage-write NAND
Date: Tue, 02 Oct 2007 10:09:26 +0100
Message-ID: <fdt1s6$8de$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allows the mtdconcat driver to work with NAND flash devices that support sub-page writes.

Signed-off-by: Chris Paulson-Ellis <chris@edesix.com>

--- linux-2.6.22.2/drivers/mtd/mtdconcat.c.orig 2007-07-09 00:32:17.000000000 +0100
+++ linux-2.6.22.2/drivers/mtd/mtdconcat.c      2007-10-02 09:49:42.000000000 +0100
@@ -726,6 +726,7 @@ struct mtd_info *mtd_concat_create(struc
        concat->mtd.size = subdev[0]->size;
        concat->mtd.erasesize = subdev[0]->erasesize;
        concat->mtd.writesize = subdev[0]->writesize;
+       concat->mtd.subpage_sft = subdev[0]->subpage_sft;
        concat->mtd.oobsize = subdev[0]->oobsize;
        concat->mtd.oobavail = subdev[0]->oobavail;
        if (subdev[0]->writev)
