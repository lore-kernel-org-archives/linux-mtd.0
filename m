Received: from mail-oa0-f48.google.com ([209.85.219.48])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgxpP-0000sH-PY
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 14:23:42 +0000
Received: by mail-oa0-f48.google.com with SMTP id n16so2246522oag.7
 for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2013 06:23:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] mtd: st_spi_fsm: Add support for JEDEC ID extraction
Date: Thu, 14 Nov 2013 14:22:33 +0000
Message-Id: <1384438956-31153-8-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1384438956-31153-1-git-send-email-lee.jones@linaro.org>
References: <1384438956-31153-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, linus.walleij@linaro.org,
 Lee Jones <lee.jones@linaro.org>, dwmw2@infradead.org, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Once we start supporting devices it will be handy go detect them
dynamically. This will be done using the chip's unique JEDEC ID. This
patch allows us to extract a device's JEDEC ID using the a predefined
FSM register write sequence.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 6691eaf..2899e0f 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -92,6 +92,22 @@ struct stfsm_seq {
 } __attribute__((__packed__, aligned(4)));
 #define STFSM_SEQ_SIZE sizeof(struct stfsm_seq)
 
+static struct stfsm_seq stfsm_seq_read_jedec = {
+	.data_size = TRANSFER_SIZE(8),
+	.seq_opc[0] = (SEQ_OPC_PADS_1 |
+		       SEQ_OPC_CYCLES(8) |
+		       SEQ_OPC_OPCODE(FLASH_CMD_RDID)),
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
 static inline int stfsm_is_idle(struct stfsm *fsm)
 {
 	return readl(fsm->base + SPI_FAST_SEQ_STA) & 0x10;
@@ -158,6 +174,50 @@ static void stfsm_read_fifo(struct stfsm *fsm, uint32_t *buf,
 	}
 }
 
+static int stfsm_read_jedec(struct stfsm *fsm, uint8_t *const jedec)
+{
+	const struct stfsm_seq *seq = &stfsm_seq_read_jedec;
+	uint32_t tmp[2];
+
+	stfsm_load_seq(fsm, seq);
+
+	stfsm_read_fifo(fsm, tmp, 8);
+
+	memcpy(jedec, tmp, 5);
+
+	stfsm_wait_seq(fsm);
+
+	return 0;
+}
+
+static struct flash_info * stfsm_jedec_probe(struct stfsm *fsm)
+{
+	u16                     ext_jedec;
+	u32			jedec;
+	u8			id[5];
+	int			ret;
+
+	/*
+	 * JEDEC also defines an optional "extended device information"
+	 * string for after vendor-specific data, after the three bytes
+	 * we use here. Supporting some chips might require using it.
+	 */
+
+	ret = stfsm_read_jedec(fsm, id);
+	if (ret) {
+		dev_info(fsm->dev, "Error reading JEDEC ID\n");
+		return NULL;
+	}
+
+	jedec     = id[0] << 16 | id[1] << 8 | id[2];
+	ext_jedec = id[3] << 8  | id[4];
+
+	dev_dbg(fsm->dev, "JEDEC =  0x%08x [%02x %02x %02x %02x %02x]\n",
+		jedec, id[0], id[1], id[2], id[3], id[4]);
+
+	return NULL;
+}
+
 static void stfsm_clear_fifo(struct stfsm *fsm)
 {
 	uint32_t avail;
@@ -310,6 +370,9 @@ static int stfsm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Detect SPI FLASH device */
+	stfsm_jedec_probe(fsm);
+
 	platform_set_drvdata(pdev, fsm);
 
 	fsm->mtd.dev.parent   = &pdev->dev;
-- 
1.8.1.2
