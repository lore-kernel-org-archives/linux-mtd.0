Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17yxss-000818-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2002 18:11:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020506151930.A15109@kosh.hut.fi> 
References: <20020506151930.A15109@kosh.hut.fi>  <20020503201900.A32761@kosh.hut.fi> <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> <20020503201900.A32761@kosh.hut.fi> <28528.1020448474@redhat.com> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 Oct 2002 18:10:27 +0100
Message-ID: <18722.1034097027@passion.cambridge.redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 6 May 2002, jlavi@iki.fi said:
>  I have caught the message 8 times. It doesn't occur rather seldom
> when I have been benchmarking JFFS2 over the weekend.

> On five cases the first line was "Unknown INCOMPAT nodetype C002 at
> 0020293C" (address varies).

> On all 8 cases the next lines are "jffs2_do_read_inode(): No data
> nodes found for ino #" then "Eep. read_inode() failed for ino #"

> Last year there were two reports about C002 type node: 28 Jun 2001
> Frederic  Giasson, and 08 Aug 2001 Xavier DEBREUIL. Is this the same
> problem they had? 

Er, yes. What happens is that the VFS calls jffs2_read_inode() at the same 
time as it's calling jffs2_clear_inode() for the inode in question. So 
clear_inode() is busily obsoleting all the nodes which belong to the inode 
while read_inode() is trying to read them. Giving you either a whinge that 
clear_inode() got there first and there are _no_ nodes, or sometimes a 
whinge about a node which was marked valid in memory but by the time we 
read it from the flash it was marked obsolete.

As this behaviour from the VFS is intentional, try this (patch to 2.4 
branch; it's already in the CVS head for other reasons):

Index: fs/jffs2/gc.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/gc.c,v
retrieving revision 1.52.2.3
diff -u -p -r1.52.2.3 gc.c
--- fs/jffs2/gc.c	12 May 2002 17:27:08 -0000	1.52.2.3
+++ fs/jffs2/gc.c	8 Oct 2002 17:06:44 -0000
@@ -134,8 +134,10 @@ int jffs2_garbage_collect_pass(struct jf
 
 	D1(printk(KERN_DEBUG "garbage collect from block at phys 0x%08x\n", jeb->offset));
 
-	if (!jeb->used_size)
+	if (!jeb->used_size) {
+		up(&c->alloc_sem);
 		goto eraseit;
+	}
 
 	raw = jeb->gc_node;
 			
@@ -156,6 +158,7 @@ int jffs2_garbage_collect_pass(struct jf
 		/* Inode-less node. Clean marker, snapshot or something like that */
 		spin_unlock_bh(&c->erase_completion_lock);
 		jffs2_mark_node_obsolete(c, raw);
+		up(&c->alloc_sem);
 		goto eraseit_lock;
 	}
 						     
@@ -170,8 +173,8 @@ int jffs2_garbage_collect_pass(struct jf
 	if (is_bad_inode(inode)) {
 		printk(KERN_NOTICE "Eep. read_inode() failed for ino #%u\n", inum);
 		/* NB. This will happen again. We need to do something appropriate here. */
-		iput(inode);
 		up(&c->alloc_sem);
+		iput(inode);
 		return -EIO;
 	}
 
@@ -234,6 +237,7 @@ int jffs2_garbage_collect_pass(struct jf
 	}
  upnout:
 	up(&f->sem);
+	up(&c->alloc_sem);
 	iput(inode);
 
  eraseit_lock:
@@ -250,7 +254,6 @@ int jffs2_garbage_collect_pass(struct jf
 		jffs2_erase_pending_trigger(c);
 	}
 	spin_unlock_bh(&c->erase_completion_lock);
-	up(&c->alloc_sem);
 
 	return ret;
 }
Index: fs/jffs2/readinode.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/readinode.c,v
retrieving revision 1.58.2.5
diff -u -p -r1.58.2.5 readinode.c
--- fs/jffs2/readinode.c	5 Mar 2002 22:40:03 -0000	1.58.2.5
+++ fs/jffs2/readinode.c	8 Oct 2002 17:06:44 -0000
@@ -468,15 +468,28 @@ void jffs2_clear_inode (struct inode *in
 	struct jffs2_node_frag *frag, *frags;
 	struct jffs2_full_dirent *fd, *fds;
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+        /* I don't think we care about the potential race due to reading this
+           without f->sem. It can never get undeleted. */
+        int deleted = f->inocache && !f->inocache->nlink;
 
 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
 
+	/* If it's a deleted inode, grab the alloc_sem. This prevents
+	   jffs2_garbage_collect_pass() from deciding that it wants to
+	   garbage collect one of the nodes we're just about to mark 
+	   obsolete -- by the time we drop alloc_sem and return, all
+	   the nodes are marked obsolete, and jffs2_g_c_pass() won't
+	   call iget() for the inode in question.
+	*/
+	if (deleted)
+		down(&c->alloc_sem);
+
 	down(&f->sem);
 
 	frags = f->fraglist;
 	fds = f->dents;
 	if (f->metadata) {
-		if (!f->inocache->nlink)
+		if (deleted)
 			jffs2_mark_node_obsolete(c, f->metadata->raw);
 		jffs2_free_full_dnode(f->metadata);
 	}
@@ -488,7 +501,7 @@ void jffs2_clear_inode (struct inode *in
 
 		if (frag->node && !(--frag->node->frags)) {
 			/* Not a hole, and it's the final remaining frag of this node. Free the node */
-			if (!f->inocache->nlink)
+			if (deleted)
 				jffs2_mark_node_obsolete(c, frag->node->raw);
 
 			jffs2_free_full_dnode(frag->node);
@@ -502,5 +515,8 @@ void jffs2_clear_inode (struct inode *in
 	}
 
 	up(&f->sem);
+
+	if(deleted)
+		up(&c->alloc_sem);
 };
 


--
dwmw2
