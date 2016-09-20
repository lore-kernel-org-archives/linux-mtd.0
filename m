Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmGXl-0004gw-9o
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 08:36:48 +0000
Received: by mail-lf0-x241.google.com with SMTP id l131so522085lfl.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2016 01:36:23 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] ubifs: drop softlimit and delta fields from struct
 ubifs_wbuf
Date: Tue, 20 Sep 2016 10:36:14 +0200
Message-Id: <20160920083615.31099-1-zajec5@gmail.com>
In-Reply-To: <20160914102151.21722-1-zajec5@gmail.com>
References: <20160914102151.21722-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

Values of these fields are set during init and never modified. They are
used (read) in a single function only. There isn't really any reason to
keep them in a struct. It only makes struct just a bit bigger without
any visible gain.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 fs/ubifs/io.c    | 18 ++++++++++--------
 fs/ubifs/ubifs.h |  5 -----
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 97be412..4d6ce4a 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -452,16 +452,22 @@ static enum hrtimer_restart wbuf_timer_callback_nolock(struct hrtimer *timer)
  */
 static void new_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
 {
+	ktime_t softlimit = ktime_set(WBUF_TIMEOUT_SOFTLIMIT, 0);
+	unsigned long long delta;
+
+	delta = WBUF_TIMEOUT_HARDLIMIT - WBUF_TIMEOUT_SOFTLIMIT;
+	delta *= 1000000000ULL;
+
 	ubifs_assert(!hrtimer_active(&wbuf->timer));
+	ubifs_assert(delta <= ULONG_MAX);
 
 	if (wbuf->no_timer)
 		return;
 	dbg_io("set timer for jhead %s, %llu-%llu millisecs",
 	       dbg_jhead(wbuf->jhead),
-	       div_u64(ktime_to_ns(wbuf->softlimit), USEC_PER_SEC),
-	       div_u64(ktime_to_ns(wbuf->softlimit) + wbuf->delta,
-		       USEC_PER_SEC));
-	hrtimer_start_range_ns(&wbuf->timer, wbuf->softlimit, wbuf->delta,
+	       div_u64(ktime_to_ns(softlimit), USEC_PER_SEC),
+	       div_u64(ktime_to_ns(softlimit) + delta, USEC_PER_SEC));
+	hrtimer_start_range_ns(&wbuf->timer, softlimit, delta,
 			       HRTIMER_MODE_REL);
 }
 
@@ -1059,10 +1065,6 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 
 	hrtimer_init(&wbuf->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	wbuf->timer.function = wbuf_timer_callback_nolock;
-	wbuf->softlimit = ktime_set(WBUF_TIMEOUT_SOFTLIMIT, 0);
-	wbuf->delta = WBUF_TIMEOUT_HARDLIMIT - WBUF_TIMEOUT_SOFTLIMIT;
-	wbuf->delta *= 1000000000ULL;
-	ubifs_assert(wbuf->delta <= ULONG_MAX);
 	return 0;
 }
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4617d45..11bc8fa 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -644,9 +644,6 @@ typedef int (*ubifs_lpt_scan_callback)(struct ubifs_info *c,
  * @io_mutex: serializes write-buffer I/O
  * @lock: serializes @buf, @lnum, @offs, @avail, @used, @next_ino and @inodes
  *        fields
- * @softlimit: soft write-buffer timeout interval
- * @delta: hard and soft timeouts delta (the timer expire interval is @softlimit
- *         and @softlimit + @delta)
  * @timer: write-buffer timer
  * @no_timer: non-zero if this write-buffer does not have a timer
  * @need_sync: non-zero if the timer expired and the wbuf needs sync'ing
@@ -675,8 +672,6 @@ struct ubifs_wbuf {
 	int (*sync_callback)(struct ubifs_info *c, int lnum, int free, int pad);
 	struct mutex io_mutex;
 	spinlock_t lock;
-	ktime_t softlimit;
-	unsigned long long delta;
 	struct hrtimer timer;
 	unsigned int no_timer:1;
 	unsigned int need_sync:1;
-- 
2.9.3
