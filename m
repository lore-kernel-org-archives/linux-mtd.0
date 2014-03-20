Received: from mail-we0-f173.google.com ([74.125.82.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQati-0003p9-0M
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:12:40 +0000
Received: by mail-we0-f173.google.com with SMTP id w61so462290wes.4
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 04:12:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH 4/5] mtd: st_spi_fsm: Allow loop to run at least once before
 giving up CPU
Date: Thu, 20 Mar 2014 11:11:46 +0000
Message-Id: <1395313907-25318-5-git-send-email-lee.jones@linaro.org>
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
 drivers/mtd/devices/st_spi_fsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 9de753d..921b44a 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -860,8 +860,6 @@ static uint8_t stfsm_wait_busy(struct stfsm *fsm)
 	 */
 	deadline = jiffies + FLASH_MAX_BUSY_WAIT;
 	while (!timeout) {
-		cond_resched();
-
 		if (time_after_eq(jiffies, deadline))
 			timeout = 1;
 
@@ -880,6 +878,8 @@ static uint8_t stfsm_wait_busy(struct stfsm *fsm)
 		if (!timeout)
 			/* Restart */
 			writel(seq->seq_cfg, fsm->base + SPI_FAST_SEQ_CFG);
+
+		cond_resched();
 	}
 
 	dev_err(fsm->dev, "timeout on wait_busy\n");
-- 
1.8.3.2
