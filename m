Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAhDg-00043U-1Y
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 01:02:41 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <430F09E5.10607@inf.u-szeged.hu>
References: <1124840186.7086.19.camel@localhost.localdomain>
	<430F09E5.10607@inf.u-szeged.hu>
Content-Type: multipart/mixed; boundary="=-SFFk1rnwGv5spQ+ggaj8"
Date: Wed, 31 Aug 2005 23:02:19 -0600
Message-Id: <1125550939.7076.14.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: Latest jffs2 broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SFFk1rnwGv5spQ+ggaj8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> Did you try which earlier snapshot works correctly? It can be a good
> starting point where the problem is. 2005-07-30? 2005-08-01? 2005-08-05?

This problem does not occur with 2005-08-01, but does with 2005-08-02.
There were some significant changes to the frag tree code that went in
between these two snapshots.

It appears that the offending code is in readinode.c. There is code in
jffs2_get_inode_nodes(), read_dnode(), and read_more() that attempts to
optimize the NAND (writebuffered) cases to avoid redundant reads of
flash. When I removed these optimizations, the problem goes away and
everything is quite happy. It was not obvious to me what is wrong with
this code, but honestly, I'm too tired to figure it out now.

Regardless, I have attached the patch that makes latest mtd cvs work for
me. I do not have high hopes that the powers that be will want to apply
this patch, but I wanted to put it out there in case someone else is
having the same trouble. Maybe someone more familiar with this code
could take another look too.

Pete


--=-SFFk1rnwGv5spQ+ggaj8
Content-Disposition: attachment; filename=jffs2-simpler-readinode.patch
Content-Type: text/x-patch; name=jffs2-simpler-readinode.patch; charset=utf-8
Content-Transfer-Encoding: 7bit

[JFFS2] Remove tricky writebuffered optimizations

This patch removes some read optimizations from readinode.c. These
optimizations cause serious problems on at least one NAND flash device.

[From: Peter Grayson <pgrayson@realmsys.com>]
diff -Narup mtd/fs/jffs2/readinode.c mtd-readinode-fix/fs/jffs2/readinode.c
--- mtd/fs/jffs2/readinode.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-readinode-fix/fs/jffs2/readinode.c	2005-08-31 22:51:51.456533976 -0600
@@ -230,61 +230,7 @@ static inline int read_dnode(struct jffs
 			goto free_out;
 		}
 
-		if (jffs2_is_writebuffered(c) && csize != 0) {
-			/* At this point we are supposed to check the data CRC
-			 * of our unchecked node. But thus far, we do not
-			 * know whether the node is valid or obsolete. To
-			 * figure this out, we need to walk all the nodes of
-			 * the inode and build the inode fragtree. We don't
-			 * want to spend time checking data of nodes which may
-			 * later be found to be obsolete. So we put off the full
-			 * data CRC checking until we have read all the inode
-			 * nodes and have started building the fragtree.
-			 *
-			 * The fragtree is being built starting with nodes
-			 * having the highest version number, so we'll be able
-			 * to detect whether a node is valid (i.e., it is not
-			 * overlapped by a node with higher version) or not.
-			 * And we'll be able to check only those nodes, which
-			 * are not obsolete.
-			 *
-			 * Of course, this optimization only makes sense in case
-			 * of NAND flashes (or other flashes whith
-			 * !jffs2_can_mark_obsolete()), since on NOR flashes
-			 * nodes are marked obsolete physically.
-			 *
-			 * Since NAND flashes (or other flashes with
-			 * jffs2_is_writebuffered(c)) are anyway read by
-			 * fractions of c->wbuf_pagesize, and we have just read
-			 * the node header, it is likely that the starting part
-			 * of the node data is also read when we read the
-			 * header. So we don't mind to check the CRC of the
-			 * starting part of the data of the node now, and check
-			 * the second part later (in jffs2_check_node_data()).
-			 * Of course, we will not need to re-read and re-check
-			 * the NAND page which we have just read. This is why we
-			 * read the whole NAND page at jffs2_get_inode_nodes(),
-			 * while we needed only the node header.
-			 */
-			unsigned char *buf;
-
-			/* 'buf' will point to the start of data */
-			buf = (unsigned char *)rd + sizeof(*rd);
-			/* len will be the read data length */
-			len = min_t(uint32_t, rdlen - sizeof(*rd), csize);
-			tn->partial_crc = crc32(0, buf, len);
-
-			JFFS2_DBG_READINODE("Calculates CRC (%#08x) for %d bytes, csize %d\n", tn->partial_crc, len, csize);
-
-			/* If we actually calculated the whole data CRC
-			 * and it is wrong, drop the node. */
-			if (len >= csize && unlikely(tn->partial_crc != je32_to_cpu(rd->data_crc))) {
-				JFFS2_NOTICE("wrong data CRC in data node at 0x%08x: read %#08x, calculated %#08x.\n",
-					ref_offset(ref), tn->partial_crc, je32_to_cpu(rd->data_crc));
-				goto free_out;
-			}
-
-		} else if (csize == 0) {
+		if (csize == 0) {
 			/*
 			 * We checked the header CRC. If the node has no data, adjust
 			 * the space accounting now. For other nodes this will be done
@@ -400,30 +346,18 @@ static inline int read_unknown(struct jf
 static int read_more(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref,
 		     int right_size, int *rdlen, unsigned char *buf, unsigned char *bufstart)
 {
-	int right_len, err, len;
+	int err, len;
 	size_t retlen;
 	uint32_t offs;
 
-	if (jffs2_is_writebuffered(c)) {
-		right_len = c->wbuf_pagesize - (bufstart - buf);
-		if (right_size + (int)(bufstart - buf) > c->wbuf_pagesize)
-			right_len += c->wbuf_pagesize;
-	} else
-		right_len = right_size;
-
-	if (*rdlen == right_len)
+	if (*rdlen == right_size)
 		return 0;
 
 	/* We need to read more data */
 	offs = ref_offset(ref) + *rdlen;
-	if (jffs2_is_writebuffered(c)) {
-		bufstart = buf + c->wbuf_pagesize;
-		len = c->wbuf_pagesize;
-	} else {
-		bufstart = buf + *rdlen;
-		len = right_size - *rdlen;
-	}
-	
+	bufstart = buf + *rdlen;
+	len = right_size - *rdlen;
+
 	JFFS2_DBG_READINODE("read more %d bytes\n", len);
 
 	err = jffs2_flash_read(c, offs, len, &retlen, bufstart);
@@ -439,7 +373,7 @@ static int read_more(struct jffs2_sb_inf
 		return -EIO;
 	}
 
-	*rdlen = right_len;
+	*rdlen = right_size;
 
 	return 0;
 }
@@ -463,24 +397,11 @@ static int jffs2_get_inode_nodes(struct 
 	
 	JFFS2_DBG_READINODE("ino #%u\n", f->inocache->ino);
 
-	if (jffs2_is_writebuffered(c)) {
-		/*
-		 * If we have the write buffer, we assume the minimal I/O unit
-		 * is c->wbuf_pagesize. We implement some optimizations which in
-		 * this case and we need a temporary buffer of size =
-		 * 2*c->wbuf_pagesize bytes (see comments in read_dnode()).
-		 * Basically, we want to read not only the node header, but the
-		 * whole wbuf (NAND page in case of NAND) or 2, if the node
-		 * header overlaps the border between the 2 wbufs.
-		 */
-		len = 2*c->wbuf_pagesize;
-	} else {
-		/*
-		 * When there is no write buffer, the size of the temporary
-		 * buffer is the size of the larges node header.
-		 */
-		len = sizeof(union jffs2_node_union);
-	}
+	/*
+	 * When there is no write buffer, the size of the temporary
+	 * buffer is the size of the larges node header.
+	 */
+	len = sizeof(union jffs2_node_union);
 
 	/* FIXME: in case of NOR and available ->point() this
 	 * needs to be fixed. */
@@ -513,23 +434,8 @@ static int jffs2_get_inode_nodes(struct 
 		 * to minimize the amount of flash IO we assume the node has
 		 * size = JFFS2_MIN_NODE_HEADER.
 		 */
-		if (jffs2_is_writebuffered(c)) {
-			/* 
-			 * We treat 'buf' as 2 adjacent wbufs. We want to
-			 * adjust bufstart such as it points to the
-			 * beginning of the node within this wbuf.
-			 */
-			bufstart = buf + (ref_offset(ref) % c->wbuf_pagesize);
-			/* We will read either one wbuf or 2 wbufs. */
-			len = c->wbuf_pagesize - (bufstart - buf);
-			if (JFFS2_MIN_NODE_HEADER + (int)(bufstart - buf) > c->wbuf_pagesize) {
-				/* The header spans the border of the first wbuf */
-				len += c->wbuf_pagesize;
-			}
-		} else {
-			bufstart = buf;
-			len = JFFS2_MIN_NODE_HEADER;
-		}
+		bufstart = buf;
+		len = JFFS2_MIN_NODE_HEADER;
 
 		JFFS2_DBG_READINODE("read %d bytes at %#08x(%d).\n", len, ref_offset(ref), ref_flags(ref));
 

--=-SFFk1rnwGv5spQ+ggaj8--
