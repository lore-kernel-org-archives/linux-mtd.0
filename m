Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMXT5-0005NE-Is
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 23:08:00 +0100
Date: Mon, 11 Sep 2006 00:04:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Felix Joussein <felix@joussein.com>
Subject: Re: Overrun end of disk in cache redahead
Message-ID: <20060910220442.GA10482@wohnheim.fh-wedel.de>
References: <45012439.5090001@joussein.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45012439.5090001@joussein.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 8 September 2006 10:05:13 +0200, Felix Joussein wrote:
>
> [...]
> Then I get 3 times "Overrun end of disk in cache redahead"
> [...]
> What am I doing wrong?

Nothing, in principle.  Looks like the readahead code is causing only
trouble for questionable gains.  Can you try the patch below?

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack

Remove readahead from block2mtd.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 drivers/mtd/devices/block2mtd.c |   55 ++--------------------------------------
 1 file changed, 4 insertions(+), 51 deletions(-)

--- slab/drivers/mtd/devices/block2mtd.c~block2mtd	2006-08-11 13:03:22.000000000 +0200
+++ slab/drivers/mtd/devices/block2mtd.c	2006-09-11 00:00:26.000000000 +0200
@@ -39,56 +39,9 @@ struct block2mtd_dev {
 static LIST_HEAD(blkmtd_device_list);
 
 
-#define PAGE_READAHEAD 64
-static void cache_readahead(struct address_space *mapping, int index)
-{
-	filler_t *filler = (filler_t*)mapping->a_ops->readpage;
-	int i, pagei;
-	unsigned ret = 0;
-	unsigned long end_index;
-	struct page *page;
-	LIST_HEAD(page_pool);
-	struct inode *inode = mapping->host;
-	loff_t isize = i_size_read(inode);
-
-	if (!isize) {
-		INFO("iSize=0 in cache_readahead\n");
-		return;
-	}
-
-	end_index = ((isize - 1) >> PAGE_CACHE_SHIFT);
-
-	read_lock_irq(&mapping->tree_lock);
-	for (i = 0; i < PAGE_READAHEAD; i++) {
-		pagei = index + i;
-		if (pagei > end_index) {
-			INFO("Overrun end of disk in cache readahead\n");
-			break;
-		}
-		page = radix_tree_lookup(&mapping->page_tree, pagei);
-		if (page && (!i))
-			break;
-		if (page)
-			continue;
-		read_unlock_irq(&mapping->tree_lock);
-		page = page_cache_alloc_cold(mapping);
-		read_lock_irq(&mapping->tree_lock);
-		if (!page)
-			break;
-		page->index = pagei;
-		list_add(&page->lru, &page_pool);
-		ret++;
-	}
-	read_unlock_irq(&mapping->tree_lock);
-	if (ret)
-		read_cache_pages(mapping, &page_pool, filler, NULL);
-}
-
-
-static struct page* page_readahead(struct address_space *mapping, int index)
+static struct page *readpage(struct address_space *mapping, int index)
 {
 	filler_t *filler = (filler_t*)mapping->a_ops->readpage;
-	cache_readahead(mapping, index);
 	return read_cache_page(mapping, index, filler, NULL);
 }
 
@@ -104,7 +57,7 @@ static int _block2mtd_erase(struct block
 	u_long *max;
 
 	while (pages) {
-		page = page_readahead(mapping, index);
+		page = readpage(mapping, index);
 		if (!page)
 			return -ENOMEM;
 		if (IS_ERR(page))
@@ -174,7 +127,7 @@ static int block2mtd_read(struct mtd_inf
 		len = len - cpylen;
 
 		//      Get page
-		page = page_readahead(dev->blkdev->bd_inode->i_mapping, index);
+		page = readpage(dev->blkdev->bd_inode->i_mapping, index);
 		if (!page)
 			return -ENOMEM;
 		if (IS_ERR(page))
@@ -213,7 +166,7 @@ static int _block2mtd_write(struct block
 		len = len - cpylen;
 
 		//	Get page
-		page = page_readahead(mapping, index);
+		page = readpage(mapping, index);
 		if (!page)
 			return -ENOMEM;
 		if (IS_ERR(page))
