Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nLQm-0003uw-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 15:21:44 +0000
Date: Tue, 19 Mar 2002 23:32:50 +0800 (MYT)
From: David Woodhouse <dwmw2@infradead.org>
To: Charles Manning <manningc2@actrix.gen.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: How to protect DoC 2000 from power fail?
In-Reply-To: <20020319120109.645F21255@creative.actrix.co.nz>
Message-ID: <Pine.LNX.4.44.0203192317360.6019-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 19 Mar 2002, Charles Manning wrote:

> CF should have at least 15ms of good power after the last write. This is 
> required to complete the write internally.
> 
> Dunno what goes on in a DOC, but basically it needs some power to complete 
> the last write. Dunno how clever it is at fixing itself. Maybe read the 
> msystems www. They have some good application notes - maybe one covers these 
> issues.

DiskOnChip is just a bunch of NAND flash chips with an ASIC to do the ECC 
for you. If you lose power during a block write, the ECC on that write 
will fail or you won't yet have written the metadata, and you get to use 
the previous version of that sector when you reboot. You don't _need_ to 
guarantee that you'll have enough power, just that you won't screw up if 
you don't.

> *  If you've done this right, you never go into a critical section with bad 
> power. If power turns bad during the run of the function then hopefully the 
> residual energy in the rail etc will be enough to power the system through 
> the rest of the function call.
> 
> This can work well if your hardware supports this kind of detection and has 
> sufficient residual energy. Dunno how long you need for a DOC, but I would 
> hunch that 100ms would be enough.

But doing it at the hardware level isn't sufficient. The problem is with
the (fat/ext2/etc.) file system, which would need to have the same checks
for power and manage to do their own transactions in the same timescales,
including all the garbage-collection that the underlying translation layer
needs to do, etc.

> > If you want to be able to write to it then the correct solution, IMO, is to
> > write a _real_ file system which operates on flash directly instead of
> > operating on a block device. Build in the wear levelling, journalling, etc.
> 
> Too right!

:)

-- 
dwmw2
