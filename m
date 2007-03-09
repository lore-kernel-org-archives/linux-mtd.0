Subject: Re: JFFS2 OOPS in 2.6.20
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1173430972.26465.20.camel@gentoo-jocke.transmode.se>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Fri, 09 Mar 2007 09:23:14 +0000
Message-Id: <1173432194.3461.562.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-03-09 at 10:02 +0100, Joakim Tjernlund wrote:
> JFFS2 notice: (137) read_unknown:  ref_flags(ref) == REF_UNCHECKED at 0x3aa6c6c.
>  {0000,0000,00000000,00000000} 

Ouch. That CRC is actually "correct". It's why we should have used
crc32(-1, buf, len) instead of crc32(0, buf, len) from the start.

Do you have any idea how you managed to get those zeroes on the flash?

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 58a0b91..ef6522e 100644
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
 
@@ -576,6 +583,13 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
 			jffs2_mark_node_obsolete(c, ref);
 			goto cont;
 		}
+		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
+		if (!je32_to_cpu(node->u.hdr_crc) && !je16_to_cpu(node->u.nodetype) &&
+		    !je16_to_cpu(node->u.magic) && je32_to_cpu(node->u.totlen)) {
+			JFFS2_NOTICE("All zero node header at %#08x.\n", ref_offset(ref));
+			jffs2_mark_node_obsolete(c, ref);
+			goto cont;
+		}
 
 		switch (je16_to_cpu(node->u.nodetype)) {
 
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 31c1475..e482081 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -734,6 +734,16 @@ scan_more:
 			ofs += 4;
 			continue;
 		}
+		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
+		if (!je32_to_cpu(node->hdr_crc) && !je16_to_cpu(node->nodetype) &&
+		    !je16_to_cpu(node->magic) && je32_to_cpu(node->totlen)) {
+			noisy_printk(&noise, "jffs2_scan_eraseblock(): All zero node header at 0x%08x.\n", ofs);
+		       
+			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
+				return err;
+			ofs += 4;
+			continue;
+		}
 
 		if (ofs + je32_to_cpu(node->totlen) >
 		    jeb->offset + c->sector_size) {

-- 
dwmw2
