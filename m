Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddy0y-0006tU-W2
 for linux-mtd@lists.infradead.org; Sat, 05 Aug 2017 12:17:10 +0000
Received: by mail-wm0-x243.google.com with SMTP id y206so8442799wmd.5
 for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2017 05:16:48 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: boris.brezillon@free-electrons.com,
	linux-mtd@lists.infradead.org
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] mtd: nand: hynix: add support for 20nm NAND chips
Date: Sat,  5 Aug 2017 14:16:24 +0200
Message-Id: <20170805121624.25553-1-martin.blumenstingl@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to the datasheet of the H27UCG8T2BTR the NAND Technology field
(6th byte of the "Device Identifier Description", bits 0-2) the
following values are possible:
- 0x0 = 48nm
- 0x1 = 41nm
- 0x2 = 32nm
- 0x3 = 26nm
- 0x4 = 20nm
- (all others are reserved)

Fix this by extending the mask for this field to allow detecting value
0x4 (20nm) as valid NAND technology.
Without this the detection of the ECC requirements fails, because the
code assumes that the device is a 48nm device (0x4 & 0x3 = 0x0) and
aborts with "Invalid ECC requirements" because it cannot map the "ECC
Level". Extending the mask makes the ECC requirement detection code
recognize this chip as <= 26nm and sets up the ECC step size and ECC
strength correctly.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/nand_hynix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index b12dc7325378..bd9a6e343848 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -477,7 +477,7 @@ static void hynix_nand_extract_ecc_requirements(struct nand_chip *chip,
 		 * The ECC requirements field meaning depends on the
 		 * NAND technology.
 		 */
-		u8 nand_tech = chip->id.data[5] & 0x3;
+		u8 nand_tech = chip->id.data[5] & 0x7;
 
 		if (nand_tech < 3) {
 			/* > 26nm, reference: H27UBG8T2A datasheet */
@@ -533,7 +533,7 @@ static void hynix_nand_extract_scrambling_requirements(struct nand_chip *chip,
 		if (nand_tech > 0)
 			chip->options |= NAND_NEED_SCRAMBLING;
 	} else {
-		nand_tech = chip->id.data[5] & 0x3;
+		nand_tech = chip->id.data[5] & 0x7;
 
 		/* < 32nm */
 		if (nand_tech > 2)
-- 
2.13.4
