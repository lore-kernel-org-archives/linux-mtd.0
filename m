Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yalth-00074z-LB
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 14:03:09 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: nand: Wire up on-die ECC support
Date: Wed, 25 Mar 2015 15:02:31 +0100
Message-Id: <1427292151-3835-4-git-send-email-richard@nod.at>
In-Reply-To: <1427292151-3835-1-git-send-email-richard@nod.at>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Finally add the Kconfig stuff for on-die ECC support
such that the feature can be enabled.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/Kconfig  | 12 ++++++++++++
 drivers/mtd/nand/Makefile |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5897d8d..215f74e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -37,6 +37,18 @@ config MTD_NAND_ECC_BCH
 	  ECC codes. They are used with NAND devices requiring more than 1 bit
 	  of error correction.
 
+config MTD_NAND_ECC_ON_DIE
+	bool "Support Micron On-Die ECC"
+	default n
+	help
+	  Some Micron chips have an internal (on-die) ECC-controller that is
+	  useful when the host-platform doesn't have hardware-support for
+	  multi-bit ECC and software ECC consumes too much CPU cycles.
+	  This enables support for this ECC mode.
+	  Please consult your NAND chip's datasheet if you want to use
+	  on-die ECC, it is likely that you'll have to adjust some timing
+	  settings in your board setup.
+
 config MTD_SM_COMMON
 	tristate
 	default n
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 582bbd05..44e952cc 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_MTD_NAND)			+= nand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
 obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
+obj-$(CONFIG_MTD_NAND_ECC_ON_DIE)	+= nand_ondie.o
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
-- 
2.3.4
