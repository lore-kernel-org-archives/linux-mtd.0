Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007EB-HE
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:47:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 03/37] mtd: nand: denali: remove meaningless pipeline
 read-ahead operation
Date: Thu, 30 Mar 2017 15:45:49 +0900
Message-Id: <1490856383-31560-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The pipeline read-ahead function of the Denali IP enables continuous
reading from the device; while data is being read out by a CPU, the
controller maintains additional commands for streaming data from the
device.  This will reduce the latency of the second page or later.

This feature is obviously no help for per-page accessors of Linux
NAND driver interface.

In the current implementation, the pipeline command is issued to
load a single page, then data are read out immediately.  The use of
the pipeline operation is not adding any advantage, but just adding
complexity to the code.  Remove.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 42 +++---------------------------------------
 1 file changed, 3 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4e6d03d..65cf7cc 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -84,7 +84,6 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 #define SPARE_ACCESS		0x41
 #define MAIN_ACCESS		0x42
 #define MAIN_SPARE_ACCESS	0x43
-#define PIPELINE_ACCESS		0x2000
 
 #define DENALI_READ	0
 #define DENALI_WRITE	0x100
@@ -683,15 +682,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 				    int access_type, int op)
 {
 	int status = PASS;
-	uint32_t page_count = 1;
-	uint32_t addr, cmd, irq_status, irq_mask;
-
-	if (op == DENALI_READ)
-		irq_mask = INTR__LOAD_COMP;
-	else if (op == DENALI_WRITE)
-		irq_mask = 0;
-	else
-		BUG();
+	uint32_t addr, cmd;
 
 	setup_ecc_for_xfer(denali, ecc_en, transfer_spare);
 
@@ -714,35 +705,8 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 		cmd = MODE_10 | addr;
 		index_addr(denali, cmd, access_type);
 
-		/*
-		 * page 33 of the NAND controller spec indicates we should not
-		 * use the pipeline commands in Spare area only mode.
-		 * So we don't.
-		 */
-		if (access_type == SPARE_ACCESS) {
-			cmd = MODE_01 | addr;
-			iowrite32(cmd, denali->flash_mem);
-		} else {
-			index_addr(denali, cmd,
-					PIPELINE_ACCESS | op | page_count);
-
-			/*
-			 * wait for command to be accepted
-			 * can always use status0 bit as the
-			 * mask is identical for each bank.
-			 */
-			irq_status = wait_for_irq(denali, irq_mask);
-
-			if (irq_status == 0) {
-				dev_err(denali->dev,
-					"cmd, page, addr on timeout (0x%x, 0x%x, 0x%x)\n",
-					cmd, denali->page, addr);
-				status = FAIL;
-			} else {
-				cmd = MODE_01 | addr;
-				iowrite32(cmd, denali->flash_mem);
-			}
-		}
+		cmd = MODE_01 | addr;
+		iowrite32(cmd, denali->flash_mem);
 	}
 	return status;
 }
-- 
2.7.4
