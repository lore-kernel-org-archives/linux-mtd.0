Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6oEB-0005Qb-MZ
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 18:10:16 +0000
Received: by vws8 with SMTP id 8so5279436vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 11:10:13 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] JFFS2: Retry Medium Scan Buffer Allocations
Date: Mon,  4 Apr 2011 11:10:01 -0700
Message-Id: <1301940601-9919-1-git-send-email-marathon96@gmail.com>
In-Reply-To: <1301707797-9458-1-git-send-email-marathon96@gmail.com>
References: <1301707797-9458-1-git-send-email-marathon96@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When handling a JFFS2 medium scan request exponentially back off on
the size of the requested scan buffer until it succeeds or until the
requested scan buffer size falls below a page. This helps ensure the
allocation and subsequent scan operation can succeed under low-memory,
highly-fragmented situations albeit somewhat more slowly.

  v2: Added __GFP_NOWARN flag as recommended by Artem.

Signed-off-by: Grant Erickson <marathon96@gmail.com>
---
 fs/jffs2/scan.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index b632ddd..4d8746d 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -118,11 +118,14 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 			buf_size = PAGE_SIZE;
 
 		/* Respect kmalloc limitations */
-		if (buf_size > 128*1024)
-			buf_size = 128*1024;
+		buf_size = min_t(uint32_t, buf_size, 128*1024);
+
+		do {
+			D1(printk(KERN_DEBUG "Trying to allocate readbuf of %d "
+					  "bytes\n", buf_size));
+			flashbuf = kmalloc(buf_size, GFP_KERNEL | __GFP_NOWARN);
+		} while (!flashbuf && ((buf_size >>= 1) >= PAGE_SIZE));
 
-		D1(printk(KERN_DEBUG "Allocating readbuf of %d bytes\n", buf_size));
-		flashbuf = kmalloc(buf_size, GFP_KERNEL);
 		if (!flashbuf)
 			return -ENOMEM;
 	}
-- 
1.7.4.2
