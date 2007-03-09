Subject: Re: JFFS2 OOPS in 2.6.20
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1173437173.26465.37.camel@gentoo-jocke.transmode.se>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
	<1173432194.3461.562.camel@pmac.infradead.org>
	<1173437173.26465.37.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Fri, 09 Mar 2007 11:08:35 +0000
Message-Id: <1173438515.3461.582.camel@pmac.infradead.org>
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

On Fri, 2007-03-09 at 11:46 +0100, Joakim Tjernlund wrote:
> Tested your patch and now it boots again with this :) 
> JFFS2 error: (137) read_unknown: REF_UNCHECKED but unknown node at 0x3aa28fc
> JFFS2 error: (137) read_unknown: Node is {0000,0000,00000000,00000000}. Please report this error.

Stupid dwmw2. No biscuit.

diff -u b/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
--- b/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -585,7 +585,7 @@
 		}
 		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
 		if (!je32_to_cpu(node->u.hdr_crc) && !je16_to_cpu(node->u.nodetype) &&
-		    !je16_to_cpu(node->u.magic) && je32_to_cpu(node->u.totlen)) {
+		    !je16_to_cpu(node->u.magic) && !je32_to_cpu(node->u.totlen)) {
 			JFFS2_NOTICE("All zero node header at %#08x.\n", ref_offset(ref));
 			jffs2_mark_node_obsolete(c, ref);
 			goto cont;
diff -u b/fs/jffs2/scan.c b/fs/jffs2/scan.c
--- b/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -736,7 +736,7 @@
 		}
 		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
 		if (!je32_to_cpu(node->hdr_crc) && !je16_to_cpu(node->nodetype) &&
-		    !je16_to_cpu(node->magic) && je32_to_cpu(node->totlen)) {
+		    !je16_to_cpu(node->magic) && !je32_to_cpu(node->totlen)) {
 			noisy_printk(&noise, "jffs2_scan_eraseblock(): All zero node header at 0x%08x.\n", ofs);
 		       
 			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))

-- 
dwmw2
