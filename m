Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjtWn-0002wT-4I
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 16:24:28 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so1501889pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 08:24:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, angus.clark@st.com
Subject: [PATCH 14/23] mtd: st_spi_fsm: Prepare the read/write FSM message
 sequence(s)
Date: Fri, 22 Nov 2013 16:22:51 +0000
Message-Id: <1385137380-28968-15-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
References: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, Lee Jones <lee.jones@linaro.org>
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
index 5bced00..80657a4 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -97,6 +97,75 @@ stfsm_search_seq_rw_configs(struct stfsm *fsm,
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
+	memset(seq, 0, STFSM_SEQ_SIZE);
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
+	addr1_cycles  = (fsm->info->flags & FLASH_FLAG_32BITADDR) ? 16 : 8;
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
 static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 			    const uint32_t size)
 {
-- 
1.8.1.2
