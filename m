From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501031923110.14981@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501031923110.14981@phoenix.infradead.org>
Content-Type: text/plain
Date: Wed, 05 Jan 2005 11:33:26 +0000
Message-Id: <1104924806.5547.49.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] JFFS[23] slab corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-03 at 19:26 +0000, Artem B. Bityuckiy wrote:
> In jffs2_do_clear_inode() we call the jffs2_kill_fragtree() which kills 
> the fragtree and mark the correspondent nodes obsolete.
> 
> The jffs2_mark_node_obsolete function frees the inode's jffs2_inode_cache 
> object when marks the last node obsolete (nodemngnt.c:594). But the 
> f->inocache still points to this deleted object.
> 
> Later in jffs2_do_clear_inode() we set the f->inocache state thus, 
> corrupting the slab cache object which does not belong us anymore. I have 
> seen several messages about the slab corruption.
> 
> Ok to commit it ?

It's not enough. The erase code can still free an inocache while it's
being held in read_inode() or clear_inode(). I think we want to prevent
that, then make jffs2_do_clear_inode() free the offending inode for
itself afterwards...

Index: erase.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/erase.c,v
retrieving revision 1.66
diff -u -p -r1.66 erase.c
--- erase.c	16 Nov 2004 20:36:11 -0000	1.66
+++ erase.c	5 Jan 2005 11:36:43 -0000
@@ -276,11 +276,8 @@ static inline void jffs2_remove_node_ref
 		printk("\n");
 	});
 
-	if (ic->nodes == (void *)ic) {
-		D1(printk(KERN_DEBUG "inocache for ino #%u is all gone now. Freeing\n", ic->ino));
+	if (ic->nodes == (void *)ic)
 		jffs2_del_ino_cache(c, ic);
-		jffs2_free_inode_cache(ic);
-	}
 }
 
 static void jffs2_free_all_node_refs(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
Index: nodelist.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodelist.c,v
retrieving revision 1.88
diff -u -p -r1.88 nodelist.c
--- nodelist.c	16 Nov 2004 20:36:11 -0000	1.88
+++ nodelist.c	5 Jan 2005 11:36:43 -0000
@@ -494,7 +494,7 @@ void jffs2_add_ino_cache (struct jffs2_s
 void jffs2_del_ino_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *old)
 {
 	struct jffs2_inode_cache **prev;
-	D2(printk(KERN_DEBUG "jffs2_del_ino_cache: Del %p (ino #%u)\n", old, old->ino));
+	D1(printk(KERN_DEBUG "jffs2_del_ino_cache: Del %p (ino #%u)\n", old, old->ino));
 	spin_lock(&c->inocache_lock);
 	
 	prev = &c->inocache_list[old->ino % INOCACHE_HASHSIZE];
@@ -506,6 +506,14 @@ void jffs2_del_ino_cache(struct jffs2_sb
 		*prev = old->next;
 	}
 
+	/* Free it now unless it's in READING or CLEARING state, which
+	   are the transitions upon read_inode() and clear_inode(). The
+	   rest of the time we know nobody else is looking at it, and 
+	   if it's held by read_inode() or clear_inode() they'll free it
+	   for themselves. */
+	if (ic->state != INO_STATE_READING && ic->state != INO_STATE_CLEARING)
+		jffs2_free_ino_cache(old);
+
 	spin_unlock(&c->inocache_lock);
 }
 
@@ -518,7 +526,6 @@ void jffs2_free_ino_caches(struct jffs2_
 		this = c->inocache_list[i];
 		while (this) {
 			next = this->next;
-			D2(printk(KERN_DEBUG "jffs2_free_ino_caches: Freeing ino #%u at %p\n", this->ino, this));
 			jffs2_free_inode_cache(this);
 			this = next;
 		}
Index: nodelist.h
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodelist.h,v
retrieving revision 1.126
diff -u -p -r1.126 nodelist.h
--- nodelist.h	19 Nov 2004 15:06:29 -0000	1.126
+++ nodelist.h	5 Jan 2005 11:36:43 -0000
@@ -135,6 +135,7 @@ struct jffs2_inode_cache {
 #define INO_STATE_CHECKEDABSENT	3	/* Checked, cleared again */
 #define INO_STATE_GC		4	/* GCing a 'pristine' node */
 #define INO_STATE_READING	5	/* In read_inode() */
+#define INO_STATE_CLEARING	6	/* In clear_inode() */
 
 #define INOCACHE_HASHSIZE 128
 
Index: nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.115
diff -u -p -r1.115 nodemgmt.c
--- nodemgmt.c	22 Nov 2004 11:07:21 -0000	1.115
+++ nodemgmt.c	5 Jan 2005 11:36:44 -0000
@@ -590,11 +590,8 @@ void jffs2_mark_node_obsolete(struct jff
 		*p = ref->next_in_ino;
 		ref->next_in_ino = NULL;
 
-		if (ic->nodes == (void *)ic) {
-			D1(printk(KERN_DEBUG "inocache for ino #%u is all gone now. Freeing\n", ic->ino));
+		if (ic->nodes == (void *)ic)
 			jffs2_del_ino_cache(c, ic);
-			jffs2_free_inode_cache(ic);
-		}
 
 		spin_unlock(&c->erase_completion_lock);
 	}
Index: readinode.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/readinode.c,v
retrieving revision 1.117
diff -u -p -r1.117 readinode.c
--- readinode.c	20 Nov 2004 18:06:54 -0000	1.117
+++ readinode.c	5 Jan 2005 11:36:44 -0000
@@ -672,6 +672,9 @@ void jffs2_do_clear_inode(struct jffs2_s
 	down(&f->sem);
 	deleted = f->inocache && !f->inocache->nlink;
 
+	if (f->inocache && f->inocache->state != INO_STATE_CHECKING)
+		jffs2_set_inocache_state(c, f->inocache, INO_STATE_CLEARING);
+
 	if (f->metadata) {
 		if (deleted)
 			jffs2_mark_node_obsolete(c, f->metadata->raw);
@@ -688,8 +691,11 @@ void jffs2_do_clear_inode(struct jffs2_s
 		jffs2_free_full_dirent(fd);
 	}
 
-	if (f->inocache && f->inocache->state != INO_STATE_CHECKING)
+	if (f->inocache && f->inocache->state != INO_STATE_CHECKING) {
 		jffs2_set_inocache_state(c, f->inocache, INO_STATE_CHECKEDABSENT);
+		if (ic->nodes == (void *)ic)
+			jffs2_del_ino_cache(c, ic);
+	}
 
 	up(&f->sem);
 }


-- 
dwmw2
