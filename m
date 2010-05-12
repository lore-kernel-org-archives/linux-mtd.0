Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OC9dh-000425-Rk
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 10:58:11 +0000
Date: Wed, 12 May 2010 12:58:01 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
Subject: Re: UBIL design doc
In-Reply-To: <AANLkTikRDNia3IMCbXFs-olREPftszw-zqn3ruXCk-QE@mail.gmail.com>
Message-ID: <alpine.LFD.2.00.1005121155140.3401@localhost.localdomain>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<1273650099.22706.41.camel@localhost>
	<AANLkTilSqtxewM9WNSu814FT9qsctuuxNiK4pboX2xjr@mail.gmail.com>
	<1273653341.22706.46.camel@localhost>
	<AANLkTikRDNia3IMCbXFs-olREPftszw-zqn3ruXCk-QE@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: rohitvdongre@gmail.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 May 2010, Brijesh Singh wrote:
> On Wed, May 12, 2010 at 2:05 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Wed, 2010-05-12 at 13:33 +0530, Brijesh Singh wrote:
> >> 4) Any unclean un-mount will lead to flash scanning just as UBI.
> >
> > No! Why you have the log then? Unclean reboots are handled by the log.
> >
> > Scanning happens only when you have _corrupted_ SB, or corrupted cmt, or
> > log. Then you fall-back to scanning.
> >
> >> Any thing goes bad, normal scanning becomes recovery.
> >> 5) Not sure if log is required in first place. But it could be an option.
> >> Is that correct?
> >
> > No, at least I did not suggest you to get rid of the log. It is needed
> > to handle unclean reboots.
>
> Log is written for each EC or VID change. Frequency of log write is same as
> the frequency of these headers. In case we keep both, there will be one log
> write penalty per write/erase. So write performance will drop considerably.

True, but the reliability will drop as well. Losing a log block is
going to be fatal as there is no way to reconstruct while losing a
single block in UBI is not inevitably fatal.

Back then when UBI was designed / written we discussed a different
approach of avoiding the full flash scan while keeping the reliability
intact.

Superblock in the first couple of erase blocks which points to a
snapshot block. snapshot block(s) contain a compressed EC/VID header
snapshot. A defined number of blocks in that snapshot is marked as
NEED_SCAN. At the point of creating the snapshot these blocks are
empty and belong to the blocks with the lowest erase count.

Now when an UBI client (filesystem ...) requests an erase block one of
those NEED_SCAN marked blocks is given out. Blocks which are handed
back from the client for erasure which are not marked NEED_SCAN are
erased and not given out as long as there are still enough empty
blocks marked NEED_SCAN available. When we run out of NEED_SCAN marked
blocks we write a new snapshot with a new set of NEED_SCAN blocks.

So at attach time we read the snapshot and scan the few NEED_SCAN
blocks. They are either empty or assigned to a volume. If assigned
they can replace an already existing logical erase block reference in
the snapshot, so we know that we need to put the original physical
erase block into a lazy back ground scan list.

With that approach we keep the reliability of UBI untouched with the
penalty of scanning a limited number of erase blocks at attach time.

That limits the number of writes to the snapshot / log
significantly. For devices with a low write frequency that means that
the snapshot block can be untouched for a very long time.

The speed penalty is constant and does not depend on the number of log
entries after the snapshot.

Your full log approach is going to slower once the number of log
entries is greater than the number of NEED_SCAN marked blocks.

If we assume a page read time of 1ms and the number of NEED_SCAN
blocks of 64, then we talk about a constant overhead of 64 ms.

So lets look at the full picture:

Flashsize:                   1 GiB
Eraseblocksize:            128 KiB
Pagesize:                    2 KiB
Subpagesize:                 1 KiB
Number of erase blocks:   8192

Snapshot size per block:    16 Byte
Full snapshot size:        128 KiB
Full snapshot pages:	    64

Number of NEED_SCAN blocks: 64

Number of blocks to scan
for finding super block(s): 64

So with an assumption of page read time == 1ms the total time of
building the initial data structures in RAM is 3 * 64ms.

So yes, it _IS_ 3 times the time which we need for your log approach
(assumed that the super block is first good block and the number of
log entries after the snapshot is 0)

So once we agree that a moveable super block is the correct way, the
speed advantage is of your log approach is 64ms (still assumed that
the number of log entry pages is 0)

Now take the log entries into account. Once you have to read 64 pages
worth of log entries, which happens in the above example after exaclty
128 entries, the speed advantage is exaclty zero. From that point on
it's going to be worse.

Thoughts ?

	 tglx
