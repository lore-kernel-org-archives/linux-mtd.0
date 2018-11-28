Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS1Bc-0001Je-NG
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 14:51:34 +0000
Received: by mail-lj1-x244.google.com with SMTP id g11-v6so23711503ljk.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2018 06:51:21 -0800 (PST)
MIME-Version: 1.0
References: <CGME20181115050724eucas1p169b2046c03e108035199a4481a82a560@eucas1p1.samsung.com>
 <1542258430-19885-1-git-send-email-huijin.park@samsung.com>
 <20181115102921.5117af90@xps13>
In-Reply-To: <20181115102921.5117af90@xps13>
From: Huijin Park <bbanghj.park@gmail.com>
Date: Wed, 28 Nov 2018 23:51:06 +0900
Message-ID: <CAMy0x0=H0pwHN09Bp_eKkHFHwbURFLt3MKJvBNC51TyqiZJyGA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: change len type from signed to unsigned type
To: miquel.raynal@bootlin.com
Cc: huijin.park@samsung.com, boris.brezillon@bootlin.com,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miqu=C3=A8l,

On Thu, Nov 15, 2018 at 6:29 PM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Huijin,
>
> Huijin Park <huijin.park@samsung.com> wrote on Thu, 15 Nov 2018
> 00:07:10 -0500:
>
> > From: "huijin.park" <huijin.park@samsung.com>
> >
> > This patch casts the "len" parameter to an unsigned int.
> > The callers of erase_write() pass the "len" parameter as unsigned int.
>
> Indeed. Perhaps it is worth backporting this patch to a stable releases?
>

It doesn't need backporting.
Because this patch is for enforcing code correctness.

> >
> > Signed-off-by: huijin.park <huijin.park@samsung.com>
> > ---
> >  drivers/mtd/mtdblock.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> > index a5b1933..b2d5ed1 100644
> > --- a/drivers/mtd/mtdblock.c
> > +++ b/drivers/mtd/mtdblock.c
> > @@ -56,7 +56,7 @@ struct mtdblk_dev {
> >   */
> >
> >  static int erase_write (struct mtd_info *mtd, unsigned long pos,
> > -                     int len, const char *buf)
> > +                     unsigned int len, const char *buf)
> >  {
> >       struct erase_info erase;
> >       size_t retlen;
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
>
> Thanks,
> Miqu=C3=A8l

Thanks,
Huijin
