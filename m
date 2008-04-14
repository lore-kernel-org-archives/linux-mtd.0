Received: from smtp6.pp.htv.fi ([213.243.153.40])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPZ3-0004CD-3S
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:45 +0000
Date: Mon, 14 Apr 2008 17:20:40 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd: make struct rfd_ftl_tr static
Message-ID: <20080414142040.GW6695@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the needlessly global struct rfd_ftl_tr static.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
99d1a83588268cd6d7e5fd43e29fa470cdc8f525 diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 823fba4..c84e454 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -823,7 +823,7 @@ static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 	kfree(part);
 }
 
-struct mtd_blktrans_ops rfd_ftl_tr = {
+static struct mtd_blktrans_ops rfd_ftl_tr = {
 	.name		= "rfd",
 	.major		= RFD_FTL_MAJOR,
 	.part_bits	= PART_BITS,
