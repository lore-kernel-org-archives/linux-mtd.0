Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJrMl-00056k-7Z
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2005 07:09:37 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id ED4CC228BA
	for <linux-mtd@lists.infradead.org>;
	Fri,  8 Apr 2005 15:09:04 +0400 (MSD)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-Z90aVU6a2xazl3Bo4wgh"
Date: Fri, 08 Apr 2005 15:09:04 +0400
Message-Id: <1112958544.32299.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Subject: [PATCH] JFFS2 race bug fix
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Z90aVU6a2xazl3Bo4wgh
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

here is the patch which fixes a JFFS2 bug related to races.

Description
~~~~~~~~~

Suppose we append something to a file.

Look at file.c:251, here JFFS2 calls jffs2_write_inode_range() which
writes new nodes.

After the node has been written, JFFS2 updates the i_size field at the
'struct inode' object (look at file.c:270) (in our example it increases
it).

Now take a glimpse a the jffs2_write_inode_range() function in
write.c:452. This function may break the peace of data to be written
into 2 smaller chunks (if there is no enough room at the current block).
After the first chunk A has been written, we free f->sem. In this point
the inode->i_size has its old value, while the real size of inode is
equivalent to the old value + the the length of node A.

Suppose we are preempted at this point and GC starts. Picks some node
belonging to our file and tries to move it, probably merge it, etc.

Garbage Collector uses the i_size value (which is, as we remember,
wrong, since it wasn't updated yet) in some places. Just do:

grep JFFS2_F_I_SIZE *
gc.c:   ri.isize = cpu_to_je32(JFFS2_F_I_SIZE(f));
gc.c:   ri.isize = cpu_to_je32(JFFS2_F_I_SIZE(f));
gc.c:           BUG_ON(end > JFFS2_F_I_SIZE(f));
gc.c:           ri.isize = cpu_to_je32(JFFS2_F_I_SIZE(f));
os-linux.h:#define JFFS2_F_I_SIZE(f) (OFNI_EDONI_2SFFJ(f)->i_size)

So, in this case it may write nodes with wrong ri.isize and have
problems later.

Personally I hit on BUG_ON(end > JFFS2_F_I_SIZE(f)) at gc:1171 when I
tested JFFS2 on an SMP host with preemption enabled.

Here is the proposed patch, please, review.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--=-Z90aVU6a2xazl3Bo4wgh
Content-Disposition: attachment; filename=jffs2-smp-1.diff
Content-Type: text/x-patch; name=jffs2-smp-1.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff -auNrp --exclude CVS mtd/fs/jffs2/gc.c mtd-fixed/fs/jffs2/gc.c
--- mtd/fs/jffs2/gc.c	2005-04-08 14:14:36.083656010 +0400
+++ mtd-fixed/fs/jffs2/gc.c	2005-04-08 14:17:15.941323792 +0400
@@ -669,6 +669,7 @@ static int jffs2_garbage_collect_metadat
 {
 	struct jffs2_full_dnode *new_fn;
 	struct jffs2_raw_inode ri;
+	struct jffs2_node_frag *last_frag;
 	jint16_t dev;
 	char *mdata = NULL, mdatalen = 0;
 	uint32_t alloclen, phys_ofs;
@@ -718,7 +719,8 @@ static int jffs2_garbage_collect_metadat
 	ri.mode = cpu_to_jemode(JFFS2_F_I_MODE(f));
 	ri.uid = cpu_to_je16(JFFS2_F_I_UID(f));
 	ri.gid = cpu_to_je16(JFFS2_F_I_GID(f));
-	ri.isize = cpu_to_je32(JFFS2_F_I_SIZE(f));
+	last_frag = frag_last(&f->fragtree);
+	ri.isize = cpu_to_je32(last_frag->ofs + last_frag->size);
 	ri.atime = cpu_to_je32(JFFS2_F_I_ATIME(f));
 	ri.ctime = cpu_to_je32(JFFS2_F_I_CTIME(f));
 	ri.mtime = cpu_to_je32(JFFS2_F_I_MTIME(f));
@@ -961,7 +963,8 @@ static int jffs2_garbage_collect_hole(st
 	ri.mode = cpu_to_jemode(JFFS2_F_I_MODE(f));
 	ri.uid = cpu_to_je16(JFFS2_F_I_UID(f));
 	ri.gid = cpu_to_je16(JFFS2_F_I_GID(f));
-	ri.isize = cpu_to_je32(JFFS2_F_I_SIZE(f));
+	frag = frag_last(&f->fragtree);
+	ri.isize = cpu_to_je32(frag->ofs + frag->size);
 	ri.atime = cpu_to_je32(JFFS2_F_I_ATIME(f));
 	ri.ctime = cpu_to_je32(JFFS2_F_I_CTIME(f));
 	ri.mtime = cpu_to_je32(JFFS2_F_I_MTIME(f));
@@ -1168,7 +1171,7 @@ static int jffs2_garbage_collect_dnode(s
 		D1(printk(KERN_DEBUG "Expanded dnode to write from (0x%x-0x%x) to (0x%x-0x%x)\n", 
 			  orig_start, orig_end, start, end));
 
-		BUG_ON(end > JFFS2_F_I_SIZE(f));
+		D1(BUG_ON(end > frag_last(&f->fragtree)->ofs + frag_last(&f->fragtree)->size));
 		BUG_ON(end < orig_end);
 		BUG_ON(start > orig_start);
 	}
diff -auNrp --exclude CVS mtd/fs/jffs2/nodelist.h mtd-fixed/fs/jffs2/nodelist.h
--- mtd/fs/jffs2/nodelist.h	2005-04-08 14:14:33.206274244 +0400
+++ mtd-fixed/fs/jffs2/nodelist.h	2005-04-08 14:09:37.007914567 +0400
@@ -363,6 +363,18 @@ static inline struct jffs2_node_frag *fr
 		node = node->rb_left;
 	return rb_entry(node, struct jffs2_node_frag, rb);
 }
+
+static inline struct jffs2_node_frag *frag_last(struct rb_root *root)
+{
+	struct rb_node *node = root->rb_node;
+
+	if (!node)
+		return NULL;
+	while(node->rb_right)
+		node = node->rb_right;
+	return rb_entry(node, struct jffs2_node_frag, rb);
+}
+
 #define rb_parent(rb) ((rb)->rb_parent)
 #define frag_next(frag) rb_entry(rb_next(&(frag)->rb), struct jffs2_node_frag, rb)
 #define frag_prev(frag) rb_entry(rb_prev(&(frag)->rb), struct jffs2_node_frag, rb)

--=-Z90aVU6a2xazl3Bo4wgh--
