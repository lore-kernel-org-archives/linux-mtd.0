Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D5TDg-00083b-VS
	for linux-mtd@lists.infradead.org; Sun, 27 Feb 2005 13:32:50 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ray Lehtiniemi <rayl@mail.com>
In-Reply-To: <20050227181012.GA15280@mail.com>
References: <1109444967.4688.19.camel@sauron.oktetlabs.ru>
	<422141F8.7050707@voxware.com>  <20050227181012.GA15280@mail.com>
Content-Type: multipart/mixed; boundary="=-NBRJqIdYXGwrfdMNAxrh"
Date: Sun, 27 Feb 2005 21:31:55 +0300
Message-Id: <1109529115.13512.50.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: [BUGFIX] JFFS2 NOR problem
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-NBRJqIdYXGwrfdMNAxrh
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2005-02-27 at 11:10 -0700, Ray Lehtiniemi wrote:
> however, there are still some issues... 

I can't be completely certain but it is likely that your problem is the
same problem that I've observed about a month ago. Take a glimpse at:
http://lists.infradead.org/pipermail/linux-mtd/2005-January/011357.html

The discussion was stopped but has been resumed today. Please, follow
the thread if you're curious.

Here is a somewhat tweaked David's patch. I tried it and it looks like
it works pretty good. Please, try it together with my last mount fix.

P.S. We'll commit both patches to the CVS after you (and others) have
reported they are OK.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--=-NBRJqIdYXGwrfdMNAxrh
Content-Disposition: attachment; filename=jff2_slab_fix-01.diff
Content-Type: text/x-patch; name=jff2_slab_fix-01.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff -auNr --exclude=CVS mtd/fs/jffs2/erase.c mtd-dwmw2fix/fs/jffs2/erase.c
--- mtd/fs/jffs2/erase.c	2005-02-09 12:17:40.000000000 +0300
+++ mtd-dwmw2fix/fs/jffs2/erase.c	2005-02-27 21:19:56.587664987 +0300
@@ -277,11 +277,8 @@
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
diff -auNr --exclude=CVS mtd/fs/jffs2/nodelist.c mtd-dwmw2fix/fs/jffs2/nodelist.c
--- mtd/fs/jffs2/nodelist.c	2005-01-19 22:22:00.000000000 +0300
+++ mtd-dwmw2fix/fs/jffs2/nodelist.c	2005-02-27 21:28:41.013605613 +0300
@@ -508,7 +508,7 @@
 void jffs2_del_ino_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *old)
 {
 	struct jffs2_inode_cache **prev;
-	D2(printk(KERN_DEBUG "jffs2_del_ino_cache: Del %p (ino #%u)\n", old, old->ino));
+	D1(printk(KERN_DEBUG "jffs2_del_ino_cache: Del %p (ino #%u)\n", old, old->ino));
 	spin_lock(&c->inocache_lock);
 	
 	prev = &c->inocache_list[old->ino % INOCACHE_HASHSIZE];
@@ -520,6 +520,14 @@
 		*prev = old->next;
 	}
 
+	/* Free it now unless it's in READING or CLEARING state, which
+	   are the transitions upon read_inode() and clear_inode(). The
+	   rest of the time we know nobody else is looking at it, and 
+	   if it's held by read_inode() or clear_inode() they'll free it
+	   for themselves. */
+	if (old->state != INO_STATE_READING && old->state != INO_STATE_CLEARING)
+		jffs2_free_inode_cache(old);
+
 	spin_unlock(&c->inocache_lock);
 }
 
@@ -532,7 +540,6 @@
 		this = c->inocache_list[i];
 		while (this) {
 			next = this->next;
-			D2(printk(KERN_DEBUG "jffs2_free_ino_caches: Freeing ino #%u at %p\n", this->ino, this));
 			jffs2_free_inode_cache(this);
 			this = next;
 		}
diff -auNr --exclude=CVS mtd/fs/jffs2/nodelist.h mtd-dwmw2fix/fs/jffs2/nodelist.h
--- mtd/fs/jffs2/nodelist.h	2005-02-09 12:23:53.000000000 +0300
+++ mtd-dwmw2fix/fs/jffs2/nodelist.h	2005-02-27 21:19:56.589664558 +0300
@@ -135,6 +135,7 @@
 #define INO_STATE_CHECKEDABSENT	3	/* Checked, cleared again */
 #define INO_STATE_GC		4	/* GCing a 'pristine' node */
 #define INO_STATE_READING	5	/* In read_inode() */
+#define INO_STATE_CLEARING	6	/* In clear_inode() */
 
 #define INOCACHE_HASHSIZE 128
 
diff -auNr --exclude=CVS mtd/fs/jffs2/nodemgmt.c mtd-dwmw2fix/fs/jffs2/nodemgmt.c
--- mtd/fs/jffs2/nodemgmt.c	2005-01-25 23:11:11.000000000 +0300
+++ mtd-dwmw2fix/fs/jffs2/nodemgmt.c	2005-02-27 21:19:56.590664344 +0300
@@ -593,11 +593,8 @@
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
diff -auNr --exclude=CVS mtd/fs/jffs2/readinode.c mtd-dwmw2fix/fs/jffs2/readinode.c
--- mtd/fs/jffs2/readinode.c	2004-11-20 21:06:54.000000000 +0300
+++ mtd-dwmw2fix/fs/jffs2/readinode.c	2005-02-27 21:28:19.009070839 +0300
@@ -672,6 +672,9 @@
 	down(&f->sem);
 	deleted = f->inocache && !f->inocache->nlink;
 
+	if (f->inocache && f->inocache->state != INO_STATE_CHECKING)
+		jffs2_set_inocache_state(c, f->inocache, INO_STATE_CLEARING);
+
 	if (f->metadata) {
 		if (deleted)
 			jffs2_mark_node_obsolete(c, f->metadata->raw);
@@ -688,8 +691,11 @@
 		jffs2_free_full_dirent(fd);
 	}
 
-	if (f->inocache && f->inocache->state != INO_STATE_CHECKING)
+	if (f->inocache && f->inocache->state != INO_STATE_CHECKING) {
 		jffs2_set_inocache_state(c, f->inocache, INO_STATE_CHECKEDABSENT);
+		if (f->inocache->nodes == (void *)f->inocache)
+			jffs2_del_ino_cache(c, f->inocache);
+	}
 
 	up(&f->sem);
 }

--=-NBRJqIdYXGwrfdMNAxrh--
