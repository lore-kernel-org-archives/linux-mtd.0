Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnVCT-0005mw-6O
 for linux-mtd@lists.infradead.org; Thu, 31 Aug 2017 19:32:27 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] UBI: Fix two typos in comments
Date: Thu, 31 Aug 2017 21:31:57 +0200
Message-Id: <20170831193157.22014-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/ubi/ubi-media.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 22ed3f627506..bfceae5a890e 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -229,7 +229,7 @@ struct ubi_ec_hdr {
  * copy. UBI also calculates data CRC when the data is moved and stores it at
  * the @data_crc field of the copy (P1). So when UBI needs to pick one physical
  * eraseblock of two (P or P1), the @copy_flag of the newer one (P1) is
- * examined. If it is cleared, the situation* is simple and the newer one is
+ * examined. If it is cleared, the situation is simple and the newer one is
  * picked. If it is set, the data CRC of the copy (P1) is examined. If the CRC
  * checksum is correct, this physical eraseblock is selected (P1). Otherwise
  * the older one (P) is selected.
@@ -389,7 +389,7 @@ struct ubi_vtbl_record {
 #define UBI_FM_POOL_MAGIC	0x67AF4D08
 #define UBI_FM_EBA_MAGIC	0xf0c040a8
 
-/* A fastmap supber block can be located between PEB 0 and
+/* A fastmap super block can be located between PEB 0 and
  * UBI_FM_MAX_START */
 #define UBI_FM_MAX_START	64
 
-- 
2.11.0
