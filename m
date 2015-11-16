Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyRun-0007aj-Im
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 22:06:22 +0000
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Cernekee <cernekee@gmail.com>
From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH] brcmnand: Clear EXT_ADDR error registers in PIO mode
Message-ID: <564A5333.9000200@simon.arlott.org.uk>
Date: Mon, 16 Nov 2015 22:05:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If an error occurs in flash above 4GB in PIO mode then the EXT_ADDR
registers will be set to the location of the error and never cleared.

Reset them to 0 before reading.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 12c6190..2c8f67f 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1400,6 +1400,8 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 	/* Clear error addresses */
 	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_ADDR, 0);
 	brcmnand_write_reg(ctrl, BRCMNAND_CORR_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_EXT_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_CORR_EXT_ADDR, 0);
 
 	brcmnand_write_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS,
 			(host->cs << 16) | ((addr >> 32) & 0xffff));
-- 
2.1.4

-- 
Simon Arlott
