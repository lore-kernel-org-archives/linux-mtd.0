Received: from mail.thorsis.com ([213.211.200.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dc9Tm-0006ip-Fq
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 12:07:24 +0000
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: Declare tBERS,
 tR and tPROG as u64 to avoid integer overflow
Date: Mon, 31 Jul 2017 14:06:15 +0200
Message-ID: <2615235.I2bcY56GkF@ada>
In-Reply-To: <1501489887-7372-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1501489887-7372-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Reviewed-by: Alexander Dahl <ada@thorsis.com>
Tested-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

Am Montag, 31. Juli 2017, 10:31:27 schrieb Boris Brezillon:
> All timings in nand_sdr_timings are expressed in picoseconds but some=

> of them may not fit in an u32.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 204e7ecd47e2 ("mtd: nand: Add a few more timings to
> nand_sdr_timings") Reported-by: Alexander Dahl <ada@thorsis.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/mtd/nand/nand_timings.c | 6 +++---
>  include/linux/mtd/nand.h        | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_timings.c
> b/drivers/mtd/nand/nand_timings.c index f06312df3669..7e36d7d13c26
> 100644
> --- a/drivers/mtd/nand/nand_timings.c
> +++ b/drivers/mtd/nand/nand_timings.c
> @@ -311,9 +311,9 @@ int onfi_init_data_interface(struct nand_chip
> *chip, struct nand_sdr_timings *timings =3D &iface->timings.sdr;
>=20
>  =09=09/* microseconds -> picoseconds */
> -=09=09timings->tPROG_max =3D 1000000UL * le16_to_cpu(params->t_prog)=
;
> -=09=09timings->tBERS_max =3D 1000000UL * le16_to_cpu(params->t_bers)=
;
> -=09=09timings->tR_max =3D 1000000UL * le16_to_cpu(params->t_r);
> +=09=09timings->tPROG_max =3D 1000000ULL * le16_to_cpu(params->t_prog=
);
> +=09=09timings->tBERS_max =3D 1000000ULL * le16_to_cpu(params->t_bers=
);
> +=09=09timings->tR_max =3D 1000000ULL * le16_to_cpu(params->t_r);
>=20
>  =09=09/* nanoseconds -> picoseconds */
>  =09=09timings->tCCS_min =3D 1000UL * le16_to_cpu(params->t_ccs);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 892148c448cc..5216d2eb2289 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -681,10 +681,10 @@ struct nand_buffers {
>   * @tWW_min: WP# transition to WE# low
>   */
>  struct nand_sdr_timings {
> -=09u32 tBERS_max;
> +=09u64 tBERS_max;
>  =09u32 tCCS_min;
> -=09u32 tPROG_max;
> -=09u32 tR_max;
> +=09u64 tPROG_max;
> +=09u64 tR_max;
>  =09u32 tALH_min;
>  =09u32 tADL_min;
>  =09u32 tALS_min;

--=20
-----------------------------------------------------------------------=
-
Thorsis Technologies GmbH                     Tel.: +49-391-544 563-303=
6
Oststra=DFe 18                                  Fax.: +49-391-544 563-9=
099
39114 Magdeburg                                  http://www.thorsis.com=
/

Sitz der Gesellschaft: Magdeburg
Amtsgericht Stendal HRB 110339
Gesch=E4ftsf=FChrer: Dipl.-Ing. Thorsten Szczepanski
-----------------------------------------------------------------------=
-
