Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mcLe-0001n2-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:45:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0209041629310.22657-100000@hex.linuxgrrls.org> 
References: <Pine.LNX.4.33.0209041629310.22657-100000@hex.linuxgrrls.org> 
To: Jasmine Strong <jasmine@hex.linuxgrrls.org>
Cc: Allen Curtis <acurtis@onz.com>,
    John Hall <John.Hall@optionexist.co.uk>,
    "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 16:44:48 +0100
Message-ID: <9941.1031154288@redhat.com>
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
> > > Adding a byte will destroy the alignment.  you'd have to add a whole
> > > word.
> > Er, what alignment?
>  The alignment of the structure.  Either it's a whole multiple of
> words or it isn't.

Sorry, I was making the unstated assumption that we would have a #define 
and add the byte only in the case where it was required because the 
allocator would _already_ be giving us unaligned structures.

So we never need to add a word instead of a byte to preserve the alignment, 
because in the case where the alignment needs preserving, we didn't need to 
add the byte in the first place.

(And now I'm making the assumption that "aligned structures" == "pointers 
without the low bit set", but that's not unreasonable in the real world.) 

But anyway, having seen that it's not as huge a saving as I thought, and
having seen that I can probably save the 4 bytes of 'size' with less pain,
I may not bother with it at all for a while.

--
dwmw2
