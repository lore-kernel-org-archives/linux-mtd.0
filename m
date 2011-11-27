Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RUXQE-0001s4-WD
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2011 05:37:03 +0000
From: Cong Wang <amwang@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 47/62] ubifs: remove the second argument of k[un]map_atomic()
Date: Sun, 27 Nov 2011 13:27:27 +0800
Message-Id: <1322371662-26166-48-git-send-email-amwang@redhat.com>
In-Reply-To: <1322371662-26166-1-git-send-email-amwang@redhat.com>
References: <1322371662-26166-1-git-send-email-amwang@redhat.com>
Cc: akpm@linux-foundation.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Cong Wang <amwang@redhat.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Cong Wang <amwang@redhat.com>
---
 fs/ubifs/file.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index f9c234b..5c8f6dc 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1042,10 +1042,10 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
 	 * the page size, the remaining memory is zeroed when mapped, and
 	 * writes to that region are not written out to the file."
 	 */
-	kaddr = kmap_atomic(page, KM_USER0);
+	kaddr = kmap_atomic(page);
 	memset(kaddr + len, 0, PAGE_CACHE_SIZE - len);
 	flush_dcache_page(page);
-	kunmap_atomic(kaddr, KM_USER0);
+	kunmap_atomic(kaddr);
 
 	if (i_size > synced_i_size) {
 		err = inode->i_sb->s_op->write_inode(inode, NULL);
-- 
1.7.4.4
