Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgxpK-0000rx-1A
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 14:23:41 +0000
Received: by mail-oa0-f49.google.com with SMTP id h16so2266453oag.8
 for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2013 06:23:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] mtd: st_spi_fsm: Supply defines for the possible flash
 command opcodes
Date: Thu, 14 Nov 2013 14:22:32 +0000
Message-Id: <1384438956-31153-7-git-send-email-lee.jones@linaro.org>
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

Flash chip commands are issued using a set of predefined opcodes. These
are mostly the same for all flash devices, but do differ on occasion.
This patch supplies the majority of the key ones which will be used in
this driver.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index a1c2857..6691eaf 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -30,6 +30,44 @@
 
 #define FLASH_SAFE_FREQ		10000000UL                         /* 10 MHz */
 
+/* Flash Commands */
+#define FLASH_CMD_WREN		0x06
+#define FLASH_CMD_WRDI		0x04
+#define FLASH_CMD_RDID		0x9f
+#define FLASH_CMD_RDSR		0x05
+#define FLASH_CMD_RDSR2		0x35
+#define FLASH_CMD_WRSR		0x01
+#define FLASH_CMD_SE_4K		0x20
+#define FLASH_CMD_SE_32K	0x52
+#define FLASH_CMD_SE		0xd8
+#define FLASH_CMD_CHIPERASE	0xc7
+#define FLASH_CMD_WRVCR		0x81
+#define FLASH_CMD_RDVCR		0x85
+
+#define FLASH_CMD_READ		0x03	/* READ */
+#define FLASH_CMD_READ_FAST	0x0b	/* FAST READ */
+#define FLASH_CMD_READ_1_1_2	0x3b	/* DUAL OUTPUT READ */
+#define FLASH_CMD_READ_1_2_2	0xbb	/* DUAL I/O READ */
+#define FLASH_CMD_READ_1_1_4	0x6b	/* QUAD OUTPUT READ */
+#define FLASH_CMD_READ_1_4_4	0xeb	/* QUAD I/O READ */
+
+#define FLASH_CMD_WRITE		0x02	/* PAGE PROGRAM */
+#define FLASH_CMD_WRITE_1_1_2	0xa2	/* DUAL INPUT PROGRAM */
+#define FLASH_CMD_WRITE_1_2_2	0xd2	/* DUAL INPUT EXT PROGRAM */
+#define FLASH_CMD_WRITE_1_1_4	0x32	/* QUAD INPUT PROGRAM */
+#define FLASH_CMD_WRITE_1_4_4	0x12	/* QUAD INPUT EXT PROGRAM */
+
+#define FLASH_CMD_EN4B_ADDR	0xb7	/* Enter 4-byte address mode */
+#define FLASH_CMD_EX4B_ADDR	0xe9	/* Exit 4-byte address mode */
+
+/* READ commands with 32-bit addressing (N25Q256 and S25FLxxxS) */
+#define FLASH_CMD_READ4		0x13
+#define FLASH_CMD_READ4_FAST	0x0c
+#define FLASH_CMD_READ4_1_1_2	0x3c
+#define FLASH_CMD_READ4_1_2_2	0xbc
+#define FLASH_CMD_READ4_1_1_4	0x6c
+#define FLASH_CMD_READ4_1_4_4	0xec
+
 struct stfsm {
 	struct device		*dev;
 	void __iomem		*base;
-- 
1.8.1.2
