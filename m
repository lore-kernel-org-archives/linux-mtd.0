Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkWHF-0006Kv-Vb
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 19:01:34 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <1089726079.6288.5.camel@famine>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1089759689.8822.18.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 00:01:29 +0100
Content-Transfer-Encoding: 8bit
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

On Tue, 2004-07-13 at 15:41 +0200, Øyvind Harboe wrote:
> After your walkthrough if the approach on IRC, I came up with this
> patch, which seems to take care of the problem.

I can't work out what that's doing. Does it do something like this?


Index: nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.107
diff -u -p -r1.107 nodemgmt.c
--- nodemgmt.c	26 Nov 2003 15:30:58 -0000	1.107
+++ nodemgmt.c	13 Jul 2004 23:00:48 -0000
@@ -549,6 +549,46 @@ void jffs2_mark_node_obsolete(struct jff
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
+	/* Merge with the next node in the physical list, if there is one
+	   and if it's also obsolete */
+	if (ref->next_phys && ref_obsolete(ref->next_phys)) {
+		struct jffs2_raw_node_ref *n = ref->next_phys;
+
+		ref->__totlen += n->__totlen;
+		ref->next_phys = n->next_phys;
+		BUG_ON(n->next_in_ino);
+		jffs2_free_raw_node_ref(n);
+	}
+
+	/* Also merge with the previous node in the list, if there is one
+	   and it that one is obsolete */
+	if (ref != jeb->first_node) {
+		struct jffs2_raw_node_ref *p = jeb->first_node;
+
+		while (p->next_phys != ref)
+			p = p->next_phys;
+
+		if (ref_obsolete(p)) {
+			p->__totlen += ref->__totlen;
+			p->next_phys = ref->next_phys;
+			jffs2_free_raw_node_ref(ref);
+		}
+	}
 }
 
 #if CONFIG_JFFS2_FS_DEBUG > 0


-- 
dwmw2
