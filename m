Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RMx-0007Zw-1i
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:14 +0000
Received: by mail-wr0-x243.google.com with SMTP id u11-v6so20624234wri.12
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:02 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Arnout Vandecappelle <arnout@mind.be>
Subject: [PATCH 05/18] mtd: nand: gpmi: return valid value from
 bch_set_geometry()
Date: Fri, 20 Apr 2018 10:19:33 +0200
Message-Id: <20180420081946.16088-6-sam.lefebvre@essensium.com>
In-Reply-To: <20180420081946.16088-1-sam.lefebvre@essensium.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

The caller of bch_set_geometry() expects the return value to
be an error code, so !0 is not valid. return the error from the
just called function instead.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: rebased
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 39834bedf460..83697b8df871 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -258,8 +258,9 @@ int bch_set_geometry(struct gpmi_nand_data *this)
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
2.14.1
