Received: from mail-yk0-f182.google.com ([209.85.160.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwTYS-000473-Ml
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 10:22:37 +0000
Received: by mail-yk0-f182.google.com with SMTP id 131so7763135ykp.41
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 02:22:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 04/11] mtd: st_spi_fsm: Add support for Micron
 N25Q512A
Date: Thu,  4 Dec 2014 10:21:45 +0000
Message-Id: <1417688512-7644-5-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
References: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 lee.jones@linaro.org, kernel@stlinux.com, Nunzio Raciti <nunzio.raciti@st.com>
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
index 35eb475..1e79e9b 100644
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
1.9.1
