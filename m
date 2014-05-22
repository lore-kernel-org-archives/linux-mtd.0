Received: from mail-ig0-f176.google.com ([209.85.213.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnR77-0003eH-73
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:24:46 +0000
Received: by mail-ig0-f176.google.com with SMTP id hl10so7448966igb.3
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:24:23 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] mtd: st_spi_fsm: Add support for Micron N25Q512A
Date: Thu, 22 May 2014 12:24:01 +0100
Message-Id: <1400757848-18075-4-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Nunzio Raciti <nunzio.raciti@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Nunzio Raciti <nunzio.raciti@st.com>

This patch adds support for the Micron N25Q512A device as required
by the B2147 (STiD127) board.

Signed-off-by: Nunzio Raciti <nunzio.raciti@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index fe54533..67ea35e 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -374,6 +374,8 @@ static struct flash_info flash_types[] = {
 	  stfsm_n25q_config },
 	{ "n25q256", 0x20ba19, 0, 64 * 1024,  512,
 	  N25Q_FLAG | FLASH_FLAG_32BIT_ADDR, 108, stfsm_n25q_config },
+	{ "n25q512", 0x20ba20, 0, 64 * 1024,  1024,
+	  N25Q_FLAG | FLASH_FLAG_32BIT_ADDR, 108, stfsm_n25q_config},
 
 	/*
 	 * Spansion S25FLxxxP
-- 
1.8.3.2
