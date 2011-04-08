Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DyT-0001iI-QM
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:51:55 +0000
Received: by mail-vx0-f177.google.com with SMTP id 2so3424458vxd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 08:51:53 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 3/3] JFFS2: Retry Large Buffer Allocations
Date: Fri,  8 Apr 2011 08:51:34 -0700
Message-Id: <1302277894-26132-4-git-send-email-marathon96@gmail.com>
In-Reply-To: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
References: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace direct call to kmalloc for a potentially large, contiguous
buffer allocation with one to mtd_kmalloc_up_to which helps ensure the
operation can succeed under low-memory, highly- fragmented situations
albeit somewhat more slowly.

Signed-off-by: Grant Erickson <marathon96@gmail.com>
Tested-by: Ben Gardiner <bengardiner at nanometrics.ca>
---
 fs/jffs2/scan.c |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index b632ddd..e393213 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -94,7 +94,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	uint32_t buf_size = 0;
 	struct jffs2_summary *s = NULL; /* summary info collected by the scan process */
 #ifndef __ECOS
-	size_t pointlen;
+	size_t pointlen, try_size;
 
 	if (c->mtd->point) {
 		ret = c->mtd->point(c->mtd, 0, c->mtd->size, &pointlen,
@@ -113,19 +113,21 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 		/* For NAND it's quicker to read a whole eraseblock at a time,
 		   apparently */
 		if (jffs2_cleanmarker_oob(c))
-			buf_size = c->sector_size;
+			try_size = c->sector_size;
 		else
-			buf_size = PAGE_SIZE;
+			try_size = PAGE_SIZE;
 
-		/* Respect kmalloc limitations */
-		if (buf_size > 128*1024)
-			buf_size = 128*1024;
+		D1(printk(KERN_DEBUG "Trying to allocate readbuf of %zu "
+			"bytes\n", try_size));
 
-		D1(printk(KERN_DEBUG "Allocating readbuf of %d bytes\n", buf_size));
-		flashbuf = kmalloc(buf_size, GFP_KERNEL);
+		flashbuf = mtd_kmalloc_up_to(&try_size);
 		if (!flashbuf)
 			return -ENOMEM;
+
+		D1(printk(KERN_DEBUG "Allocated readbuf of %zu bytes\n",
+			try_size));
+
+		buf_size = (uint32_t)try_size;
 	}
 
 	if (jffs2_sum_active()) {
--
1.7.4.2
