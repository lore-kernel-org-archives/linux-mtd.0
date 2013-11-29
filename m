Received: from mail-yh0-x233.google.com ([2607:f8b0:4002:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN3q-00038q-1o
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:20:42 +0000
Received: by mail-yh0-f51.google.com with SMTP id c41so5137669yho.10
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:20:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 23/36] mtd: st_spi_fsm: Supply the N25Qxxx specific read
 configurations
Date: Fri, 29 Nov 2013 12:19:12 +0000
Message-Id: <1385727565-25794-24-git-send-email-lee.jones@linaro.org>
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

The N25Qxxx Serial Flash devices required different sequence
configurations depending on whether they're running in 24bit (3Byte)
or 32bit (4Byte) mode. We provide those here.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 43 ++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/st_spi_fsm.h | 10 ++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 0ecf248..3a6b233 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -55,6 +55,49 @@ static struct seq_rw_config default_write_configs[] = {
 	{0x00,			 0,			 0, 0, 0, 0x00, 0, 0},
 };
 
+/*
+ * [N25Qxxx] Configuration
+ */
+#define N25Q_VCR_DUMMY_CYCLES(x)	(((x) & 0xf) << 4)
+#define N25Q_VCR_XIP_DISABLED		((uint8_t)0x1 << 3)
+#define N25Q_VCR_WRAP_CONT		0x3
+
+/* N25Q 3-byte Address READ configurations
+ *	- 'FAST' variants configured for 8 dummy cycles.
+ *
+ * Note, the number of dummy cycles used for 'FAST' READ operations is
+ * configurable and would normally be tuned according to the READ command and
+ * operating frequency.  However, this applies universally to all 'FAST' READ
+ * commands, including those used by the SPIBoot controller, and remains in
+ * force until the device is power-cycled.  Since the SPIBoot controller is
+ * hard-wired to use 8 dummy cycles, we must configure the device to also use 8
+ * cycles.
+ */
+static struct seq_rw_config n25q_read3_configs[] = {
+	{FLASH_FLAG_READ_1_4_4, FLASH_CMD_READ_1_4_4,	0, 4, 4, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_1_4, FLASH_CMD_READ_1_1_4,	0, 1, 4, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_2_2, FLASH_CMD_READ_1_2_2,	0, 2, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_1_2, FLASH_CMD_READ_1_1_2,	0, 1, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_FAST,	FLASH_CMD_READ_FAST,	0, 1, 1, 0x00, 0, 8},
+	{FLASH_FLAG_READ_WRITE, FLASH_CMD_READ,	        0, 1, 1, 0x00, 0, 0},
+	{0x00,			0,			0, 0, 0, 0x00, 0, 0},
+};
+
+/* N25Q 4-byte Address READ configurations
+ *	- use special 4-byte address READ commands (reduces overheads, and
+ *        reduces risk of hitting watchdog reset issues).
+ *	- 'FAST' variants configured for 8 dummy cycles (see note above.)
+ */
+static struct seq_rw_config n25q_read4_configs[] = {
+	{FLASH_FLAG_READ_1_4_4, FLASH_CMD_READ4_1_4_4,	0, 4, 4, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_1_4, FLASH_CMD_READ4_1_1_4,	0, 1, 4, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_2_2, FLASH_CMD_READ4_1_2_2,	0, 2, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_1_2, FLASH_CMD_READ4_1_1_2,	0, 1, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_FAST,	FLASH_CMD_READ4_FAST,	0, 1, 1, 0x00, 0, 8},
+	{FLASH_FLAG_READ_WRITE, FLASH_CMD_READ4,	0, 1, 1, 0x00, 0, 0},
+	{0x00,			0,			0, 0, 0, 0x00, 0, 0},
+};
+
 static struct stfsm_seq stfsm_seq_en_32bit_addr;/* Dynamically populated */
 
 static struct stfsm_seq stfsm_seq_read_jedec = {
diff --git a/drivers/mtd/devices/st_spi_fsm.h b/drivers/mtd/devices/st_spi_fsm.h
index 0548511..6699174 100644
--- a/drivers/mtd/devices/st_spi_fsm.h
+++ b/drivers/mtd/devices/st_spi_fsm.h
@@ -229,6 +229,15 @@
 #define FLASH_CMD_READ4_1_1_4	0x6c
 #define FLASH_CMD_READ4_1_4_4	0xec
 
+/*
+ * Flags to tweak operation of default read/write/erase routines
+ */
+#define CFG_READ_TOGGLE_32BIT_ADDR	0x00000001
+#define CFG_WRITE_TOGGLE_32BIT_ADDR	0x00000002
+#define CFG_WRITE_EX_32BIT_ADDR_DELAY	0x00000004
+#define CFG_ERASESEC_TOGGLE_32BIT_ADDR	0x00000008
+#define CFG_S25FL_CHECK_ERROR_FLAGS	0x00000010
+
 struct stfsm {
 	struct device		*dev;
 	void __iomem		*base;
@@ -237,6 +246,7 @@ struct stfsm {
 	struct mutex		lock;
 	struct flash_info 	*info;
 
+	uint32_t		configuration;
 	uint32_t		fifo_dir_delay;
 	bool			booted_from_spi;
 	bool			reset_signal;
-- 
1.8.3.2
