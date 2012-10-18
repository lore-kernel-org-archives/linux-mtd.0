From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] dma: add new DMA control commands
Date: Thu, 18 Oct 2012 10:16:06 +0200
References: <1350538335-29026-1-git-send-email-b32955@freescale.com>
 <201210180914.58527.marex@denx.de> <507FB495.7050104@freescale.com>
In-Reply-To: <507FB495.7050104@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201210181016.06782.marex@denx.de>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 artem.bityutskiy@linux.intel.com, perex@perex.cz,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Huang Shijie <shijie8@gmail.com>, linux@arm.linux.org.uk, cjb@laptop.org,
 lrg@ti.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Vinod Koul <vinod.koul@linux.intel.com>, broonie@opensource.wolfsonmicro.com,
 linux-mmc@vger.kernel.org, w.sang@pengutronix.de, linux-kernel@vger.kernel.org,
 djbw@fb.com, khali@linux-fr.org, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 15:14, Marek Vasut =E5=86=
=99=E9=81=93:
> > Dear Huang Shijie,
> >=20
> > Why such massive CC ?
> >=20
> >> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 14:18, Vinod Koul =E5=86=
=99=E9=81=93:
> >>> Why cant you do start (prepare clock etc) when you submit the
> >>> descriptor to dmaengine. Can be done in tx_submit callback.
> >>> Similarly remove the clock when dma transaction gets completed.
> >>=20
> >> I ever thought this method too.
> >>=20
> >> But it will become low efficient in the following case:
> >>     Assuming the gpmi-nand driver has to read out 1024 pages in one
> >>=20
> >> _SINGLE_ read operation.
> >> The gpmi-nand will submit the descriptor to dmaengine per page.
> >=20
> > It will? Then GPMI NAND is flat our broken ... again.
>=20
> yes.
>=20
> Please read the NAND chip spec about the comand READ PAGE(00h-30h) and
> the code
> nand_do_read_ops(). The nand chip limits us only read one page out one
> time. So the driver will submit the descriptor to dmaengine per page.

So we can't stream data from the chip? About time to adjust the MTD framewo=
rk to=20
allow that. Maybe implement a command queue?

> >> So with
> >> your method,
> >> the system will repeat the enable/disable dma clock 1024 time.
> >=20
> > Yes, it is the driver that's wrong.
>=20
> not the driver.
>=20
> >> At every
> >> enable/disable dma clock,
> >> the system has to enable the clock chain and it's parents ...
> >>=20
> >> But with this patch, we only need to enable/disable dma clock one time,
> >> just at we select the nand chip.
> >=20
> > You are fixing a driver problem at a framework level, wrong.
> >=20
> > So, check how the MXS SPI driver handles descriptor chaining. Indeed, t=
he
> > Sigmatel screwed the DMA stuff good. But if you analyze the SPI driver,
> > you'll notice a few important points that might come handy when you fix
> > the GPMI NAND driver properly.
> >=20
> > The direction to take here is:
> > 1) Implement DMA chaining into the GPMI NAND driver
>=20
> How can i implement the DMA chain if the nand chip READ-PAGE command
> gives us the one page limit?

This smells like a time to extend the MTD api ?

> thanks
> Huang Shijie
>=20
> > 2) You might need to do one PIO transfer to reconfigure the IP registers
> > between each segment of the DMA chain (just as MXS SPI does it)
> > 3) You might run out of DMA descriptors when doing too long chains -- so
> > you might need to fix that part of the mxs DMA driver.

Best regards,
Marek Vasut
