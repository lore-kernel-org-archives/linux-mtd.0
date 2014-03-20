Received: from mail-we0-f172.google.com ([74.125.82.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZAp-0007W1-EZ
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:22:11 +0000
Received: by mail-we0-f172.google.com with SMTP id t61so364960wes.31
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:21:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH v6 12/36] mtd: st_spi_fsm: Prepare the read/write FSM message
 sequence(s)
Date: Thu, 20 Mar 2014 09:20:44 +0000
Message-Id: <1395307268-12721-13-git-send-email-lee.jones@linaro.org>
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

The FSM Serial Flash Controller is driven by issuing a standard set of
register writes we call a message sequence. This patch supplies a method
to prepare read/write FSM message sequence(s) based on chip capability
and configuration.

Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 69 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 5a1b470..83cf9df 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -489,6 +489,75 @@ stfsm_search_seq_rw_configs(struct stfsm *fsm,
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
