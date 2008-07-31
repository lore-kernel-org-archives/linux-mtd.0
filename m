Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1217491258.9432.20.camel@sauron>
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
	<1217481315.9048.64.camel@sauron>
	<200807302356.29835.david-b@pacbell.net>
	<1217491258.9432.20.camel@sauron>
Content-Type: text/plain
Date: Thu, 31 Jul 2008 09:48:15 +0100
Message-Id: <1217494095.3454.55.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	trimarchimichael@yahoo.it, jwboyer@gmail.com,
	akpm@linux-foundation.org, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-07-31 at 11:00 +0300, Artem Bityutskiy wrote:
> I've just glanced to JFFS2, and this sum_buf does not have to be of
> eraseblock size. It should be something like a couple of NAND pages in
> size, or, say, 5-10% of eraseblock size. So I would say, in this
> particular case JFFS2 may be fixed an kmalloc() may be used.

That's a reasonable answer in the short term; good idea. And we don't
have to worry too much about proving a lower bound on the size we'll
want to use for the summary -- because the summary is optional, it's OK
just to abort it if it would have overflowed our truncated buffer. 

Something like this should do the trick...

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 629af01..6caf1e1 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -23,6 +23,8 @@
 
 int jffs2_sum_init(struct jffs2_sb_info *c)
 {
+	uint32_t sum_size = max_t(uint32_t, c->sector_size, MAX_SUMMARY_SIZE);
+
 	c->summary = kzalloc(sizeof(struct jffs2_summary), GFP_KERNEL);
 
 	if (!c->summary) {
@@ -30,7 +32,7 @@ int jffs2_sum_init(struct jffs2_sb_info *c)
 		return -ENOMEM;
 	}
 
-	c->summary->sum_buf = vmalloc(c->sector_size);
+	c->summary->sum_buf = kmalloc(sum_size, GFP_KERNEL);
 
 	if (!c->summary->sum_buf) {
 		JFFS2_WARNING("Can't allocate buffer for writing out summary information!\n");
@@ -49,7 +51,7 @@ void jffs2_sum_exit(struct jffs2_sb_info *c)
 
 	jffs2_sum_disable_collecting(c->summary);
 
-	vfree(c->summary->sum_buf);
+	kfree(c->summary->sum_buf);
 	c->summary->sum_buf = NULL;
 
 	kfree(c->summary);
@@ -665,7 +667,7 @@ crc_err:
 /* Write summary data to flash - helper function for jffs2_sum_write_sumnode() */
 
 static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
-					uint32_t infosize, uint32_t datasize, int padsize)
+				uint32_t infosize, uint32_t datasize, int padsize)
 {
 	struct jffs2_raw_summary isum;
 	union jffs2_sum_mem *temp;
@@ -676,6 +678,26 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
 	int ret;
 	size_t retlen;
 
+	if (padsize + datasize > MAX_SUMMARY_SIZE) {
+		/* It won't fit in the buffer. Abort summary for this jeb */
+		jffs2_sum_disable_collecting(c->summary);
+
+		JFFS2_WARNING("Summary too big (%d data, %d pad) in eraseblock at %08x\n",
+			      datasize, padsize, jeb->offset);
+		/* Non-fatal */
+		return 0;
+	}
+	/* Is there enough space for summary? */
+	if (padsize < 0) {
+		/* don't try to write out summary for this jeb */
+		jffs2_sum_disable_collecting(c->summary);
+
+		JFFS2_WARNING("Not enough space for summary, padsize = %d\n",
+			      padsize);
+		/* Non-fatal */
+		return 0;
+	}
+
 	memset(c->summary->sum_buf, 0xff, datasize);
 	memset(&isum, 0, sizeof(isum));
 
@@ -821,7 +843,7 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 {
 	int datasize, infosize, padsize;
 	struct jffs2_eraseblock *jeb;
-	int ret;
+	int ret = 0;
 
 	dbg_summary("called\n");
 
@@ -841,16 +863,6 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 	infosize += padsize;
 	datasize += padsize;
 
-	/* Is there enough space for summary? */
-	if (padsize < 0) {
-		/* don't try to write out summary for this jeb */
-		jffs2_sum_disable_collecting(c->summary);
-
-		JFFS2_WARNING("Not enough space for summary, padsize = %d\n", padsize);
-		spin_lock(&c->erase_completion_lock);
-		return 0;
-	}
-
 	ret = jffs2_sum_write_data(c, jeb, infosize, datasize, padsize);
 	spin_lock(&c->erase_completion_lock);
 	return ret;
diff --git a/fs/jffs2/summary.h b/fs/jffs2/summary.h
index 8bf34f2..60207a2 100644
--- a/fs/jffs2/summary.h
+++ b/fs/jffs2/summary.h
@@ -13,6 +13,12 @@
 #ifndef JFFS2_SUMMARY_H
 #define JFFS2_SUMMARY_H
 
+/* Limit summary size to 64KiB so that we can kmalloc it. If the summary
+   is larger than that, we have to just ditch it and avoid using summary
+   for the eraseblock in question... and it probably doesn't hurt us much
+   anyway. */
+#define MAX_SUMMARY_SIZE 65536
+
 #include <linux/uio.h>
 #include <linux/jffs2.h>
 



-- 
dwmw2
