From: David Woodhouse <dwmw2@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <1100959034.8600.33.camel@localhost.localdomain>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
Content-Type: multipart/mixed; boundary="=-URol7UcCDtY2MRe5tjG6"
Date: Sat, 20 Nov 2004 14:47:03 +0000
Message-Id: <1100962023.8600.38.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-URol7UcCDtY2MRe5tjG6
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2004-11-20 at 13:57 +0000, David Woodhouse wrote:
> On Thu, 2004-11-18 at 17:35 +0100, Konstantin Kletschke wrote:
> > Well I tried out the jffs2 which is in 2.6.10-rc2 vanilla and
> > experienced the same:
> 
> Is this with an SMP or preemptable kernel? If so, I think I see the
> problem. Does it also fix it if you wrap the code you disabled with 
> 	spin_lock(&c->erase_completion_lock);
> 	<...>
> 	spin_unlock(&c->erase_completion_lock);

Alternatively try the better fix I committed to CVS, which is attached. 

There was another race in jffs2_mark_node_obsolete() anyway -- we were
marking the ref as REF_OBSOLETE and then potentially filing its
eraseblock onto the erase_pending_list, but then we were dropping the
lock -- and nothing was preventing the erase code from actually erasing
the block and then freeing 'ref' before we got round to clearing the
JFFS2_NODETYPE_OBSOLETE bit and trying to merge with adjacent obsolete
refs.

-- 
dwmw2

--=-URol7UcCDtY2MRe5tjG6
Content-Disposition: inline
Content-Description: Attached message - mtd/fs/jffs2 nodemgmt.c,1.111,1.112
Content-Type: message/rfc822

Return-path: <linux-mtd-cvs-bounces+dwmw2=infradead.org@lists.infradead.org>
Envelope-to: dwmw2@baythorne.infradead.org
Delivery-date: Sat, 20 Nov 2004 14:18:16 +0000
Received: from [2002:cde9:da46::1] (helo=canuck.infradead.org) by
	baythorne.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux)) id
	1CVW46-00077t-PS for dwmw2@baythorne.infradead.org; Sat, 20 Nov 2004
	14:18:16 +0000
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org) by
	canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux)) id
	1CVWAu-0005uf-F4; Sat, 20 Nov 2004 09:25:16 -0500
Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux)) id
	1CVWAp-0005ua-Go for linux-mtd-cvs@canuck.infradead.org;
	Sat, 20 Nov 2004 09:25:12 -0500
Received: from dwmw2 by phoenix.infradead.org with local (Exim 4.42 #1 (Red
	Hat Linux)) id 1CVWAn-0004sU-3M for linux-mtd-cvs@lists.infradead.org;
	Sat, 20 Nov 2004 14:25:09 +0000
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-mtd-cvs@lists.infradead.org
X-CVS-Module: mtd
X-CVS-Directory: mtd/fs/jffs2
Precedence: first-class
Message-Id: <E1CVWAn-0004sU-3M@phoenix.infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 20 Nov 2004 14:25:09 +0000
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
	phoenix.infradead.org See http://www.infradead.org/rpr.html
Subject: mtd/fs/jffs2 nodemgmt.c,1.111,1.112
X-BeenThere: linux-mtd-cvs@lists.infradead.org
X-Mailman-Version: 2.1.5
List-Id: Linux MTD CVS commit list <linux-mtd-cvs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd-cvs>
List-Post: <mailto:linux-mtd-cvs@lists.infradead.org>
List-Help: <mailto:linux-mtd-cvs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-cvs-bounces@lists.infradead.org
Errors-To: linux-mtd-cvs-bounces+dwmw2=infradead.org+dwmw2=infradead.org@lists.infradead.org
X-Evolution-Source: imap://dwmw2@pentafluge.infradead.org/
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Update of /home/cvs/mtd/fs/jffs2
In directory phoenix.infradead.org:/tmp/cvs-serv18719

Modified Files:
	nodemgmt.c 
Log Message:
Fix race in jffs2_mark_node_obsolete(). There was nothing preventing the
block from being erased and 'ref' from being freed before we even got
around to marking it obsolete and then trying to merge nodes.


Index: nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.111
retrieving revision 1.112
diff -u -r1.111 -r1.112
--- nodemgmt.c	16 Nov 2004 20:36:11 -0000	1.111
+++ nodemgmt.c	20 Nov 2004 14:25:05 -0000	1.112
@@ -399,6 +399,17 @@
 	}
 	jeb = &c->blocks[blocknr];
 
+	if (jffs2_can_mark_obsolete(c) && !jffs2_is_readonly(c) &&
+	    !(c->flags & JFFS2_SB_FLAG_MOUNTING)) {
+		/* Hm. This may confuse static lock analysis. If any of the above 
+		   three conditions is false, we're going to return from this 
+		   function without actually obliterating any nodes or freeing
+		   any jffs2_raw_node_refs. So we don't need to stop erases from
+		   happening, or protect against people holding an obsolete
+		   jffs2_raw_node_ref without the erase_completion_lock. */
+		down(&c->erase_free_sem);
+	}
+
 	spin_lock(&c->erase_completion_lock);
 
 	if (ref_flags(ref) == REF_UNCHECKED) {
@@ -463,6 +474,7 @@
 		   marked obsolete on the flash at the time they _became_
 		   obsolete, there was probably a reason for that. */
 		spin_unlock(&c->erase_completion_lock);
+		/* We didn't lock the erase_free_sem */
 		return;
 	}
 
@@ -515,53 +527,66 @@
 
 	spin_unlock(&c->erase_completion_lock);
 
-	if (!jffs2_can_mark_obsolete(c))
-		return;
-	if (jffs2_is_readonly(c))
+	if (!jffs2_can_mark_obsolete(c) || jffs2_is_readonly(c)) {
+		/* We didn't lock the erase_free_sem */
 		return;
+	}
+
+	/* The erase_free_sem is locked, and has been since before we marked the node obsolete
+	   and potentially put its eraseblock onto the erase_pending_list. Thus, we know that
+	   the block hasn't _already_ been erased, and that 'ref' itself hasn't been freed yet
+	   by jffs2_free_all_node_refs() in erase.c. Which is nice. */
 
 	D1(printk(KERN_DEBUG "obliterating obsoleted node at 0x%08x\n", ref_offset(ref)));
 	ret = jffs2_flash_read(c, ref_offset(ref), sizeof(n), &retlen, (char *)&n);
 	if (ret) {
 		printk(KERN_WARNING "Read error reading from obsoleted node at 0x%08x: %d\n", ref_offset(ref), ret);
-		return;
+		goto out_erase_sem;
 	}
 	if (retlen != sizeof(n)) {
 		printk(KERN_WARNING "Short read from obsoleted node at 0x%08x: %zd\n", ref_offset(ref), retlen);
-		return;
+		goto out_erase_sem;
 	}
 	if (PAD(je32_to_cpu(n.totlen)) != PAD(ref_totlen(c, jeb, ref))) {
 		printk(KERN_WARNING "Node totlen on flash (0x%08x) != totlen from node ref (0x%08x)\n", je32_to_cpu(n.totlen), ref_totlen(c, jeb, ref));
-		return;
+		goto out_erase_sem;
 	}
 	if (!(je16_to_cpu(n.nodetype) & JFFS2_NODE_ACCURATE)) {
 		D1(printk(KERN_DEBUG "Node at 0x%08x was already marked obsolete (nodetype 0x%04x)\n", ref_offset(ref), je16_to_cpu(n.nodetype)));
-		return;
+		goto out_erase_sem;
 	}
 	/* XXX FIXME: This is ugly now */
 	n.nodetype = cpu_to_je16(je16_to_cpu(n.nodetype) & ~JFFS2_NODE_ACCURATE);
 	ret = jffs2_flash_write(c, ref_offset(ref), sizeof(n), &retlen, (char *)&n);
 	if (ret) {
 		printk(KERN_WARNING "Write error in obliterating obsoleted node at 0x%08x: %d\n", ref_offset(ref), ret);
-		return;
+		goto out_erase_sem;
 	}
 	if (retlen != sizeof(n)) {
 		printk(KERN_WARNING "Short write in obliterating obsoleted node at 0x%08x: %zd\n", ref_offset(ref), retlen);
-		return;
+		goto out_erase_sem;
 	}
 
 	/* Nodes which have been marked obsolete no longer need to be
-	   associated with any inode. Remove them from the per-inode list */
+	   associated with any inode. Remove them from the per-inode list.
+	   
+	   Note we can't do this for NAND at the moment because we need 
+	   obsolete dirent nodes to stay on the lists, because of the
+	   horridness in jffs2_garbage_collect_deletion_dirent(). */
 	if (ref->next_in_ino) {
 		struct jffs2_inode_cache *ic;
 		struct jffs2_raw_node_ref **p;
 
+		spin_lock(&c->erase_completion_lock);
+
 		ic = jffs2_raw_ref_to_ic(ref);
 		for (p = &ic->nodes; (*p) != ref; p = &((*p)->next_in_ino))
 			;
 
 		*p = ref->next_in_ino;
 		ref->next_in_ino = NULL;
+
+		spin_unlock(&c->erase_completion_lock);
 	}
 
 
@@ -570,6 +595,8 @@
 	if (ref->next_phys && ref_obsolete(ref->next_phys) ) {
 		struct jffs2_raw_node_ref *n = ref->next_phys;
 		
+		spin_lock(&c->erase_completion_lock);
+
 		ref->__totlen += n->__totlen;
 		ref->next_phys = n->next_phys;
                 if (jeb->last_node == n) jeb->last_node = ref;
@@ -577,6 +604,8 @@
 			/* gc will be happy continuing gc on this node */
 			jeb->gc_node=ref;
 		}
+		spin_unlock(&c->erase_completion_lock);
+
 		BUG_ON(n->next_in_ino);
 		jffs2_free_raw_node_ref(n);
 	}
@@ -585,7 +614,9 @@
 	   and that one is obsolete */
 	if (ref != jeb->first_node ) {
 		struct jffs2_raw_node_ref *p = jeb->first_node;
-		
+
+		spin_lock(&c->erase_completion_lock);
+
 		while (p->next_phys != ref)
 			p = p->next_phys;
 		
@@ -601,7 +632,10 @@
 			p->next_phys = ref->next_phys;
 			jffs2_free_raw_node_ref(ref);
 		}
+		spin_unlock(&c->erase_completion_lock);
 	}
+ out_erase_sem:
+	up(&c->erase_free_sem);
 }
 
 #if CONFIG_JFFS2_FS_DEBUG >= 2


__________________________________________________________
Linux-MTD CVS commit list
http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs/

--=-URol7UcCDtY2MRe5tjG6--
