Date: Wed, 30 Mar 2011 17:13:23 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [PATCH V3 2/6] dmaengine: change the flags of request_irq()
Message-ID: <20110330091323.GB20019@S2100-06.ap.freescale.net>
References: <1301474413-28821-1-git-send-email-b32955@freescale.com>
	<1301474413-28821-3-git-send-email-b32955@freescale.com>
	<19858.61894.956256.280158@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <19858.61894.956256.280158@ipc1.ka-ro>
Content-Transfer-Encoding: quoted-printable
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, ffainelli@freebox.fr,
	shijie8@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 30, 2011 at 11:03:02AM +0200, Lothar Wa=DFmann wrote:
> Hi,
>=20
> Huang Shijie writes:
> > The GPMI may have many DMA channels, such as the imx23 has
> > four DMA channels. All these DMA channels share the same interrupt.
> > So change the flags from '0' to IRQF_SHARED, else there will be
> > an EBUSY error returns.
> >=20
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > ---
> >  drivers/dma/mxs-dma.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> > index 88aad4f..0ee5b52 100644
> > --- a/drivers/dma/mxs-dma.c
> > +++ b/drivers/dma/mxs-dma.c
> > @@ -328,7 +328,7 @@ static int mxs_dma_alloc_chan_resources(struct dm=
a_chan *chan)
> >  	memset(mxs_chan->ccw, 0, PAGE_SIZE);
> > =20
> >  	ret =3D request_irq(mxs_chan->chan_irq, mxs_dma_int_handler,
> > -				0, "mxs-dma", mxs_dma);
> > +				IRQF_SHARED, "mxs-dma", mxs_dma);
> >  	if (ret)
> >  		goto err_irq;
> > =20
> IMO this is wrong. The interrupt is requested with all the same
> parameters for each DMA channel. So, actually it is not a shared IRQ,

The parameter mxs_chan->chan_irq is different for each channel, except
gpmi which has 4 channels sharing one irq.

> but an IRQ with the same handler registered multiple times, which is
> just nonsense.
>=20
> Instead of declaring it as shared, it would be more sensible to only
> register it for the first channel. Otherwise the handler will be
> called multiple times in case of an interrupt with only the first
> invocation doing all the work and the subsequent invocations just
> returning without doing anything.
>=20

--=20
Regards,
Shawn
