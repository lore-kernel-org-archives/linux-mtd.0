Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmYyM-0004v6-HX
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 10:18:32 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1089792912.7607.22.camel@famine>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
	<1089759689.8822.18.camel@imladris.demon.co.uk>
	<1089792912.7607.22.camel@famine>
Content-Type: multipart/mixed; boundary="=-Hbz3ebdKew/+Lq+vDZGL"
Message-Id: <1090246707.13401.18.camel@famine>
Mime-Version: 1.0
Date: Mon, 19 Jul 2004 16:18:27 +0200
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


--=-Hbz3ebdKew/+Lq+vDZGL
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-07-14 at 10:15, =D8yvind Harboe wrote:
> On Wed, 2004-07-14 at 01:01, David Woodhouse wrote:
> > On Tue, 2004-07-13 at 15:41 +0200, =D8yvind Harboe wrote:
> > > After your walkthrough if the approach on IRC, I came up with this
> > > patch, which seems to take care of the problem.
> >=20
> > I can't work out what that's doing. Does it do something like this?
>=20
> Yes.
>=20
> - I made a small fix: update jeb->last_node
> - Ran some tests and it appears to do the job nicely on my rocket.

It crashes during garbage collect.

How does this fix look?

--=20
=D8yvind Harboe
http://www.zylin.com


--=-Hbz3ebdKew/+Lq+vDZGL
Content-Disposition: attachment; filename=memfixgc.txt
Content-Type: text/x-patch; name=memfixgc.txt; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Index: nodemgmt.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/nodemgmt.c,v
retrieving revision 1.6
diff -u -w -r1.6 nodemgmt.c
--- nodemgmt.c	11 Dec 2003 23:33:54 -0000	1.6
+++ nodemgmt.c	19 Jul 2004 14:15:48 -0000
@@ -549,6 +549,54 @@
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
+	/* try to free memory unless a garbage collect is in progress. */
+	if (jeb->gc_node==NULL) {
+	  /* Merge with the next node in the physical list, if there is one
+	     and if it's also obsolete. */
+	  if (ref->next_phys && ref_obsolete(ref->next_phys) ) {
+	    struct jffs2_raw_node_ref *n = ref->next_phys;
+	    if (jeb->gc_node != n) {
+	      ref->__totlen += n->__totlen;
+	      /* we don't need to check jeb->last_node */
+	      ref->next_phys = n->next_phys;
+	      BUG_ON(n->next_in_ino);
+	      jffs2_free_raw_node_ref(n);
+	    }
+	  }
+	  
+	  /* Also merge with the previous node in the list, if there is one
+	     and that one is obsolete and it is not currently being garabage collected */
+	  if (ref != jeb->first_node ) {
+	    struct jffs2_raw_node_ref *p = jeb->first_node;
+	    
+	    while (p->next_phys != ref)
+	      p = p->next_phys;
+	    
+	    if (ref_obsolete(p) ) {
+	      p->__totlen += ref->__totlen;
+	      if (jeb->last_node == ref) {
+		jeb->last_node = p;
+	      }
+	      p->next_phys = ref->next_phys;
+	      jffs2_free_raw_node_ref(ref);
+	    }
+	  }
+	}
 }
 
 #if CONFIG_JFFS2_FS_DEBUG > 0

--=-Hbz3ebdKew/+Lq+vDZGL--
