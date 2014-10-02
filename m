Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZfJL-0001SM-Od
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 12:16:44 +0000
Received: by mail-wi0-f175.google.com with SMTP id d1so3726209wiv.14
 for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2014 05:16:21 -0700 (PDT)
From: Rostislav Lisovy <lisovy@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: nand: omap: Do not use global variables
Date: Thu,  2 Oct 2014 14:16:12 +0200
Message-Id: <1412252173-20454-1-git-send-email-lisovy@merica.cz>
Cc: michal.vokac@comap.cz, lisovy@gmail.com,
 Rostislav Lisovy <lisovy@merica.cz>, sojkam1@fel.cvut.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since the commit 97a288ba2cfa ("ARM: omap2+: gpmc-nand: Use
dynamic platform_device_alloc()") gpmc-nand driver supports
multiple NAND flash devices connected to the single controller.
Remove global variable to make the code thread-safe.

Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
---
Changes since v1:
* Do not dynamically allocate the 'struct nand_ecclayout' but rather
  include it in the 'struct omap_nand_info' (Roger Quadros)


 drivers/mtd/nand/omap2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 3b357e9..f0dcdb6 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -144,9 +144,6 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 	0xac, 0x6b, 0xff, 0x99, 0x7b};
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
-/* oob info generated runtime depending on ecc algorithm and layout selected */
-static struct nand_ecclayout omap_oobinfo;
-
 struct omap_nand_info {
 	struct nand_hw_control		controller;
 	struct omap_nand_platform_data	*pdata;
@@ -168,6 +165,8 @@ struct omap_nand_info {
 	u_char				*buf;
 	int					buf_len;
 	struct gpmc_nand_regs		reg;
+	/* generated on runtime depending on ecc algorithm and layout selected */
+	struct nand_ecclayout		oobinfo;
 	/* fields specific for BCHx_HW ECC scheme */
 	struct device			*elm_dev;
 	struct device_node		*of_node;
@@ -1840,7 +1839,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	}
 
 	/* populate MTD interface based on ECC scheme */
-	ecclayout		= &omap_oobinfo;
+	ecclayout		= &info->oobinfo;
 	switch (info->ecc_opt) {
 	case OMAP_ECC_HAM1_CODE_SW:
 		nand_chip->ecc.mode = NAND_ECC_SOFT;
-- 
1.9.1
