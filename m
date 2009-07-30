Received: from dscas1.ad.uiuc.edu ([128.174.68.119])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWWvQ-0008J2-4a
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 14:48:12 +0000
From: Stoyan Gaydarov <sgayda2@uiuc.edu>
To: bigeasy@linutronix.de
Subject: [PATCH] [mtd] fixed faulty check
Date: Thu, 30 Jul 2009 09:47:23 -0500
Message-ID: <1248965243-861-1-git-send-email-sgayda2@uiuc.edu>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Stoyan Gaydarov <sgayda2@uiuc.edu>,
	vimal.newwork@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes a spelling error that has resulted from copy and pasting. The location of the error was found using a semantic patch but the semantic patch was not trying to find these errors. After looking things over it seemed logical that this change was needed.

The patch also makes sure mtd_list is not being freed if it has not been allocated

Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
---
 drivers/mtd/maps/physmap_of.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 39d357b..96a1c50 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -215,8 +215,8 @@ static int __devinit of_flash_probe(struct of_device *dev,
 		goto err_out;
 
 	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
-	if (!info)
-		goto err_out;
+	if (!mtd_list)
+		goto err_out_no_free;
 
 	dev_set_drvdata(&dev->dev, info);
 
@@ -338,6 +338,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 
 err_out:
 	kfree(mtd_list);
+err_out_no_free:
 	of_flash_remove(dev);
 
 	return err;
-- 
1.6.3.3
