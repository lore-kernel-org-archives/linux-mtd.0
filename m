From: Wolfram Sang <wsa@the-dreams.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: elm: compile suspend/resume only with PM_SLEEP
Date: Thu, 17 Apr 2014 09:39:07 +0200
Message-Id: <1397720349-5825-1-git-send-email-wsa@the-dreams.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Wolfram Sang <wsa@the-dreams.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wolfram Sang <wsa@sang-engineering.com>

Fixes:
drivers/mtd/devices/elm.c:480:12: warning: 'elm_suspend' defined but not used [-Wunused-function]
drivers/mtd/devices/elm.c:488:12: warning: 'elm_resume' defined but not used [-Wunused-function]

Signed-off-by: Wolfram Sang <wsa@sang-engineering.com>
---
 drivers/mtd/devices/elm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 1fd4a0f77967..0a037b15c11b 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -418,6 +418,7 @@ static int elm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
 /**
  * elm_context_save
  * saves ELM configurations to preserve them across Hardware powered-down
@@ -509,6 +510,7 @@ static int elm_resume(struct device *dev)
 	elm_context_restore(info);
 	return 0;
 }
+#endif
 
 static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
 
-- 
1.9.1
