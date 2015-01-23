Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YEZdi-0006My-FO
 for linux-mtd@lists.infradead.org; Fri, 23 Jan 2015 08:30:51 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so6256829pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jan 2015 00:30:29 -0800 (PST)
Date: Fri, 23 Jan 2015 00:30:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 2/2 v3 RESEND] mtd: fsl_upm: Support NAND ECC DTS
 properties
Message-ID: <20150123083026.GE3268@brian-ubuntu>
References: <1136776275.110939.1421109367310.JavaMail.zimbra@xes-inc.com>
 <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 05:41:49PM -0600, Aaron Sierra wrote:
> From: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> 
> Support the generic nand-ecc-mode, nand-ecc-strength, and
> nand-ecc-step-size device-tree properties with the Freescale UPM NAND
> driver.
> 
> This patch preserves the default software ECC mode while adding the
> ability to use BCH ECC for larger NAND devices.
> 
> Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
> v2:
>     * Now using ECC mode and strength helpers from of_mtd.h
>     * ECC mode and strength checking is more robust
> v3 (resent due to [PATCH 1/2] v2 update):
>     * Require nand-ecc-step-size for soft_bch.
>     * Simplify mode/strength/step parameter checking.
> 
>  .../devicetree/bindings/mtd/fsl-upm-nand.txt       | 32 +++++++++++
>  drivers/mtd/nand/Kconfig                           |  1 +
>  drivers/mtd/nand/fsl_upm.c                         | 66 ++++++++++++++++++++--

I was thinking about this a bit more, and it seems like we could really
just factor this all into the core nand_base code with something like
the following patch. It could possibly use some smarter logic to rule
out certain combinations (but some of those are already caught in
nand_scan_tail() anyway). What do you think?

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 72755d7ec25d..fc4834946233 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -181,6 +181,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	flash_np = of_get_next_child(upm_np, NULL);
 	if (!flash_np)
 		return -ENODEV;
+	fun->chip.dn = flash_np;
 
 	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
 				  flash_np->name);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3f24b587304f..b701c3f23da1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -48,6 +48,7 @@
 #include <linux/leds.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_mtd.h>
 
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
@@ -3780,6 +3781,33 @@ ident_done:
 	return type;
 }
 
+static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip,
+			struct device_node *dn)
+{
+	int ecc_mode, ecc_strength, ecc_step;
+
+	if (of_get_nand_bus_width(dn) == 16)
+		chip->options |= NAND_BUSWIDTH_16;
+
+	if (of_get_nand_on_flash_bbt(dn))
+		chip->bbt_options |= NAND_BBT_USE_FLASH;
+
+	ecc_mode = of_get_nand_ecc_mode(dn);
+	ecc_strength = of_get_nand_ecc_strength(dn);
+	ecc_step = of_get_nand_ecc_step_size(dn);
+
+	if (ecc_mode >= 0)
+		chip->ecc.mode = ecc_mode;
+
+	if (ecc_strength >= 0)
+		chip->ecc.strength = ecc_strength;
+
+	if (ecc_step > 0)
+		chip->ecc.size = ecc_step;
+
+	return 0;
+}
+
 /**
  * nand_scan_ident - [NAND Interface] Scan for the NAND device
  * @mtd: MTD device structure
@@ -3797,6 +3825,13 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	int i, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
+	int ret;
+
+	if (chip->dn) {
+		ret = nand_dt_init(mtd, chip, chip->dn);
+		if (ret)
+			return ret;
+	}
 
 	/* Set the default functions */
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7eb2b68..e0f40e12a2c8 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -26,6 +26,8 @@
 
 struct mtd_info;
 struct nand_flash_dev;
+struct device_node;
+
 /* Scan and identify a NAND device */
 extern int nand_scan(struct mtd_info *mtd, int max_chips);
 /*
@@ -542,6 +544,7 @@ struct nand_buffers {
  *			flash device
  * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
  *			flash device.
+ * @dn:			[BOARDSPECIFIC] device node describing this instance
  * @read_byte:		[REPLACEABLE] read one byte from the chip
  * @read_word:		[REPLACEABLE] read one word from the chip
  * @write_byte:		[REPLACEABLE] write a single byte to the chip on the
@@ -644,6 +647,8 @@ struct nand_chip {
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
 
+	struct device_node *dn;
+
 	uint8_t (*read_byte)(struct mtd_info *mtd);
 	u16 (*read_word)(struct mtd_info *mtd);
 	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
