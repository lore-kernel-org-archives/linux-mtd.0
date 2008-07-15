Received: from mail29.messagelabs.com ([216.82.249.147])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KIkSe-0003it-NN
	for linux-mtd@lists.infradead.org; Tue, 15 Jul 2008 13:20:57 +0000
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] physmap: only call suspend and resume callbacks if
	non-NULL
Date: Tue, 15 Jul 2008 15:14:11 +0200
Message-ID: <1216127652-2318-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
In-Reply-To: <20080715130316.GA1617@digi.com>
References: <20080715130316.GA1617@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
---
 drivers/mtd/maps/physmap.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 183255f..f04061f 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -202,8 +202,10 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
 	int ret = 0;
 	int i;
 
-	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		ret |= info->mtd[i]->suspend(info->mtd[i]);
+	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++) {
+		if (info->mtd[i]->suspend)
+			ret |= info->mtd[i]->suspend(info->mtd[i]);
+	}
 
 	return ret;
 }
@@ -213,8 +215,10 @@ static int physmap_flash_resume(struct platform_device *dev)
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
 	int i;
 
-	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		info->mtd[i]->resume(info->mtd[i]);
+	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++) {
+		if (info->mtd[i]->resume)
+			info->mtd[i]->resume(info->mtd[i]);
+	}
 
 	return 0;
 }
-- 
1.5.6.2
