Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bmuo7-0000in-Jv
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 09:37:25 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1090285839.4149.8.camel@localhost.localdomain>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
	<1089759689.8822.18.camel@imladris.demon.co.uk>
	<1089792912.7607.22.camel@famine> <1090246707.13401.18.camel@famine>
	<Pine.LNX.4.58.0407191522360.4985@localhost.localdomain>
	<1090250145.14173.3.camel@famine>
	<1090285839.4149.8.camel@localhost.localdomain>
Content-Type: multipart/mixed; boundary="=-I378RlDM6+HrFho6cijG"
Message-Id: <1090330640.15032.1.camel@famine>
Mime-Version: 1.0
Date: Tue, 20 Jul 2004 15:37:20 +0200
Cc: linux-mtd@lists.infradead.org, ecos-discuss@sources.redhat.com
Subject: Re: JFFS2 eats memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-I378RlDM6+HrFho6cijG
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> gc_node is the next node to be garbage-collected. We don't need to
> garbage-collect nodes which are already obsolete. So if you're freeing
> the object which is currently pointed to by jeb->gc_node, you can just
> make gc_node point to the next_phys node which you're _not_ freeing.

I modified the code to have gc continue on the previous node(the next
node does not always exist).



--=20
=D8yvind Harboe
http://www.zylin.com


--=-I378RlDM6+HrFho6cijG
Content-Disposition: attachment; filename=gcjffsmemfix.txt
Content-Type: text/plain; name=gcjffsmemfix.txt; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

? gcmemfix.txt
? memfix.txt
? memfixgc.txt
? memleakfix.txt
? mutex.txt
? oyvind@84.234.138.230
Index: build.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/build.c,v
retrieving revision 1.5
diff -w -u -r1.5 build.c
--- build.c	20 Nov 2003 16:52:36 -0000	1.5
+++ build.c	20 Jul 2004 13:35:11 -0000
@@ -259,6 +259,14 @@
 
 	c->resv_blocks_write = c->resv_blocks_deletion + (size / c->sector_size);
 
+	// If the flash disk is smaller than resv_blocks_write, then we 
+	// allow writing to the disk anyway. The flash disk is then most likely
+	// being used as write once - read many medimum, e.g. configuration of 
+	// static paramters.
+	if (c->resv_blocks_write * c->sector_size > c->flash_size) {
+	  c->resv_blocks_write = 0; 
+	}
+
 	/* When do we let the GC thread run in the background */
 
 	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;
Index: dir-ecos.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/dir-ecos.c,v
retrieving revision 1.5
diff -w -u -r1.5 dir-ecos.c
--- dir-ecos.c	11 Dec 2003 23:33:54 -0000	1.5
+++ dir-ecos.c	20 Jul 2004 13:35:11 -0000
@@ -48,9 +48,11 @@
 	up(&dir_f->sem);
 	if (ino) {
 		inode = jffs2_iget(dir_i->i_sb, ino);
-		if (!inode) {
+		if (IS_ERR(inode)) {
 			printk("jffs2_iget() failed for ino #%u\n", ino);
-			return (ERR_PTR(-EIO));
+			// NOTE! inode is *not* a pointer here, but an
+			// error code we propagate.
+			return inode;
 		}
 	}
 
Index: erase.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/erase.c,v
retrieving revision 1.6
diff -w -u -r1.6 erase.c
--- erase.c	11 Dec 2003 23:33:54 -0000	1.6
+++ erase.c	20 Jul 2004 13:35:11 -0000
@@ -365,11 +365,12 @@
 		jeb->dirty_size = 0;
 		jeb->wasted_size = 0;
 	} else {
-		struct jffs2_unknown_node marker = {
-			.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK),
-			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
-			.totlen =	cpu_to_je32(c->cleanmarker_size)
-		};
+		
+		struct jffs2_unknown_node marker;
+		memset(&marker, 0, sizeof(marker));
+		marker.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK);
+		marker.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
+		marker.totlen =	cpu_to_je32(c->cleanmarker_size);
 
 		marker.hdr_crc = cpu_to_je32(crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4));
 
Index: fs-ecos.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/fs-ecos.c,v
retrieving revision 1.27
diff -w -u -r1.27 fs-ecos.c
--- fs-ecos.c	21 Apr 2004 18:51:21 -0000	1.27
+++ fs-ecos.c	20 Jul 2004 13:35:12 -0000
@@ -302,7 +302,7 @@
 	d = jffs2_lookup(dir, name, namelen);
 	D2(printf("find_entry got dir = %x\n", d));
 
-	if (d == NULL)
+	if ((d==NULL)||IS_ERR(d))
 		return ENOENT;
 
 	// If it's a new directory inode, increase refcount on its parent
Index: gc.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/gc.c,v
retrieving revision 1.7
diff -w -u -r1.7 gc.c
--- gc.c	1 Apr 2004 03:17:57 -0000	1.7
+++ gc.c	20 Jul 2004 13:35:13 -0000
@@ -358,10 +358,10 @@
 	spin_unlock(&c->inocache_lock);
 
 	f = jffs2_gc_fetch_inode(c, inum, nlink);
-	if (IS_ERR(f))
-		return PTR_ERR(f);
-	if (!f)
-		return 0;
+	if (!f||IS_ERR(f)) {
+	  up(&c->alloc_sem);
+		return f;
+	}
 
 	ret = jffs2_garbage_collect_live(c, jeb, raw, f);
 
Index: nodemgmt.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/nodemgmt.c,v
retrieving revision 1.6
diff -w -u -r1.6 nodemgmt.c
--- nodemgmt.c	11 Dec 2003 23:33:54 -0000	1.6
+++ nodemgmt.c	20 Jul 2004 13:35:13 -0000
@@ -549,6 +549,59 @@
 		printk(KERN_WARNING "Short write in obliterating obsoleted node at 0x%08x: %zd\n", ref_offset(ref), retlen);
 		return;
 	}
+
+	/* Nodes which have been marked obsolete no longer need to be
+	   associated with any inode. Remove them from the per-inode list */
+	if (ref->next_in_ino) {
+		struct jffs2_inode_cache *ic;
+		struct jffs2_raw_node_ref **p;
+
+		ic = jffs2_raw_ref_to_ic(ref);
+		for (p = &ic->nodes; (*p) != ref; p = &((*p)->next_in_ino))
+			;
+
+		*p = ref->next_in_ino;
+		ref->next_in_ino = NULL;
+	}
+
+
+	/* Merge with the next node in the physical list, if there is one
+	   and if it's also obsolete. */
+	if (ref->next_phys && ref_obsolete(ref->next_phys) ) {
+		struct jffs2_raw_node_ref *n = ref->next_phys;
+		
+		ref->__totlen += n->__totlen;
+		/* we don't need to check jeb->last_node */
+		ref->next_phys = n->next_phys;
+		if (jeb->gc_node == n) {
+			/* gc will be happy continuing gc on this node */
+			jeb->gc_node=ref;
+		}
+		BUG_ON(n->next_in_ino);
+		jffs2_free_raw_node_ref(n);
+	}
+	
+	/* Also merge with the previous node in the list, if there is one
+	   and that one is obsolete */
+	if (ref != jeb->first_node ) {
+		struct jffs2_raw_node_ref *p = jeb->first_node;
+		
+		while (p->next_phys != ref)
+			p = p->next_phys;
+		
+		if (ref_obsolete(p) ) {
+			p->__totlen += ref->__totlen;
+			if (jeb->last_node == ref) {
+				jeb->last_node = p;
+			}
+			if (jeb->gc_node == ref) {
+				/* gc will be happy continuing gc on this node */
+				jeb->gc_node=p;
+			}
+			p->next_phys = ref->next_phys;
+			jffs2_free_raw_node_ref(ref);
+		}
+	}
 }
 
 #if CONFIG_JFFS2_FS_DEBUG > 0

--=-I378RlDM6+HrFho6cijG--
