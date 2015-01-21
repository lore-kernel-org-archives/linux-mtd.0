Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDx9e-0008Ep-4E
 for linux-mtd@lists.infradead.org; Wed, 21 Jan 2015 15:25:17 +0000
Received: by mail-ig0-f178.google.com with SMTP id hl2so20361144igb.5
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2015 07:24:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/10] mtd: st_spi_fsm: Update Spansion device entries
Date: Wed, 21 Jan 2015 15:24:24 +0000
Message-Id: <1421853868-8262-7-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
References: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
Cc: Angus Clark <angus.clark@st.com>, kernel@stlinux.com,
 Carmelo Amoroso <carmelo.amoroso@st.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, lee.jones@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Angus Clark <angus.clark@st.com>

This patch updates various Spansion device entries in the flash_types[] table:
  - Define full 6-byte READIDs for S25FL128Sx devices (and fix the 4th
    byte). This allows us to differentiate between S25FL129P and S25FL128S
    devices.
  - Add S25FL128Px device entries.

Signed-off-by: Angus Clark <angus.clark@st.com>
Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index e2b1240..f452276e 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -483,6 +483,7 @@ static struct flash_info flash_types[] = {
 	/*
 	 * Spansion S25FLxxxP
 	 *     - 256KiB and 64KiB sector variants (identified by ext. JEDEC)
+	 *     - S25FL128Px devices do not support DUAL or QUAD I/O
 	 */
 #define S25FLXXXP_FLAG (FLASH_FLAG_READ_WRITE  |	\
 			FLASH_FLAG_READ_1_1_2   |	\
@@ -493,6 +494,12 @@ static struct flash_info flash_types[] = {
 			FLASH_FLAG_READ_FAST)
 	RDID_INFO("s25fl032p", RDID({0x01, 0x02, 0x15, 0x4d, 0x00}), 5,
 		  64 * 1024,  64, S25FLXXXP_FLAG, 80, stfsm_s25fl_config),
+	RDID_INFO("s25fl128p1", RDID({0x01, 0x20, 0x18, 0x03, 0x00}), 5,
+		  256 * 1024, 64,
+		  (FLASH_FLAG_READ_WRITE | FLASH_FLAG_READ_FAST), 104, NULL),
+	RDID_INFO("s25fl128p0", RDID({0x01, 0x20, 0x18, 0x03, 0x01}), 5,
+		  64 * 1024, 256,
+		  (FLASH_FLAG_READ_WRITE | FLASH_FLAG_READ_FAST), 104, NULL),
 	RDID_INFO("s25fl129p0", RDID({0x01, 0x20, 0x18, 0x4d, 0x00}), 5,
 		  256 * 1024,  64, S25FLXXXP_FLAG, 80, stfsm_s25fl_config),
 	RDID_INFO("s25fl129p1", RDID({0x01, 0x20, 0x18, 0x4d, 0x01}), 5,
@@ -506,17 +513,18 @@ static struct flash_info flash_types[] = {
 	 *       so this information is captured in the board's flags.
 	 *     - Supports 'DYB' sector protection. Depending on variant, sectors
 	 *       may default to locked state on power-on.
+	 *     - S25FL127Sx handled as S25FL128Sx
 	 */
 #define S25FLXXXS_FLAG (S25FLXXXP_FLAG         |	\
 			FLASH_FLAG_RESET        |	\
 			FLASH_FLAG_DYB_LOCKING)
-	RDID_INFO("s25fl128s0", RDID({0x01, 0x20, 0x18, 0x03, 0x00}), 5,
+	RDID_INFO("s25fl128s0", RDID({0x01, 0x20, 0x18, 0x4d, 0x00, 0x80}), 6,
 		  256 * 1024, 64, S25FLXXXS_FLAG, 80, stfsm_s25fl_config),
-	RDID_INFO("s25fl128s1", RDID({0x01, 0x20, 0x18, 0x03, 0x01}), 5,
+	RDID_INFO("s25fl128s1", RDID({0x01, 0x20, 0x18, 0x4d, 0x01, 0x80}), 6,
 		  64 * 1024, 256, S25FLXXXS_FLAG, 80, stfsm_s25fl_config),
-	RDID_INFO("s25fl256s0", RDID({0x01, 0x02, 0x19, 0x4d, 0x00}), 5,
+	RDID_INFO("s25fl256s0", RDID({0x01, 0x02, 0x19, 0x4d, 0x00, 0x80}), 6,
 		  256 * 1024, 128, S25FLXXXS_FLAG, 80, stfsm_s25fl_config),
-	RDID_INFO("s25fl256s1", RDID({0x01, 0x02, 0x19, 0x4d, 0x01}), 5,
+	RDID_INFO("s25fl256s1", RDID({0x01, 0x02, 0x19, 0x4d, 0x01, 0x80}), 6,
 		  64 * 1024, 512, S25FLXXXS_FLAG, 80, stfsm_s25fl_config),
 
 #define W25X_FLAG (FLASH_FLAG_READ_WRITE       |	\
-- 
1.9.1
