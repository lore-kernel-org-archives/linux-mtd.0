Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JZjcr-0002b8-Lo
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 09:21:26 +0000
Date: Thu, 13 Mar 2008 09:22:24 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH] Fix oops on reboot in physmap
Message-ID: <20080313082224.GA2187@logfs.org>
References: <87fxuv816l.fsf@lechat.rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fxuv816l.fsf@lechat.rtp-net.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 March 2008 09:42:42 +0100, Arnaud Patard wrote:
> 
> I sent this patch to David Woodhouse, but I forgot to put the list in
> CC: (and I'm not even sure that I used the right email address :( ). So,
> I'm sending the patch here so everyone can have my fix.

There were various small errors in it, afaics.  Does this patch achieve
the same result for you?

Added dwmw2 on Cc:.  This could be material for -stable.

Jörn

-- 
Prosperity makes friends, adversity tries them.
-- Publilius Syrus

Commit df66e7167ac756baf14d2b8ea7a2cfa056600a93 is adding support for multiple
resources in physmap. On shutdown/supend/resume, it's suspending all resources
by calling mtd[]->suspend() without checking the mtd[] is not null.
This makes oopsing my kernel.

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
Signed-Off-By: Joern Engel <joern@logfs.org>

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index f00e04e..1abecd5 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -204,7 +204,8 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
 
 	if (info)
 		for (i = 0; i < MAX_RESOURCES; i++)
-			ret |= info->mtd[i]->suspend(info->mtd[i]);
+			if (info->mtd[i])
+				ret |= info->mtd[i]->suspend(info->mtd[i]);
 
 	return ret;
 }
@@ -216,7 +217,8 @@ static int physmap_flash_resume(struct platform_device *dev)
 
 	if (info)
 		for (i = 0; i < MAX_RESOURCES; i++)
-			info->mtd[i]->resume(info->mtd[i]);
+			if (info->mtd[i])
+				info->mtd[i]->resume(info->mtd[i]);
 	return 0;
 }
 
@@ -225,9 +227,10 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
 	int i;
 
-	for (i = 0; i < MAX_RESOURCES; i++)
-		if (info && info->mtd[i]->suspend(info->mtd[i]) == 0)
-			info->mtd[i]->resume(info->mtd[i]);
+	if (info)
+		for (i = 0; i < MAX_RESOURCES; i++)
+			if (info->mtd[i] && info->mtd[i]->suspend(info->mtd[i]) == 0)
+				info->mtd[i]->resume(info->mtd[i]);
 }
 #else
 #define physmap_flash_suspend NULL
