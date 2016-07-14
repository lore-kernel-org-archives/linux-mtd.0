Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNc5P-0006rg-16
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 08:33:36 +0000
Date: Thu, 14 Jul 2016 10:33:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Artem Bityutskiy
 <dedekind1@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: Cached NAND reads and UBIFS
Message-ID: <20160714103301.4b01b0ce@bbrezillon>
In-Reply-To: <20160713165422.GA130613@google.com>
References: <57863449.4070108@nod.at>
	<20160713165422.GA130613@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 Jul 2016 09:54:22 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, Jul 13, 2016 at 02:30:01PM +0200, Richard Weinberger wrote:
> > The TNC seems to assume that it can do a lot of short reads since the NAND
> > read cache will help.  
> 
> For my info: by "short reads" are you talking page-size/aligned?
> Subpage-sized/aligned? Or none of the above?

None of them. IIRC, the size was around 200bytes and not necessarily
page or ECC-chunk aligned.

> 
> > But as soon subpage reads are possible this assumption is no longer true.  
> 
> This sounds similar to the problem we were just discussing, about a
> bug/oversight/suboptimality in nand_do_read_ops()'s use of an extra
> buffer + memcpy(). I guess the difference here is that a sub-page read
> can't fill the cache as-is (we have no way to mark the cache as
> partially valid), so we just skip it. To "fixup" the cache
> for subpages, I guess we'd have to split it into subpages...

Well, it's not exactly the same problem. For the EC/VID headers we know
that we'll only need to read 64 bytes from the whole page. Here, we
don't know: the code might well read the whole page in small chunks,
and using subpage read in this case is inefficient: each time you have
to issue a READ command to store the page in the internal NAND cache,
and then I/Os + ECC calculation for the ECC chunk (note that modern
NAND controllers are able to pipeline I/Os and ECC calculation, thus
making full-page read more efficient than partial ones especially when
you end-up reading the whole page).

This is why this decision to use full-page vs ECC-chunk (AKA subpage)
reads can only be done at the MTD user level (in this particular case,
only UBIFS can predict whether we are likely to need the whole page
content or only a sub-part of it).

> 
> > Now we're not sure what do do, should we implement bulk reading in the TNC
> > code or improve NAND read caching?  
> 
> Seems like we should improve the caching, either in a layer above, or
> just in the NAND layer.

I think we all agree on that one :).

> 
> But, we haven't really figured out how to advertise the minimum
> (optimal) read size to the MTD user, right? We have at best
> 
>   writesize >> subpage_sft
> 
> but that's really the minimum write size, not read size, right?

Correct, the minimum write-size (when the controller supports
individual ECC chunk read) is an ECC chunk (usually 512 or 1024 bytes).

But again, the minimum read size is not necessarily the most optimal one
(see my explanation above), this means we'll have to differentiate the
minimum read size from the optimal read size (the one providing the
best throughput).

> So even
> if we're trying to shore up the read cacheability, we should better
> define the constraints first, so that we know what we can guarantee an
> MTD user, and what we can't. e.g., we will cache on size/alignment FOO,
> and anything not aligned to that is not guaranteed.

The read request will be ECC chunk (or page) aligned anyway, and the
core will use an intermediate buffer when the user request does not
match this constraint, so we'll always end-up with aligned content that
we can store in the cache.

> 
> On a potentially conflicting note, I think nand_do_read_ops() is too
> complicated. I think Boris expressed a similar sentiment. So if we can
> find a good way to factor the caching code to be less entangled with the
> mechanics of reading, that'd be a win for me.

I fully agree, and I'm not even sure this caching mechanism should be
implemented in the NAND layer.

Regards,

Boris
