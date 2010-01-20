Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXagV-0005e7-C4
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 13:33:28 +0000
Date: Wed, 20 Jan 2010 13:33:15 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Liu Hui <onlyflyer@gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
Message-ID: <20100120133315.GB30789@shareable.org>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
	<2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Liu Hui wrote:
> Richard,
> 
> Thank you for your confirmation and good idea.
> 
> I also think about your idea before, that is, when power failure
> happens, generate an interrupt and blocks any other write requests in
> interrupt handler. But this is a little complex.

Ideally, you would design the hardware so that power failure can be
detected early near the power input, but with enough on-board power
retention (i.e. capacitor) that there is guaranteed enough continuous
power for the CPU to react and the NAND chip to have enough stable
power to complete the write reliably.

There is no need for an interrupt, if you have a fast GPIO that you
can read before each write command that tells if the input power has
not dropped.

> Now, I think I can use ECC to check the partial write, if a write was
> not finished, the ECC should be wrong, so we can detect this partial
> write and discard this write. Do you think this is a good idea?

It's good, but not perfect: In principle a power-failed write could
successfully store the correct bits including ECC so they read back
correctly, but with the cell charges not completely stable.  But I
guess that's rare enough that it is just included in the normal NAND
bad block possibilities.

-- Jamie
