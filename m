Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbjG-0001dV-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:06:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0209041546020.22265-100000@hex.linuxgrrls.org> 
References: <Pine.LNX.4.33.0209041546020.22265-100000@hex.linuxgrrls.org> 
To: Jasmine Strong <jasmine@hex.linuxgrrls.org>
Cc: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 16:06:02 +0100
Message-ID: <4414.1031151962@redhat.com>
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

jasmine@hex.linuxgrrls.org said:
>  Is there nowhere that's not a pointer that you can stuff it? 

struct jffs2_node_frag
{
	rb_node_t rb;
	struct jffs2_full_dnode *node; /* NULL for holes */
	uint32_t size;
	uint32_t ofs; /* Don't really need this, but optimisation */
};

Not really. 'size' and 'ofs' are within the file -- so if you open a file,
seek to 0xFFFFFFFD and write a byte, you can quite happily end up with a
hole frag with size=0xFFFFFFFD and a subsequent data frag with the same ofs.
So I can't abuse the high or low bits like I do with the physical offsets on
the flash in the jffs2_raw_node_ref.

And although I thought at the time that 'size' was an optimisation I don't 
really think it is any more.

Although actually perhaps it is. Must investigate that possibility too -- no
reason why I can't assume that 'frag->size' is always equivalent to
'frag_next(frag)->ofs - frag->ofs', as long as I stick in an end-marker to
show the size of the last frag, if I can stick 0xFFFFFFFF in the 'node'
pointer to mark that or something. Or if you'd shoot me for that too I could
allocate something at boot and use _that_ address as the 'end marker' in the
knowledge that it's not ambiguous.

--
dwmw2
