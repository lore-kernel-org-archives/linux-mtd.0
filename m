Received: from mail-wg0-f44.google.com ([74.125.82.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSqsG-0004YV-I9
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 16:40:27 +0000
Received: by mail-wg0-f44.google.com with SMTP id m15so1499892wgh.27
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 09:39:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/15] mtd: st_spi_fsm: Add Spansion S25FL032P to device table
Date: Wed, 26 Mar 2014 16:39:19 +0000
Message-Id: <1395851969-13520-6-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
References: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 lee.jones@linaro.org, kernel@stlinux.com, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Angus Clark <angus.clark@st.com>

Add Spansion S25FL032P to the list of known devices.

Signed-off-by: Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index d6b352e..148c86f 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -413,6 +413,8 @@ static struct flash_info flash_types[] = {
 			FLASH_FLAG_READ_1_4_4   |	\
 			FLASH_FLAG_WRITE_1_1_4  |	\
 			FLASH_FLAG_READ_FAST)
+	{ "s25fl032p",  0x010215, 0x4d00,  64 * 1024,  64, S25FLXXXP_FLAG, 80,
+	  stfsm_s25fl_config},
 	{ "s25fl129p0", 0x012018, 0x4d00, 256 * 1024,  64, S25FLXXXP_FLAG, 80,
 	  stfsm_s25fl_config },
 	{ "s25fl129p1", 0x012018, 0x4d01,  64 * 1024, 256, S25FLXXXP_FLAG, 80,
-- 
1.8.3.2
