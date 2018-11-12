Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMEpt-0006pr-Cm
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 16:13:14 +0000
Received: by mail-lf1-x141.google.com with SMTP id l10so2957165lfh.9
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2018 08:13:02 -0800 (PST)
MIME-Version: 1.0
References: <CGME20180823072813eucas1p2a534b4be94a3a2bc3480adcefca2ca22@eucas1p2.samsung.com>
 <1535009282-1480-1-git-send-email-huijin.park@samsung.com>
 <20181031145505.6b034b84@bbrezillon>
In-Reply-To: <20181031145505.6b034b84@bbrezillon>
From: Huijin Park <bbanghj.park@gmail.com>
Date: Tue, 13 Nov 2018 01:12:48 +0900
Message-ID: <CAMy0x0ngjNugPO0aN0c0hACsw3qQE0rgLwfuMaX5+L7+DhXp2w@mail.gmail.com>
Subject: Re: [PATCH] mtd: cast to u64 to avoid unexpected error
To: boris.brezillon@bootlin.com
Cc: huijin.park@samsung.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

Thanks for review.
I will send patch again.

On Wed, Oct 31, 2018 at 10:55 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> Hi Huijin,
>
> Subject prefix should be "mtd: spi-nor: ...", and please replace
> "unexpected error" by "unsigned int overflows".
>
> On Thu, 23 Aug 2018 03:28:02 -0400
> Huijin Park <huijin.park@samsung.com> wrote:
>
> > From: "huijin.park" <huijin.park@samsung.com>
> >
> > the params->size is defined as "u64"
> > and, "info->sector_size" and "info->n_sectors" is defined as unsgined and u16
>
>                                                  ^ are          ^ unsigned
>
> > thus, u64 data might have strange data(loss data) if data is overflow.
>
>                                                     ^ if the result
> overflows an unsigned int.
>
> > this patch cast it to u64.
>
>              ^casts info->sector_size to an u64.
>
> >
> > Signed-off-by: huijin.park <huijin.park@samsung.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index d9c368c..527f281 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2459,7 +2459,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
> >       memset(params, 0, sizeof(*params));
> >
> >       /* Set SPI NOR sizes. */
> > -     params->size = info->sector_size * info->n_sectors;
> > +     params->size = (u64)info->sector_size * (u64)info->n_sectors;
>
>                                                 ^ this cast is not needed.
>
> BTW, I doubt we'll ever have to deal with NORs that are more than 4GB,
> but making static code analysis tools happy and enforcing code
> correctness is important too.
>

I agree that enforcing code correctness is important as your said too.

> >       params->page_size = info->page_size;
> >
> >       /* (Fast) Read settings. */
>
> Regards,
>
> Boris

Thanks & best regards,

Huijin
