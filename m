Date: Wed, 29 Jun 2011 22:37:02 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC controller
	driver
Message-ID: <20110629143701.GC25931@S2100-06.ap.freescale.net>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
	<20110629100658.GE1992@pengutronix.de>
	<20110629103337.GF1992@pengutronix.de>
	<4E0B0296.6060902@freescale.com>
	<20110629122942.GH1992@pengutronix.de>
	<20110629140038.GB25931@S2100-06.ap.freescale.net>
	<20110629141557.GK1992@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20110629141557.GK1992@pengutronix.de>
Cc: dedekind1@gmail.com, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 29, 2011 at 04:15:57PM +0200, Wolfram Sang wrote:
> On Wed, Jun 29, 2011 at 10:00:39PM +0800, Shawn Guo wrote:
> > On Wed, Jun 29, 2011 at 02:29:42PM +0200, Wolfram Sang wrote:
> > > 
> > > > > Still, the problem exists: When a second channel GPMI channel is
> > > > > requested, dmaengine will return -EBUSY, because the DMAIRQ is already
> > > > > taken.
> > > > >
> > > > Yes, we should change the DMA code, it is a DMA bug.
> > > > I ever submitted a patch about the issue:
> > > > http://patchwork.ozlabs.org/patch/87145/
> > > 
> > > That approach was rejected because it would register the same handler
> > > n-times where one time would do. Your other approach puts too much
> > > mach-specific details into the driver IMO and probably won't scale very
> > > well. Maybe we should add something to the private dma_data (like flags
> > > indicating SHARED) and then do some refcounting?
> > > 
> > I would suggest leave this gpmi specific quirk to gpmi driver to sort
> > out.  With the following mxs-dma change, it should work if gpmi driver
> > can pass the valid gpmi irq number for only one gpmi channel, and -1
> > for all others.
> 
> ...which brings us right into the 'NO_IRQ is 0' discussion :)
> 
Though I do not know what it means exactly, number 0 is an valid IRQ
on both mx23 and mx28 (see mx23.h and mx28.h).

> Other than that, [thinking loud] this will help if all irq-sharing
> channels are handled by the same driver. If not, we would just add
> IRQF_SHARED (hopefully this will never be needed). Yup, sounds
> reasonable to me. Will give it a second thought later, though.
> 
GPMI is the only mxs-dma user that gets irq-sharing.  So yes, all
irq-sharing channels are handled by the same driver, gpmi-nfc :)

-- 
Regards,
Shawn
