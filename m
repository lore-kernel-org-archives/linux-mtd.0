Received: from lechat.rtp-net.org ([88.191.19.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZin6-0003NN-8F
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 08:27:56 +0000
Received: from lechat.rtp-net.org (localhost [127.0.0.1])
	by lechat.rtp-net.org (Postfix) with ESMTP id CD7211006C
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Mar 2008 09:42:42 +0100 (CET)
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix oops on reboot in physmap
Date: Thu, 13 Mar 2008 09:42:42 +0100
Message-ID: <87fxuv816l.fsf@lechat.rtp-net.org>
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

Hi,

I sent this patch to David Woodhouse, but I forgot to put the list in
CC: (and I'm not even sure that I used the right email address :( ). So,
I'm sending the patch here so everyone can have my fix.


Thanks,
Arnaud


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=physmap_change.patch

Commit df66e7167ac756baf14d2b8ea7a2cfa056600a93 is adding support for multiple 
resources in physmap. On shutdown/supend/resume, it's suspending all resources
by calling mtd[]->suspend() without checking the mtd[] is not null.
This makes oopsing my kernel.


Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/mach-iop32x/em7210.c |   10 	6 +	4 -	0 !
 drivers/mtd/maps/physmap.c    |    8 	5 +	3 -	0 !
 2 files changed, 11 insertions(+), 7 deletions(-)

Index: linux-2.6/drivers/mtd/maps/physmap.c
===================================================================
--- linux-2.6.orig/drivers/mtd/maps/physmap.c	2008-03-02 15:37:20.000000000 +0100
+++ linux-2.6/drivers/mtd/maps/physmap.c	2008-03-02 15:43:18.000000000 +0100
@@ -204,7 +204,8 @@ static int physmap_flash_suspend(struct 
 
 	if (info)
 		for (i = 0; i < MAX_RESOURCES; i++)
-			ret |= info->mtd[i]->suspend(info->mtd[i]);
+			if (info && info->mtd[i])
+				ret |= info->mtd[i]->suspend(info->mtd[i]);
 
 	return ret;
 }
@@ -216,7 +217,8 @@ static int physmap_flash_resume(struct p
 
 	if (info)
 		for (i = 0; i < MAX_RESOURCES; i++)
-			info->mtd[i]->resume(info->mtd[i]);
+			if (info && info->mtd[i])
+				info->mtd[i]->resume(info->mtd[i]);
 	return 0;
 }
 
@@ -226,7 +228,7 @@ static void physmap_flash_shutdown(struc
 	int i;
 
 	for (i = 0; i < MAX_RESOURCES; i++)
-		if (info && info->mtd[i]->suspend(info->mtd[i]) == 0)
+		if (info && info->mtd[i] &&  info->mtd[i]->suspend(info->mtd[i]) == 0)
 			info->mtd[i]->resume(info->mtd[i]);
 }
 #else

--=-=-=--
