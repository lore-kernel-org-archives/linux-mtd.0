Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcZ9T-0006Nl-L4
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 13:23:05 +0000
Date: Thu, 17 Sep 2015 15:22:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, "Qi Wang =?UTF-8?B?546L6LW3?= (qiwang)"
 <qiwang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff
 Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20150917152240.757c9e90@bbrezillon>
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

Hello,

I'm currently working on the paired pages problem we have on MLC chips.
I remember discussing it with Artem earlier this year when I was
preparing my talk for ELC.

I now have some time I can spend working on this problem and I started
looking at how this can be solved.

First let's take a look at the UBI layer.
There's one basic thing we have to care about: protecting UBI metadata.
There are two kind of metadata:
1/ those stored at the beginning of each erase block (EC and VID
   headers)
2/ those stored in specific volumes (layout and fastmap volumes)

We don't have to worry about #2 since those are written using atomic
update, and atomic updates are immune to this paired page corruption
problem (either the whole write is valid, or none of it is valid).

This leaves problem #1.
For this case, Artem suggested to duplicate the EC header in the VID
header so that if page 0 is corrupted we can recover the EC info from
page 1 (which will contain both VID and EC info).
Doing that is fine for dealing with EC header corruption, since, AFAIK,
none of the NAND vendors are pairing page 0 with page 1.
Still remains the VID header corruption problem. Do prevent that we
still have several solutions:
a/ skip the page paired with the VID header. This is doable and can be
   hidden from UBI users, but it also means that we're loosing another
   page for metadata (not a negligible overhead)
b/ storing VID info (PEB <-> LEB association) somewhere else. Fastmap
   seems the right place to put that in, since fastmap is already
   storing those information for almost all blocks. Still we would have
   to modify fastmap a bit to store information about all erase blocks
   and not only those that are not part of the fastmap pool.
   Also, updating that in real-time would require using a log approach,
   instead of the atomic update currently used by fastmap when it runs
   out of PEBs in it's free PEB pool. Note that the log approach does
   not have to be applied to all fastmap data (we just need it for the
   PEB <-> LEB info).
   Another off-topic note regarding the suggested log approach: we
   could also use it to log which PEB was last written/erased, and use
   that to handle the unstable bits issue.
c/ (also suggested by Artem) delay VID write until we have enough data
   to write on the LEB, and thus guarantee that it cannot be corrupted
   (at least by programming on the paired page ;-)) anymore.
   Doing that would also require logging data to be written on those
   LEBs somewhere, not to mention the impact of copying the data twice
   (once in the log, and then when we have enough data, in the real
   block).

I don't have any strong opinion about which solution is the best, also
I'm maybe missing other aspects or better solutions, so feel free to
comment on that and share your thoughts.

That's all for the UBI layer. We will likely need new functions (and
new fields in existing structures) to help UBI users deal with MLC
NANDs: for example a field exposing the storage type or a function
helping users skip one (or several) blocks to secure the data they have
written so far. Anyway, those are things we can discuss after deciding
which approach we want to take.

Now, let's talk about the UBIFS layer. We are facing pretty much the
same problem in there: we need to protect the data we have already
written from time to time.
AFAIU (correct me if I'm wrong), data should be secure when we sync the
file system, or commit the UBIFS journal (feel free to correct me if
I'm not using the right terms in my explanation).
As explained earlier, the only way to secure data is to skip some pages
(those that are paired with the already written ones).

I see two approaches here (there might be more):
1/ do not skip any pages until we are asked to secure the data, and
   then skip as much pages as needed to ensure nobody can ever corrupt
   the data. With this approach you can loose a non negligible amount
   of space. For example, with this paired pages scheme [1], if you
   only write page on page 2 and want to secure your data, you'll have
   to skip pages 3 to 8.
2/ use the NAND in 'SLC mode' (AKA only write on half the pages in a
   block). With this solution you always loose half the NAND capacity,
   but in case of small writes, it's still more efficient than #1.
   Of course using that solution is not acceptable, because you'll
   only be able to use half the NAND capacity, but the plan is to use
   it in conjunction with the GC, so that from time to time UBIFS
   data chunks/nodes can be put in a single erase block without
   skipping half the pages.
   Note that currently the GC does not work this way: it tries to
   collect chunks one by one and write them to the journal to free a
   dirty LEB. What we would need here is a way to collect enough data
   to fill an entire block and after that release the LEBs that where
   previously using half the LEB capacity.

Of course both of those solutions implies marking the skipped regions
as dirty so that the GC can account for the padded space. For #1 we
should probably also use padding nodes to reflect how much space is lost
on the media, though I'm not sure how this can be done. For #2, we may
have to differentiate 'full' and 'half' LEBs in the LPT.

Anyway, all the above are just some ideas I had or suggestions I got
from other people and I wanted to share. I'm open to any new
suggestions, because none of the proposed solutions are easy to
implement.

Best Regards,

Boris

P.S.: Note that I'm not discussing the WP solution on purpose: I'd like
      to have a solution that is completely HW independent.

[1]https://www.olimex.com/Products/Components/IC/H27UBG8T2BTR/resources/H27UBG8T2BTR.pdf,
   chapter 6.1. Paired Page Address Information

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
