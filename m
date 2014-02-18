Received: from mail-we0-f169.google.com ([74.125.82.169])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFm73-0005uy-CK
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 14:57:34 +0000
Received: by mail-we0-f169.google.com with SMTP id t61so11895624wes.0
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 06:57:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/35] mtd: st_spi_fsm: Provide the sequence for enabling
 32bit addressing mode
Date: Tue, 18 Feb 2014 14:55:43 +0000
Message-Id: <1392735362-1245-17-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
References: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
Cc: Angus.Clark@st.com, lee.jones@linaro.org,
 DCG_UPD_stlinux_kernel@list.st.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The FSM Serial Flash Controller is driven by issuing a standard set of
register writes we call a message sequence. This patch supplies a method
to prepare the message sequence responsible for setting 32bit addressing
mode on the Flash chip.

Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 059188c..94b0cb4 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -411,6 +411,28 @@ static struct stfsm_seq stfsm_seq_erase_sector = {
 		    SEQ_CFG_STARTSEQ),
 };
 
+static int stfsm_n25q_en_32bit_addr_seq(struct stfsm_seq *seq)
+{
+	seq->seq_opc[0] = (SEQ_OPC_PADS_1 | SEQ_OPC_CYCLES(8) |
+			   SEQ_OPC_OPCODE(FLASH_CMD_EN4B_ADDR));
+	seq->seq_opc[1] = (SEQ_OPC_PADS_1 | SEQ_OPC_CYCLES(8) |
+			   SEQ_OPC_OPCODE(FLASH_CMD_WREN) |
+			   SEQ_OPC_CSDEASSERT);
+
+	seq->seq[0] = STFSM_INST_CMD2;
+	seq->seq[1] = STFSM_INST_CMD1;
+	seq->seq[2] = STFSM_INST_WAIT;
+	seq->seq[3] = STFSM_INST_STOP;
+
+	seq->seq_cfg = (SEQ_CFG_PADS_1 |
+			SEQ_CFG_ERASE |
+			SEQ_CFG_READNOTWRITE |
+			SEQ_CFG_CSDEASSERT |
+			SEQ_CFG_STARTSEQ);
+
+	return 0;
+}
+
 static inline int stfsm_is_idle(struct stfsm *fsm)
 {
 	return readl(fsm->base + SPI_FAST_SEQ_STA) & 0x10;
-- 
1.8.3.2
