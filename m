Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnks-0002r1-Ap
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:14 +0000
Received: by mail-wi0-f169.google.com with SMTP id hi5so449362wib.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 22/47] mtd: nand: stm_nand_bch: provide shared BCH operations
Date: Thu,  1 May 2014 10:56:29 +0100
Message-Id: <1398938214-17847-23-git-send-email-lee.jones@linaro.org>
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

Including one for programming the BCH sequence, taking care not to
program two registers marked 'reserved' in the NANDi specification.
Failing to take this precaution results in an imprecise data exception
on ARM platforms. We also add an operation which waits on a completion
timeout (released by the IRQ handler).

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 5be7889..40767b8 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -431,6 +431,34 @@ static void nandi_disable_interrupts(struct nandi_controller *nandi,
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
+/*
  * Initialisation
  */
 static int bch_check_compatibility(struct nandi_controller *nandi,
-- 
1.8.3.2
