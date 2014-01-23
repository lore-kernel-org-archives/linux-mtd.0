Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6HbK-0003Cv-33
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 10:33:44 +0000
Received: by mail-wg0-f41.google.com with SMTP id n12so414290wgh.4
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 02:33:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 35/37] mtd: st_spi_fsm: Supply the W25Qxxx chip
 specific configuration call-back
Date: Thu, 23 Jan 2014 10:31:23 +0000
Message-Id: <1390473085-24626-36-git-send-email-lee.jones@linaro.org>
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
 drivers/mtd/devices/st_spi_fsm.c | 47 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 88017d8..ddfff35 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -339,6 +339,7 @@ struct flash_info {
 static int stfsm_n25q_config(struct stfsm *fsm);
 static int stfsm_mx25_config(struct stfsm *fsm);
 static int stfsm_s25fl_config(struct stfsm *fsm);
+static int stfsm_w25q_config(struct stfsm *fsm);
 
 static struct flash_info flash_types[] = {
 	/*
@@ -444,10 +445,14 @@ static struct flash_info flash_types[] = {
 		   FLASH_FLAG_READ_1_1_4        |	\
 		   FLASH_FLAG_READ_1_4_4        |	\
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
@@ -575,6 +580,11 @@ static struct seq_rw_config stfsm_s25fl_write4_configs[] = {
 	{0x00,                   0,                      0, 0, 0, 0x00, 0, 0},
 };
 
+/*
+ * [W25Qxxx] Configuration
+ */
+#define W25Q_STATUS_QE			(0x1 << 9)
+
 static struct stfsm_seq stfsm_seq_read;		/* Dynamically populated */
 static struct stfsm_seq stfsm_seq_write;	/* Dynamically populated */
 static struct stfsm_seq stfsm_seq_en_32bit_addr;/* Dynamically populated */
@@ -1433,6 +1443,35 @@ static int stfsm_s25fl_config(struct stfsm *fsm)
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
 static int stfsm_read(struct stfsm *fsm, uint8_t *buf, uint32_t size,
 		      uint32_t offset)
 {
-- 
1.8.3.2
