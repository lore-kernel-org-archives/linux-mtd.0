Received: from mail-ie0-f174.google.com ([209.85.223.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnR7H-0003g2-ED
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:24:56 +0000
Received: by mail-ie0-f174.google.com with SMTP id lx4so3377799iec.19
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:24:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] mtd: st_spi_fsm: Improve busy wait handling
Date: Thu, 22 May 2014 12:24:05 +0100
Message-Id: <1400757848-18075-8-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
Cc: Angus Clark <angus.clark@st.com>, Lee Jones <lee.jones@linaro.org>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Angus Clark <angus.clark@st.com>

In this patch, the fsm_wait_busy() function is updated to a take a timeout
parameter.  This allows us to specify different timeout delays depending on
the operation being performed.  Previously, a fixed, worst-case delay
(corresponding to the Chip Erase operation, ~300s!) was used. For the moment,
we have defined conservative delays for each relevant operation, which should
accommodate all existing devices.  In principle, one could set the delays
according the device probed, but there is probably little to be gained.

Signed-off-by: Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 7514a07..3f74e125 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -252,7 +252,12 @@
 
 #define FLASH_PAGESIZE         256			/* In Bytes    */
 #define FLASH_PAGESIZE_32      (FLASH_PAGESIZE / 4)	/* In uint32_t */
-#define FLASH_MAX_BUSY_WAIT    (300 * HZ)	/* Maximum 'CHIPERASE' time */
+/* Maximum operation times (in ms) */
+#define FLASH_MAX_CHIP_ERASE_MS 500000          /* Chip Erase time */
+#define FLASH_MAX_SEC_ERASE_MS  30000           /* Sector Erase time */
+#define FLASH_MAX_PAGE_WRITE_MS 100             /* Write Page time */
+#define FLASH_MAX_STA_WRITE_MS  4000            /* Write status reg time */
+#define FSM_MAX_WAIT_SEQ_MS     1000            /* FSM execution time */
 
 /*
  * Flags to tweak operation of default read/write/erase routines
@@ -966,7 +971,7 @@ static int stfsm_enter_32bit_addr(struct stfsm *fsm, int enter)
 	return 0;
 }
 
-static uint8_t stfsm_wait_busy(struct stfsm *fsm)
+static uint8_t stfsm_wait_busy(struct stfsm *fsm, unsigned int max_time_ms)
 {
 	struct stfsm_seq *seq = &stfsm_seq_read_status_fifo;
 	unsigned long deadline;
@@ -984,7 +989,7 @@ static uint8_t stfsm_wait_busy(struct stfsm *fsm)
 	/*
 	 * Repeat until busy bit is deasserted, or timeout, or error (S25FLxxxS)
 	 */
-	deadline = jiffies + FLASH_MAX_BUSY_WAIT;
+	deadline = jiffies + msecs_to_jiffies(max_time_ms);
 	while (!timeout) {
 		if (time_after_eq(jiffies, deadline))
 			timeout = 1;
@@ -1063,7 +1068,7 @@ static int stfsm_write_status(struct stfsm *fsm, uint8_t cmd,
 	stfsm_wait_seq(fsm);
 
 	if (wait_busy)
-		stfsm_wait_busy(fsm);
+		stfsm_wait_busy(fsm, FLASH_MAX_STA_WRITE_MS);
 
 	return 0;
 }
@@ -1460,7 +1465,7 @@ static void stfsm_s25fl_write_dyb(struct stfsm *fsm, uint32_t offs, uint8_t dby)
 	stfsm_load_seq(fsm, &seq);
 	stfsm_wait_seq(fsm);
 
-	stfsm_wait_busy(fsm);
+	stfsm_wait_busy(fsm, FLASH_MAX_STA_WRITE_MS);
 }
 
 static int stfsm_s25fl_clear_status_reg(struct stfsm *fsm)
@@ -1763,7 +1768,7 @@ static int stfsm_write(struct stfsm *fsm, const uint8_t *buf,
 	stfsm_wait_seq(fsm);
 
 	/* Wait for completion */
-	ret = stfsm_wait_busy(fsm);
+	ret = stfsm_wait_busy(fsm, FLASH_MAX_PAGE_WRITE_MS);
 	if (ret && fsm->configuration & CFG_S25FL_CHECK_ERROR_FLAGS)
 		stfsm_s25fl_clear_status_reg(fsm);
 
@@ -1835,7 +1840,7 @@ static int stfsm_erase_sector(struct stfsm *fsm, uint32_t offset)
 	stfsm_wait_seq(fsm);
 
 	/* Wait for completion */
-	ret = stfsm_wait_busy(fsm);
+	ret = stfsm_wait_busy(fsm, FLASH_MAX_SEC_ERASE_MS);
 	if (ret && fsm->configuration & CFG_S25FL_CHECK_ERROR_FLAGS)
 		stfsm_s25fl_clear_status_reg(fsm);
 
@@ -1865,7 +1870,7 @@ static int stfsm_erase_chip(struct stfsm *fsm)
 
 	stfsm_wait_seq(fsm);
 
-	return stfsm_wait_busy(fsm);
+	return stfsm_wait_busy(fsm, FLASH_MAX_CHIP_ERASE_MS);
 }
 
 /*
-- 
1.8.3.2
