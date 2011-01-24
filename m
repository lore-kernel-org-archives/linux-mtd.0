Received: from mail.de.keymile.com ([195.8.104.1])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PhPY4-0000CK-K0
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2011 16:45:49 +0000
From: Holger Brunck <holger.brunck@keymile.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: adapt writebufsize calculation for concat
Date: Mon, 24 Jan 2011 17:45:42 +0100
Message-Id: <1295887542-22785-1-git-send-email-holger.brunck@keymile.com>
Cc: Holger Brunck <holger.brunck@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If different chips with different writebufsize are concatenated,
the writebufsize from the concat device has to be taken from
the device with the largest writebuffer. This writebufsize
is used later on in the UBI layer for the min I/O size.

Signed-off-by: Holger Brunck <holger.brunck@keymile.com>
---
 drivers/mtd/mtdconcat.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index b84dadb..951883d 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -733,6 +733,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	struct mtd_concat *concat;
 	uint32_t max_erasesize, curr_erasesize;
 	int num_erase_region;
+	int max_writebufsize = 0;
 
 	printk(KERN_NOTICE "Concatenating MTD devices:\n");
 	for (i = 0; i < num_devs; i++)
@@ -759,7 +760,12 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.size = subdev[0]->size;
 	concat->mtd.erasesize = subdev[0]->erasesize;
 	concat->mtd.writesize = subdev[0]->writesize;
-	concat->mtd.writebufsize = subdev[0]->writebufsize;
+
+	for (i = 0; i < num_devs; i++)
+		if (max_writebufsize < subdev[i]->writebufsize)
+			max_writebufsize = subdev[i]->writebufsize;
+	concat->mtd.writebufsize = max_writebufsize;
+
 	concat->mtd.subpage_sft = subdev[0]->subpage_sft;
 	concat->mtd.oobsize = subdev[0]->oobsize;
 	concat->mtd.oobavail = subdev[0]->oobavail;
-- 
1.7.0.5
