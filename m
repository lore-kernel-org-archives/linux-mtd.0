Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs4qf-0005TC-5W
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 08:15:47 +0000
Date: Fri, 30 Oct 2015 09:15:21 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger  <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>, Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= \"(beanhuo)\""
 <beanhuo@micron.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20151030091521.439f436b@bbrezillon>
In-Reply-To: <1446035085.12536.71.camel@gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
 <1446035085.12536.71.camel@gmail.com>
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

Hi Artem,

Don't take the following answer as a try to teach you how UBI/UBIFS work
or should work with MLC NANDs. I still listen to your suggestions, but
when I had a look at how this "skip pages on demand" approach could
be implemented I realized it was not so simple.

Also, if you don't mind I'd like to finish my consolidation-GC
implementation before trying a new approach, which don't mean I won't
consider the "skip pages on demand" one.

On Wed, 28 Oct 2015 14:24:45 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2015-10-23 at 10:14 +0200, Boris Brezillon wrote:
> > I decided to go for the simplest solution (but I can't promise I
> > won't
> > change my mind if this approach appears to be wrong), which is either
> > using a LEB is MLC or SLC mode. In SLC modes, only the first page of
> > each pair is used, which completely address the paired pages problem.
> > For now the SLC mode logic is hidden in the MTD/NAND layers which are
> > providing functions to write/read in SLC mode.
> 
> Most of the writes go through the journalling subsystem.
> 
> There are some non-journal writes, related to internal meta-date
> management, like from other subsystems: log, the master node, LPT,
> index, GC.
> 
> In case of journal subsystem, in MLC mode you just skip pages every
> time the "flush write-buffer" API call is used.
> 
> In LPT subsystem, you invent a custom solution, skip pages as needed.
> 
> In master - probably nothing needs to be done, since we have 2 copies.
> 
> Index, GC - data also goes via journal, so the journal subsystem
> solution will probably cover it.

For the general concept I agree that it should probably work, but here
are my concerns (maybe you'll prove me wrong ;-)):

1/ will you ever be able to use a full LEB without skipping any pages?
I mean, when use the "skip pages on demand" you can easily have more
than half the page in your LEB skipped, because when you write only on
one page, you'll have to skip between 3 to 8 pages (it depends on the
pairing scheme). I'll try to run gather some statistics to see how
often wbuf are synced to see if that's a real problem.
The consolidation approach has the advantage of being able to
consolidate existing LEBs to completely fill them, but the consolidation
stuff could probably work with the "skip pages on demand".

2/ skipping pages on demand is not as easy as only writing on lower
pages of each pair. As you might know, when skipping pages to secure
your data, you'll also have to skip some lower pages so that you end up
with an offset to a memory region that can be contiguously written to,
and when you skip those lower pages, you have to write on it, because
NAND chips require that the lower page of each pair be programmed
before the higher one (ignoring this will just render some pages
unreliable).

3/ UBIFS is really picky when it comes to corrupted nodes detection,
and there are a few cases where it refuses to mount the FS when a
corrupted node is detected. One of this case is when the corrupted
page (filled with one or several nodes) is filled with non-ff data,
which is likely to happen with MLC NANDs (paired pages are not
contiguous). We discussed about relaxing this policy a few weeks ago,
but what should we do when such a corruption is detected? Drop all
nodes with a sequence higher or equal to the last valid node on the
LEB?
Note that with the consolidation-GC approach we don't have this
problem because the consolidate LEB is added to journal after it has
been completely filled with data, and marked as full (->free = 0) so
that nobody can reclaim it to write data on it.

> 
> 
> > Thanks to this differentiation, UBI is now exposing two kind of LEBs:
> > - the secure (small) LEBS (those accessed in SLC mode)
> > - the unsecure (big) LEBS (those accessed in MLC mode)
> 
> Is this really necessary? Feels like a bit of over-complication to the
> UBI layer.

Hm, it's actually not so complicated: SLC mode is implemented by the
NAND layer and UBI is just using MTD functions to access the NAND in
SLC mode. I'm more concerned by the on-flash format changes problem
raised by Richard.

> 
> Can UBI care about itself WRT MLC safeness, and let UBIFS care about
> itself?
> 

Sorry but I don't agree here. By exposing the secure LEB concept, UBI
does not specifically care about UBIFS, it just provides a way for all
UBI users to address the problem brought by paired pages in a generic
way.
Maybe the secure LEB approach is wrong, but in the end UBI will expose
other functions to handle those paired pages problems
(ubi_secure_data() to skip pages for example), and this layering
(NAND/MTD/UBI/UBIFS) is IMO the only sane way to let each layer handle
what it's supposed to handle and let the upper layers use the new
features to mitigate the problems.
So, no matter which solution is chosen, it will impact the UBI, MTD,
and NAND layers.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
