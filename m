Received: from lelnx193.ext.ti.com ([198.47.27.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eD4WV-0004kJ-HW
 for linux-mtd@lists.infradead.org; Fri, 10 Nov 2017 08:18:51 +0000
Subject: Re: [PATCH v3 3/7] mtd: onenand: omap2: Remove skip initial unlocking
 support
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091407.z4jr2kgdubhd4dpw@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <22a95dc4-6d93-7ea0-2593-83c1aa02cd7b@ti.com>
Date: Fri, 10 Nov 2017 10:18:14 +0200
MIME-Version: 1.0
In-Reply-To: <20171109091407.z4jr2kgdubhd4dpw@lenoch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BF
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 09/11/17 11:14, Ladislav Michl wrote:
> No platform data user sets skip_initial_unlocking, so remove test
> for this field.
>=20
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  Changes:
>  -v2: new patch
>  -v3: none
>=20
>  drivers/mtd/onenand/omap2.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index a03e1fe4aa48..93bd94337b35 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -700,9 +700,6 @@ static int omap2_onenand_probe(struct platform_device=
 *pdev)
>  		}
>  	}
> =20
> -	if (pdata->skip_initial_unlocking)
> -		this->options |=3D ONENAND_SKIP_INITIAL_UNLOCKING;
> -
>  	if ((r =3D onenand_scan(&c->mtd, 1)) < 0)
>  		goto err_release_dma;
> =20
>=20

Let's get rid of 'skip_initial_unlocking' from platform_data as well.

--=20
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki
