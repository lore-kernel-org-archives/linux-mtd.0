Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDJBJ-0007Oe-Ux
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 17:30:42 +0000
Received: by yenm10 with SMTP id m10so1880516yen.36
 for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2012 10:30:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
Date: Thu, 29 Mar 2012 10:30:40 -0700
Message-ID: <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 11, 2012 at 2:21 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
> The drivers' read methods, absent an error, return a non-negative integer
> indicating the maximum number of bit errors that were corrected in any on=
e
> writesize region. =A0MTD returns -EUCLEAN if this is >=3D euclean_thresho=
ld, 0
> otherwise. =A0Note that this is a subtle change to the driver interface.
>
> This and the preceeding patches in this set were tested ubi on top of the
> nandsim and docg4 devices, running the ubi test io_basic from mtd-utils.

Did you test any non-NAND devices? I'm getting the feeling that some
of this is misguided or at least needs some fixing. See below.

> We may want to also change the name of the macro mtd_is_bitflip(), since =
this is
> not really correctly named anymore.

What sort of name change? Shouldn't EUCLEAN still mean bitflip? We are
just masking the bitflips below a threshold. Anyway, if you have a
better name, bring it up! I think I changed the name from my original
choice based on Artem's suggestions, so I'm open to anything with more
merit :)

> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 5bbd717..6871658 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -789,12 +789,24 @@ EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
> =A0int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *re=
tlen,
> =A0 =A0 =A0 =A0 =A0 =A0 u_char *buf)
> =A0{
> + =A0 =A0 =A0 int ret_code;
> =A0 =A0 =A0 =A0*retlen =3D 0;
> =A0 =A0 =A0 =A0if (from < 0 || from > mtd->size || len > mtd->size - from=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0if (!len)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> - =A0 =A0 =A0 return mtd->_read(mtd, from, len, retlen, buf);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* In the absence of an error, drivers return a non-negat=
ive integer
> + =A0 =A0 =A0 =A0* representing the maximum number of bitflips that were =
corrected on
> + =A0 =A0 =A0 =A0* any one writesize region (typically a NAND page).
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 ret_code =3D mtd->_read(mtd, from, len, retlen, buf);
> +
> + =A0 =A0 =A0 if (unlikely(ret_code < 0))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret_code;
> +
> + =A0 =A0 =A0 return ret_code >=3D mtd->euclean_threshold ? -EUCLEAN : 0;
> =A0}

This seems wrong in the case that mtd->euclean_threshold =3D=3D 0. This
could be the case for any of the following:
(1) NAND that uses ECC_NONE
(2) NAND drivers with HW_ECC that don't initialize chip->ecc.strength
(3) MTD without ECC (e.g., NOR)
(4) Other drivers that might have missed initializing mtd->ecc_strength

Regarding (1): although ECC_NONE is not recommended, it's possible. I
don't think this deserves an EUCLEAN message.

Regarding (2): I notice that your nand_base.c code (patch 2) leaves
ecc.strength initialization up to the driver. I think a sanity check
could be provided in those cases. For instance, in the NAND_ECC_HW*
cases, you could warn or error out on 'chip->ecc.strength =3D=3D 0'.

If I'm correct, (3) is quite significant, since non-ECC'd MTDs would
produce EUCLEAN statuses on every read.

Brian
