Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbIv-0001Uo-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:38:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0209041519170.22265-100000@hex.linuxgrrls.org> 
References: <Pine.LNX.4.33.0209041519170.22265-100000@hex.linuxgrrls.org> 
To: Jasmine Strong <jasmine@hex.linuxgrrls.org>
Cc: John Hall <John.Hall@optionexist.co.uk>,
    "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 15:37:00 +0100
Message-ID: <547.1031150220@redhat.com>
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
>  Yes.  uCLinux, anyway.   Pointers should always be treated as opaque
> unless you have a *really* good reason not to.

I have 8000 reasons not to:

# grep node_frag /proc/slabinfo 
jffs2_node_frag     8028   8064     28   64   64    1

At a gratuitous extra 4 bytes per object, that's... ok, well it's only
wasting 32KiB which is less than I expected, but it still annoys me.

> (Architectures that don't always use word-aligned pointers include
> m68k and ARM Thumb.) 

Even when we're allocating from the slab and the object in question is a 
structure of size which is an even number?

Even so, I'd assume that we care even _more_ about that 32KiB on uCLinux, so
maybe it's worth adding 1 byte of padding to the structure there and
manually aligning the pointer after allocating, or something. We only need 
1 bit, after all. Or we could use the _top_ bit on uCLinux, perhaps?

--
dwmw2
