From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <computersforpeace@gmail.com>
Subject: [RFC PATCH 08/16] mtd: nand: omap: Fix build warning
Date: Wed, 21 May 2014 14:20:56 +0300
Message-ID: <1400671264-10702-9-git-send-email-rogerq@ti.com>
In-Reply-To: <1400671264-10702-1-git-send-email-rogerq@ti.com>
References: <1400671264-10702-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, robertcnelson@gmail.com, jg1.han@samsung.com,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 pekon@ti.com, ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 linux-omap@vger.kernel.org, dwmw2@infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the following warning when CONFIG_MTD_NAND_OMAP_BCH is disabled.
warning: ‘erased_sector_bitflips’ defined but not used [-Wunused-function]

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/mtd/nand/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 1ff49b8..1b800bc 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1237,6 +1237,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 	return 0;
 }
 
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * erased_sector_bitflips - count bit flips
  * @data:	data sector buffer
@@ -1276,7 +1277,6 @@ static int erased_sector_bitflips(u_char *data, u_char *oob,
 	return flip_bits;
 }
 
-#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * omap_elm_correct_data - corrects page data area in case error reported
  * @mtd:	MTD device structure
-- 
1.8.3.2
