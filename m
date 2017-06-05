Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1LW-00080M-Bb
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:23:45 +0000
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
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 12/23] mtd: nand: denali: fix NAND_CMD_STATUS handling
Date: Tue,  6 Jun 2017 08:21:51 +0900
Message-Id: <1496704922-12261-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
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

Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e8e6667..372c871 100644
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
@@ -893,7 +878,11 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 
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
