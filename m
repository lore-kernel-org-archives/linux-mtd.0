Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d09wj-0000WX-TV
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 16:56:16 +0000
Received: by mail-oi0-x241.google.com with SMTP id b187so29423355oif.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2017 09:55:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <329243f7-ca5d-7a26-5db0-617868607f37@gmail.com>
References: <1491813318-4417-1-git-send-email-boris.brezillon@free-electrons.com>
 <1491813318-4417-2-git-send-email-boris.brezillon@free-electrons.com>
 <329243f7-ca5d-7a26-5db0-617868607f37@gmail.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Mon, 17 Apr 2017 11:55:50 -0500
Message-ID: <CA+EcR20mtmzovvE_uVdKf44aCFX6vesbSnbjgAXdJRjcTq3=pg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: gpmi: Kill gpmi_nand_exit()
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sascha Hauer <kernel@pengutronix.de>, Han Xu <han.xu@nxp.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 15, 2017 at 9:58 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>
> On 04/10/2017 10:35 AM, Boris Brezillon wrote:
> > The only user of gpmi_nand_exit() is gpmi_nand_remove(). Move its content
> > to the caller.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> Super, thanks.
>
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Acked-by: Han Xu <han.xu@nxp.com>
>
>
> > ---
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > index 92279a0d52f1..f22eeedc728f 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -1929,12 +1929,6 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
> >       return gpmi_alloc_dma_buffer(this);
> >  }
> >
> > -static void gpmi_nand_exit(struct gpmi_nand_data *this)
> > -{
> > -     nand_release(nand_to_mtd(&this->nand));
> > -     gpmi_free_dma_buffer(this);
> > -}
> > -
> >  static int gpmi_init_last(struct gpmi_nand_data *this)
> >  {
> >       struct nand_chip *chip = &this->nand;
> > @@ -2131,7 +2125,8 @@ static int gpmi_nand_remove(struct platform_device *pdev)
> >  {
> >       struct gpmi_nand_data *this = platform_get_drvdata(pdev);
> >
> > -     gpmi_nand_exit(this);
> > +     nand_release(nand_to_mtd(&this->nand));
> > +     gpmi_free_dma_buffer(this);
> >       release_resources(this);
> >       return 0;
> >  }
> >
>
>
> --
> Best regards,
> Marek Vasut
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/




-- 
Sincerely,

Han XU
