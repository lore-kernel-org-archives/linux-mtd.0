Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCikG-0000GO-Gf
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 08:31:18 +0000
Received: by mail-qk0-x241.google.com with SMTP id o85so17962071qkh.0
 for <linux-mtd@lists.infradead.org>; Mon, 22 May 2017 01:30:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJbz7-1KY0h=f8HgnfZGKtG8CYTK+S+Qb9BR7mwSk2U35cRtVg@mail.gmail.com>
References: <CAJbz7-1KY0h=f8HgnfZGKtG8CYTK+S+Qb9BR7mwSk2U35cRtVg@mail.gmail.com>
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Mon, 22 May 2017 10:30:53 +0200
Message-ID: <CAJbz7-0nczeq7Kf1pSps7N=a1n7-dPih-kOhfE0i0s4WAokKRA@mail.gmail.com>
Subject: Re: [PATCH] mtd:nor:ppb_unlock: remove repeated chip unlock
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org
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

2017-05-17 9:25 GMT+02:00 Honza Petrou=C5=A1 <jpetrous@gmail.com>:
> The Persistent Protection Bits (PPB) locking of cfi_cmdset_0002.c
> doesn't support per-sector-unlocking, so any unlock request
> unlocks the whole chip. Because of that limitation the driver
> does the unlock in three steps:
>  1) remember all locked sector
>  2) do the whole chip unlock
>  3) lock back only the necessary sectors
>
> Unfortunately in step 2 (unlocking the chip) there is used
> cfi_varsize_frob() for per-sector unlock, what ends up
> in multiple chip unlocking calls (exactly the chip unlock
> is called for every sector in the unlock area) even the only one
> unlock per chip is enough.
>
> Signed-off-by: Honza Petrous <jpetrous@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 37 +++++++++++++++++++++++++++++--=
------
>  1 file changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 56aa6b7..53c842a 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2534,8 +2534,10 @@ struct ppb_lock {
>      struct flchip *chip;
>      loff_t offset;
>      int locked;
> +    unsigned int erasesize;
>  };
>
> +#define MAX_CHIPS            16
>  #define MAX_SECTORS            512
>
>  #define DO_XXLOCK_ONEBLOCK_LOCK        ((void *)1)
> @@ -2628,11 +2630,12 @@ static int __maybe_unused
> cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>      struct map_info *map =3D mtd->priv;
>      struct cfi_private *cfi =3D map->fldrv_priv;
>      struct ppb_lock *sect;
> +    struct ppb_lock *chips;
>      unsigned long adr;
>      loff_t offset;
>      uint64_t length;
>      int chipnum;
> -    int i;
> +    int i, j;
>      int sectors;
>      int ret;
>
> @@ -2642,15 +2645,19 @@ static int __maybe_unused
> cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>       * first check the locking status of all sectors and save
>       * it for future use.
>       */
> -    sect =3D kzalloc(MAX_SECTORS * sizeof(struct ppb_lock), GFP_KERNEL);
> +    sect =3D kzalloc((MAX_SECTORS + MAX_CHIPS) * sizeof(struct ppb_lock)=
,
> +            GFP_KERNEL);
>      if (!sect)
>          return -ENOMEM;
>
> +    chips =3D &sect[MAX_SECTORS];
> +
>      /*
>       * This code to walk all sectors is a slightly modified version
>       * of the cfi_varsize_frob() code.
>       */
>      i =3D 0;
> +    j =3D -1;
>      chipnum =3D 0;
>      adr =3D 0;
>      sectors =3D 0;
> @@ -2671,6 +2678,18 @@ static int __maybe_unused cfi_ppb_unlock(struct
> mtd_info *mtd, loff_t ofs,
>              sect[sectors].locked =3D do_ppb_xxlock(
>                  map, &cfi->chips[chipnum], adr, 0,
>                  DO_XXLOCK_ONEBLOCK_GETLOCK);
> +        } else {
> +            if (j < 0 || chips[j].chip !=3D &cfi->chips[chipnum]) {
> +                j++;
> +                if (j >=3D MAX_CHIPS) {
> +                    printk(KERN_ERR "Only %d chips for PPB locking
> supported!\n",
> +                           MAX_CHIPS);
> +                    kfree(sect);
> +                    return -EINVAL;
> +                }
> +                chips[j].chip =3D &cfi->chips[chipnum];
> +                chips[j].erasesize =3D size;
> +            }
>          }
>
>          adr +=3D size;
> @@ -2697,12 +2716,14 @@ static int __maybe_unused
> cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>          }
>      }
>
> -    /* Now unlock the whole chip */
> -    ret =3D cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
> -                   DO_XXLOCK_ONEBLOCK_UNLOCK);
> -    if (ret) {
> -        kfree(sect);
> -        return ret;
> +    /* Now unlock all involved chip(s) */
> +    for (i =3D 0; i <=3D j; i++) {UBI and UBIFS do not work on top of bl=
ock devices
> +        ret =3D do_ppb_xxlock(map, chips[i].chip, 0, chips[i].erasesize,
> +                    DO_XXLOCK_ONEBLOCK_UNLOCK);
> +        if (ret) {
> +            kfree(sect);
> +            return ret;
> +        }
>      }
>
>      /*
> --
> 2.9.3

Ping. No any volunteer for review?

PS: Even it seems not to be so crucial for most cases, I still
think it is not correct to do multiple unlocking if know that
cmd0002 chips have support only for full chip unlock
(so no per-sector unlock is possible).

I have detected that incorrect behavior on Spansion
S29GL01GS, which has really crazy unlocking timing
(at least on our custom boards).

/Honza
