Received: from mail-we0-f174.google.com ([74.125.82.174])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Hb3-0005Uf-AD
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:33:22 +0000
Received: by mail-we0-f174.google.com with SMTP id x55so930360wes.19
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:32:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 28/37] mtd: st_spi_fsm: Supply a busy wait for
 post-write status
Date: Thu, 23 Jan 2014 10:31:16 +0000
Message-Id: <1390473085-24626-29-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1390473085-24626-1-git-send-email-lee.jones@linaro.org>
References: <1390473085-24626-1-git-send-email-lee.jones@linaro.org>
Cc: olivier.clergeaud@st.com, Angus.Clark@st.com,
 Lee Jones <lee.jones@linaro.org>, linus.walleij@linaro.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, DCG_UPD_stlinux_kernel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we write data to the Serial Flash chip we'll wait a predetermined
period of time before giving up. During that period of time we poll the
status register until completion.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index c64f741..c2ee7e3 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -236,8 +236,18 @@
 #define FLASH_CMD_READ4_1_1_4  0x6c
 #define FLASH_CMD_READ4_1_4_4  0xec
 
+/* Status register */
+#define FLASH_STATUS_BUSY      0x01
+#define FLASH_STATUS_WEL       0x02
+#define FLASH_STATUS_BP0       0x04
+#define FLASH_STATUS_BP1       0x08
+#define FLASH_STATUS_BP2       0x10
+#define FLASH_STATUS_SRWP0     0x80
+#define FLASH_STATUS_TIMEOUT   0xff
+
 #define FLASH_PAGESIZE         256			/* In Bytes    */
 #define FLASH_PAGESIZE_32      (FLASH_PAGESIZE / 4)	/* In uint32_t */
+#define FLASH_MAX_BUSY_WAIT    (300 * HZ)	/* Maximum 'CHIPERASE' time */
 
 /*
  * Flags to tweak operation of default read/write/erase routines
@@ -517,6 +527,22 @@ static struct stfsm_seq stfsm_seq_read_jedec = {
 		    SEQ_CFG_STARTSEQ),
 };
 
+static struct stfsm_seq stfsm_seq_read_status_fifo = {
+	.data_size = TRANSFER_SIZE(4),
+	.seq_opc[0] = (SEQ_OPC_PADS_1 |
+		       SEQ_OPC_CYCLES(8) |
+		       SEQ_OPC_OPCODE(FLASH_CMD_RDSR)),
+	.seq = {
+		STFSM_INST_CMD1,
+		STFSM_INST_DATA_READ,
+		STFSM_INST_STOP,
+	},
+	.seq_cfg = (SEQ_CFG_PADS_1 |
+		    SEQ_CFG_READNOTWRITE |
+		    SEQ_CFG_CSDEASSERT |
+		    SEQ_CFG_STARTSEQ),
+};
+
 static struct stfsm_seq stfsm_seq_erase_sector = {
 	/* 'addr_cfg' configured during initialisation */
 	.seq_opc = {
@@ -692,6 +718,45 @@ static int stfsm_enter_32bit_addr(struct stfsm *fsm, int enter)
 	return 0;
 }
 
+static uint8_t stfsm_wait_busy(struct stfsm *fsm)
+{
+	struct stfsm_seq *seq = &stfsm_seq_read_status_fifo;
+	unsigned long deadline;
+	uint32_t status;
+
+	/* Use RDRS1 */
+	seq->seq_opc[0] = (SEQ_OPC_PADS_1 |
+			   SEQ_OPC_CYCLES(8) |
+			   SEQ_OPC_OPCODE(FLASH_CMD_RDSR));
+
+	/* Load read_status sequence */
+	stfsm_load_seq(fsm, seq);
+
+	/* Repeat until busy bit is deasserted, or timeout */
+	deadline = jiffies + FLASH_MAX_BUSY_WAIT;
+	do {
+		cond_resched();
+
+		stfsm_wait_seq(fsm);
+
+		stfsm_read_fifo(fsm, &status, 4);
+		if ((status & FLASH_STATUS_BUSY) == 0)
+			return 0;
+
+		/* Restart */
+		writel(seq->seq_cfg, fsm->base + SPI_FAST_SEQ_CFG);
+
+	} while (!time_after_eq(jiffies, deadline));
+
+	stfsm_read_fifo(fsm, &status, 4);
+	if ((status & FLASH_STATUS_BUSY) == 0)
+		return 0;
+
+	dev_err(fsm->dev, "timeout on wait_busy\n");
+
+	return -EIO;
+}
+
 static int stfsm_wrvcr(struct stfsm *fsm, uint8_t data)
 {
 	struct stfsm_seq *seq = &stfsm_seq_wrvcr;
-- 
1.8.3.2
