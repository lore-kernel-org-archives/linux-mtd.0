From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 07/10] mtd: nand: gpmi: return valid value from
 bch_set_geometry()
Date: Wed,  6 Dec 2017 10:19:22 +0100
Message-Id: <20171206091925.5810-8-s.hauer@pengutronix.de>
In-Reply-To: <20171206091925.5810-1-s.hauer@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The caller of bch_set_geometry() expects the return value to
be an error code, so !0 is not valid. return the error from the
just called function instead.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 83996f7783ab..ae3adbf4fe42 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -259,8 +259,9 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	unsigned int gf_len;
 	int ret;
 
-	if (common_nfc_set_geometry(this))
-		return !0;
+	ret = common_nfc_set_geometry(this);
+	if (ret)
+		return ret;
 
 	block_count   = bch_geo->ecc_chunk_count - 1;
 	block_size    = bch_geo->ecc_chunk_size;
-- 
2.11.0
