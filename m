Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NX5hl-0006DV-0P
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 04:28:42 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KWH003W38FKJH@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 13:28:32 +0900 (KST)
Received: from amulsaha ([107.108.214.58])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KWH00M0S8FHLC@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 13:28:31 +0900 (KST)
Date: Tue, 19 Jan 2010 09:58:28 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: [PATCH] [JFFS2] Readpages using Read-While-Load feature
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Message-id: <A71F4C904C9343EB9DA2088AEF89D2E3@sisodomain.com>
Content-transfer-encoding: 7BIT
Cc: dedekind@infradead.org, kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

JFFS2-Readpages patch makes use of the Read-While-Load support
present on OneNAND variant devices. There is an increase
in the read-speed by ~13% upon usage of the readpages patch.

Signed-off-by: Rajshekar Hanumantappa Payagond <rajshekar.hp@samsung.com>
Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>
---
 file.c     |   89 ++++++++++++++++
 nodelist.h |    9 +
 read.c     |  333 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 431 insertions(+)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index b7b74e2..eef28af 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -17,6 +17,7 @@
 #include <linux/highmem.h>
 #include <linux/crc32.h>
 #include <linux/jffs2.h>
+#include <linux/pagevec.h>
 #include "nodelist.h"

 static int jffs2_write_end(struct file *filp, struct address_space *mapping,
@@ -26,6 +27,8 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 			loff_t pos, unsigned len, unsigned flags,
 			struct page **pagep, void **fsdata);
 static int jffs2_readpage (struct file *filp, struct page *pg);
+static int jffs2_readpages(struct file *file, struct address_space *mapping,
+			struct list_head *pages, unsigned nr_pages);

 int jffs2_fsync(struct file *filp, struct dentry *dentry, int datasync)
 {
@@ -66,6 +69,7 @@ const struct inode_operations jffs2_file_inode_operations =

 const struct address_space_operations jffs2_file_address_operations =
 {
+	.readpages =	jffs2_readpages,
 	.readpage =	jffs2_readpage,
 	.write_begin =	jffs2_write_begin,
 	.write_end =	jffs2_write_end,
@@ -109,6 +113,91 @@ int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
 	return ret;
 }

+static int jffs2_readpages(struct file *file, struct address_space *mapping,
+			   struct list_head *pages, unsigned nr_pages)
+{
+	struct pagevec lru_pvec;
+	struct page *page;
+	loff_t offset;
+	unsigned int readSize, i;
+	int readCnt = 0, pageaddfailed = 0;
+	unsigned contigPages;
+	unsigned long expectedIndex;
+
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(mapping->host);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(mapping->host->i_sb);
+
+	pagevec_init(&lru_pvec, 0);
+	mutex_lock(&f->sem);
+
+	f->inocache = jffs2_get_ino_cache(c, mapping->host->i_ino);
+	if (unlikely(!f->inocache)) {
+		mutex_unlock(&f->sem);
+		return readCnt;
+	}
+
+	for (i = 0; i < nr_pages; i += contigPages) {
+		if (list_empty(pages))
+			break;
+		expectedIndex = (loff_t)(list_entry(pages->prev, struct page,
+				lru))->index;
+		offset = expectedIndex << PAGE_CACHE_SHIFT;
+
+		contigPages = 0;
+		list_for_each_entry_reverse(page, pages, lru) {
+			if (page->index != expectedIndex)
+				break;
+			if (add_to_page_cache(page, mapping, page->index,
+			GFP_KERNEL)) {
+				printk(KERN_CRIT "%s: Add page cache failed\n",
+					__func__);
+				pageaddfailed = 1;
+				break;
+			}
+			BUG_ON(!PageLocked(page));
+			contigPages++;
+			expectedIndex++;
+		}
+
+		readSize = contigPages * PAGE_CACHE_SIZE;
+		readCnt = jffs2_read_multiple_inode_range(c, f, pages, offset,
+			readSize) & PAGE_CACHE_MASK;
+
+		while (readSize) {
+			page = list_entry(pages->prev, struct page, lru);
+			list_del(&page->lru);
+
+			if (readCnt > 0) {
+				SetPageUptodate(page);
+				ClearPageError(page);
+				readCnt -= PAGE_CACHE_SIZE;
+			} else {
+				ClearPageUptodate(page);
+				SetPageError(page);
+			}
+			flush_dcache_page(page);
+			unlock_page(page);
+			if (!pagevec_add(&lru_pvec, page))
+				pagevec_lru_add_file(&lru_pvec);
+
+			readSize -= PAGE_CACHE_SIZE;
+		}
+
+		if (pageaddfailed) {
+			page = list_entry(pages->prev, struct page, lru);
+			list_del(&page->lru);
+			page_cache_release(page);
+			i++;
+			pageaddfailed = 0;
+		}
+
+	}
+
+	mutex_unlock(&f->sem);
+	pagevec_lru_add_file(&lru_pvec);
+	return readCnt;
+}
+

 static int jffs2_readpage (struct file *filp, struct page *pg)
 {
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 507ed6e..6564b81 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -451,6 +451,15 @@ int jffs2_read_dnode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		     int ofs, int len);
 int jffs2_read_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			   unsigned char *buf, uint32_t offset, uint32_t len);
+int jffs2_read_multiple_inode_range(struct jffs2_sb_info *c,
+		struct jffs2_inode_info *f, struct list_head *pages,
+		uint32_t startofs, uint32_t lentoread);
+int jffs2_read_multiple_dnodes(struct jffs2_sb_info *c,
+		struct jffs2_inode_info *f, struct jffs2_node_frag *frag,
+		struct list_head *pages, uint32_t tobuf, uint32_t startofs,
+		int conlen);
+char *mmemcpy(struct list_head *pages, uint32_t offset, char *src,
+		uint32_t len);
 char *jffs2_getlink(struct jffs2_sb_info *c, struct jffs2_inode_info *f);

 /* scan.c */
diff --git a/fs/jffs2/read.c b/fs/jffs2/read.c
index 3f39be1..5f90ae8 100644
--- a/fs/jffs2/read.c
+++ b/fs/jffs2/read.c
@@ -214,3 +214,336 @@ int jffs2_read_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 	return 0;
 }

+int jffs2_read_multiple_inode_range(struct jffs2_sb_info *c,
+	struct jffs2_inode_info *f, struct list_head *pages,
+	uint32_t offset, uint32_t len)
+{
+	struct jffs2_node_frag *frag, *confrag;
+	int bytesread = 0;
+	uint32_t conofs = offset;
+	uint32_t conlen = 0;
+	uint32_t end;
+	uint16_t dconflag = 1;
+	uint32_t buf = 0;
+	uint32_t conbuf = 0;
+	int ret;
+
+	frag = jffs2_lookup_node_frag(&f->fragtree, offset);
+	if (!frag) {
+		D1(printk(KERN_ERR "%s: No valid frag to begin with\n",
+				__func__));
+		return -EIO;
+	}
+	confrag = frag;
+	D2(printk(KERN_DEBUG "%s: ino:%d, offset:%d, len:%d\n",
+		__func__, f->inocache->ino, offset, len));
+	while (len) {
+		end = (offset & PAGE_CACHE_MASK) + PAGE_CACHE_SIZE;
+		D2(printk(KERN_DEBUG "%s: len : 0x%x\n", __func__, len));
+
+		while (offset < end) {
+			D1(printk(KERN_DEBUG "%s: offset 0x%x, end 0x%x\n",
+				__func__, offset, end));
+			if (unlikely(!frag || frag->ofs > offset)) {
+				uint32_t holesize = end - offset;
+				if (frag) {
+					D1(printk(KERN_NOTICE "Eep. Hole in ino"
+						" #%u fraglist. frag->ofs ="
+						" 0x%08x, offset = 0x%08x\n",
+						f->inocache->ino,
+						frag->ofs, offset));
+					holesize = min(holesize,
+						frag->ofs - offset);
+				}
+				D1(printk(KERN_DEBUG "%s: Filling non-frag hole"
+					" from 0x%x-0x%x, buf:0x%p\n", __func__,
+					offset, offset+holesize, buf));
+				mmemcpy(pages, buf, 0, holesize);
+				buf += holesize;
+				offset += holesize;
+				continue;
+			} else if (unlikely(!frag->node)) {
+				uint32_t holeend = min(end,
+						frag->ofs + frag->size);
+				D1(printk(KERN_DEBUG "%s: Filling frag hole"
+					" from 0x%x-0x%x (frag 0x%x 0x%x),"
+					" buf:0x%p\n", __func__, offset,
+					holeend, frag->ofs,
+					frag->ofs + frag->size, buf));
+				mmemcpy(pages, buf, 0, holeend - offset);
+				buf += holeend - offset;
+				offset = holeend;
+				frag = frag_next(frag);
+				continue;
+			} else {
+				uint32_t readlen;
+
+				/* offset within the frag to start reading */
+				uint32_t fragofs;
+				fragofs = offset - frag->ofs;
+				readlen = min(frag->size - fragofs,
+						end - offset);
+				D2(printk(KERN_DEBUG "%s: Reading %d-%d"
+					" from node at 0x%08x (%d)\n",
+					__func__, frag->ofs+fragofs,
+					frag->ofs+fragofs+readlen,
+					ref_offset(frag->node->raw),
+					ref_flags(frag->node->raw)));
+
+				/*Flash Continuity*/
+				if (dconflag == 1) {
+					conofs = offset;
+					confrag = frag;
+					conbuf = buf;
+					conlen = ref_totlen(c, NULL,
+						frag->node->raw);
+					dconflag = 0;
+				} else if ((ref_offset(confrag->node->raw)
+				+ conlen) == ref_offset(frag->node->raw)) {
+					conlen += ref_totlen(c, NULL,
+							frag->node->raw);
+				} else {
+					dconflag = 1;
+					break;
+				}
+				buf += readlen;
+				offset += readlen;
+				frag = frag_next(frag);
+			}
+		}
+
+		if (dconflag == 1) {
+			D2(printk(KERN_DEBUG "%s: Discontinuous Read"
+				" conbuf:0x%p\n", __func__, conbuf));
+			ret = jffs2_read_multiple_dnodes(c, f, confrag, pages,
+					conbuf, conofs, conlen);
+
+			if (ret < 0) {
+				D1(printk(KERN_ERR "Error: %s returned %d\n",
+					__func__, ret));
+				return bytesread;
+			}
+			bytesread += ret;
+		} else {
+			len -= PAGE_CACHE_SIZE;
+			D1(printk(KERN_DEBUG "%s: loop done len:0x%x\n",
+				__func__, len));
+		}
+	}
+
+	if (dconflag == 0) {
+			D1(printk(KERN_DEBUG "%s: Continuous Read"
+				" conbuf: 0x%p\n", __func__, conbuf));
+			ret = jffs2_read_multiple_dnodes(c, f, confrag, pages,
+					conbuf, conofs, conlen);
+			if (ret < 0) {	/* Handle Error checking*/
+				printk(KERN_CRIT "Error: %s returned %d\n",
+					__func__, ret);
+				return bytesread;
+			}
+			bytesread += ret;
+	}
+	return bytesread;
+}
+
+
+int jffs2_read_multiple_dnodes(struct jffs2_sb_info *c,
+	struct jffs2_inode_info *f, struct jffs2_node_frag *frag,
+	struct list_head *pages, uint32_t tobuf, uint32_t startofs, int conlen)
+{
+	char *tempbuffer, *bptr;
+	uint32_t buf = tobuf;
+	int bytesread = 0;
+	size_t readlen;
+	struct jffs2_raw_inode *ri;
+	int bytestoread = conlen;
+	uint32_t npofs, pgofs = startofs;
+	uint32_t tordofs;
+	int ret;
+
+
+	tempbuffer = kmalloc(conlen, GFP_KERNEL);
+	if (!tempbuffer) {
+		printk(KERN_CRIT "%s: kamlloc failed\n", __func__);
+		return -ENOMEM;
+	}
+
+	bptr = tempbuffer;
+
+	ret = jffs2_flash_read(c, ref_offset(frag->node->raw), conlen, &readlen,
+			tempbuffer);
+	if (ret && readlen != conlen) {
+		ret = -EIO;
+		printk(KERN_WARNING "%s: Read failed req: %d bytes"
+			" but read only %d bytes\n",
+			__func__, conlen, readlen);
+		goto out_tmpbuf;
+	}
+	npofs = (startofs & PAGE_MASK) >> PAGE_CACHE_SHIFT;
+	npofs = (npofs + 1) << PAGE_CACHE_SHIFT;
+
+	D1(printk(KERN_CRIT "%s: DNODES: pgofs:0x%x, npofs:0x%x, conlen:0x%x,"
+		" bptr:0x%p\n", __func__, pgofs, npofs, conlen, bptr));
+
+	while (bytestoread > 0) {
+		uint32_t fragofs;
+		uint32_t len;
+		uint32_t crc;
+
+		fragofs = pgofs - frag->ofs;
+		len = min(frag->size - fragofs, npofs - pgofs);
+		tordofs = fragofs + frag->ofs - frag->node->ofs;
+
+		ri = (struct jffs2_raw_inode *)bptr;
+		crc = crc32(0, ri, sizeof(*ri)-8);
+
+		D1(printk(KERN_DEBUG "%s: Node read from %08x:n_crc %08x,"
+			" calcCRC %08x.dsize %x,csize %x,offset %x,buf %p,"
+			" bptr:0x%p, ri->compr:0x%x,len:0x%x\n", __func__,
+			ref_offset(frag->node->raw), je32_to_cpu(ri->node_crc),
+			crc, je32_to_cpu(ri->dsize), je32_to_cpu(ri->csize),
+			je32_to_cpu(ri->offset), buf, bptr, ri->compr, len));
+
+		if (crc != je32_to_cpu(ri->node_crc)) {
+			printk(KERN_WARNING "%s: Node CRC %08x !="
+				" calculated CRC %08x for node at %08x",
+				__func__, je32_to_cpu(ri->node_crc), crc,
+				ref_offset(frag->node->raw));
+
+			ret = -EIO;
+			goto out_tmpbuf;
+		}
+
+		if (ri->compr == JFFS2_COMPR_ZERO && !je32_to_cpu(ri->dsize) &&
+		    je32_to_cpu(ri->csize)) {
+			ri->dsize = ri->csize;
+			ri->csize = cpu_to_je32(0);
+		}
+
+		if (ri->compr == JFFS2_COMPR_ZERO) {
+			mmemcpy(pages, buf, 0, len);
+			bptr += ref_totlen(c, NULL, frag->node->raw);
+			bytestoread -= ref_totlen(c, NULL, frag->node->raw);
+			bytesread += len;
+			buf += len;
+			pgofs += len;
+			npofs += PAGE_CACHE_SIZE;
+
+			while (frag) {
+				frag = frag_next(frag);
+				if (frag && frag->node)
+					break;
+			}
+
+			continue;
+		}
+		bptr += sizeof(*ri);
+		crc = crc32(0, bptr, je32_to_cpu(ri->csize));
+		if (crc != je32_to_cpu(ri->data_crc)) {
+			printk(KERN_WARNING "%s: Data CRC %08x !="
+			" calculated CRC %08x for node at %08x\n",
+			__func__, je32_to_cpu(ri->data_crc), crc,
+			ref_offset(frag->node->raw));
+
+			ret = -EIO;
+			goto out_tmpbuf;
+		}
+
+		D1(printk(KERN_CRIT "%s: buf:0x%p, tordfs:0x%x\n",
+			__func__, buf, tordofs));
+
+		if (ri->compr == JFFS2_COMPR_NONE &&
+				(len == je32_to_cpu(ri->dsize))) {
+			mmemcpy(pages, buf, bptr, len);
+		} else if (ri->compr == JFFS2_COMPR_NONE &&
+				(len < je32_to_cpu(ri->dsize))) {
+			mmemcpy(pages, buf, bptr+tordofs, len);
+		} else if ((ri->compr != JFFS2_COMPR_NONE) &&
+				(len == je32_to_cpu(ri->dsize))) {
+			char *copybuffer = mmemcpy(pages, buf, 0, 0);
+			ret = jffs2_decompress(c, f,
+				ri->compr | (ri->usercompr << 8), bptr,
+				copybuffer, je32_to_cpu(ri->csize),
+				je32_to_cpu(ri->dsize));
+
+			if (ret) {
+				printk(KERN_WARNING "Error: jffs2_decompress"
+					" returned %d\n", ret);
+				ret = -EIO;
+				goto out_tmpbuf;
+			}
+		} else if ((ri->compr != JFFS2_COMPR_NONE) &&
+				(len < je32_to_cpu(ri->dsize))) {
+			char *dbuf = kmalloc(je32_to_cpu(ri->dsize),
+						GFP_KERNEL);
+			if (!dbuf) {
+				printk(KERN_CRIT "%s: dnuf kamlloc failed\n",
+					__func__);
+				ret = -ENOMEM;
+				goto out_tmpbuf;
+			}
+
+			ret = jffs2_decompress(c, f,
+				ri->compr | (ri->usercompr << 8), bptr, dbuf,
+				je32_to_cpu(ri->csize), je32_to_cpu(ri->dsize));
+			if (ret) {
+				printk(KERN_WARNING "Error: jffs2_decompress"
+					"returned %d\n", ret);
+				ret = -EIO;
+				kfree(dbuf);
+				goto out_tmpbuf;
+			}
+			mmemcpy(pages, buf, dbuf+tordofs, len);
+			kfree(dbuf);
+		}
+
+		bptr += ref_totlen(c, NULL, frag->node->raw) - sizeof(*ri);
+		bytestoread -= ref_totlen(c, NULL, frag->node->raw);
+		bytesread += len;
+		buf += len;
+		pgofs += len;
+		npofs += PAGE_CACHE_SIZE;
+		while (frag) {
+			frag = frag_next(frag);
+			if (frag && frag->node)
+				break;
+		}
+		if (!frag)
+			break;
+		D1(printk(KERN_DEBUG "%s: Looping bytestoread:0x%x,"
+			" bytesread:0x%x", __func__, bytestoread, bytesread));
+	}
+	ret = bytesread;
+out_tmpbuf:
+	kfree(tempbuffer);
+	return ret;
+}
+
+char *mmemcpy(struct list_head *pages, uint32_t offset, char *src, uint32_t len)
+{
+	uint32_t pgidx = 0;
+	struct page *page;
+	char *dst;
+	while (1) {
+		page = list_entry(pages->prev, struct page, lru);
+		if (offset < PAGE_CACHE_SIZE)
+			break;
+		pages = pages->prev;
+		offset -= PAGE_CACHE_SIZE;
+		pgidx++;
+	}
+
+	dst = kmap(page) + offset;
+	if (!len) {
+		kunmap(page);
+		return dst;
+	}
+
+	if (!src)
+		memset(dst, 0, len);
+	else
+		memcpy(dst, src, len);
+
+	kunmap(page);
+	return 0;
+}
