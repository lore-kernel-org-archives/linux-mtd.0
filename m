Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Ep0JG-0003jF-DZ
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 04:31:06 -0500
Date: Wed, 21 Dec 2005 11:30:34 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Christian Lehne <christian_lehne@gmx.de>
Message-ID: <20051221093034.GA7781@angel.research.nokia.com>
References: <20051216122331.GA801@angel.research.nokia.com>
	<43A690EA.5050903@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43A690EA.5050903@gmx.de>
Cc: priewasser@gmail.com, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	"Zhao, Forrest" <forrest.zhao@intel.com>
Subject: Re: EBH with OneNAND doesn't work
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Christian, your patch helpt me to get JFFS2 working without
using too many printks.

Currently wbuf.c:jffs2_check_nand_cleanmarker_ebh() assumes the node header 
fits in the first free region.  The magic and node type would take 4 bytes.
If we have only 2 byte free regions available,  this is not enough
and the struct jffs2_unknown_node needs to be assembled.

I am using new helper function jffs2_copy_nand_fsdata(), from Forrest's code. 
Forrest assembled the longer EBH struct (28 bytes) from several free
regions. Similar assmebly is also needed for the struct unknown_node.

Optimally JFFS2 would use more free regions available at OOB. This would 
result fewer amount of OOBs being used less writing to OOBs.

Jarkko Lavinen

Index: fs/jffs2/wbuf.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/wbuf.c,v
retrieving revision 1.108
diff -u -b -B -p -r1.108 wbuf.c
--- fs/jffs2/wbuf.c	18 Nov 2005 07:27:45 -0000	1.108
+++ fs/jffs2/wbuf.c	21 Dec 2005 09:19:56 -0000
@@ -984,6 +984,21 @@ out:
 	return ret;
 }
 
+static void jffs2_copy_nand_fsdata(struct jffs2_sb_info *c, void *to, 
+				   unsigned char *from, int len, int oob_size)
+{
+	uint32_t read_in, i, copy_len;
+
+	read_in = i = 0;
+	while (read_in < len) {
+		copy_len = min_t(uint32_t, c->fsdata_len, len - read_in);
+		memcpy(to + read_in, &from[oob_size*i + c->fsdata_pos], copy_len);
+		read_in += copy_len;
+		i++;
+	}
+
+}
+
 /*
 *	Scan for a valid cleanmarker and for bad blocks
 *	For virtual blocks (concatenated physical blocks) check the cleanmarker
@@ -997,9 +1012,9 @@ int jffs2_check_nand_cleanmarker_ebh (st
 	uint32_t oob_nr, total_len;
 	unsigned char *buf;
 	int ret;
-	struct jffs2_unknown_node *n;
+	struct jffs2_unknown_node *n, unode;
 	struct jffs2_raw_ebh eh;
-	uint32_t read_in = 0, i = 0, copy_len, node_crc;
+	uint32_t node_crc;
 
 	offset = jeb->offset;
 	*data_len = 0;
@@ -1028,7 +1043,13 @@ int jffs2_check_nand_cleanmarker_ebh (st
 		goto out;
 	}
 
+	if (c->fsdata_len >= sizeof(struct jffs2_unknown_node *)) {
 	n = (struct jffs2_unknown_node *) &buf[c->fsdata_pos];
+	} else {
+		n = &unode;
+		jffs2_copy_nand_fsdata(c, n, buf, sizeof(sizeof(struct jffs2_unknown_node)), oob_size);
+	}
+
 	if (je16_to_cpu(n->magic) != JFFS2_MAGIC_BITMASK) {
 		D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker_ebh(): Cleanmarker node not detected in block at %08x\n", jeb->offset));
 		ret = 1;
@@ -1043,16 +1064,11 @@ int jffs2_check_nand_cleanmarker_ebh (st
 			ret = 1;
 		}
 		goto out;
-	}else if (je16_to_cpu(n->nodetype) == JFFS2_NODETYPE_ERASEBLOCK_HEADER) {
+	} else if (je16_to_cpu(n->nodetype) == JFFS2_NODETYPE_ERASEBLOCK_HEADER) {
 		/* Read the scattered data(in buf[]) into struct jffs2_raw_ebh */
-		while (read_in < sizeof(struct jffs2_raw_ebh)) {
-			copy_len = min_t(uint32_t, c->fsdata_len, sizeof(struct jffs2_raw_ebh) - read_in);
-			memcpy((unsigned char *)&eh + read_in, &buf[oob_size*i + c->fsdata_pos], copy_len);
-			read_in += copy_len;
-			i++;
-		}
+		jffs2_copy_nand_fsdata(c, &eh, buf, sizeof(struct jffs2_raw_ebh), oob_size);
 
-		node_crc = crc32(0, &eh, sizeof(struct jffs2_raw_ebh)-8);
+		node_crc = crc32(0, &eh, sizeof(struct jffs2_raw_ebh) - 8);
 		if (node_crc != je32_to_cpu(eh.node_crc)) {
 			ret = 1;
 			goto out;
