Received: from mail-we0-f181.google.com ([74.125.82.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQati-0003pA-00
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:12:40 +0000
Received: by mail-we0-f181.google.com with SMTP id q58so456550wes.26
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 04:12:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH 5/5] mtd: st_spi_fsm: Succinctly reorganise .remove()
Date: Thu, 20 Mar 2014 11:11:47 +0000
Message-Id: <1395313907-25318-6-git-send-email-lee.jones@linaro.org>
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
 drivers/mtd/devices/st_spi_fsm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 921b44a..bea1416 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2081,13 +2081,8 @@ static int stfsm_probe(struct platform_device *pdev)
 static int stfsm_remove(struct platform_device *pdev)
 {
 	struct stfsm *fsm = platform_get_drvdata(pdev);
-	int err;
 
-	err = mtd_device_unregister(&fsm->mtd);
-	if (err)
-		return err;
-
-	return 0;
+	return mtd_device_unregister(&fsm->mtd);
 }
 
 static struct of_device_id stfsm_match[] = {
-- 
1.8.3.2
