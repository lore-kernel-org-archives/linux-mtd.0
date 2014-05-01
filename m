Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlE-0003MG-Pp
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:37 +0000
Received: by mail-wi0-f171.google.com with SMTP id hm4so409035wib.10
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 33/47] mtd: nand: stm_nand_bch: read and write raw (FLEX)
Date: Thu,  1 May 2014 10:56:40 +0100
Message-Id: <1398938214-17847-34-git-send-email-lee.jones@linaro.org>
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

Once the correct READ/WRITE(SEQIN) commands and address locations have
been sent to the Controller, these calls are able to read/write the
requested information from the FLEX_DATA register.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index aba4bc5..32d2211 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -754,6 +754,41 @@ static void flex_addr(struct nandi_controller *nandi,
 	writel(addr, nandi->base + NANDHAM_FLEX_ADD);
 }
 
+static int flex_read_raw(struct nandi_controller *nandi,
+			 uint32_t page_addr,
+			 uint32_t col_addr,
+			 uint8_t *buf, uint32_t len)
+{
+	dev_dbg(nandi->dev, "%s %u bytes at [0x%06x,0x%04x]\n",
+		__func__, len, page_addr, col_addr);
+
+	BUG_ON(len & 0x3);
+	BUG_ON((unsigned long)buf & 0x3);
+
+	emiss_nandi_select(STM_NANDI_HAMMING);
+	nandi_enable_interrupts(nandi, NAND_INT_RBN);
+	reinit_completion(&nandi->rbn_completed);
+
+	writel(FLEX_DATA_CFG_BEATS_4 | FLEX_DATA_CFG_CSN,
+	       nandi->base + NANDHAM_FLEX_DATAREAD_CONFIG);
+
+	flex_cmd(nandi, NAND_CMD_READ0);
+	flex_addr(nandi, col_addr, 2);
+	flex_addr(nandi, page_addr, nandi->extra_addr ? 3 : 2);
+	flex_cmd(nandi, NAND_CMD_READSTART);
+
+	flex_wait_rbn(nandi);
+
+	readsl(nandi->base + NANDHAM_FLEX_DATA, buf, len / 4);
+
+	nandi_disable_interrupts(nandi, NAND_INT_RBN);
+
+	writel(FLEX_DATA_CFG_BEATS_1 | FLEX_DATA_CFG_CSN,
+	       nandi->base + NANDHAM_FLEX_DATAREAD_CONFIG);
+
+	return 0;
+}
+
 /*
  * Bad Block Tables/Bad Block Markers
  */
-- 
1.8.3.2
