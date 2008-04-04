Date: Fri, 4 Apr 2008 13:21:32 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
In-Reply-To: <20080404093359.GA4338@logfs.org>
Message-ID: <Pine.LNX.4.64.0804041310550.10410@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
	<20080404093359.GA4338@logfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: nico@cam.org, haokexin@gmail.com, dwmw2@infradead.org,
	akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 


 CFI driver in 2.6.24 kernel is broken. Not so intensive read/write operations cause incomplete writes which lead to kernel panics in JFFS2. 
 We investigated the issue - it is caused by bug in FL_SHUTDOWN parsing code. Sometimes chip returns -EIO as if it is in FL_SHUTDOWN state when it should wait in FL_PONT (error in order of conditions).

The following patch fixes the bug in state parsing code of CFI. 
Also I've added comments to notify developers if they want to add new case in future.
Please include it.
 
Signed-off-by: Alexey Korolev <akorolev@infradead.org>
Reviewed-By: Joern Engel <joern@logfs.org>

diff -aurpp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-02-11 08:51:11.000000000 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-04-04 15:50:47.000000000 +0400
@@ -669,7 +669,7 @@ static int chip_ready (struct map_info *
 			/* Someone else might have been playing with it. */
 			return -EAGAIN;
 		}
-
+		/* Fall through */
 	case FL_READY:
 	case FL_CFI_QUERY:
 	case FL_JEDEC_QUERY:
@@ -729,14 +729,14 @@ static int chip_ready (struct map_info *
 		chip->state = FL_READY;
 		return 0;
 
+	case FL_SHUTDOWN:
+		/* The machine is rebooting now,so no one can get chip anymore */
+		return -EIO;
 	case FL_POINT:
 		/* Only if there's no operation suspended... */
 		if (mode == FL_READY && chip->oldstate == FL_READY)
 			return 0;
-
-	case FL_SHUTDOWN:
-		/* The machine is rebooting now,so no one can get chip anymore */
-		return -EIO;
+		/* Fall through */
 	default:
 	sleep:
 		set_current_state(TASK_UNINTERRUPTIBLE);
-------------
Thanks,
Alexey
