Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Con3m-0005kb-VD
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:17:37 -0500
Date: Wed, 12 Jan 2005 19:17:36 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20050112181736.GJ25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<1105488400.17853.179.camel@tglx.tec.linutronix.de>
	<20050112165911.GE25638@wohnheim.fh-wedel.de>
	<1105551420.17853.256.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105551420.17853.256.camel@tglx.tec.linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 18:37:00 +0100, Thomas Gleixner wrote:
> On Wed, 2005-01-12 at 17:59 +0100, Jörn Engel wrote:
> > Ok, you completely ignore the central issue.  Looks like I was unclear
> > about it.
> > 
> > What happens, if crucial data in flash gets corrupted and is unusable?
> > Say, /sbin/init.
> 
> I totaly agree that it must be sure that stuff does not get corrupted. 
> 
> We use MTD for embedded systems since long and I'm well aware that data
> might be corrupted. So most of the systems have a ro partition for
> crucial stuff which only is mounted rw for updates under safe
> conditions. The application data is living on a different partition.
> 
> For critical systems we have a backup emergency root, which we can
> activate when a update smashes the normal rootfs. There are other
> userspace possibilities to take care of backups and fallback.
> 
> So I don't see the point of an enforced mirror in MTD which will bring
> more complexity than it is worth, but I might have missed some points.

So my last mail in this thread for NAND analysis.  It basically states
that data corruption is nothing we have to worry about a lot.  Maybe a
little, depending on your preferred reliability.

Same goes for NOR, DRAM and hard drives, so I feel pretty safe.

Now, if some El-Cheapo manufacturer would come along and create an
ultra-cheap and ultra-unreliable new type of flash, we might need to
reconsider something like the mirroring, but only for this particular
type of flash.  Let's hope this never happens.

So again, I don't care too much, whether jffs2 can scavenge some bytes
of data from a rotten block, simply because this never happens (for
all practical purposes).  If it's simple enough, sure, go ahead.  If
it's complicated and ugly, please don't.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
