Received: from smtp6-g19.free.fr ([212.27.42.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4zvM-0006Df-8U
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 15:01:44 +0000
Received: from smtp6-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp6-g19.free.fr (Postfix) with ESMTP id 5C9445FE38
	for <linux-mtd@lists.infradead.org>;
	Sat,  7 Jun 2008 17:01:42 +0200 (CEST)
Received: from velvet (mur31-2-82-243-122-54.fbx.proxad.net [82.243.122.54])
	by smtp6-g19.free.fr (Postfix) with ESMTP id 178DC5FE36
	for <linux-mtd@lists.infradead.org>;
	Sat,  7 Jun 2008 17:01:41 +0200 (CEST)
To: linux-mtd@lists.infradead.org
Subject: physmap without MTD partitions
From: Robert Jarzmik <rjarzmik@free.fr>
Date: 07 Jun 2008 17:01:41 +0200
Message-ID: <87y75hz3u2.fsf@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=

Hello,

I'm using physmap driver without MTD partitions (accessing the memory directly
through /dev/mtd0).
On suspend/resume/shutdown I get kernel stacks.

This is my configuration :
CONFIG_ARCH_MTD_XIP=y
CONFIG_MTD=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_ROM=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x00000000
CONFIG_MTD_PHYSMAP_LEN=0x0
CONFIG_MTD_PHYSMAP_BANKWIDTH=2

This is the patch I used to solve the problem. Would someone consider
merging/reviewing it please ?

--
Robert


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment;
	filename=0001-Fix-suspend-resume-shutdown-bugs.patch

>From 048b1131b186640c6d99be371698a035069f0fc8 Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <rjarzmik@free.fr>
Date: Sat, 7 Jun 2008 16:59:05 +0200
Subject: [PATCH] Fix suspend/resume/shutdown bugs.

Don't call suspend/resume functions if they have not been
defined.

Signed-off-by: Robert Jarzmik <rjarzmik@free.fr>
---
 drivers/mtd/maps/physmap.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 183255f..541d582 100644
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
@@ -213,8 +214,10 @@ static int physmap_flash_resume(struct platform_device *dev)
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
 	int i;
 
+	return 0;
 	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		info->mtd[i]->resume(info->mtd[i]);
+		if (info->mtd[i]->resume)
+			info->mtd[i]->resume(info->mtd[i]);
 
 	return 0;
 }
@@ -225,8 +228,9 @@ static void physmap_flash_shutdown(struct platform_device *dev)
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
1.5.5.3


--=-=-=--
