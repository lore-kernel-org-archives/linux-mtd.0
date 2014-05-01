Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnkM-0002Zn-WD
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:57:43 +0000
Received: by mail-wi0-f173.google.com with SMTP id bs8so388486wib.12
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/47] mtd: nand: stm_nand_bch: change between BCH and Hamming
 modes
Date: Thu,  1 May 2014 10:56:14 +0100
Message-Id: <1398938214-17847-8-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The EMISS is a device which, amongst other things, controls various
flash memory modes. We make use of it here merely to flip the
HAMMING_NOT_BCH bit dependant on whether we wish to operate in Hamming
or BCH modes. The STM BCH driver makes good use of the helper introduced
here.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mtd/stm_nand.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/linux/mtd/stm_nand.h b/include/linux/mtd/stm_nand.h
index 9210d5c..da2006c 100644
--- a/include/linux/mtd/stm_nand.h
+++ b/include/linux/mtd/stm_nand.h
@@ -15,6 +15,8 @@
 #ifndef __LINUX_STM_NAND_H
 #define __LINUX_STM_NAND_H
 
+#include <linux/io.h>
+
 struct stm_plat_nand_bch_data {
 	struct stm_nand_bank_data *bank;
 	enum stm_nand_bch_ecc_config bch_ecc_cfg;
@@ -30,4 +32,44 @@ struct stm_plat_nand_bch_data {
 	bool flashss;
 };
 
+#define EMISS_BASE				0xfef01000
+#define EMISS_CONFIG				0x0000
+#define EMISS_CONFIG_HAMMING_NOT_BCH		(0x1 << 6)
+
+enum nandi_controllers {
+	STM_NANDI_UNCONFIGURED,
+	STM_NANDI_HAMMING,
+	STM_NANDI_BCH
+};
+
+static inline void emiss_nandi_select(enum nandi_controllers controller)
+{
+	unsigned v;
+	void __iomem *emiss_config_base;
+
+	emiss_config_base = ioremap(EMISS_BASE, 4);
+	if (!emiss_config_base) {
+		pr_err("%s: failed to ioremap EMISS\n", __func__);
+		return;
+	}
+
+	v = readl(emiss_config_base + EMISS_CONFIG);
+
+	if (controller == STM_NANDI_HAMMING) {
+		if (v & EMISS_CONFIG_HAMMING_NOT_BCH)
+			goto out;
+		v |= EMISS_CONFIG_HAMMING_NOT_BCH;
+	} else {
+		if (!(v & EMISS_CONFIG_HAMMING_NOT_BCH))
+			goto out;
+		v &= ~EMISS_CONFIG_HAMMING_NOT_BCH;
+	}
+
+	writel(v, emiss_config_base + EMISS_CONFIG);
+	readl(emiss_config_base + EMISS_CONFIG);
+
+out:
+	iounmap(emiss_config_base);
+}
+
 #endif /* __LINUX_STM_NAND_H */
-- 
1.8.3.2
