Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMcL-0002Db-14
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:53 +0000
Received: by mail-wg0-f41.google.com with SMTP id n12so81123wgh.24
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:30 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 38/47] mtd: nand: stm_nand_bch: check WP (FLEX)
Date: Tue, 25 Mar 2014 08:19:55 +0000
Message-Id: <1395735604-26706-39-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Return status of the Write Protect bit for the NAND device.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 3853e7a..18601e5 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -543,6 +543,22 @@ static void flex_addr(struct nandi_controller *nandi,
 	writel(addr, nandi->base + NANDHAM_FLEX_ADD);
 }
 
+/*
+ * Hamming-FLEX operations (optimised replacements for nand_base.c versions)
+ */
+static int flex_check_wp(struct nandi_controller *nandi)
+{
+	uint8_t status;
+
+	emiss_nandi_select(STM_NANDI_HAMMING);
+
+	flex_cmd(nandi, NAND_CMD_STATUS);
+
+	status = (uint8_t)(readl(nandi->base + NANDHAM_FLEX_DATA) & 0xff);
+
+	return status & NAND_STATUS_WP ? 0 : 1;
+}
+
 static int flex_read_raw(struct nandi_controller *nandi,
 			 uint32_t page_addr,
 			 uint32_t col_addr,
-- 
1.8.3.2
