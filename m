Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgkhe-0000gw-P6
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:09:33 -0500
Date: Tue, 21 Dec 2004 15:09:23 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221140923.GY22636@wohnheim.fh-wedel.de>
References: <20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
	<20041221140219.GU22636@wohnheim.fh-wedel.de>
	<20041221140322.GV22636@wohnheim.fh-wedel.de>
	<20041221140446.GW22636@wohnheim.fh-wedel.de>
	<20041221140617.GX22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221140617.GX22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/22] Fold various erase functions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After the previous 18 patches and your work, it becomes obvious that
write_pages() is effectively two functions with very little overlap.
This patch moves the erase part of that function out and simplifies
it.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |  117 ++++++++++++++++++++++++++++++-------------------------------
 1 files changed, 58 insertions(+), 59 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_erase	2004-12-21 01:52:12.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-21 02:12:15.000000000 +0100
@@ -121,70 +121,35 @@
  * part of the page being modified. Pages are added to the bio and then written
  * out.
  */
-
-static int write_pages(struct blockmtd_dev *dev, const u_char *buf, loff_t to, size_t len, size_t *retlen)
+static int my_read(struct page **page, struct address_space *mapping, int index)
+{
+	int err = 0;
+	
+	*page = page_readahead(mapping, index);
+	if (unlikely(!*page)) {
+		ERROR("unable to read page (%d) in write_pages\n", index);
+		err = -ENOMEM;
+	}
+	if (IS_ERR(*page))
+		err = PTR_ERR(*page);
+	if (err)
+		printk("READ ERROR\n");
+	return err;
+}
+static int write_pages(struct blockmtd_dev *dev, const u_char *buf, loff_t to,
+		size_t len, size_t *retlen)
 {
 	struct	page *page;
 	struct	address_space *mapping = dev->blkdev->bd_inode->i_mapping;
-	//
 	int	err	= 0;			// return status
 	int	index	= to >> PAGE_SHIFT;	// page index
 	int	offset 	= to & ~PAGE_MASK;	// page offset
-	//
-
-	static int my_read(void)
-	{
-		err=0;
-		page = page_readahead(mapping,index);
-		if( unlikely(!page) ) {
-			ERROR("unable to read page (%d) in write_pages\n", index);
-			err=-ENOMEM;
-		}
-		//if(IS_ERR(page)) err=-EIO;
-		if(err) printk("READ ERROR\n");
-		return err;
-	}
-	//
-	static int my_erase(void)
-	{
-		int pages = len >> PAGE_SHIFT;
-		unsigned char *p;
-		unsigned char *max;
-		int format;
-
-		while(pages) {
-			//printk(KERN_INFO "readahead on index (%d)\n",index);
-			if(my_read()) return err;
-
-			max = ((char*)page_address(page)+PAGE_SIZE);
-			format = 0;
-
-			for(p=(unsigned char*)page_address(page); p<max; p++) 
-				if(*p != 0xff) {
-					format=1;
-					break;
-				}
-
-			if(format) {
-				lock_page(page);
-				memset(page_address(page), 0xff, PAGE_SIZE);
-				set_page_dirty(page);
-				unlock_page(page);
-			}
-			page_cache_release(page);
-			pages--;
-			index++;
-		}
-		*retlen = len;
-		return 0;
-	}
 
 	static int my_write(void)
 	{
 		int cpylen;
 
 		if(retlen) *retlen = 0;
-		//printk(KERN_INFO "Write req: %d\n",len);
 		while(len) {
 			if((offset+len) > PAGE_SIZE) 
 				cpylen = PAGE_SIZE - offset;	// multiple pages
@@ -193,7 +158,9 @@
 			//
 			//	Get page
 			//
-			if(my_read()) return err;
+			err = my_read(&page, mapping, index);
+			if (err)
+				return err;
 			//
 			if(memcmp(page_address(page)+offset,buf,cpylen)) {
 				lock_page(page);
@@ -216,29 +183,61 @@
 
 	err=0;
 	down(&dev->write_mutex);
-	err = buf ? my_write() : my_erase();
+	err = my_write();
 	up(&dev->write_mutex);
 	return err;
 }
 
 
 /* erase a specified part of the device */
+static int _blockmtd_erase(struct blockmtd_dev *dev, loff_t to, size_t len)
+{
+	struct address_space *mapping = dev->blkdev->bd_inode->i_mapping;
+	struct page *page;
+	int index = to >> PAGE_SHIFT;	// page index
+	int pages = len >> PAGE_SHIFT;
+	u_long *p;
+	u_long *max;
+
+	while (pages) {
+		page = page_readahead(mapping, index);
+		if (!page)
+			return -ENOMEM;
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		max = (u_long*)page_address(page) + PAGE_SIZE;
+		for (p=(u_long*)page_address(page); p<max; p++) 
+			if (*p != -1UL) {
+				lock_page(page);
+				memset(page_address(page), 0xff, PAGE_SIZE);
+				set_page_dirty(page);
+				unlock_page(page);
+				break;
+			}
+
+		page_cache_release(page);
+		pages--;
+		index++;
+	}
+	return 0;
+}
 static int blockmtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct blockmtd_dev *dev = mtd->priv;
 	size_t from = instr->addr;
 	size_t len = instr->len;
-	size_t retlen;
 	int err;
 
 	instr->state = MTD_ERASING;
-	err = write_pages(dev, NULL, from, len, &retlen);
-	if (err || retlen != len) {
+	down(&dev->write_mutex);
+	err = _blockmtd_erase(dev, from, len);
+	up(&dev->write_mutex);
+	if (err) {
 		ERROR("erase failed err = %d", err);
 		instr->state = MTD_ERASE_FAILED;
-	} else {
+	} else
 		instr->state = MTD_ERASE_DONE;
-	}
 
 	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
