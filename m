Received: from mail-wg0-f50.google.com ([74.125.82.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZBQ-0006Xf-G2
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:22:41 +0000
Received: by mail-wg0-f50.google.com with SMTP id x13so379053wgg.9
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:22:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH v6 29/36] mtd: st_spi_fsm: Add the ability to read the FSM's
 status
Date: Thu, 20 Mar 2014 09:21:01 +0000
Message-Id: <1395307268-12721-30-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
References: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
Cc: dwmw2@infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, Angus.Clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 34aac3f..5e315e3 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -793,6 +793,30 @@ static uint8_t stfsm_wait_busy(struct stfsm *fsm)
 	return FLASH_STATUS_TIMEOUT;
 }
 
+static int stfsm_read_status(struct stfsm *fsm, uint8_t cmd,
+			   uint8_t *status)
+{
+	struct stfsm_seq *seq = &stfsm_seq_read_status_fifo;
+	uint32_t tmp;
+
+	dev_dbg(fsm->dev, "reading STA[%s]\n",
+		(cmd == FLASH_CMD_RDSR) ? "1" : "2");
+
+	seq->seq_opc[0] = (SEQ_OPC_PADS_1 |
+			   SEQ_OPC_CYCLES(8) |
+			   SEQ_OPC_OPCODE(cmd)),
+
+	stfsm_load_seq(fsm, seq);
+
+	stfsm_read_fifo(fsm, &tmp, 4);
+
+	*status = (uint8_t)(tmp >> 24);
+
+	stfsm_wait_seq(fsm);
+
+	return 0;
+}
+
 static int stfsm_wrvcr(struct stfsm *fsm, uint8_t data)
 {
 	struct stfsm_seq *seq = &stfsm_seq_wrvcr;
-- 
1.8.3.2
