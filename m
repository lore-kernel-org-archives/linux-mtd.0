Received: from 16.mo3.mail-out.ovh.net ([188.165.56.217]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0u2w-0006Wy-Dk
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 14:23:50 +0000
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 726E7101C144
 for <linux-mtd@lists.infradead.org>; Wed,  8 Jan 2014 15:23:28 +0100 (CET)
From: Boris BREZILLON <b.brezillon@overkiz.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>
Subject: [RFC PATCH 1/9] mtd: nand: retrieve ECC requirements from Hynix READ
 ID byte 4
Date: Wed,  8 Jan 2014 15:21:56 +0100
Message-Id: <1389190924-26226-2-git-send-email-b.brezillon@overkiz.com>
In-Reply-To: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Hynix nand flashes store their ECC requirements in byte 4 of its id
(returned on READ ID command).

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 drivers/mtd/nand/nand_base.c |   37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd39f7b..15069ec 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3202,6 +3202,43 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		else
 			mtd->erasesize = (64 * 1024) << tmp;
 		*busw = 0;
+
+		/* Retrieve ECC infos */
+		switch ((id_data[4] >> 4) & 0x7) {
+		case 1:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 1;
+			break;
+		case 2:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 2;
+			break;
+		case 3:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 4;
+			break;
+		case 4:
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 8;
+			break;
+		case 5:
+			chip->ecc_step_ds = 1024;
+			chip->ecc_strength_ds = 24;
+			break;
+		case 6:
+			chip->ecc_step_ds = 1024;
+			chip->ecc_strength_ds = 32;
+			break;
+		case 7:
+			chip->ecc_step_ds = 1024;
+			chip->ecc_strength_ds = 40;
+			break;
+		case 0:
+		default:
+			chip->ecc_step_ds = 0;
+			chip->ecc_strength_ds = 0;
+			break;
+		}
 	} else {
 		/* Calc pagesize */
 		mtd->writesize = 1024 << (extid & 0x03);
-- 
1.7.9.5
