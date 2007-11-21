Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IuxGk-0005qf-DD
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 16:38:08 -0500
Date: Wed, 21 Nov 2007 22:32:58 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
Message-ID: <20071121213257.GI20871@lazybastard.org>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, 21 November 2007 21:46:16 +0100, Ricard Wanderlof wrote:
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

Single-bit, yes.  Once you accumulated a bunch of them in proximity, it
may no longer work.

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
