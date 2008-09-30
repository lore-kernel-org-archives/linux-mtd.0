Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZs6-0005Lr-8d
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:14 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7gBpH010038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:42:11 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: ensure data read beyond i_size is zeroed out correctly
Date: Tue, 30 Sep 2008 12:19:07 +0300
Message-Id: <1222766358-21886-12-git-send-email-dedekind@infradead.org>
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

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 fs/ubifs/file.c        |   10 ++++++++--
 fs/ubifs/ubifs-media.h |    1 -
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cdcfe95..2f20a49 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -147,6 +147,12 @@ static int do_readpage(struct page *page)
 				err = ret;
 				if (err != -ENOENT)
 					break;
+			} else if (block + 1 == beyond) {
+				int dlen = le32_to_cpu(dn->size);
+				int ilen = i_size & (UBIFS_BLOCK_SIZE - 1);
+
+				if (ilen && ilen < dlen)
+					memset(addr + ilen, 0, dlen - ilen);
 			}
 		}
 		if (++i >= UBIFS_BLOCKS_PER_PAGE)
@@ -601,7 +607,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 
 	addr = zaddr = kmap(page);
 
-	end_index = (i_size + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
+	end_index = (i_size - 1) >> PAGE_CACHE_SHIFT;
 	if (!i_size || page->index > end_index) {
 		memset(addr, 0, PAGE_CACHE_SIZE);
 		goto out_hole;
@@ -649,7 +655,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 	if (end_index == page->index) {
 		int len = i_size & (PAGE_CACHE_SIZE - 1);
 
-		if (len < read)
+		if (len && len < read)
 			memset(zaddr + len, 0, read - len);
 	}
 
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index a9ecbd9..0b37804 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -75,7 +75,6 @@
  */
 #define UBIFS_BLOCK_SIZE  4096
 #define UBIFS_BLOCK_SHIFT 12
-#define UBIFS_BLOCK_MASK  0x00000FFF
 
 /* UBIFS padding byte pattern (must not be first or last byte of node magic) */
 #define UBIFS_PADDING_BYTE 0xCE
-- 
1.5.4.1
