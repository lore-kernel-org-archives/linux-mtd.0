Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SccVb-0003VV-Ij
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 13:12:19 +0000
Date: Thu, 7 Jun 2012 14:11:58 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [CFT 09/11] mtd: omap2: add DMA engine support
Message-ID: <20120607131158.GC15973@n2100.arm.linux.org.uk>
References: <20120607110610.GB15973@n2100.arm.linux.org.uk>
 <E1Scaaa-0003uB-1l@rmk-PC.arm.linux.org.uk>
 <1339073375.6875.102.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339073375.6875.102.camel@sauron.fi.intel.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 07, 2012 at 03:49:35PM +0300, Artem Bityutskiy wrote:
> On Thu, 2012-06-07 at 12:09 +0100, Russell King wrote:
> > Add DMA engine support to the OMAP2 NAND driver.  This supplements the
> > private DMA API implementation contained within this driver, and the
> > driver can be independently switched at build time between using DMA
> > engine and the private DMA API.
> > 
> > Tested-by: Grazvydas Ignotas <notasas@gmail.com>
> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> 
> I guess it is makes sense to make this stuff to go in via the OMAP tree.

No, it makes sense to get this stuff via a single tree all together,
because, as you can see from the thread structure, it isn't purely
an OMAP thing.

The OMAP stuff depends on a core set, as does a bunch of PL08x and
SA11x0 changes.  We can't stuff all that through the OMAP tree, that
wouldn't make any sense.

What probably should happen is that the tip of the OMAP stuff gets
pulled by Tony into his tree, and we share those commits between my
tree and his - and then it doesn't matter what goes in when and by
whom.
