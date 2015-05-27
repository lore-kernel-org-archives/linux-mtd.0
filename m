Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yxh6Y-00064P-LE
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 19:35:07 +0000
Received: by pdbqa5 with SMTP id qa5so24042205pdb.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 12:34:45 -0700 (PDT)
Date: Wed, 27 May 2015 12:34:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH V3] mtd: fsl-quadspi: Access multiple chips simultaneously
Message-ID: <20150527193405.GH27753@ld-irv-0074>
References: <1431546057-16596-1-git-send-email-b45815@freescale.com>
 <20150520215250.GP11598@ld-irv-0074>
 <CA+EcR231boQyR9Jj7SRkmoOgZbv-WLhdzUK+S7ZHDaGqECsF-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EcR231boQyR9Jj7SRkmoOgZbv-WLhdzUK+S7ZHDaGqECsF-Q@mail.gmail.com>
Cc: Huang Shijie <shijie.huang@intel.com>, Han Xu <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Han,

On Wed, May 20, 2015 at 05:28:20PM -0500, Han Xu wrote:
> On Wed, May 20, 2015 at 4:52 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Wed, May 13, 2015 at 02:40:57PM -0500, Han Xu wrote:
> >> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> >> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > ...
> >> @@ -761,13 +763,17 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> >>       struct fsl_qspi *q = nor->priv;
> >>       int ret;
> >>
> >> +     mutex_lock(&q->lock);
> >>       ret = clk_enable(q->clk_en);
> >> -     if (ret)
> >> +     if (ret) {
> >> +             mutex_unlock(&q->lock);
> >>               return ret;
> >> +     }
> >>
> >>       ret = clk_enable(q->clk);
> >>       if (ret) {
> >>               clk_disable(q->clk_en);
> >> +             mutex_unlock(&q->lock);
> >>               return ret;
> >>       }
> >>
> >
> > I think it'd be better to have a single error path in this function now.
> >
> > Otherwise, I think this is OK. I can push the appended patch instead, if
> > that's OK with you.
> 
> Hi Brian, I think that's fine. I will submit another patch to improve it.

OK. Resubmit if you'd like, or just ack my version. I'd like your
Tested-by if possible.

> >
> > Signed-off-by: Han Xu <b45815@freescale.com>
> > [Brian: reworked err path in fsl_qspi_prep()]
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 32 +++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
[...]

Brian
