Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar9qb-000575-32
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 19:56:09 +0000
Received: by mail-wm0-x22c.google.com with SMTP id u206so46597529wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 12:55:53 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 11/12] of: mtd: drop support for NAND_ECC_SOFT_BCH as
 "soft_bch" mapping
Date: Fri, 15 Apr 2016 21:54:11 +0200
Message-Id: <1460750052-16285-12-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
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

There isn't any difference between handling NAND_ECC_SOFT and
NAND_ECC_SOFT_BCH now. What matters is the new field called "algo".
Please note we're keeping backward DT compatibility. We are still
treating "soft_bch" value as the one setting Hamming algorithm, it's
just handled in of_get_nand_ecc_algo now.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/of/of_mtd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index 15d056e..a70a38c 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -22,7 +22,6 @@ static const char *nand_ecc_modes[] = {
 	[NAND_ECC_HW]		= "hw",
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
-	[NAND_ECC_SOFT_BCH]	= "soft_bch",
 };
 
 /**
@@ -45,6 +44,14 @@ int of_get_nand_ecc_mode(struct device_node *np)
 		if (!strcasecmp(pm, nand_ecc_modes[i]))
 			return i;
 
+	/*
+	 * For backward compatibility we support few obsoleted values that don't
+	 * have their mappings into nand_ecc_modes_t anymore (they were merged
+	 * with other enums).
+	 */
+	if (!strcasecmp(pm, "soft_bch"))
+		return NAND_ECC_SOFT;
+
 	return -ENODEV;
 }
 EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
-- 
1.8.4.5
