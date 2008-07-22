Received: from mail51.messagelabs.com ([216.82.244.179])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLCSi-0006Wu-0C
	for linux-mtd@lists.infradead.org; Tue, 22 Jul 2008 07:39:08 +0000
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] [MTD] physmap: Fix suspend/resume/shutdown bugs.
Date: Tue, 22 Jul 2008 09:39:00 +0200
Message-ID: <1216712341-25869-4-git-send-email-Uwe.Kleine-Koenig@digi.com>
In-Reply-To: <1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Robert Jarzmik <rjarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Robert Jarzmik <rjarzmik@free.fr>

Don't call suspend/resume functions if they have not been
defined.

Signed-off-by: Robert Jarzmik <rjarzmik@free.fr>
Acked-By: Joern Engel <joern@logfs.org>
Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
---
 drivers/mtd/maps/physmap.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 183255f..73c770b 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -203,7 +203,8 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
 	int i;
 
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		ret |= info->mtd[i]->suspend(info->mtd[i]);
+		if (info->mtd[i]->suspend)
+			ret |= info->mtd[i]->suspend(info->mtd[i]);
 
 	return ret;
 }
@@ -214,7 +215,8 @@ static int physmap_flash_resume(struct platform_device *dev)
 	int i;
 
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		info->mtd[i]->resume(info->mtd[i]);
+		if (info->mtd[i]->resume)
+			info->mtd[i]->resume(info->mtd[i]);
 
 	return 0;
 }
@@ -225,8 +227,9 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 	int i;
 
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		if (info->mtd[i]->suspend(info->mtd[i]) == 0)
-			info->mtd[i]->resume(info->mtd[i]);
+		if (info->mtd[i]->suspend && info->mtd[i]->resume)
+			if (info->mtd[i]->suspend(info->mtd[i]) == 0)
+				info->mtd[i]->resume(info->mtd[i]);
 }
 #else
 #define physmap_flash_suspend NULL
-- 
1.5.6.3
