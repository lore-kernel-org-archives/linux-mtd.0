Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dEI9e-0005gA-Re
 for linux-mtd@lists.infradead.org; Fri, 26 May 2017 16:32:00 +0000
Date: Fri, 26 May 2017 18:31:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Honza =?UTF-8?B?UGV0cm91xaE=?= <jpetrous@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd:nor:ppb_unlock: remove repeated chip unlock
Message-ID: <20170526183126.24462292@bbrezillon>
In-Reply-To: <CAJbz7-0fKC_tOn3jRF=cqGLnt26qP5h6fCApCFmtA5wN6fpkNw@mail.gmail.com>
References: <CAJbz7-1KY0h=f8HgnfZGKtG8CYTK+S+Qb9BR7mwSk2U35cRtVg@mail.gmail.com>
 <20170522111704.52ce1c40@bbrezillon>
 <CAJbz7-3zUrkr4OV4Hkp6B0px+MGQGukmGKo31rid-8K=TCooXA@mail.gmail.com>
 <CAJbz7-0fKC_tOn3jRF=cqGLnt26qP5h6fCApCFmtA5wN6fpkNw@mail.gmail.com>
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

Le Thu, 25 May 2017 10:11:46 +0200,
Honza Petrou=C5=A1 <jpetrous@gmail.com> a =C3=A9crit :

> Hi Boris
>=20
> 2017-05-23 8:45 GMT+02:00 Honza Petrou=C5=A1 <jpetrous@gmail.com>:
> > 2017-05-22 11:17 GMT+02:00 Boris Brezillon <boris.brezillon@free-electr=
ons.com>: =20
> >> Hi Honza,
> >>
> >> On Wed, 17 May 2017 09:25:18 +0200
> >> Honza Petrou=C5=A1 <jpetrous@gmail.com> wrote:
> >> =20
> >>> The Persistent Protection Bits (PPB) locking of cfi_cmdset_0002.c
> >>> doesn't support per-sector-unlocking, so any unlock request
> >>> unlocks the whole chip. Because of that limitation the driver
> >>> does the unlock in three steps:
> >>>  1) remember all locked sector
> >>>  2) do the whole chip unlock
> >>>  3) lock back only the necessary sectors
> >>>
> >>> Unfortunately in step 2 (unlocking the chip) there is used
> >>> cfi_varsize_frob() for per-sector unlock, what ends up
> >>> in multiple chip unlocking calls (exactly the chip unlock
> >>> is called for every sector in the unlock area) even the only one
> >>> unlock per chip is enough.
> >>>
> >>> Signed-off-by: Honza Petrous <jpetrous@gmail.com>
> >>> ---
> >>>  drivers/mtd/chips/cfi_cmdset_0002.c | 37 +++++++++++++++++++++++++++=
++--------
> >>>  1 file changed, 29 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> >>> b/drivers/mtd/chips/cfi_cmdset_0002.c
> >>> index 56aa6b7..53c842a 100644
> >>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> >>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> >>> @@ -2534,8 +2534,10 @@ struct ppb_lock {
> >>>      struct flchip *chip;
> >>>      loff_t offset;
> >>>      int locked;
> >>> +    unsigned int erasesize;
> >>>  };
> >>>
> >>> +#define MAX_CHIPS            16
> >>>  #define MAX_SECTORS            512
> >>>
> >>>  #define DO_XXLOCK_ONEBLOCK_LOCK        ((void *)1)
> >>> @@ -2628,11 +2630,12 @@ static int __maybe_unused
> >>> cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
> >>>      struct map_info *map =3D mtd->priv;
> >>>      struct cfi_private *cfi =3D map->fldrv_priv;
> >>>      struct ppb_lock *sect;
> >>> +    struct ppb_lock *chips;
> >>>      unsigned long adr;
> >>>      loff_t offset;
> >>>      uint64_t length;
> >>>      int chipnum;
> >>> -    int i;
> >>> +    int i, j;
> >>>      int sectors;
> >>>      int ret;
> >>>
> >>> @@ -2642,15 +2645,19 @@ static int __maybe_unused
> >>> cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
> >>>       * first check the locking status of all sectors and save
> >>>       * it for future use.
> >>>       */
> >>> -    sect =3D kzalloc(MAX_SECTORS * sizeof(struct ppb_lock), GFP_KERN=
EL);
> >>> +    sect =3D kzalloc((MAX_SECTORS + MAX_CHIPS) * sizeof(struct ppb_l=
ock),
> >>> +            GFP_KERNEL);
> >>>      if (!sect)
> >>>          return -ENOMEM;
> >>>
> >>> +    chips =3D &sect[MAX_SECTORS];
> >>> +
> >>>      /*
> >>>       * This code to walk all sectors is a slightly modified version
> >>>       * of the cfi_varsize_frob() code.
> >>>       */
> >>>      i =3D 0;
> >>> +    j =3D -1;
> >>>      chipnum =3D 0;
> >>>      adr =3D 0;
> >>>      sectors =3D 0;
> >>> @@ -2671,6 +2678,18 @@ static int __maybe_unused cfi_ppb_unlock(struct
> >>> mtd_info *mtd, loff_t ofs,
> >>>              sect[sectors].locked =3D do_ppb_xxlock(
> >>>                  map, &cfi->chips[chipnum], adr, 0,
> >>>                  DO_XXLOCK_ONEBLOCK_GETLOCK);
> >>> +        } else {
> >>> +            if (j < 0 || chips[j].chip !=3D &cfi->chips[chipnum]) {
> >>> +                j++;
> >>> +                if (j >=3D MAX_CHIPS) {
> >>> +                    printk(KERN_ERR "Only %d chips for PPB locking
> >>> supported!\n",
> >>> +                           MAX_CHIPS);
> >>> +                    kfree(sect);
> >>> +                    return -EINVAL;
> >>> +                }
> >>> +                chips[j].chip =3D &cfi->chips[chipnum];
> >>> +                chips[j].erasesize =3D size;
> >>> +            }
> >>>          }
> >>>
> >>>          adr +=3D size;
> >>> @@ -2697,12 +2716,14 @@ static int __maybe_unused
> >>> cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
> >>>          }
> >>>      }
> >>>
> >>> -    /* Now unlock the whole chip */
> >>> -    ret =3D cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
> >>> -                   DO_XXLOCK_ONEBLOCK_UNLOCK);
> >>> -    if (ret) {
> >>> -        kfree(sect);
> >>> -        return ret;
> >>> +    /* Now unlock all involved chip(s) */
> >>> +    for (i =3D 0; i <=3D j; i++) {
> >>> +        ret =3D do_ppb_xxlock(map, chips[i].chip, 0, chips[i].erases=
ize,
> >>> +                    DO_XXLOCK_ONEBLOCK_UNLOCK);
> >>> +        if (ret) {
> >>> +            kfree(sect);
> >>> +            return ret;
> >>> +        }
> >>>      }
> >>>
> >>>      /* =20
> >>
> >> Hm, this logic looks over-complicated. How about the following changes?
> >> Would that work? And if it doesn't, can you detail why?
> >> =20
> >> --->8--- =20
> >> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/c=
fi_cmdset_0002.c
> >> index 56aa6b75213d..370c063c3d4d 100644
> >> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> >> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> >> @@ -2698,11 +2698,13 @@ static int __maybe_unused cfi_ppb_unlock(struc=
t mtd_info *mtd, loff_t ofs,
> >>         }
> >>
> >>         /* Now unlock the whole chip */
> >> -       ret =3D cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
> >> -                              DO_XXLOCK_ONEBLOCK_UNLOCK);
> >> -       if (ret) {
> >> -               kfree(sect);
> >> -               return ret;
> >> +       for (chipnum =3D 0; chipnum < cfi->numchips; chipnum++) {

Hm, I think I was wrong here. It should be:

	for (chipnum =3D ofs >> cfi->chipshift;
	     chipnum <=3D (ofs + len - 1) >> cfi->chipshift; chipnum++) {


> >> +               ret =3D do_ppb_xxlock(map, &cfi->chips[chipnum],
> >> +                                   (loff_t)chipnum << cfi->chipshift,
> >> +                                   1 << cfi->chipshift,
> >> +                                   DO_XXLOCK_ONEBLOCK_UNLOCK);
> >> +               if (ret)
> >> +                       goto out;
> >>         }
> >>
> >>         /*
> >> @@ -2715,6 +2717,7 @@ static int __maybe_unused cfi_ppb_unlock(struct =
mtd_info *mtd, loff_t ofs,
> >>                                       DO_XXLOCK_ONEBLOCK_LOCK);
> >>         }
> >>
> >> +out:
> >>         kfree(sect);
> >>         return ret;
> >>  } =20
>=20
> I just tested your fix and it works as expected.
>=20
> So you can add my:
>=20
> Tested-by: Honza Petrous <jpetrous@gmail.com>

Hm, actually I was expecting you to send a v2 :-), I was just
suggesting to do something simpler, that's all.

>=20
> >
> > Well, your fix should work (I'm going to verify it on our hw asap) and =
I agree
> > it is much more simple :)
> >
> > But I found another use case, when it is not fully optimized
> > - it not cover the multi-chip setting when the requested unlock area
> > not involve all chips. In that case it execute few unneeded commands
> > (both full chip unlock and every-sector re-lock) on chips which
> > are out of requested area.
> >
> > Though, I can agree it is very minor use case, so might be not worth
> > of caught it.
> >
> > /Honza =20
