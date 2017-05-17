Received: from us-smtp-delivery-212.mimecast.com ([63.128.21.212])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAwOa-000822-Gv
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 10:41:34 +0000
Subject: Re: [PATCH] mtd: nand: Wait for PAGEPROG to finish in drivers setting
 NAND_ECC_CUSTOM_PAGE_ACCESS
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: Wenyou Yang <wenyou.yang@microchip.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Marek
 Vasut" <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
References: <1494952069-3914-1-git-send-email-boris.brezillon@free-electrons.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <633b8440-2961-e84a-edde-5a5afb9f0f52@sigmadesigns.com>
Date: Wed, 17 May 2017 12:41:01 +0200
MIME-Version: 1.0
In-Reply-To: <1494952069-3914-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16/05/2017 18:27, Boris Brezillon wrote:

> Drivers setting NAND_ECC_CUSTOM_PAGE_ACCESS are supposed to handle the
> full read/write page sequence, and waiting for a page to actually be
> programmed is part of this write-page sequence.
> This is also what is done in ->write_oob_xxx() hooks, so let's do that in
> ->write_page_xxx() as well to make it consistent.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c |  6 +++++-
>  drivers/mtd/nand/nand_base.c             | 10 ++++++----
>  drivers/mtd/nand/nand_micron.c           | 10 ++++++++--
>  drivers/mtd/nand/tango_nand.c            | 13 ++++++++++++-
>  4 files changed, 31 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8dafd2a54e11..08ff98c47e1f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2574,11 +2574,13 @@ static int nand_write_page(struct mtd_info *mtd, =
struct nand_chip *chip,
>  =09if (status < 0)
>  =09=09return status;
> =20
> -=09if (nand_standard_page_accessors(&chip->ecc))
> +=09if (nand_standard_page_accessors(&chip->ecc)) {
>  =09=09chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> -=09status =3D chip->waitfunc(mtd, chip);
> -=09if (status & NAND_STATUS_FAIL)
> -=09=09return -EIO;
> +
> +=09=09status =3D chip->waitfunc(mtd, chip);
> +=09=09if (status & NAND_STATUS_FAIL)
> +=09=09=09return -EIO;
> +=09}

AFAIU, the wait operation used to be unconditional;
but it is now skipped for CUSTOM accessors. OK.


> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.=
c
> index a2150b15d4c1..8498fa36e533 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -295,7 +295,7 @@ static int tango_write_page(struct mtd_info *mtd, str=
uct nand_chip *chip,
>  =09=09=09    const u8 *buf, int oob_required, int page)
>  {
>  =09struct tango_nfc *nfc =3D to_tango_nfc(chip->controller);
> -=09int err, len =3D mtd->writesize;
> +=09int err, status, len =3D mtd->writesize;
> =20
>  =09/* Calling tango_write_oob() would send PAGEPROG twice */
>  =09if (oob_required)
> @@ -306,6 +306,10 @@ static int tango_write_page(struct mtd_info *mtd, st=
ruct nand_chip *chip,
>  =09if (err)
>  =09=09return err;
> =20
> +=09status =3D chip->waitfunc(mtd, chip);
> +=09if (status & NAND_STATUS_FAIL)
> +=09=09return -EIO;
> +
>  =09return 0;
>  }

When I introduced the custom_accessors flag, I missed the removal
of this wait operation. The tango NFC is supposed to take care of
everything, from start to finish.

I applied the following patch:

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2675,6 +2675,9 @@ static int nand_write_page(struct mtd_info *mtd, stru=
ct nand_chip *chip,
        if (status < 0)
                return status;
=20
+       if (!nand_standard_page_accessors(&chip->ecc))
+               return 0;
+

And ran mtd_speedtest. No measurable change.
mtd_stresstest did not detect any issues.

> @@ -423,9 +427,16 @@ static int tango_read_page_raw(struct mtd_info *mtd,=
 struct nand_chip *chip,
>  static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
>  =09=09=09=09const u8 *buf, int oob_required, int page)
>  {
> +=09int status;
> +
>  =09chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
>  =09raw_write(chip, buf, chip->oob_poi);
>  =09chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +
> +=09status =3D chip->waitfunc(mtd, chip);
> +=09if (status & NAND_STATUS_FAIL)
> +=09=09return -EIO;
> +
>  =09return 0;
>  }

This one would still be required, since we're going behind the NFC's back.
Should we test NAND_STATUS_FAIL in tango_write_oob() too?
It might not matter, since you plan to change it to nand_prog_page_end_op()
ultimately.

Regards.
