Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZs2-0005Ki-7a
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:10 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7g74O010014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:42:07 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: fix bulk-read handling uptodate pages
Date: Tue, 30 Sep 2008 12:19:15 +0300
Message-Id: <1222766358-21886-20-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Adrian Hunter <ext-adrian.hunter@nokia.com>

Bulk-read skips uptodate pages but this was putting its
array index out and causing it to treat subsequent pages
as holes.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 fs/ubifs/file.c |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 2f20a49..51cf511 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -595,7 +595,7 @@ out:
 static int populate_page(struct ubifs_info *c, struct page *page,
 			 struct bu_info *bu, int *n)
 {
-	int i = 0, nn = *n, offs = bu->zbranch[0].offs, hole = 1, read = 0;
+	int i = 0, nn = *n, offs = bu->zbranch[0].offs, hole = 0, read = 0;
 	struct inode *inode = page->mapping->host;
 	loff_t i_size = i_size_read(inode);
 	unsigned int page_block;
@@ -609,6 +609,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 
 	end_index = (i_size - 1) >> PAGE_CACHE_SHIFT;
 	if (!i_size || page->index > end_index) {
+		hole = 1;
 		memset(addr, 0, PAGE_CACHE_SIZE);
 		goto out_hole;
 	}
@@ -617,10 +618,10 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 	while (1) {
 		int err, len, out_len, dlen;
 
-		if (nn >= bu->cnt ||
-		    key_block(c, &bu->zbranch[nn].key) != page_block)
+		if (nn >= bu->cnt) {
+			hole = 1;
 			memset(addr, 0, UBIFS_BLOCK_SIZE);
-		else {
+		} else if (key_block(c, &bu->zbranch[nn].key) == page_block) {
 			struct ubifs_data_node *dn;
 
 			dn = bu->buf + (bu->zbranch[nn].offs - offs);
@@ -643,8 +644,13 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 				memset(addr + len, 0, UBIFS_BLOCK_SIZE - len);
 
 			nn += 1;
-			hole = 0;
 			read = (i << UBIFS_BLOCK_SHIFT) + len;
+		} else if (key_block(c, &bu->zbranch[nn].key) < page_block) {
+			nn += 1;
+			continue;
+		} else {
+			hole = 1;
+			memset(addr, 0, UBIFS_BLOCK_SIZE);
 		}
 		if (++i >= UBIFS_BLOCKS_PER_PAGE)
 			break;
-- 
1.5.4.1
