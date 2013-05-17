Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UdBRG-0005wu-Nz
 for linux-mtd@lists.infradead.org; Fri, 17 May 2013 03:34:44 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v6 07/10] mtd: add ECC info for nand_flash_dev{}
Date: Fri, 17 May 2013 11:17:31 +0800
Message-ID: <1368760654-28754-8-git-send-email-b32955@freescale.com>
In-Reply-To: <1368760654-28754-1-git-send-email-b32955@freescale.com>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, vikram186@gmail.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an instance of an anonymous struct to store the ECC infor for full id
nand chips.
	@ecc.strength_ds: ECC correctability from the datasheet.
	@ecc.step_ds: ECC size required by the @ecc.strength_ds,

These two fields are all from the datasheet.

Also add the necessary macros to make the code simple and clean.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9574e0a..217cdfe 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -625,6 +625,11 @@ struct nand_chip {
 	{ .name = (nm), {{ .dev_id = (devid) }}, .chipsize = (chipsz), \
 	  .options = (opts) }
 
+#define NAND_ECC_INFO(_strength, _step)	\
+			{ .strength_ds = (_strength), .step_ds = (_step) }
+#define NAND_ECC_STRENGTH(type)		((type)->ecc.strength_ds)
+#define NAND_ECC_STEP(type)		((type)->ecc.step_ds)
+
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
  * @name: a human-readable name of the NAND chip
@@ -642,6 +647,12 @@ struct nand_chip {
  * @options: stores various chip bit options
  * @id_len: The valid length of the @id.
  * @oobsize: OOB size
+ * @ecc.strength_ds: The ECC correctability from the datasheet, same as the
+ *                   @ecc_strength_ds in nand_chip{}.
+ * @ecc.step_ds: The ECC step required by the @ecc.strength_ds, same as the
+ *               @ecc_step_ds in nand_chip{}, also from the datasheet.
+ *               For example, the "4bit ECC for each 512Byte" can be set with
+ *               NAND_ECC_INFO(4, 512).
  */
 struct nand_flash_dev {
 	char *name;
@@ -658,6 +669,10 @@ struct nand_flash_dev {
 	unsigned int options;
 	uint16_t id_len;
 	uint16_t oobsize;
+	struct {
+		uint16_t strength_ds;
+		uint16_t step_ds;
+	} ecc;
 };
 
 /**
-- 
1.7.1
