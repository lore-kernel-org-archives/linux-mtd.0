Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDJ5T-00065R-3W
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 17:24:39 +0000
Received: by ggnk1 with SMTP id k1so1882491ggn.36
 for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2012 10:24:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
Date: Thu, 29 Mar 2012 10:24:38 -0700
Message-ID: <CAN8TOE_BxgTMJb0beyDC17jcmavmuz0WGvLw3NbJRCiuvB4VnA@mail.gmail.com>
Subject: Re: [PATCH 2/4] MTD: flash drivers set ecc strength
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike, Artem, David,

Sorry for the late review here. It looks like this is already queued
up for merging soon by David...
(BTW, patch 1 and 2 seem to do nothing by themselves; should they
really be merged in the 3.4 window?)

On Sun, Mar 11, 2012 at 2:21 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
> Flash device drivers initialize 'ecc_strength' in struct mtd_info, which =
is the
> maximum number of bit errors that can be corrected in one writesize regio=
n.
>
> Drivers using the nand interface intitialize 'strength' in struct nand_ec=
c_ctrl,
> which is the maximum number of bit errors that can be corrected in one ec=
c step.
> Nand infrastructure code translates this to 'ecc_strength'.
>
> Also for nand drivers, the nand infrastructure code sets ecc.strength for=
 ecc
> modes NAND_ECC_SOFT, NAND_ECC_SOFT_BCH, and NAND_ECC_NONE. =A0It is set i=
n the
> driver for all other modes.

I agree that the other modes should be set by the driver, but is there
any kind of sanity check? We've seen problems with the addition of the
mtd->writebufsize parameter that didn't get caught as uninitialized in
a large number of drivers. I don't think your later patches handle the
case that mtd->ecc_strength is not initialized or is 0.

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 1e907dc..8008853 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3350,6 +3350,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!chip->ecc.size)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.size =3D 256;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.bytes =3D 3;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.strength =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case NAND_ECC_SOFT_BCH:
> @@ -3384,6 +3385,8 @@ int nand_scan_tail(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warn("BCH ECC initializ=
ation failed!\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.strength =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.bytes*8 / fls(8*c=
hip->ecc.size);

Isn't this spacing against coding style? I'd suggest spaces around the
'*'. Also, after a few minutes, I have no idea where this calculation
comes from. But I'm not familiar with SOFT_BCH. Maybe a comment is in
order?

> @@ -3397,6 +3400,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.write_oob =3D nand_write_oob_std=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.size =3D mtd->writesize;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.bytes =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.strength =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;

This will cause problems with your patch 4, I think. I'll comment on
the other email.

Brian
