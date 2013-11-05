From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 11/28] mtd: nand: pxa3xx: Add a nice comment to
 pxa3xx_set_datasize()
Date: Tue,  5 Nov 2013 09:55:18 -0300
Message-Id: <1383656135-8627-12-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a comment clarifying the use of pxa3xx_set_datasize() which is only
applicable on data read/write commands (i.e. commands with a data cycle,
such as READID, READ0, STATUS, etc.)

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c558cadb..2fb0f38 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -302,6 +302,11 @@ static void pxa3xx_nand_set_timing(struct pxa3xx_nand_host *host,
 	nand_writel(info, NDTR1CS0, ndtr1);
 }
 
+/*
+ * Set the data and OOB size, depending on the selected
+ * spare and ECC configuration.
+ * Only applicable to READ0, READOOB and PAGEPROG commands.
+ */
 static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 {
 	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
-- 
1.8.1.5
