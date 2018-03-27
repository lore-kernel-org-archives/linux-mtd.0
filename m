Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0uKe-0007hC-QH
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 19:32:34 +0000
From: Richard Weinberger <richard@nod.at>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: dwmw2@infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Replace typedef with struct
Date: Tue, 27 Mar 2018 21:32:19 +0200
Message-ID: <2234121.GJlN6YpY6x@blindfold>
In-Reply-To: <20180318175122.GA15004@seema-Inspiron-15-3567>
References: <20180318175122.GA15004@seema-Inspiron-15-3567>
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

Am Sonntag, 18. M=E4rz 2018, 18:51:23 CEST schrieb Arushi Singhal:
> Using typedef for a structure type is not suggested in Linux kernel
> coding style guidelines. Hence, occurrence of typedefs has been
> removed.
>=20
> Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> ---
>  drivers/mtd/ssfdc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
> index 95f0bf9..8bae672 100644
> --- a/drivers/mtd/ssfdc.c
> +++ b/drivers/mtd/ssfdc.c
> @@ -54,15 +54,15 @@ SumSector	2,000	4,000	8,000	16,000	32,000	64,000	128,=
000	256,000
>  SectorSize	512	512	512	512	512	512	512	512
>  **/
> =20
> -typedef struct {
> +struct chs_entry {
>  	unsigned long size;
>  	unsigned short cyl;
>  	unsigned char head;
>  	unsigned char sec;
> -} chs_entry_t;
> +};
> =20
>  /* Must be ordered by size */
> -static const chs_entry_t chs_table[] =3D {
> +static const struct chs_entry chs_table[] =3D {
>  	{ MiB(  1), 125,  4,  4 },
>  	{ MiB(  2), 125,  4,  8 },
>  	{ MiB(  4), 250,  4,  8 },
>=20

Didn't we already talk about coding style fixes on existing code? ;-)

Thanks,
//richard
