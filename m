Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HfxmU-00053Q-RK
	for linux-mtd@lists.infradead.org; Mon, 23 Apr 2007 08:36:36 -0400
Subject: [Fwd: Re: JFFS2 OOPS in 2.6.20]
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Apr 2007 14:36:31 +0200
Message-Id: <1177331791.4388.7.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David, I think you have forgotten this one.

 Jocke

-------- Forwarded Message --------
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Reply-To: joakim.tjernlund@transmode.se
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 OOPS in 2.6.20
Date: Sat, 10 Mar 2007 17:08:44 +0100

> > 
> > The check in scan is rendundant. You will never reach it due to two
> > earlier checks:
> > 	if (je16_to_cpu(node->magic) != JFFS2_MAGIC_BITMASK) {
> > and
> > 	crcnode.nodetype = cpu_to_je16( je16_to_cpu(node->nodetype) | JFFS2_NODE_ACCURATE);
> > 
> > I wonder if JFFS2_NODE_ACCURATE mask bit could be used in readinode.c as well?
> > 
> >  Jocke
> 
> probably better to remove the zero crc32 check and add a:
>    if (je16_to_cpu(node->u.magic) != JFFS2_MAGIC_BITMASK)
> 
> to make sure it is a JFFS2 node with the added benefit that this will work
> when ->point is added too.
> 
>  Jocke

How about this fix instead:

>From 4421fa227585b205f52e90966683c0a57737547b Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Sat, 10 Mar 2007 16:59:03 +0100
Subject: [PATCH] Better fix for all-zero node headers
No need to check for all-zero header since the header cannot
be zero due to other checks.
Replace the all-zero header check in readinode.c with a
check for the magic word.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/readinode.c |    8 ++++----
 fs/jffs2/scan.c      |   11 -----------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 7f7618c..9f6885b 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -572,10 +572,10 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
 
 		node = (union jffs2_node_union *)bufstart;
 
-		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
-		if (!je32_to_cpu(node->u.hdr_crc) && !je16_to_cpu(node->u.nodetype) &&
-		    !je16_to_cpu(node->u.magic) && !je32_to_cpu(node->u.totlen)) {
-			JFFS2_NOTICE("All zero node header at %#08x.\n", ref_offset(ref));
+		if (je16_to_cpu(node->u.magic) != JFFS2_MAGIC_BITMASK) {
+			/* Not a JFFS2 node, whinge and move on */
+			JFFS2_NOTICE("Wrong magic bitmask 0x%04x in node header at %#08x.\n", je16_to_cpu(node->u.magic),
+				     ref_offset(ref));
 			jffs2_mark_node_obsolete(c, ref);
 			goto cont;
 		}
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index b98661a..3af746e 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -718,17 +718,6 @@ scan_more:
 		crcnode.totlen = node->totlen;
 		hdr_crc = crc32(0, &crcnode, sizeof(crcnode)-4);
 
-		/* Due to poor choice of crc32 seed, an all-zero node will have a correct CRC */
-		if (!je32_to_cpu(node->hdr_crc) && !je16_to_cpu(node->nodetype) &&
-		    !je16_to_cpu(node->magic) && !je32_to_cpu(node->totlen)) {
-			noisy_printk(&noise, "jffs2_scan_eraseblock(): All zero node header at 0x%08x.\n", ofs);
-		       
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
-			ofs += 4;
-			continue;
-		}
-
 		if (hdr_crc != je32_to_cpu(node->hdr_crc)) {
 			noisy_printk(&noise, "jffs2_scan_eraseblock(): Node at 0x%08x {0x%04x, 0x%04x, 0x%08x) has invalid CRC 0x%08x (calculated 0x%08x)\n",
 				     ofs, je16_to_cpu(node->magic),
