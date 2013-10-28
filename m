From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-omap@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/3] omap2: gpmc: Move initialization outside the gpmc_t
 condition
Date: Sun, 27 Oct 2013 21:51:46 -0300
Message-Id: <1382921508-5104-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382921508-5104-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1382921508-5104-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Javier Martinez Canillas <martinez.javier@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Jon Hunter <jgchunter@gmail.com>,
 Tony Lindgren <tony@atomide.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit moves a bunch of initialization previously enclosed
under a 'if (gpmc_t)' check, to be outside such condition.

These initializations are not related to gpmc_t (timings) in any way
so it's nonsense to enclose them under such check.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/mach-omap2/gpmc-nand.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
index 662c7fd..d66b856 100644
--- a/arch/arm/mach-omap2/gpmc-nand.c
+++ b/arch/arm/mach-omap2/gpmc-nand.c
@@ -98,32 +98,32 @@ int gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data,
 			dev_err(dev, "Unable to set gpmc timings: %d\n", err);
 			return err;
 		}
+	}
 
-		if (gpmc_nand_data->of_node) {
-			gpmc_read_settings_dt(gpmc_nand_data->of_node, &s);
-		} else {
-			/* Enable RD PIN Monitoring Reg */
-			if (gpmc_nand_data->dev_ready) {
-				s.wait_on_read = true;
-				s.wait_on_write = true;
-			}
+	if (gpmc_nand_data->of_node) {
+		gpmc_read_settings_dt(gpmc_nand_data->of_node, &s);
+	} else {
+		/* Enable RD PIN Monitoring Reg */
+		if (gpmc_nand_data->dev_ready) {
+			s.wait_on_read = true;
+			s.wait_on_write = true;
 		}
+	}
 
-		s.device_nand = true;
+	s.device_nand = true;
 
-		if (gpmc_nand_data->devsize == NAND_BUSWIDTH_16)
-			s.device_width = GPMC_DEVWIDTH_16BIT;
-		else
-			s.device_width = GPMC_DEVWIDTH_8BIT;
+	if (gpmc_nand_data->devsize == NAND_BUSWIDTH_16)
+		s.device_width = GPMC_DEVWIDTH_16BIT;
+	else
+		s.device_width = GPMC_DEVWIDTH_8BIT;
 
-		err = gpmc_cs_program_settings(gpmc_nand_data->cs, &s);
-		if (err < 0)
-			goto out_free_cs;
+	err = gpmc_cs_program_settings(gpmc_nand_data->cs, &s);
+	if (err < 0)
+		goto out_free_cs;
 
-		err = gpmc_configure(GPMC_CONFIG_WP, 0);
-		if (err < 0)
-			goto out_free_cs;
-	}
+	err = gpmc_configure(GPMC_CONFIG_WP, 0);
+	if (err < 0)
+		goto out_free_cs;
 
 	gpmc_update_nand_reg(&gpmc_nand_data->reg, gpmc_nand_data->cs);
 
-- 
1.8.1.5
