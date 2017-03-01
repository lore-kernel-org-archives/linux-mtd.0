Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cj5Fv-00022h-V4
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 14:29:31 +0000
Date: Wed, 1 Mar 2017 15:28:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, Frode Isaksen <fisaksen@baylibre.com>,
 <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 2/2] mtd: devices: m25p80: Enable spi-nor bounce
 buffer support
Message-ID: <20170301152855.0cfcdf0f@bbrezillon>
In-Reply-To: <8a2c9b3b-dd5f-fca7-fa5c-690e5bed949f@atmel.com>
References: <20170227120839.16545-1-vigneshr@ti.com>
 <20170227120839.16545-3-vigneshr@ti.com>
 <aa967f6a-0526-3e33-1de7-fbe7d4264f34@nod.at>
 <8f999a27-c3ce-2650-452c-b21c3e44989d@ti.com>
 <aeaf87ca-e8f5-72d0-997d-494df86abf68@atmel.com>
 <a6c61bf7-1f26-41db-9a6b-bcae87274cb9@ti.com>
 <8a2c9b3b-dd5f-fca7-fa5c-690e5bed949f@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 1 Mar 2017 15:21:24 +0100
Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:

> + Mark
>=20
> Le 01/03/2017 =C3=A0 12:46, Vignesh R a =C3=A9crit :
> >=20
> >=20
> > On Wednesday 01 March 2017 04:13 PM, Cyrille Pitchen wrote: =20
> >> Le 01/03/2017 =C3=A0 05:54, Vignesh R a =C3=A9crit : =20
> >>>
> >>>
> >>> On Wednesday 01 March 2017 03:11 AM, Richard Weinberger wrote: =20
> >>>> Vignesh,
> >>>>
> >>>> Am 27.02.2017 um 13:08 schrieb Vignesh R: =20
> >>>>> Many SPI controller drivers use DMA to read/write from m25p80 compa=
tible
> >>>>> flashes. Therefore enable bounce buffers support provided by spi-nor
> >>>>> framework to take care of handling vmalloc'd buffers which may not =
be
> >>>>> DMA'able.
> >>>>>
> >>>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
> >>>>> ---
> >>>>>  drivers/mtd/devices/m25p80.c | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25=
p80.c
> >>>>> index c4df3b1bded0..d05acf22eadf 100644
> >>>>> --- a/drivers/mtd/devices/m25p80.c
> >>>>> +++ b/drivers/mtd/devices/m25p80.c
> >>>>> @@ -241,6 +241,7 @@ static int m25p_probe(struct spi_device *spi)
> >>>>>  	else
> >>>>>  		flash_name =3D spi->modalias;
> >>>>> =20
> >>>>> +	nor->flags |=3D SNOR_F_USE_BOUNCE_BUFFER; =20
> >>>>
> >>>> Isn't there a better way to detect whether a bounce buffer is needed=
 or not? =20
> >>> =20
> >>
> >> I agree with Richard: the bounce buffer should be enabled only if need=
ed
> >> by the SPI controller.
> >> =20
> >>> Yes, I can poke the spi->master struct to see of dma channels are
> >>> populated and request SNOR_F_USE_BOUNCE_BUFFER accordingly:
> >>>
> >>> -       nor->flags |=3D SNOR_F_USE_BOUNCE_BUFFER;
> >>> +       if (spi->master->dma_tx || spi->master->dma_rx)
> >>> +               nor->flags |=3D SNOR_F_USE_BOUNCE_BUFFER;
> >>> +
> >>> =20
> >>
> >> However I don't agree with this solution: master->dma_{tx|rx} can be s=
et
> >> for SPI controllers which already rely on spi_map_msg() to handle
> >> vmalloc'ed memory during DMA transfers.
> >> Such SPI controllers don't need the spi-nor bounce buffer.
> >>
> >> spi_map_msg() can build a scatter-gather list from vmalloc'ed buffer
> >> then map this sg list with dma_map_sg(). AFAIK, It is safe to do so for
> >> architectures using PIPT caches since the possible cache aliases issue
> >> present for VIPT or VIVT caches is always avoided for PIPT caches.
> >>
> >> For instance, the drivers/spi/spi-atmel.c driver relies on spi_map_sg()
> >> to be called from the SPI sub-system to handle vmalloc'ed buffers and
> >> both master->dma_tx and master->dma_rx are set by the this driver.
> >>
> >>
> >> By the way, Is there any case where the same physical page is actually
> >> mapped into two different virtual addresses for the buffers allocated =
by
> >> the MTD sub-system? Because for a long time now I wonder whether the
> >> cache aliases issue is a real or only theoretical issue but I have no
> >> answer to that question.
> >> =20
> >=20
> > I have atleast one evidence of VIVT aliasing causing problem. Please see
> > this thread on DMA issues with davinci-spi driver
> > https://www.spinics.net/lists/arm-kernel/msg563420.html
> > https://www.spinics.net/lists/arm-kernel/msg563445.html
> >  =20
> >> Then my next question: is spi_map_msg() enough in every case, even with
> >> VIPT or VIVT caches?
> >> =20
> >=20
> > Not really, I am debugging another issue with UBIFS on DRA74 EVM (ARM
> > cortex-a15) wherein pages allocated by vmalloc are in highmem region
> > that are not addressable using 32 bit addresses and is backed by LPAE.
> > So, a 32 bit DMA cannot access these buffers at all.
> > When dma_map_sg() is called to map these pages by spi_map_buf() the
> > physical address is just truncated to 32 bit in pfn_to_dma() (as part of
> > dma_map_sg() call). This results in random crashes as DMA starts
> > accessing random memory during SPI read.
> >=20
> > IMO, there may be more undiscovered caveat with using dma_map_sg() for
> > non kmalloc'd buffers and its better that spi-nor starts handling these
> > buffers instead of relying on spi_map_msg() and working around every
> > time something pops up.
> >  =20
>=20
> Both Frode and you confirmed that the alias issue does occur at least
> with VIVT caches, hence we can't rely on spi_map_msg() in that case.
> So I agree with you: adding a bounce buffer in spi-nor seems to be a
> good solution at least till some rework is done in the ubifs layer, as
> proposed by Boris, to replace vmalloc'ed buffers by kmalloc'ed memory.

We should keep it even after reworking UBI/UBIFS, because UBI is just
one user of MTD, and other users might pass vmalloc-ed or kmap-ed bufs.
