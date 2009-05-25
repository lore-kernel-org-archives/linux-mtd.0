Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8cRe-0000Ml-0K
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 15:50:41 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 4379C650002
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 May 2009 17:53:02 +0200 (CEST)
Subject: error in obliterating obsoleted node, possible race?
To: linux-mtd@lists.infradead.org
Message-ID: <OF8E417754.5D085243-ONC12575C1.005565BA-C12575C1.005705E7@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 25 May 2009 17:50:31 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I suspect I found an race in JFFS2 but I cannot convince myself of that. I get lots of
 Write error in obliterating obsoleted node at 0x01ea0000: -30
when I stress the FS with this loop:
  while [ 1 == 1 ] ; do rm -rf a*; cp -ap /opt/appl a1; cp -ap /opt/appl a2;cp -ap /opt/appl a3; done
/opt/appl is a fairly large.

Adding this crude debug code to JFFS2:
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 21a0529..7624ff9 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -591,7 +591,9 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 		/* We didn't lock the erase_free_sem */
 		return;
 	}
-
+	{
+		unsigned long used_size = jeb->used_size;
+		unsigned long unchecked_size = jeb->unchecked_size;
 	if (jeb == c->nextblock) {
 		D2(printk(KERN_DEBUG "Not moving nextblock 0x%08x to dirty/erase_pending list\n", jeb->offset));
 	} else if (!jeb->used_size && !jeb->unchecked_size) {
@@ -674,9 +676,24 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 	n.nodetype = cpu_to_je16(je16_to_cpu(n.nodetype) & ~JFFS2_NODE_ACCURATE);
 	ret = jffs2_flash_write(c, ref_offset(ref), sizeof(n), &retlen, (char *)&n);
 	if (ret) {
+		struct jffs2_unknown_node n2;
+
 		printk(KERN_WARNING "Write error in obliterating obsoleted node at 0x%08x: %d\n", ref_offset(ref), ret);
+		printk(KERN_WARNING "Used/Unchecked for ref 0x%08x: %lu:%lu\n", ref_offset(ref),
+		       used_size, unchecked_size);
+		ret = jffs2_flash_read(c, ref_offset(ref), sizeof(n), &retlen, (char *)&n2);
+		if (ret)
+			printk(KERN_WARNING "Read confirm error node at 0x%08x: %d\n", ref_offset(ref), ret);
+		else {
+			ret = memcmp(&n, &n2, sizeof(n));
+			if (ret)
+				printk(KERN_WARNING "DIFF:Read confirm node at 0x%08x: %d\n", ref_offset(ref), ret);
+			else
+				printk(KERN_WARNING "SAME:Read confirm node at 0x%08x: %d\n", ref_offset(ref), ret);
+		}
 		goto out_erase_sem;
 	}
+	}
 	if (retlen != sizeof(n)) {
 		printk(KERN_WARNING "Short write in obliterating obsoleted node at 0x%08x: %zd\n", ref_offset(ref), retlen);
 		goto out_erase_sem;

I see lots of:
flash: buffer locked error (status 0xd2)
Write error in obliterating obsoleted node at 0x01ea0000: -30
Used/Unchecked for ref 0x01ea0000: 0:0
DIFF:Read confirm node at 0x01ea0000: -32
flash: buffer locked error (status 0xd2)
Write error in obliterating obsoleted node at 0x06520000: -30
Used/Unchecked for ref 0x06520000: 0:0
DIFF:Read confirm node at 0x06520000: -32
flash: buffer locked error (status 0xd2)
Write error in obliterating obsoleted node at 0x02280000: -30
Used/Unchecked for ref 0x02280000: 0:0
DIFF:Read confirm node at 0x02280000: -32
flash: buffer locked error (status 0xd2)
Write error in obliterating obsoleted node at 0x06e60000: -30
Used/Unchecked for ref 0x06e60000: 0:0
DIFF:Read confirm node at 0x06e60000: -32

Notice that Used/Unchecked is always 0 so
the block ends up in the erase_pending_list or c->erasable_list before
one marks it obsolete in flash.
Is this allowed? The erase_free_sem is held so I guess it is allowed, but
I can't shake the feeling that one might end up writing to a block that is
already erasing.

I know that the chip status 0xd2 means that the block is locked, but I am
sure it isn't (unless JFFS2 managed to do that for me)

Note I got 4 consecutive chips in the FS.

   Jocke
