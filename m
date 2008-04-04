Date: Fri, 4 Apr 2008 10:06:59 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, nico@cam.org, joern@logfs.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
Message-ID: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: akpm@linux-foundation.org, haokexin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

CFI driver in 2.6.24 kernel is broken. Not so intensive read/write operations cause incomplete writes which lead to kernel panics in JFFS2. 
We investigated the issue - it is caused by bug in FL_SHUTDOWN parsing code. Sometimes chip returns -EIO as if it is in FL_SHUTDOWN state when it should wait in FL_PONT (error in order of conditions).

The following patch fixes the problem. 
Could you please include it?

Signed-off-by: Alexey Korolev <akorolev@infradead.org>

diff -aurpp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-02-11 08:51:11.000000000 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-04-04 12:46:24.000000000 +0400
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
 
-	case FL_SHUTDOWN:
-		/* The machine is rebooting now,so no one can get chip anymore */
-		return -EIO;
 	default:
 	sleep:
 		set_current_state(TASK_UNINTERRUPTIBLE);

Thanks,
Alexey
