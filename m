Received: from mail-we0-f179.google.com ([74.125.82.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFm7E-0007MA-BX
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 14:57:52 +0000
Received: by mail-we0-f179.google.com with SMTP id q58so11886203wes.10
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 06:57:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/35] mtd: st_spi_fsm: Provide the default read/write
 configurations
Date: Tue, 18 Feb 2014 14:55:48 +0000
Message-Id: <1392735362-1245-22-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
References: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
Cc: Angus.Clark@st.com, lee.jones@linaro.org,
 DCG_UPD_stlinux_kernel@list.st.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Message sequences can vary depending on how many pads (lines) are
required to address the chip (mode & dummy), how many data pads (lines)
are required to write out to the chip which will determine speed
amongst other things which are detailed by the SFDP specification. We
are able to use multiple configurations for each chip, but they need
to me matched to a device's capabilities. These configurations are
listed in preference order - most preferred first.

Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 208b6c3..576712c 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -375,6 +375,33 @@ static struct flash_info flash_types[] = {
 	{ NULL, 0x000000, 0, 0, 0, 0, 0, NULL },
 };
 
+/*
+ * FSM message sequence configurations:
+ *
+ * All configs are presented in order of preference
+ */
+
+/* Default READ configurations, in order of preference */
+static struct seq_rw_config default_read_configs[] = {
+	{FLASH_FLAG_READ_1_4_4, FLASH_CMD_READ_1_4_4,	0, 4, 4, 0x00, 2, 4},
+	{FLASH_FLAG_READ_1_1_4, FLASH_CMD_READ_1_1_4,	0, 1, 4, 0x00, 4, 0},
+	{FLASH_FLAG_READ_1_2_2, FLASH_CMD_READ_1_2_2,	0, 2, 2, 0x00, 4, 0},
+	{FLASH_FLAG_READ_1_1_2, FLASH_CMD_READ_1_1_2,	0, 1, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_FAST,	FLASH_CMD_READ_FAST,	0, 1, 1, 0x00, 0, 8},
+	{FLASH_FLAG_READ_WRITE, FLASH_CMD_READ,		0, 1, 1, 0x00, 0, 0},
+	{0x00,			0,			0, 0, 0, 0x00, 0, 0},
+};
+
+/* Default WRITE configurations */
+static struct seq_rw_config default_write_configs[] = {
+	{FLASH_FLAG_WRITE_1_4_4, FLASH_CMD_WRITE_1_4_4, 1, 4, 4, 0x00, 0, 0},
+	{FLASH_FLAG_WRITE_1_1_4, FLASH_CMD_WRITE_1_1_4, 1, 1, 4, 0x00, 0, 0},
+	{FLASH_FLAG_WRITE_1_2_2, FLASH_CMD_WRITE_1_2_2, 1, 2, 2, 0x00, 0, 0},
+	{FLASH_FLAG_WRITE_1_1_2, FLASH_CMD_WRITE_1_1_2, 1, 1, 2, 0x00, 0, 0},
+	{FLASH_FLAG_READ_WRITE,  FLASH_CMD_WRITE,       1, 1, 1, 0x00, 0, 0},
+	{0x00,			 0,			0, 0, 0, 0x00, 0, 0},
+};
+
 static struct stfsm_seq stfsm_seq_en_32bit_addr;/* Dynamically populated */
 
 static struct stfsm_seq stfsm_seq_read_jedec = {
-- 
1.8.3.2
