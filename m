From: Wenlin Kang <wenlin.kang@windriver.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
Subject: [PATCH] mtd: blktrans: change blktrans_getgeo return value
Date: Thu, 21 May 2015 15:55:29 +0800
Message-ID: <1432194929-26453-1-git-send-email-wenlin.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Modify function blktrans_getgeo()'s return value to -EOPNOTSUPP when
dev->tr->getgeo == NULL.

We shouldn't make the return value to 0 when dev->tr->getgeo == NULL,
because the function blktrans_getgeo() has an output value "hd_geometry"
which is usually used by some application, if return 0, it will make some
application get the wrong information.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 drivers/mtd/mtd_blkdevs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 2b0c5287..2012216 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -273,7 +273,7 @@ static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	if (!dev->mtd)
 		goto unlock;
 
-	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : 0;
+	ret = dev->tr->getgeo ? dev->tr->getgeo(dev, geo) : -EOPNOTSUPP;
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
-- 
1.7.9.5
