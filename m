Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1QjD-0003tf-NI
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 10:04:36 -0500
Received: from fra-out-02.spheriq.net (fra-out-02.spheriq.net [195.46.51.130])
	by fra-del-03.spheriq.net with ESMTP id j1GF4UNF018627
	for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2005 15:04:30 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-02.spheriq.net with ESMTP id j1GF4Ukx023856
	for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2005 15:04:30 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <42135E98.E187DD1A@st.com>
Date: Wed, 16 Feb 2005 15:54:16 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Konstantin Kletschke <lists@ku-gbr.de>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
	<20050216122015.GB16239@synertronixx3>
	<1108556645.24721.86.camel@tglx.tec.linutronix.de>
	<20050216124409.GC16239@synertronixx3>
	<20050216133753.GD16239@synertronixx3>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops vanilla 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:
> EEEEEK. jffs2_mark_node_obsolete called with NULL node

> >>EIP; c00bfed0 <jffs2_build_remove_unlinked_inode+30/ec>   <=====
> 
> >>r3; c01b1ed4 <log_wait+0/8>
> 
> Trace; c00bfea0 <jffs2_build_remove_unlinked_inode+0/ec>
> Trace; c00bfcf8 <jffs2_build_filesystem+1e4/38c>
> Trace; c00bfb14 <jffs2_build_filesystem+0/38c>

Not sure this is relevant, (and I have no way to test it right now), 
but it could be related to the obsolete node merging. You have NOR
flash haven't you ?

In jffs2_build_remove_unlinked_inode 
	raw = ic->nodes;
	while (raw != (void *)ic) {
		struct jffs2_raw_node_ref *next = raw->next_in_ino;
		D1(printk(KERN_DEBUG "obsoleting node at 0x%08x\n", ref_offset(raw)));
		jffs2_mark_node_obsolete(c, raw);
		raw = next;
	}

However if "next" is also raw->next_phys and is already obsolete 
and is the last in the next_in_ino chain, I think it may be 
freed in jffs2_mark_node_obsolete:

	/* Merge with the next node in the physical list, if there is one
	   and if it's also obsolete and if it doesn't belong to any inode */
	if (ref->next_phys && ref_obsolete(ref->next_phys) &&
	    !ref->next_phys->next_in_ino) {
		struct jffs2_raw_node_ref *n = ref->next_phys;
		
		spin_lock(&c->erase_completion_lock);

		ref->__totlen += n->__totlen;
		ref->next_phys = n->next_phys;
                if (jeb->last_node == n) jeb->last_node = ref;
		if (jeb->gc_node == n) {
			/* gc will be happy continuing gc on this node */
			jeb->gc_node=ref;
		}
		spin_unlock(&c->erase_completion_lock);

		jffs2_free_raw_node_ref(n);
	}

This would explain things... if you think it is plausible you could
try commenting out the node merging in jffs2_mark_node_obsolete.

Estelle
