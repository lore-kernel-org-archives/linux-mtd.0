Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IvBn1-0002yr-G9
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 08:08:25 -0500
Date: Thu, 22 Nov 2007 13:08:16 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
Message-ID: <20071122130816.GA9134@shareable.org>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> 
> On Wed, 21 Nov 2007, Josh Boyer wrote:
> 
> > > > What problem does the driver solve?
> > > It allow  to use cramfs/squashfs/fat in read-only on NAND flash for
> > > embedded systems.
> >
> > Not really.  It allows you to put one of those filesystems into
> > NAND using a bad-block aware program initially, and mount it.  It
> > doesn't handle run-time bit flips or errors from what I can see.
> 
> Won't ECC take care of spurious bit flips?

Are the blocks written back after bit flips are detected?

If not, they will accumulate until they're uncorrectable.

-- Jamie
