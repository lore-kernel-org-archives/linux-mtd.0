Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUpxf-0006VV-HK
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 12:20:49 -0500
Date: Thu, 18 Nov 2004 18:20:46 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20041118172046.GB9471@synertronixx3>
References: <20041118163528.GA9471@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20041118163528.GA9471@synertronixx3>
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


In nodemgmt.c I remove the following code, which was added after 2.6.9:

#undef KONSTI
#ifdef KONSTI

        /* Nodes which have been marked obsolete no longer need to be
           associated with any inode. Remove them from the per-inode list */
        if (ref->next_in_ino) {
                struct jffs2_inode_cache *ic;
                struct jffs2_raw_node_ref **p;

                ic = jffs2_raw_ref_to_ic(ref);
                for (p = &ic->nodes; (*p) != ref; p = &((*p)->next_in_ino))
                        ;

                *p = ref->next_in_ino;
                ref->next_in_ino = NULL;
        }


        /* Merge with the next node in the physical list, if there is one
           and if it's also obsolete. */
        if (ref->next_phys && ref_obsolete(ref->next_phys) ) {
                struct jffs2_raw_node_ref *n = ref->next_phys;

                ref->__totlen += n->__totlen;
                ref->next_phys = n->next_phys;
                if (jeb->last_node == n) jeb->last_node = ref;
                if (jeb->gc_node == n) {
                        /* gc will be happy continuing gc on this node */
                        jeb->gc_node=ref;
                }
                BUG_ON(n->next_in_ino);
                jffs2_free_raw_node_ref(n);
        }

        /* Also merge with the previous node in the list, if there is one
           and that one is obsolete */
        if (ref != jeb->first_node ) {
                struct jffs2_raw_node_ref *p = jeb->first_node;

                while (p->next_phys != ref)
                        p = p->next_phys;

                if (ref_obsolete(p) ) {
                        p->__totlen += ref->__totlen;
                        if (jeb->last_node == ref) {
                                jeb->last_node = p;
                        }
                        if (jeb->gc_node == ref) {
                                /* gc will be happy continuing gc on this node */
                                jeb->gc_node=p;
                        }
                        p->next_phys = ref->next_phys;
                        jffs2_free_raw_node_ref(ref);
                }
        }

#endif


That helps, the Kernel doesn't Oops on fresh flashed filesystem. Don't know
if the error is this code or only triggered by it though.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
