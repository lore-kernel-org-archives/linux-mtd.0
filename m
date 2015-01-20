Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDVFc-0004Hx-1X
 for linux-mtd@lists.infradead.org; Tue, 20 Jan 2015 09:37:33 +0000
From: Niklas Cassel <niklas.cassel@axis.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: update ops->oobretlen in concat_write_oob
Date: Tue, 20 Jan 2015 10:35:32 +0100
Message-ID: <1421746532-25547-1-git-send-email-niklass@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Niklas Cassel <niklass@axis.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In concat_read_oob both retlen and oobretlen is updated.
concat_write_oob previously only updated retlen.

Signed-off-by: Niklas Cassel <niklass@axis.com>
---
 drivers/mtd/mtdconcat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index b900056..d85c946 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -311,7 +311,8 @@ concat_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops)
 			devops.len = subdev->size - to;
 
 		err = mtd_write_oob(subdev, to, &devops);
-		ops->retlen += devops.oobretlen;
+		ops->retlen += devops.retlen;
+		ops->oobretlen += devops.oobretlen;
 		if (err)
 			return err;
 
-- 
2.1.4
