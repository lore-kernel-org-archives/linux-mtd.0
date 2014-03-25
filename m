Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbn-0002BP-Mc
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:33 +0000
Received: by mail-we0-f177.google.com with SMTP id u57so76600wes.22
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 21/47] mtd: nand: stm_nand_bch: provide shared BCH operations
Date: Tue, 25 Mar 2014 08:19:38 +0000
Message-Id: <1395735604-26706-22-git-send-email-lee.jones@linaro.org>
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

Including one for programming the BCH sequence, taking care not to
program two registers marked 'reserved' in the NANDi specification.
Failing to take this precaution results in an imprecise data exception
on ARM platforms. We also add an operation which waits on a completion
timeout (released by the IRQ handler) and finally another which
utilises the two aforementioned operations in order to erase a single
block.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index fafde22..2042cdd 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -264,6 +264,61 @@ static void nandi_disable_interrupts(struct nandi_controller *nandi,
 }
 
 /*
+ * BCH Operations
+ */
+static inline void bch_load_prog_cpu(struct nandi_controller *nandi,
+				     struct bch_prog *prog)
+{
+	uint32_t *src = (uint32_t *)prog;
+	uint32_t *dst = (uint32_t *)(nandi->base + NANDBCH_ADDRESS_REG_1);
+	int i;
+
+	for (i = 0; i < 16; i++) {
+		/* Skip registers marked as "reserved" */
+		if (i != 11 && i != 14)
+			writel(*src, dst);
+		dst++;
+		src++;
+	}
+}
+
+static void bch_wait_seq(struct nandi_controller *nandi)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&nandi->seq_completed, HZ/2);
+	if (!ret)
+		dev_err(nandi->dev, "BCH Seq timeout\n");
+}
+
+static uint8_t bch_erase_block(struct nandi_controller *nandi,
+			       loff_t offs)
+{
+	struct bch_prog *prog = &bch_prog_erase_block;
+	uint8_t status;
+
+	dev_dbg(nandi->dev, "%s: offs = 0x%012llx\n", __func__, offs);
+
+	prog->extra = (uint32_t)(offs >> nandi->page_shift);
+
+	emiss_nandi_select(STM_NANDI_BCH);
+
+	nandi_enable_interrupts(nandi, NANDBCH_INT_SEQNODESOVER);
+	reinit_completion(&nandi->seq_completed);
+
+	bch_load_prog_cpu(nandi, prog);
+
+	bch_wait_seq(nandi);
+
+	nandi_disable_interrupts(nandi, NANDBCH_INT_SEQNODESOVER);
+
+	status = (uint8_t)(readl(nandi->base +
+				 NANDBCH_CHECK_STATUS_REG_A) & 0xff);
+
+	return status;
+}
+
+/*
  * Initialisation
  */
 static int bch_check_compatibility(struct nandi_controller *nandi,
-- 
1.8.3.2
