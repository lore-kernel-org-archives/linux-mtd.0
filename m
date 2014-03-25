Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMc5-0002AF-1D
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:37 +0000
Received: by mail-we0-f171.google.com with SMTP id t61so79457wes.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 29/47] mtd: nand: stm_nand_bch: add Hamming-FLEX operations
Date: Tue, 25 Mar 2014 08:19:46 +0000
Message-Id: <1395735604-26706-30-git-send-email-lee.jones@linaro.org>
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

Including; a check for Ready/NotBusy (RBn) (i.e. wait for current
operation to finish and a method to issue Flex commands to the
controller.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index a4f3e46..baecc40 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -502,6 +502,42 @@ static uint8_t bch_write_page(struct nandi_controller *nandi,
 }
 
 /*
+ * Hamming-FLEX operations
+ */
+static int flex_wait_rbn(struct nandi_controller *nandi)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&nandi->rbn_completed, HZ/2);
+	if (!ret)
+		dev_err(nandi->dev, "FLEX RBn timeout\n");
+
+	return ret;
+}
+
+static void flex_cmd(struct nandi_controller *nandi, uint8_t cmd)
+{
+	uint32_t val;
+
+	val = (FLEX_CMD_CSN | FLEX_CMD_BEATS_1 | cmd);
+	writel(val, nandi->base + NANDHAM_FLEX_CMD);
+}
+
+static void flex_addr(struct nandi_controller *nandi,
+		      uint32_t addr, int cycles)
+{
+	addr &= 0x00ffffff;
+
+	BUG_ON(cycles < 1);
+	BUG_ON(cycles > 3);
+
+	addr |= (FLEX_ADDR_CSN | FLEX_ADDR_ADD8_VALID);
+	addr |= (cycles & 0x3) << 28;
+
+	writel(addr, nandi->base + NANDHAM_FLEX_ADD);
+}
+
+/*
  * Bad Block Tables/Bad Block Markers
  */
 #define BBT_MARK_BAD_FACTORY	0x0
-- 
1.8.3.2
