Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bC4is-0003mA-9g
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 12:42:39 +0000
Date: Sun, 12 Jun 2016 14:42:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "George Spelvin" <linux@sciencehorizons.net>
Cc: beanhuo@micron.com, computersforpeace@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH 2/4] mtd: nand: implement two pairing scheme
Message-ID: <20160612144215.48445eb4@bbrezillon>
In-Reply-To: <20160612122549.30320.qmail@ns.sciencehorizons.net>
References: <20160612131142.293ff800@bbrezillon>
 <20160612122549.30320.qmail@ns.sciencehorizons.net>
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

On 12 Jun 2016 08:25:49 -0400
"George Spelvin" <linux@sciencehorizons.net> wrote:

> >> (Another thing I thought of, but am less sure of, is packing the group
> >> and pair numbers into a register-passable int rather than a structure.
> >> Even 2 bits for the group is probably the most that will ever be needed,
> >> but it's easy to say the low 4 bits are the group and the high 28 are
> >> the pair.  Just create a few access macros to pull them apart.  
> 
> > We could indeed do that, but again, do we really need to optimize
> > things like that?  
> 
> I don't have a good mental model of what the code calling these
> translation functions looks like.  I was actually thinking that
> if the results were returned by value, then the page to pair/group
> translation function could be __pure, too, which might allow
> for more optimization of the caller.
> 
> In fact, if (and only if!) the struct mtd_info structures are all
> statically initialized, it would be legal to declare the functions
> __attribute__const__.
> 
> Normally, an attribute((const)) function isn't allowed to dereference
> pointers, but it *is* allowed to use information known at compile time,
> and if the pointer is to a structure known at compile-time, then it's
> okay.
> 
> All __attribute_const__ says is that the return value doesn't depend on
> any *mutable* state.
> 
> >> Well, yes, but you may need to do conversion ops for in-memory cache
> >> lookups or searching for free blocks, or wear-levelling computations,
> >> all of which may involve a great many conversions per actual I/O.  
> >
> > That's true, even if I don't think it makes such a big difference (you
> > don't have that much paired pages manipulation that are not followed by
> > read/write accesses, and this is where the contention is).  
> 
> In that case, there's not much to worry about.  As I said, I don't have a
> good idea what this information is used for.
> 
> >> However, it's desirable to alternate group-0 and group-1 pages, since
> >> the write operations are rather different and even take different amounts
> >> of time.  Alternating them makes it possible to:
> >> 1) Possibly overlap parts of the writes that use different on-chip
> >>    resources, and
> >> 2) Average the non-overlapping times for minimum jitter.  
> 
> > Okay, that's actually a good reason, and probably the part I was
> > missing to explain these non-log2 distance scheme leading to
> > heterogeneous distance (the first and last set of pages don't have
> > the same stride).  
> 
> Please note that I'm guessing, too; I don't actually *know*.
> 
> But the idea seems to hold together.
> 
> > Still, I've seen weird things while working on modern MLC NANDs which
> > makes me think the pairing scheme is also here to help mitigate the
> > write-disturb effect, but I might be wrong. The behavior I'm
> > describing here has been observed on Hynix (H27QCG8T2E5R=E2=80=90BCF) and
> > Toshiba (TC58TEG5DCLTA00) NANDs so far. When I write the 2 pages in a
> > pair, but not the following page, I see a high number of bitflips in
> > the last programmed page until the next page is programmed.
> > 
> > Let's take a real example. My NAND is exposing a stride-3 pairing
> > scheme, when I only program page 0, 1, 2, page 2 is showing a high
> > number of bitflips until page 3 is programmed. Actually, I don't
> > remember if the number decrease after programming page 3 or 4, but my
> > guess is that the NAND is accounting for future write-disturb when
> > programming a page in group 1, which makes this page un-reliable until
> > the subsequent page(s) have been programmed.
> > 
> > What's your opinion on that?  
> 
> I'm a bit confused, too, but that actually seems plausible.  The Samsung
> data sheet you pointed me to explicitly says that the pages in a block
> must be programmed in order, no exceptions.

Yep, that is mandatory.

> (In fact, an interesting
> question is whether bad pages should be skipped or not!)

There's no such thing. We have bad blocks, but when a block is bad all
the pages inside this block are considered bad. If one of the page in a
valid block shows uncorrectable errors, UBI/UBIFS will just refuse to
attach the partition/mount the FS.

> 
> Given that, very predictable writer ordering, it would make sense to
> precompensate for write disturb.

Yes, that's what I assumed, but this is not clearly documented.
Actually, I discovered that while trying to solve the paired pages
problem (when I was partially programming a block, it was showing
uncorrectable errors sooner than the fully written ones).

> 
> >> Also, the data sheets are a real PITA to find.  I have yet to
> >> see an actual data sheet that documents the stride-3 pairing scheme.  
> 
> > Yes, that's a real problem. Here is a Samsung NAND data sheet
> > describing stride-3 [1], and an Hynix one describing stride-6 [2].
> > 
> > [1]http://dl.btc.pl/kamami_wa/k9gbg08u0a_ds.pdf
> > [2]http://www.szyuda88.com/uploadfile/cfile/201061714220663.pdf  
> 
> Thank you very much!
> 
> Did you see the footnote at the bottom of p. 64 of the latter?
> Does that affect your pair/group addressing scheme?
> 
> It seems they are grouping not just 8K pages into even/odd double-pages,
> and those 16K double-pages are being addressed with stride of 3.
> 
> But in particular, an interrupted write is likely to corrupt both
> double-pages, 32K of data!

Yes, that's yet another problem I decided to ignore for now :).

I guess a solution would be to consider that all 4 pages are 'paired'
together, but this also implies considering that the NAND is a 4-level
cells, which will make us loose even more space when operating in 'SLC
mode' where we only write the lower page (page attached to group 0) of
each pair.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
