Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT6-0004Zv-Am
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:15 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 38/53] mtd: nand: denali: fix NAND_CMD_STATUS
 handling
Date: Thu, 23 Mar 2017 09:17:47 +0900
Message-Id: <1490228282-10805-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current NAND_CMD_STATUS handling is weird; it just reads the
WRITE_PROTECT register, and returns NAND_STATUS_WP if it is set.

It does not send Read Status (0x70) command, so it is not helpful
for checking the current device status.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 5aafa59..275f1fa 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -107,21 +107,6 @@ static void write_byte_to_buf(struct denali_nand_info *denali, uint8_t byte)
 	denali->buf.buf[denali->buf.tail++] = byte;
 }
 
-/* reads the status of the device */
-static void read_status(struct denali_nand_info *denali)
-{
-	uint32_t cmd;
-
-	/* initialize the data buffer to store status */
-	reset_buf(denali);
-
-	cmd = ioread32(denali->flash_reg + WRITE_PROTECT);
-	if (cmd)
-		write_byte_to_buf(denali, NAND_STATUS_WP);
-	else
-		write_byte_to_buf(denali, 0);
-}
-
 /* Reset the flash controller */
 static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
@@ -857,7 +842,11 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 
 	switch (cmd) {
 	case NAND_CMD_STATUS:
-		read_status(denali);
+		reset_buf(denali);
+		addr = MODE_11 | BANK(denali->flash_bank);
+		index_addr(denali, addr | 0, cmd);
+		index_addr_read_data(denali, addr | 2, &id);
+		write_byte_to_buf(denali, id);
 		break;
 	case NAND_CMD_READID:
 	case NAND_CMD_PARAM:
-- 
2.7.4
