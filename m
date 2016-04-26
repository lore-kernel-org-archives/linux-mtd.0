Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avAMB-0002vh-R4
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 21:17:20 +0000
Received: by mail-lf0-x232.google.com with SMTP id y84so30275933lfc.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2016 14:16:59 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V2] mtd: nand: fix NULL pointer dereference in
 of_get_nand_ecc_algo
Date: Tue, 26 Apr 2016 23:16:47 +0200
Message-Id: <1461705408-12858-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1461695776-29740-1-git-send-email-zajec5@gmail.com>
References: <1461695776-29740-1-git-send-email-zajec5@gmail.com>
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

Our array nand_ecc_algos doesn't specify mappings for all available
enum nand_ecc_algo values. The one missing there is NAND_ECC_UNKNOWN
as this value is reserved for algorithm not being specified at all.
It means we have to be careful when iterating this array and avoid
NULL values.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V2: Iterate from NAND_ECC_HAMMING instead of checking for NULL as preferred by
Boris.
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a5417a0..2e6ba44 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4015,7 +4015,7 @@ static int of_get_nand_ecc_algo(struct device_node *np)
 
 	err = of_property_read_string(np, "nand-ecc-algo", &pm);
 	if (!err) {
-		for (i = 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
+		for (i = NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
 			if (!strcasecmp(pm, nand_ecc_algos[i]))
 				return i;
 		return -ENODEV;
-- 
1.8.4.5
