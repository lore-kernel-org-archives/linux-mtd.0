Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnkv-0002s8-GJ
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:17 +0000
Received: by mail-wi0-f177.google.com with SMTP id cc10so403670wib.10
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 23/47] mtd: nand: stm_nand_bch: erase one block (BCH)
Date: Thu,  1 May 2014 10:56:30 +0100
Message-Id: <1398938214-17847-24-git-send-email-lee.jones@linaro.org>
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

Adding a function which simply erases a single flash block.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 40767b8..6d7ab79 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -458,6 +458,33 @@ static void bch_wait_seq(struct nandi_controller *nandi)
 		dev_err(nandi->dev, "BCH Seq timeout\n");
 }
 
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
 /*
  * Initialisation
  */
-- 
1.8.3.2
