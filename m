Received: from mail28.messagelabs.com ([216.82.249.131])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLCZF-0007Q6-TM
	for linux-mtd@lists.infradead.org; Tue, 22 Jul 2008 07:45:54 +0000
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] [MTD] physmap: resume already suspended chips on failure
	to suspend
Date: Tue, 22 Jul 2008 09:39:01 +0200
Message-ID: <1216712341-25869-5-git-send-email-Uwe.Kleine-Koenig@digi.com>
In-Reply-To: <1216712341-25869-4-git-send-email-Uwe.Kleine-Koenig@digi.com>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-4-git-send-email-Uwe.Kleine-Koenig@digi.com>
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

A nice side effect of this patch is that the return value of
physmap_flash_suspend in the error path is the value of the first failing
suspend callback and not the bitwise OR of all of them.

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
---
 drivers/mtd/maps/physmap.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 73c770b..3e60e87 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -203,8 +203,19 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
 	int i;
 
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		if (info->mtd[i]->suspend)
-			ret |= info->mtd[i]->suspend(info->mtd[i]);
+		if (info->mtd[i]->suspend) {
+			ret = info->mtd[i]->suspend(info->mtd[i]);
+			if (ret)
+				goto fail;
+		}
+
+	return 0;
+fail:
+	for (--i; i >= 0; --i)
+		if (info->mtd[i]->suspend) {
+			BUG_ON(!info->mtd[i]->resume);
+			info->mtd[i]->resume(info->mtd[i]);
+		}
 
 	return ret;
 }
-- 
1.5.6.3
