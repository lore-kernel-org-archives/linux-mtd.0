Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9Fdx-0003VN-Ae
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 13:27:45 +0000
Received: by ghbf20 with SMTP id f20so73097ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 06:27:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: [PATCH] mtd: gpmi-nand: Improve logging style
Date: Wed,  5 Sep 2012 10:27:33 -0300
Message-Id: <1346851653-28117-1-git-send-email-festevam@gmail.com>
Cc: marex@denx.de, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Improve logging style by prefixing the pr_ messages with "gpmi_nand".

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index c46be6c..9493507 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -18,6 +18,9 @@
  * with this program; if not, write to the Free Software Foundation, Inc.,
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
@@ -114,7 +117,7 @@ int common_nfc_set_geometry(struct gpmi_nand_data *this)
 	/* We use the same ECC strength for all chunks. */
 	geo->ecc_strength = get_ecc_strength(this);
 	if (!geo->ecc_strength) {
-		pr_err("We get a wrong ECC strength.\n");
+		pr_err("wrong ECC strength.\n");
 		return -EINVAL;
 	}
 
@@ -1685,9 +1688,9 @@ static int __init gpmi_nand_init(void)
 
 	err = platform_driver_register(&gpmi_nand_driver);
 	if (err == 0)
-		printk(KERN_INFO "GPMI NAND driver registered. (IMX)\n");
+		pr_info("driver registered.\n");
 	else
-		pr_err("i.MX GPMI NAND driver registration failed\n");
+		pr_err("driver registration failed.\n");
 	return err;
 }
 
-- 
1.7.9.5
