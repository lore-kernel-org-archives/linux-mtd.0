Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7iXd-0001lV-SW
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 05:45:50 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9I5jVjj004228
	for <linux-mtd@lists.infradead.org>; Mon, 18 Oct 2010 08:45:47 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 2/2] UBIFS: do not forget to cancel timers
Date: Mon, 18 Oct 2010 08:46:09 +0300
Message-Id: <1287380769-8250-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1287380769-8250-1-git-send-email-dedekind1@gmail.com>
References: <1287380769-8250-1-git-send-email-dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a bug-fix: when we unmount, and we are currently in R/O
mode because of an error - we do not sync write-buffers, which
means we also do not cancel write-buffer timers we may possibly
have armed. This patch fixes the issue.

The issue can easily be reproduced by enabling UBIFS failure debug
mode (echo 4 > /sys/module/ubifs/parameters/debug_tsts) and
unmounting as soon as a failure happen. At some point the system
oopses because we have an armed hrtimer but UBIFS is unmounted
already.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 6ff2f80..98695f9 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1772,7 +1772,11 @@ static void ubifs_put_super(struct super_block *sb)
 				 */
 				ubifs_err("failed to write master node, "
 					  "error %d", err);
-		}
+		} else {
+			for (i = 0; i < c->jhead_cnt; i++)
+				/* Make sure write-buffer timers are canceled */
+				hrtimer_cancel(&c->jheads[i].wbuf.timer);
+ 		}
 	}
 
 	ubifs_umount(c);
-- 
1.7.2.3
