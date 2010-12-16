Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWj-0006eF-7h
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:42:23 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 5/6] mtd: initialize writebufsize in the MTD object of a
	partition
Date: Thu, 16 Dec 2010 23:42:18 +0100
Message-Id: <1292539339-25111-6-git-send-email-agust@denx.de>
In-Reply-To: <292342500.2538.65.camel@localhost>
References: <292342500.2538.65.camel@localhost>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Propagate the writebufsize to the partition's MTD object so
that UBI can set correct value for it's minimal I/O size
using the writebufsize field of MTD object of the partition.

By previous patches we added proper writebufsize field
initialization. Next patch can now change UBI to use
this field for setting the minimal I/O size.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/mtdconcat.c |    1 +
 drivers/mtd/mtdpart.c   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index bf8de09..5f5777b 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -776,6 +776,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.size = subdev[0]->size;
 	concat->mtd.erasesize = subdev[0]->erasesize;
 	concat->mtd.writesize = subdev[0]->writesize;
+	concat->mtd.writebufsize = subdev[0]->writebufsize;
 	concat->mtd.subpage_sft = subdev[0]->subpage_sft;
 	concat->mtd.oobsize = subdev[0]->oobsize;
 	concat->mtd.oobavail = subdev[0]->oobavail;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1047ff0..b910a37 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -384,6 +384,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.flags = master->flags & ~part->mask_flags;
 	slave->mtd.size = part->size;
 	slave->mtd.writesize = master->writesize;
+	slave->mtd.writebufsize = master->writebufsize;
 	slave->mtd.oobsize = master->oobsize;
 	slave->mtd.oobavail = master->oobavail;
 	slave->mtd.subpage_sft = master->subpage_sft;
-- 
1.7.1
