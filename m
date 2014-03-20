Received: from mail-wg0-f45.google.com ([74.125.82.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQate-0003oo-JQ
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:12:32 +0000
Received: by mail-wg0-f45.google.com with SMTP id l18so469499wgh.4
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 04:12:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH 2/5] mtd: st_spi_fsm: Avoid duplicating MTD core code
Date: Thu, 20 Mar 2014 11:11:44 +0000
Message-Id: <1395313907-25318-3-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395313907-25318-1-git-send-email-lee.jones@linaro.org>
References: <1395313907-25318-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, lee.jones@linaro.org,
 kernel@stlinux.com, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reported-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index dcc1dc3..27f9ec9 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -1728,14 +1728,6 @@ static int stfsm_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(fsm->dev, "%s to 0x%08x, len %zd\n", __func__, (u32)to, len);
 
-	*retlen = 0;
-
-	if (!len)
-		return 0;
-
-	if (to + len > mtd->size)
-		return -EINVAL;
-
 	/* Offset within page */
 	page_offs = to % FLASH_PAGESIZE;
 
-- 
1.8.3.2
