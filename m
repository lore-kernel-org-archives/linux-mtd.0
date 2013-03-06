Received: from mail-ee0-f47.google.com ([74.125.83.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDC6o-00040g-Ps
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 11:02:08 +0000
Received: by mail-ee0-f47.google.com with SMTP id e52so5405698eek.20
 for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2013 03:02:04 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 3/3] mtd: bcm47xxsflash: define opcodes
Date: Wed,  6 Mar 2013 12:01:35 +0100
Message-Id: <1362567695-17523-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
References: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need them to add erase/write support. This may duplicate some defines
with bcma and/or ssb code, but it makes more sense to keep that in
bcm47xxsflash which is supposed to work with both buses.
Duplicated defines will be removed from ssb/bcma.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/devices/bcm47xxsflash.h |   48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
index 1574ea8..3faffcc 100644
--- a/drivers/mtd/devices/bcm47xxsflash.h
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -3,6 +3,54 @@
 
 #include <linux/mtd/mtd.h>
 
+/* Used for ST flashes only. */
+#define OPCODE_ST_WREN		0x0006		/* Write Enable */
+#define OPCODE_ST_WRDIS		0x0004		/* Write Disable */
+#define OPCODE_ST_RDSR		0x0105		/* Read Status Register */
+#define OPCODE_ST_WRSR		0x0101		/* Write Status Register */
+#define OPCODE_ST_READ		0x0303		/* Read Data Bytes */
+#define OPCODE_ST_PP		0x0302		/* Page Program */
+#define OPCODE_ST_SE		0x02d8		/* Sector Erase */
+#define OPCODE_ST_BE		0x00c7		/* Bulk Erase */
+#define OPCODE_ST_DP		0x00b9		/* Deep Power-down */
+#define OPCODE_ST_RES		0x03ab		/* Read Electronic Signature */
+#define OPCODE_ST_CSA		0x1000		/* Keep chip select asserted */
+#define OPCODE_ST_SSE		0x0220		/* Sub-sector Erase */
+
+/* Used for Atmel flashes only. */
+#define OPCODE_AT_READ				0x07e8
+#define OPCODE_AT_PAGE_READ			0x07d2
+#define OPCODE_AT_STATUS			0x01d7
+#define OPCODE_AT_BUF1_WRITE			0x0384
+#define OPCODE_AT_BUF2_WRITE			0x0387
+#define OPCODE_AT_BUF1_ERASE_PROGRAM		0x0283
+#define OPCODE_AT_BUF2_ERASE_PROGRAM		0x0286
+#define OPCODE_AT_BUF1_PROGRAM			0x0288
+#define OPCODE_AT_BUF2_PROGRAM			0x0289
+#define OPCODE_AT_PAGE_ERASE			0x0281
+#define OPCODE_AT_BLOCK_ERASE			0x0250
+#define OPCODE_AT_BUF1_WRITE_ERASE_PROGRAM	0x0382
+#define OPCODE_AT_BUF2_WRITE_ERASE_PROGRAM	0x0385
+#define OPCODE_AT_BUF1_LOAD			0x0253
+#define OPCODE_AT_BUF2_LOAD			0x0255
+#define OPCODE_AT_BUF1_COMPARE			0x0260
+#define OPCODE_AT_BUF2_COMPARE			0x0261
+#define OPCODE_AT_BUF1_REPROGRAM		0x0258
+#define OPCODE_AT_BUF2_REPROGRAM		0x0259
+
+/* Status register bits for ST flashes */
+#define SR_ST_WIP		0x01		/* Write In Progress */
+#define SR_ST_WEL		0x02		/* Write Enable Latch */
+#define SR_ST_BP_MASK		0x1c		/* Block Protect */
+#define SR_ST_BP_SHIFT		2
+#define SR_ST_SRWD		0x80		/* Status Register Write Disable */
+
+/* Status register bits for Atmel flashes */
+#define SR_AT_READY		0x80
+#define SR_AT_MISMATCH		0x40
+#define SR_AT_ID_MASK		0x38
+#define SR_AT_ID_SHIFT		3
+
 struct bcma_drv_cc;
 
 enum bcm47xxsflash_type {
-- 
1.7.10.4
