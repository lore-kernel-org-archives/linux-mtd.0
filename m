Received: from dscas1.ad.uiuc.edu ([128.174.68.119])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWSpE-00086v-P2
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 10:25:33 +0000
From: Stoyan Gaydarov <sgayda2@uiuc.edu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] [mtd] fixed faulty check
Date: Thu, 30 Jul 2009 05:25:06 -0500
Message-ID: <1248949506-20827-1-git-send-email-sgayda2@uiuc.edu>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stoyan Gaydarov <sgayda2@uiuc.edu>, David.Woodhouse@intel.com,
	bigeasy@linutronix.de, kay.sievers@vrfy.org,
	linux-mtd@lists.infradead.org, sr@denx.de, gregkh@suse.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patche fixes a spelling error that has resulted from copy and pasting. The location of the error was found using a semantic patch but the semantic patch was not trying to find these errors. After looking things over it seemed logical that this change was needed. Please review it and then include the patch if it is in fact the correct change.

Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
---
 drivers/mtd/maps/physmap_of.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 39d357b..2cc0b0d 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -215,7 +215,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 		goto err_out;
 
 	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
-	if (!info)
+	if (!mtd_list)
 		goto err_out;
 
 	dev_set_drvdata(&dev->dev, info);
-- 
1.6.3.3
