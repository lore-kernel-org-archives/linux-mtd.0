Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRfky-0008Um-7w
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 08:26:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: Replace yield() with cond_resched()
Date: Tue,  8 May 2012 10:26:42 +0200
Message-Id: <1336465602-12627-1-git-send-email-richard@nod.at>
Cc: peterz@infradead.org, Richard Weinberger <richard@nod.at>,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comment above yield()'s definition says:
 * If you want to use yield() to wait for something, use wait_event().
 * If you want to use yield() to be 'nice' for others, use cond_resched().
 * If you still want to use yield(), do not!

The yield() usage of UBI really looks like the "be nice for others" case,
so use cond_resched().

Signed-off-by: Richard Weinberger <richard@nod.at>
CC: peterz@infradead.org
---
 drivers/mtd/ubi/io.c |    6 +++---
 drivers/mtd/ubi/wl.c |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 43f1a00..a125ef6 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -192,7 +192,7 @@ retry:
 			dbg_io("error %d%s while reading %d bytes from PEB "
 			       "%d:%d, read only %zd bytes, retry",
 			       err, errstr, len, pnum, offset, read);
-			yield();
+			cond_resched();
 			goto retry;
 		}
 
@@ -366,7 +366,7 @@ retry:
 		if (retries++ < UBI_IO_RETRIES) {
 			dbg_io("error %d while erasing PEB %d, retry",
 			       err, pnum);
-			yield();
+			cond_resched();
 			goto retry;
 		}
 		ubi_err("cannot erase PEB %d, error %d", pnum, err);
@@ -384,7 +384,7 @@ retry:
 	if (ei.state == MTD_ERASE_FAILED) {
 		if (retries++ < UBI_IO_RETRIES) {
 			dbg_io("error while erasing PEB %d, retry", pnum);
-			yield();
+			cond_resched();
 			goto retry;
 		}
 		ubi_err("cannot erase PEB %d", pnum);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7c1a9bf..f2f9056 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1243,7 +1243,7 @@ retry:
 		 */
 		spin_unlock(&ubi->wl_lock);
 		dbg_wl("the PEB %d is not in proper tree, retry", pnum);
-		yield();
+		cond_resched();
 		goto retry;
 	}
 
-- 
1.7.6.4
