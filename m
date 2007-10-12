Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IgHDt-00067d-7T
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 10:54:29 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1IgHDl-0005T7-QN
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 09:54:17 +0000
Received: from 87-194-185-172.bethere.co.uk ([87.194.185.172])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2007 09:54:17 +0000
Received: from chris by 87-194-185-172.bethere.co.uk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2007 09:54:17 +0000
To: linux-mtd@lists.infradead.org
From: Chris Paulson-Ellis <chris@edesix.com>
Subject: [PATCH] mtd: fix mtdconcat for subpage-write NAND
Date: Fri, 12 Oct 2007 10:54:06 +0100
Message-ID: <feng7u$sfs$1@sea.gmane.org>
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

---

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
