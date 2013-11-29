Received: from mail-yh0-f50.google.com ([209.85.213.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN4D-0003Df-KY
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:21:06 +0000
Received: by mail-yh0-f50.google.com with SMTP id b6so6823958yha.9
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:20:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 35/36] mtd: st_spi_fsm: Supply the W25Qxxx chip specific
 configuration call-back
Date: Fri, 29 Nov 2013 12:19:24 +0000
Message-Id: <1385727565-25794-36-git-send-email-lee.jones@linaro.org>
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

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/st_spi_fsm.h | 13 +++++++++----
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index d31348a..72474f1 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -150,6 +150,11 @@ static struct seq_rw_config stfsm_s25fl_write4_configs[] = {
 	{0x00,                   0,                      0, 0, 0, 0x00, 0, 0},
 };
 
+/*
+ * [W25Qxxx] Configuration
+ */
+#define W25Q_STATUS_QE			(0x1 << 9)
+
 static struct stfsm_seq stfsm_seq_read; 	/* Dynamically populated */
 static struct stfsm_seq stfsm_seq_write;	/* Dynamically populated */
 static struct stfsm_seq stfsm_seq_en_32bit_addr;/* Dynamically populated */
@@ -1010,6 +1015,35 @@ static int stfsm_s25fl_config(struct stfsm *fsm)
 	return 0;
 }
 
+static int stfsm_w25q_config(struct stfsm *fsm)
+{
+	uint32_t data_pads;
+	uint16_t sta_wr;
+	uint8_t sta1, sta2;
+	int ret;
+
+	ret = stfsm_prepare_rwe_seqs_default(fsm);
+	if (ret)
+		return ret;
+
+	/* If using QUAD mode, set QE STATUS bit */
+	data_pads = ((stfsm_seq_read.seq_cfg >> 16) & 0x3) + 1;
+	if (data_pads == 4) {
+		stfsm_read_status(fsm, FLASH_CMD_RDSR, &sta1);
+		stfsm_read_status(fsm, FLASH_CMD_RDSR2, &sta2);
+
+		sta_wr = ((uint16_t)sta2 << 8) | sta1;
+
+		sta_wr |= W25Q_STATUS_QE;
+
+		stfsm_write_status(fsm, sta_wr, 2);
+
+		stfsm_wait_busy(fsm);
+	}
+
+	return 0;
+}
+
 static int stfsm_read(struct stfsm *fsm, uint8_t *const buf,
 		      const uint32_t size, const uint32_t offset)
 {
diff --git a/drivers/mtd/devices/st_spi_fsm.h b/drivers/mtd/devices/st_spi_fsm.h
index 83b30f9..4c8fecd 100644
--- a/drivers/mtd/devices/st_spi_fsm.h
+++ b/drivers/mtd/devices/st_spi_fsm.h
@@ -333,6 +333,7 @@ struct flash_info {
 static int stfsm_n25q_config(struct stfsm *fsm);
 static int stfsm_mx25_config(struct stfsm *fsm);
 static int stfsm_s25fl_config(struct stfsm *fsm);
+static int stfsm_w25q_config(struct stfsm *fsm);
 
 static struct flash_info flash_types[] = {
 	/*
@@ -439,10 +440,14 @@ static struct flash_info flash_types[] = {
 		   FLASH_FLAG_READ_1_1_4	| \
 		   FLASH_FLAG_READ_1_4_4	| \
 		   FLASH_FLAG_WRITE_1_1_4)
-	{ "w25q80",  0xef4014, 0,  64 * 1024,  16, W25Q_FLAG, 80, NULL },
-	{ "w25q16",  0xef4015, 0,  64 * 1024,  32, W25Q_FLAG, 80, NULL },
-	{ "w25q32",  0xef4016, 0,  64 * 1024,  64, W25Q_FLAG, 80, NULL },
-	{ "w25q64",  0xef4017, 0,  64 * 1024, 128, W25Q_FLAG, 80, NULL },
+	{ "w25q80",  0xef4014, 0,  64 * 1024,  16, W25Q_FLAG, 80,
+	  stfsm_w25q_config },
+	{ "w25q16",  0xef4015, 0,  64 * 1024,  32, W25Q_FLAG, 80,
+	  stfsm_w25q_config },
+	{ "w25q32",  0xef4016, 0,  64 * 1024,  64, W25Q_FLAG, 80,
+	  stfsm_w25q_config },
+	{ "w25q64",  0xef4017, 0,  64 * 1024, 128, W25Q_FLAG, 80,
+	  stfsm_w25q_config },
 
 	/* Sentinel */
 	{ NULL, 0x000000, 0, 0, 0, 0, 0, NULL },
-- 
1.8.3.2
