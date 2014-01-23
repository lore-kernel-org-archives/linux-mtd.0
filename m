Received: from mail-we0-f172.google.com ([74.125.82.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Hb9-0003As-Af
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:33:25 +0000
Received: by mail-we0-f172.google.com with SMTP id q58so954820wes.3
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:33:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 31/37] mtd: st_spi_fsm: Add the ability to read the
 FSM's status
Date: Thu, 23 Jan 2014 10:31:19 +0000
Message-Id: <1390473085-24626-32-git-send-email-lee.jones@linaro.org>
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

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index eac23df..5f291dc 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -778,6 +778,30 @@ static uint8_t stfsm_wait_busy(struct stfsm *fsm)
 	return -EIO;
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
