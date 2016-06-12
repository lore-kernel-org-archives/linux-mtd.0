Received: from ns.sciencehorizons.net ([71.41.210.147])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCBwa-0007AD-57
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 20:25:19 +0000
Date: 12 Jun 2016 16:24:53 -0400
Message-ID: <20160612202453.21265.qmail@ns.sciencehorizons.net>
From: "George Spelvin" <linux@sciencehorizons.net>
To: boris.brezillon@free-electrons.com, linux@sciencehorizons.net
Subject: Re: [PATCH 2/4] mtd: nand: implement two pairing scheme
Cc: beanhuo@micron.com, computersforpeace@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at
In-Reply-To: <20160612144215.48445eb4@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon wrote:
> On 12 Jun 2016 08:25:49 -0400
> "George Spelvin" <linux@sciencehorizons.net> wrote:
>> (In fact, an interesting
>> question is whether bad pages should be skipped or not!)
> 
> There's no such thing. We have bad blocks, but when a block is bad all
> the pages inside this block are considered bad. If one of the page in a
> valid block shows uncorrectable errors, UBI/UBIFS will just refuse to
> attach the partition/mount the FS.

Ah, okay.  I guess dealing with inconsistently-sized blocks is too much
hassle.  And a block has a single program/erase cycle count, so if one
part is close to wearing out, the rest is, too.

P.S. interesting NASA study of (SLC) flash disturb effects:
http://nepp.nasa.gov/DocUploads/9CCA546D-E7E6-4D96-880459A831EEA852/07-100%20Sheldon_JPL%20Distrub%20Testing%20in%20Flash%20Mem.pdf?q=disturb-testing-in-flash-memories

One thing they noted was that manufacturers' bad-blocck testing sucked,
and quite a few "bad" blocks became good and stayed good over time.

>> Given that, very predictable writer ordering, it would make sense to
>> precompensate for write disturb.
> 
> Yes, that's what I assumed, but this is not clearly documented.
> Actually, I discovered that while trying to solve the paired pages
> problem (when I was partially programming a block, it was showing
> uncorrectable errors sooner than the fully written ones).

Were the errors in a predictable direction?  My understanding is that
write disturb tends to add a little extra charge to the disturbed
floating gates (i.e. write them more toward 0), so you'd expect
to see extra 1s if the chip was underprogramming in antiipation.

I'm also having a hard time figuring out the bit assignment.
In general, "1" means uncharged floating gate and "0" means charged,
but different sources show different encodings for MLC.

Some (e.g. the NASA report above) show the progression from erased to
programmed as

11 - 10 - 01 - 00

so the msbit is a "big jump" and the lsbit is a "small jump", and to
program it in SLC mode you'd program both pages identically, then read
back the msbit.


Others, e.g.
http://users.ece.cmu.edu/~omutlu/pub/flash-programming-interference_iccd13.pdf
suggest the order is

11 - 10 - 00 - 01

This has the advantage that a 1-level mis-read only produces a 1-bit
error.

But in this case, to get SLC programming, you program the lsbit as
all-ones.

My problem is that I don't really understand MLC programming.


>>> [2]http://www.szyuda88.com/uploadfile/cfile/201061714220663.pdf  
>> 
>> Did you see the footnote at the bottom of p. 64 of the latter?
>> Does that affect your pair/group addressing scheme?
>> 
>> It seems they are grouping not just 8K pages into even/odd double-pages,
>> and those 16K double-pages are being addressed with stride of 3.
>> 
>> But in particular, an interrupted write is likely to corrupt both
>> double-pages, 32K of data!
> 
> Yes, that's yet another problem I decided to ignore for now :).
> 
> I guess a solution would be to consider that all 4 pages are 'paired'
> together, but this also implies considering that the NAND is a 4-level
> cells, which will make us loose even more space when operating in 'SLC
> mode' where we only write the lower page (page attached to group 0) of
> each pair.

It's more considering it to have 16K pages that can be accessed in half-pages.

> Now I remember why I decided to ignore this. If you look at this other
> Hynix data sheet [1] exposing the same pairing scheme you see that the
> description as slightly changed. I don't know if it's a fix from the
> previous description or if the pairing scheme are really different, but
> until someone has tested it on a real device, I'll assume the Hynix
> case is an exception which should be handled separately.

This chip has 16K pages.  But yes, it also has 256 pages/block.
