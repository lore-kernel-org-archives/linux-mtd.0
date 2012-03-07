Received: from eu1sys200aog106.obsmtp.com ([207.126.144.121])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F66-0006W3-2n
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:00 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/18] fsmc_nand.c: Fixed data abort inside change_bit()
Date: Wed, 7 Mar 2012 17:00:53 +0530
Message-ID: <a289aad6aca8156a196b88c5f3674a809a0dbf4d.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Armando Visconti <armando.visconti@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Armando Visconti <armando.visconti@st.com>

Since change_bit() requires a (unsigned int *) as second arg,
the correct definition of err_idx[] array declared as
local variable of fsmc_correct_data() is the following:

	u32 err_idx[8];

Signed-off-by: Armando Visconti <armando.visconti@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 4dda9bb..cfe15a6 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -604,7 +604,7 @@ static int fsmc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	struct nand_chip *chip = mtd->priv;
 	struct fsmc_regs *regs = host->regs_va;
 	unsigned int bank = host->bank;
-	uint16_t err_idx[8];
+	uint32_t err_idx[8];
 	uint64_t ecc_data[2];
 	uint32_t num_err, i;
 
-- 
1.7.0.4
