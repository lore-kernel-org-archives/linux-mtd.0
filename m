Received: from mail-wg0-f46.google.com ([74.125.82.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6HaN-0007ul-VX
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:32:36 +0000
Received: by mail-wg0-f46.google.com with SMTP id x12so1248269wgg.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:32:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 13/37] mtd: st_spi_fsm: Prepare the read/write FSM
 message sequence(s)
Date: Thu, 23 Jan 2014 10:31:01 +0000
Message-Id: <1390473085-24626-14-git-send-email-lee.jones@linaro.org>
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

The FSM Serial Flash Controller is driven by issuing a standard set of
register writes we call a message sequence. This patch supplies a method
to prepare read/write FSM message sequence(s) based on chip capability
and configuration.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 69 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 1803f94..961abfd 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -520,6 +520,75 @@ stfsm_search_seq_rw_configs(struct stfsm *fsm,
 	return NULL;
 }
 
+/* Prepare a READ/WRITE sequence according to configuration parameters */
+static void stfsm_prepare_rw_seq(struct stfsm *fsm,
+				 struct stfsm_seq *seq,
+				 struct seq_rw_config *cfg)
+{
+	int addr1_cycles, addr2_cycles;
+	int i = 0;
+
+	memset(seq, 0, sizeof(*seq));
+
+	/* Add READ/WRITE OPC  */
+	seq->seq_opc[i++] = (SEQ_OPC_PADS_1 |
+			     SEQ_OPC_CYCLES(8) |
+			     SEQ_OPC_OPCODE(cfg->cmd));
+
+	/* Add WREN OPC for a WRITE sequence */
+	if (cfg->write)
+		seq->seq_opc[i++] = (SEQ_OPC_PADS_1 |
+				     SEQ_OPC_CYCLES(8) |
+				     SEQ_OPC_OPCODE(FLASH_CMD_WREN) |
+				     SEQ_OPC_CSDEASSERT);
+
+	/* Address configuration (24 or 32-bit addresses) */
+	addr1_cycles  = (fsm->info->flags & FLASH_FLAG_32BIT_ADDR) ? 16 : 8;
+	addr1_cycles /= cfg->addr_pads;
+	addr2_cycles  = 16 / cfg->addr_pads;
+	seq->addr_cfg = ((addr1_cycles & 0x3f) << 0 |	/* ADD1 cycles */
+			 (cfg->addr_pads - 1) << 6 |	/* ADD1 pads */
+			 (addr2_cycles & 0x3f) << 16 |	/* ADD2 cycles */
+			 ((cfg->addr_pads - 1) << 22));	/* ADD2 pads */
+
+	/* Data/Sequence configuration */
+	seq->seq_cfg = ((cfg->data_pads - 1) << 16 |
+			SEQ_CFG_STARTSEQ |
+			SEQ_CFG_CSDEASSERT);
+	if (!cfg->write)
+		seq->seq_cfg |= SEQ_CFG_READNOTWRITE;
+
+	/* Mode configuration (no. of pads taken from addr cfg) */
+	seq->mode = ((cfg->mode_data & 0xff) << 0 |	/* data */
+		     (cfg->mode_cycles & 0x3f) << 16 |	/* cycles */
+		     (cfg->addr_pads - 1) << 22);	/* pads */
+
+	/* Dummy configuration (no. of pads taken from addr cfg) */
+	seq->dummy = ((cfg->dummy_cycles & 0x3f) << 16 |	/* cycles */
+		      (cfg->addr_pads - 1) << 22);		/* pads */
+
+
+	/* Instruction sequence */
+	i = 0;
+	if (cfg->write)
+		seq->seq[i++] = STFSM_INST_CMD2;
+
+	seq->seq[i++] = STFSM_INST_CMD1;
+
+	seq->seq[i++] = STFSM_INST_ADD1;
+	seq->seq[i++] = STFSM_INST_ADD2;
+
+	if (cfg->mode_cycles)
+		seq->seq[i++] = STFSM_INST_MODE;
+
+	if (cfg->dummy_cycles)
+		seq->seq[i++] = STFSM_INST_DUMMY;
+
+	seq->seq[i++] =
+		cfg->write ? STFSM_INST_DATA_WRITE : STFSM_INST_DATA_READ;
+	seq->seq[i++] = STFSM_INST_STOP;
+}
+
 static void stfsm_read_jedec(struct stfsm *fsm, uint8_t *const jedec)
 {
 	const struct stfsm_seq *seq = &stfsm_seq_read_jedec;
-- 
1.8.3.2
