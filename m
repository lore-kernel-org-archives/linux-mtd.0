Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSqs8-0004Y4-7g
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 16:40:19 +0000
Received: by mail-wi0-f177.google.com with SMTP id cc10so2038939wib.10
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 09:39:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/15] mtd: st_spi_fsm: Add Macronix MX25L25655E device
Date: Wed, 26 Mar 2014 16:39:15 +0000
Message-Id: <1395851969-13520-2-git-send-email-lee.jones@linaro.org>
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

Add Macronix MX25L25655E to the list of known devices.

Signed-off-by: Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index bea1416..2471061 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -380,6 +380,9 @@ static struct flash_info flash_types[] = {
 	{ "mx25l25635e", 0xc22019, 0, 64*1024, 512,
 	  (MX25_FLAG | FLASH_FLAG_32BIT_ADDR | FLASH_FLAG_RESET), 70,
 	  stfsm_mx25_config },
+	{ "mx25l25655e", 0xc22619, 0, 64*1024, 512,
+	  (MX25_FLAG | FLASH_FLAG_32BIT_ADDR | FLASH_FLAG_RESET), 70,
+	  stfsm_mx25_config},
 
 #define N25Q_FLAG (FLASH_FLAG_READ_WRITE       |	\
 		   FLASH_FLAG_READ_FAST         |	\
-- 
1.8.3.2
