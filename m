Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPd42-0003gO-8s
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 06:15:13 -0500
Subject: Re: JFFS2 OOPS in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173437173.26465.37.camel@gentoo-jocke.transmode.se>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
	<1173432194.3461.562.camel@pmac.infradead.org>
	<1173437173.26465.37.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Mar 2007 12:15:08 +0100
Message-Id: <1173438908.26465.54.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-03-09 at 11:46 +0100, Joakim Tjernlund wrote:
> On Fri, 2007-03-09 at 09:23 +0000, David Woodhouse wrote:
> > On Fri, 2007-03-09 at 10:02 +0100, Joakim Tjernlund wrote:
> > > JFFS2 notice: (137) read_unknown:  ref_flags(ref) == REF_UNCHECKED at 0x3aa6c6c.
> > >  {0000,0000,00000000,00000000} 
> > 
> > Ouch. That CRC is actually "correct". It's why we should have used
> > crc32(-1, buf, len) instead of crc32(0, buf, len) from the start.
> > 
> > Do you have any idea how you managed to get those zeroes on the flash?
> 
> Not much, our system test did power cycle testing while doing SW
> upgrade(lots of writing of files).
> 
> Tested your patch and now it boots again with this :)
> JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
> {0040,4001,00000044,00000000}
> JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa6c6c
> JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa517c. 
> {0400,4001,00000000,00000004}
> JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa28fc
> JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1ef8. 
> {0000,0000,00000000,00100400}
> JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1438. 
> {0000,4000,00000000,00000000}
> JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa0a44
> JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa3e84
> JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa3d80. 
> {0040,4000,00000000,01000005}
> JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa33c8
> JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.
> VFS: Mounted root (jffs2 filesystem).

This does not look right, none of the "All zero node header" checks has triggered.

hmm,
je32_to_cpu(node->u.totlen) should be !je32_to_cpu(node->u.totlen)

also I think this check should be before the real crc32 check.
After that I get:
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
{0040,4001,00000044,00000000}
JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa6c6c.
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa517c. 
{0400,4001,00000000,00000004}
JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa28fc.
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1ef8. 
{0000,0000,00000000,00100400}
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa1438. 
{0000,4000,00000000,00000000}
JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa0a44.
JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa3e84.
JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa3d80. 
{0040,4000,00000000,01000005}
JFFS2 notice: (137) jffs2_get_inode_nodes: All zero node header at 0x3aa33c8.
VFS: Mounted root (jffs2 filesystem).


diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 58a0b91..7f7618c 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -373,7 +373,14 @@ free_out:
 static inline int read_unknown(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref, struct jffs2_unknown_node *un)
 {
 	/* We don't mark unknown nodes as REF_UNCHECKED */
-	BUG_ON(ref_flags(ref) == REF_UNCHECKED);
+	if (ref_flags(ref) == REF_UNCHECKED) {
+		JFFS2_ERROR("REF_UNCHECKED but unknown node at %#08x\n",
+			    ref_offset(ref));
+		JFFS2_ERROR("Node is {%04x,%04x,%08x,%08x}. Please report this error.\n",
+                            je16_to_cpu(un->magic), je16_to_cpu(un->nodetype),
+                            je32_to_cpu(un->totlen), je32_to_cpu(un->hdr_crc));
+		return 1;
+	}
 
 	un->nodetype = cpu_to_je16(JFFS2_NODE_ACCURATE | je16_to_cpu(un->nodetype));
 
@@ -565,6 +572,14 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
 
 		node = (union jffs2_node_union *)bufstart;
 
+		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
+		if (!je32_to_cpu(node->u.hdr_crc) && !je16_to_cpu(node->u.nodetype) &&
+		    !je16_to_cpu(node->u.magic) && !je32_to_cpu(node->u.totlen)) {
+			JFFS2_NOTICE("All zero node header at %#08x.\n", ref_offset(ref));
+			jffs2_mark_node_obsolete(c, ref);
+			goto cont;
+		}
+
 		/* No need to mask in the valid bit; it shouldn't be invalid */
 		if (je32_to_cpu(node->u.hdr_crc) != crc32(0, node, sizeof(node->u)-4)) {
 			JFFS2_NOTICE("Node header CRC failed at %#08x. {%04x,%04x,%08x,%08x}\n",
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 3af746e..b98661a 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -718,6 +718,17 @@ scan_more:
 		crcnode.totlen = node->totlen;
 		hdr_crc = crc32(0, &crcnode, sizeof(crcnode)-4);
 
+		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
+		if (!je32_to_cpu(node->hdr_crc) && !je16_to_cpu(node->nodetype) &&
+		    !je16_to_cpu(node->magic) && !je32_to_cpu(node->totlen)) {
+			noisy_printk(&noise, "jffs2_scan_eraseblock(): All zero node header at 0x%08x.\n", ofs);
+		       
+			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
+				return err;
+			ofs += 4;
+			continue;
+		}
+
 		if (hdr_crc != je32_to_cpu(node->hdr_crc)) {
 			noisy_printk(&noise, "jffs2_scan_eraseblock(): Node at 0x%08x {0x%04x, 0x%04x, 0x%08x) has invalid CRC 0x%08x (calculated 0x%08x)\n",
 				     ofs, je16_to_cpu(node->magic),
