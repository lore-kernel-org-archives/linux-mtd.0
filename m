From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] UBI: Fix copy/paste error in function documentation
Date: Fri, 24 Nov 2017 12:17:14 +0100
Message-Id: <20171124111714.5904-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function documentation of leb_write_trylock is copied from
leb_write_lock. Replace the function name with the correct one.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/ubi/eba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 388e46be6ad9..250e30fac61b 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -384,7 +384,7 @@ static int leb_write_lock(struct ubi_device *ubi, int vol_id, int lnum)
 }
 
 /**
- * leb_write_lock - lock logical eraseblock for writing.
+ * leb_write_trylock - try to lock logical eraseblock for writing.
  * @ubi: UBI device description object
  * @vol_id: volume ID
  * @lnum: logical eraseblock number
-- 
2.11.0
