Received: from mail-wg0-f51.google.com ([74.125.82.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4nR3-0005mR-D5
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 09:45:38 +0000
Received: by wgbhy7 with SMTP id hy7so8067697wgb.2
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 02:45:17 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Linux MTD Mailinglist <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Baruch Siach <baruch@tkos.co.il>, Rafal Milecki <zajec5@gmail.com>
Subject: [RFC Patch  2/3] mtd: nand: Support non-ONFI timing modes
Date: Tue, 16 Jun 2015 11:45:03 +0200
Message-Id: <1434447904-31748-3-git-send-email-r.spliet@ultimaker.com>
In-Reply-To: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
References: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Roy Spliet <r.spliet@ultimaker.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For chips whose timings are exceptionally aberrant to the point that it
impacts performance, we are going to need some mechanism to steer away
from ONFI modes. This lays the foundation for defining custom modes
---
 drivers/mtd/nand/nand_base.c | 9 +++++++--
 include/linux/mtd/nand.h     | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f561c68..8e636df 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3624,8 +3624,13 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
 		chip->ecc_step_ds = NAND_ECC_STEP(type);
 
-		mode = type->onfi_timing_mode_default;
-		chip->sdr_timings = onfi_async_timing_mode_to_sdr_timings(mode);
+		if (type->custom_sdr_timing) {
+			chip->sdr_timings = type->custom_sdr_timing;
+		} else {
+			mode = type->onfi_timing_mode_default;
+			chip->sdr_timings =
+				onfi_async_timing_mode_to_sdr_timings(mode);
+		}
 
 		*busw = type->options & NAND_BUSWIDTH_16;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 2eb92a3..7d9e599 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -863,6 +863,7 @@ struct nand_flash_dev {
 		uint16_t step_ds;
 	} ecc;
 	int onfi_timing_mode_default;
+	const struct nand_sdr_timings *custom_sdr_timing;
 };
 
 /**
-- 
2.4.3


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com
