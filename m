Received: from mail-yh0-f51.google.com ([209.85.213.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN3k-00037z-S1
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:20:37 +0000
Received: by mail-yh0-f51.google.com with SMTP id c41so5102216yho.24
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:20:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 20/36] mtd: st_spi_fsm: Provide a method to put the chip
 into 32bit addressing mode
Date: Fri, 29 Nov 2013 12:19:09 +0000
Message-Id: <1385727565-25794-21-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linus.walleij@linaro.org,
 Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Most Serial Flash chips support 24bit addressing as a default but more
recent incarnations can support 32bit. Based on information provided
though platform specific data and capabilities we can determine whether
or not our current chip can. This patch provides a means to setup the
FSM message sequence to put the chip into 32bit mode.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 4edd3f2..325fd7a 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -28,6 +28,8 @@
 #include "st_spi_fsm.h"
 #include "serial_flash_cmds.h"
 
+static struct stfsm_seq stfsm_seq_en_32bit_addr;/* Dynamically populated */
+
 static struct stfsm_seq stfsm_seq_read_jedec = {
 	.data_size = TRANSFER_SIZE(8),
 	.seq_opc[0] = (SEQ_OPC_PADS_1 |
@@ -170,6 +172,23 @@ static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 	}
 }
 
+static int stfsm_enter_32bit_addr(struct stfsm *fsm, int enter)
+{
+	struct stfsm_seq *seq = &stfsm_seq_en_32bit_addr;
+	uint32_t cmd = enter ? FLASH_CMD_EN4B_ADDR : FLASH_CMD_EX4B_ADDR;
+
+	seq->seq_opc[0] = (SEQ_OPC_PADS_1 |
+			   SEQ_OPC_CYCLES(8) |
+			   SEQ_OPC_OPCODE(cmd) |
+			   SEQ_OPC_CSDEASSERT);
+
+	stfsm_load_seq(fsm, seq);
+
+	stfsm_wait_seq(fsm);
+
+	return 0;
+}
+
 /*
  * SoC reset on 'boot-from-spi' systems
  *
-- 
1.8.3.2
