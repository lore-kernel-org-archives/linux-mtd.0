Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzWzT-00087T-Df
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 21:11:26 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH 1/6] mtd: r852: Fix device_create_file() usage
Date: Mon,  1 Jun 2015 23:10:49 +0200
Message-Id: <1433193054-26865-2-git-send-email-richard@nod.at>
In-Reply-To: <1433193054-26865-1-git-send-email-richard@nod.at>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, maximlevitsky@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

device_create_file() can fail, therefore we have to
handle this case and abort.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/r852.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index baea83f..77e96d2 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -653,11 +653,15 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (sm_register_device(dev->mtd, dev->sm))
 		goto error2;
 
-	if (device_create_file(&dev->mtd->dev, &dev_attr_media_type))
+	if (device_create_file(&dev->mtd->dev, &dev_attr_media_type)) {
 		message("can't create media type sysfs attribute");
+		goto error3;
+	}
 
 	dev->card_registred = 1;
 	return 0;
+error3:
+	nand_release(dev->mtd);
 error2:
 	kfree(dev->mtd);
 error1:
-- 
1.8.4.5
