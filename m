Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgkj0-0000hm-6M
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:10:58 -0500
Date: Tue, 21 Dec 2004 15:10:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221141042.GZ22636@wohnheim.fh-wedel.de>
References: <20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
	<20041221140219.GU22636@wohnheim.fh-wedel.de>
	<20041221140322.GV22636@wohnheim.fh-wedel.de>
	<20041221140446.GW22636@wohnheim.fh-wedel.de>
	<20041221140617.GX22636@wohnheim.fh-wedel.de>
	<20041221140923.GY22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221140923.GY22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 20/22] Fold various write functions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the erase half gone, the remaining write part can be folded into
blockmtd_write as well.  Here we go.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |  126 ++++++++++++++++++++++---------------------------------------
 1 files changed, 46 insertions(+), 80 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_write	2004-12-21 02:12:15.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-21 02:19:58.000000000 +0100
@@ -102,91 +102,13 @@
 	}
 }
 
+
 static struct page* page_readahead(struct address_space *mapping, int index)
 {
 	filler_t *filler = (filler_t*)(mapping->a_ops->readpage);
 	cache_readahead(mapping,index);
 	return read_cache_page(mapping, index, filler, NULL);
 }
-/**
- * write_pages - write block of data to device via the page cache
- * @dev: device to write to
- * @buf: data source or NULL if erase (output is set to 0xff)
- * @to: offset into output device
- * @len: amount to data to write
- * @retlen: amount of data written
- *
- * Grab pages from the page cache and fill them with the source data.
- * Non page aligned start and end result in a readin of the page and
- * part of the page being modified. Pages are added to the bio and then written
- * out.
- */
-static int my_read(struct page **page, struct address_space *mapping, int index)
-{
-	int err = 0;
-	
-	*page = page_readahead(mapping, index);
-	if (unlikely(!*page)) {
-		ERROR("unable to read page (%d) in write_pages\n", index);
-		err = -ENOMEM;
-	}
-	if (IS_ERR(*page))
-		err = PTR_ERR(*page);
-	if (err)
-		printk("READ ERROR\n");
-	return err;
-}
-static int write_pages(struct blockmtd_dev *dev, const u_char *buf, loff_t to,
-		size_t len, size_t *retlen)
-{
-	struct	page *page;
-	struct	address_space *mapping = dev->blkdev->bd_inode->i_mapping;
-	int	err	= 0;			// return status
-	int	index	= to >> PAGE_SHIFT;	// page index
-	int	offset 	= to & ~PAGE_MASK;	// page offset
-
-	static int my_write(void)
-	{
-		int cpylen;
-
-		if(retlen) *retlen = 0;
-		while(len) {
-			if((offset+len) > PAGE_SIZE) 
-				cpylen = PAGE_SIZE - offset;	// multiple pages
-			else	cpylen = len;			// this page
-			len = len - cpylen;
-			//
-			//	Get page
-			//
-			err = my_read(&page, mapping, index);
-			if (err)
-				return err;
-			//
-			if(memcmp(page_address(page)+offset,buf,cpylen)) {
-				lock_page(page);
-				memcpy(page_address(page) + offset,buf, cpylen);
-				set_page_dirty(page);
-				unlock_page(page);
-			}
-			page_cache_release(page);
-
-			if(retlen) *retlen += cpylen;
-			//
-			buf+=cpylen;
-			offset = 0;
-			index++;
-			//
-		}
-		//printk(KERN_INFO "Write act: %d\n",*retlen);
-		return 0;
-	}
-
-	err=0;
-	down(&dev->write_mutex);
-	err = my_write();
-	up(&dev->write_mutex);
-	return err;
-}
 
 
 /* erase a specified part of the device */
@@ -290,6 +212,48 @@
 
 
 /* write data to the underlying device */
+static int _blockmtd_write(struct blockmtd_dev *dev, const u_char *buf,
+		loff_t to, size_t len, size_t *retlen)
+{
+	struct page *page;
+	struct address_space *mapping = dev->blkdev->bd_inode->i_mapping;
+	int index = to >> PAGE_SHIFT;	// page index
+	int offset = to & ~PAGE_MASK;	// page offset
+	int cpylen;
+
+	if (retlen)
+		*retlen = 0;
+	while (len) {
+		if ((offset+len) > PAGE_SIZE) 
+			cpylen = PAGE_SIZE - offset;	// multiple pages
+		else
+			cpylen = len;			// this page
+		len = len - cpylen;
+
+		//	Get page
+		page = page_readahead(mapping, index);
+		if (!page)
+			return -ENOMEM;
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		if (memcmp(page_address(page)+offset, buf, cpylen)) {
+			lock_page(page);
+			memcpy(page_address(page) + offset, buf, cpylen);
+			set_page_dirty(page);
+			unlock_page(page);
+		}
+		page_cache_release(page);
+
+		if (retlen)
+			*retlen += cpylen;
+
+		buf += cpylen;
+		offset = 0;
+		index++;
+	}
+	return 0;
+}
 static int blockmtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
@@ -303,7 +267,9 @@
 	if (to + len > mtd->size)
 		len = mtd->size - to;
 
-	err = write_pages(dev, buf, to, len, retlen);
+	down(&dev->write_mutex);
+	err = _blockmtd_write(dev, buf, to, len, retlen);
+	up(&dev->write_mutex);
 	if (err > 0)
 		err = 0;
 	return err;
