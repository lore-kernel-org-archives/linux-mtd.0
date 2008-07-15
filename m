Received: from mail164.messagelabs.com ([216.82.253.131])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KJ1Ph-00036D-R8
	for linux-mtd@lists.infradead.org; Wed, 16 Jul 2008 07:27:02 +0000
Resent-Message-ID: <20080716072656.GA16043@digi.com>
From: "Kleine-Koenig, Uwe" <Uwe.Kleine-Koenig@digi.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 15 Jul 2008 15:14:12 +0200
Subject: [PATCH] [MTD] physmap: resume already suspended chips on failure to
	suspend
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-ID: <DOR-SMS-MAIL1reBBsQ00000021@dor-sms-mail1.digi.com>
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
 drivers/mtd/maps/physmap.c |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index f04061f..814b617 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -203,8 +203,22 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
        int i;

        for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++) {
-               if (info->mtd[i]->suspend)
-                       ret |= info->mtd[i]->suspend(info->mtd[i]);
+               if (info->mtd[i]->suspend) {
+                       ret = info->mtd[i]->suspend(info->mtd[i]);
+                       if (ret)
+                               goto fail;
+
+               }
+       }
+
+       return 0;
+
+fail:
+       for (i; i >= 0; --i) {
+               if (info->mtd[i]->suspend) {
+                       BUG_ON(!info->mtd[i]->resume);
+                       info->mtd[i]->resume(info->mtd[i]);
+               }
        }

        return ret;
--
1.5.6.2
