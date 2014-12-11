Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xz1dQ-0003sr-Vl
 for linux-mtd@lists.infradead.org; Thu, 11 Dec 2014 11:10:17 +0000
From: <chenjie6@huawei.com>
To: <linux-mtd@lists.infradead.org>, <David.Woodhouse@intel.com>
Subject: [PATCH] [RESEND] jffs2: bugfix of summary length
Date: Fri, 12 Dec 2014 03:03:44 +0800
Message-ID: <1418324624-29697-1-git-send-email-chenjie6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, akpm@linux-foundation.org, lizefan@huawei.com,
 zengweilin@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: chenjie <chenjie6@huawei.com>

When power is off, the magic of summary is writed but the length not 
so the length is 0xffffffff, sumlen maybe very large. 
The kmalloc() failed  and mount failed.
	
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen Jie <chenjie6@huawei.com>
---
 fs/jffs2/scan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 7654e87..6187e56 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -510,6 +510,9 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 				sumlen = c->sector_size - je32_to_cpu(sm->offset);
 				sumptr = buf + buf_size - sumlen;
 
+				if (sumlen > c->sector_size)
+					goto full_scan;
+
 				/* Now, make sure the summary itself is available */
 				if (sumlen > buf_size) {
 					/* Need to kmalloc for this. */
@@ -544,6 +547,7 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 		}
 	}
 
+full_scan:
 	buf_ofs = jeb->offset;
 
 	if (!buf_size) {
-- 
1.8.0
