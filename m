Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZguNj-0000nD-Gv
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 12:51:45 +0000
Date: Tue, 29 Sep 2015 14:51:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>, "Qi Wang
 =?UTF-8?B?546L6LW3?= (qiwang)" <qiwang@micron.com>, Iwo Mergler
 <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20150929145120.10c6a8c5@bbrezillon>
In-Reply-To: <560A73A5.2070406@nod.at>
References: <20150917152240.757c9e90@bbrezillon>
	<560A73A5.2070406@nod.at>
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

Hi Richard,

On Tue, 29 Sep 2015 13:19:01 +0200
Richard Weinberger <richard@nod.at> wrote:

> Hi!
> 
> Am 17.09.2015 um 15:22 schrieb Boris Brezillon:
> > Hello,
> > 
> > I'm currently working on the paired pages problem we have on MLC chips.
> > I remember discussing it with Artem earlier this year when I was
> > preparing my talk for ELC.
> > 
> > I now have some time I can spend working on this problem and I started
> > looking at how this can be solved.
> > 
> > First let's take a look at the UBI layer.
> > There's one basic thing we have to care about: protecting UBI metadata.
> > There are two kind of metadata:
> > 1/ those stored at the beginning of each erase block (EC and VID
> >    headers)
> > 2/ those stored in specific volumes (layout and fastmap volumes)
> > 
> > We don't have to worry about #2 since those are written using atomic
> > update, and atomic updates are immune to this paired page corruption
> > problem (either the whole write is valid, or none of it is valid).
> > 
> > This leaves problem #1.
> > For this case, Artem suggested to duplicate the EC header in the VID
> > header so that if page 0 is corrupted we can recover the EC info from
> > page 1 (which will contain both VID and EC info).
> > Doing that is fine for dealing with EC header corruption, since, AFAIK,
> > none of the NAND vendors are pairing page 0 with page 1.
> > Still remains the VID header corruption problem. Do prevent that we
> > still have several solutions:
> > a/ skip the page paired with the VID header. This is doable and can be
> >    hidden from UBI users, but it also means that we're loosing another
> >    page for metadata (not a negligible overhead)
> > b/ storing VID info (PEB <-> LEB association) somewhere else. Fastmap
> >    seems the right place to put that in, since fastmap is already
> >    storing those information for almost all blocks. Still we would have
> >    to modify fastmap a bit to store information about all erase blocks
> >    and not only those that are not part of the fastmap pool.
> >    Also, updating that in real-time would require using a log approach,
> >    instead of the atomic update currently used by fastmap when it runs
> >    out of PEBs in it's free PEB pool. Note that the log approach does
> >    not have to be applied to all fastmap data (we just need it for the
> >    PEB <-> LEB info).
> >    Another off-topic note regarding the suggested log approach: we
> >    could also use it to log which PEB was last written/erased, and use
> >    that to handle the unstable bits issue.
> > c/ (also suggested by Artem) delay VID write until we have enough data
> >    to write on the LEB, and thus guarantee that it cannot be corrupted
> >    (at least by programming on the paired page ;-)) anymore.
> >    Doing that would also require logging data to be written on those
> >    LEBs somewhere, not to mention the impact of copying the data twice
> >    (once in the log, and then when we have enough data, in the real
> >    block).
> 
> Let's start with UBI, as soon it is stable on MLC NAND we can focus on
> UBIFS.

I wish it was that simple, but the decision we take at the UBI layer
will most likely impact the choices we'll have at the UBIFS layer.
So yes, focusing on the UBI layer for the implementation sounds
sensible, but I think we have to carefully think about the solution we
want to test first, and what are the impact on the UBIFS implementation.

> 
> Solution a) sounds very promising to me as the can be implemented easily
> and loosing another page for meta data is IMHO acceptable on MLC.
> Especially as MLC NANDs are anyways bigger and cheaper than SLC.

Yes, solution a) is definitely the simplest one (and probably the one
I'll try first). Regarding the overhead, we go from
2/number_of_pages_per_block to 4/number_of_pages_per_block (not counting
the overhead of internal volumes, since they should be pretty much the
same in both cases), so wouldn't say it's negligible even for MLCs. But
I agree that having a reliable solution at the cost of more overhead
can be a good match for our first implementation.

> 
> b) is tricky as fastmap follows the design principle that UBI can fall
> back to a full scan if the fastmap is corrupted or a self check fails.
> If the ability to full scan suddenly depends on fastmap it can become
> messy.

We are only talking about paired pages corruption here, so I hope both
information will not be corrupted at the same time: VID header should
be valid unless a power-cut occurred while writing on the page paired
with the VID header one, which means fastmap volume should still be
valid (unless we are experiencing data-retention issues, which can be
true for the SLC case too). And even if the LEB and fastmap information
are corrupted, we should be able to reconstruct it and discard the LEB
with the corrupted VID header.
Anyway, this approach is way more complicated to implement, and I
reserve it as a "going further" topic ;-).

> 
> In terms of computer science c) is the most elegant solution but converting
> UBI to a log based "block layer" is not trivial and as you wrote the write
> overhead is not negligible.

Hm, I don't know if it's the most elegant solution (I'm still concerned
by the write overhead caused by the extra copy step, though solution b)
as some overhead too), but I agree that implementing that one is not
trivial.

> 
> So, I'd vote for a) and see how well it does in our powercut tests. :-)

a) it is. I'll focus on that solution first.

Thanks for the advices.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
