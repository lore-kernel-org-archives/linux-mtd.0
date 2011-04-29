Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFoaz-0002WU-AD
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 14:23:02 +0000
From: "Saxena, Parth" <parth.saxena@ti.com>
To: "'dedekind1@gmail.com'" <dedekind1@gmail.com>, Brian Norris
	<computersforpeace@gmail.com>
Date: Fri, 29 Apr 2011 19:52:32 +0530
Subject: RE: [RFC] mtd: nand: Fix bad block identification issue
Message-ID: <19F8576C6E063C45BE387C64729E739404E1A21866@dbde02.ent.ti.com>
References: <1303906161-24175-1-git-send-email-parth.saxena@ti.com>
	<1304011843.2737.3.camel@localhost>
In-Reply-To: <1304011843.2737.3.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Thursday, April 28, 2011 11:01 PM
> To: Saxena, Parth; Brian Norris
> Cc: linux-mtd@lists.infradead.org; Basheer, Mansoor Ahamed; linux-
> omap@vger.kernel.org
> Subject: Re: [RFC] mtd: nand: Fix bad block identification issue
>=20
> On Wed, 2011-04-27 at 17:39 +0530, Saxena, Parth wrote:
> > This patch solves the above issue for omap by initialising
> > badblockbits. We are working further on this to find a generic fix
> > to the problem in nand_base.c.
>=20
> But it looks like the generic solution is to return the line which was
> accidentally removed, how about this patch
>=20
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Thu, 28 Apr 2011 20:26:59 +0300
> Subject: [PATCH] mtd: return badblockbits back
>=20
> In commit c7b28e25cb9beb943aead770ff14551b55fa8c79 the initialization of
> the backblockbits was accidentally removed. This patch returns it back,
> because otherwise some NAND drivers are broken.
>=20
> This problem was reported by "Saxena, Parth <parth.saxena@ti.com>" here:
> http://lists.infradead.org/pipermail/linux-mtd/2011-April/035221.html
>=20
> Reported-by: Saxena, Parth <parth.saxena@ti.com>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: stable@kernel.org [2.6.36+]
> ---
>  drivers/mtd/nand/nand_base.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 15510f2..5a7f817 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3106,6 +3106,8 @@ ident_done:
>  		chip->chip_shift +=3D 32 - 1;
>  	}
>=20
> +	chip->badblockbits =3D 8;
> +
>  	/* Set the bad block position */
>  	if (mtd->writesize > 512 || (busw & NAND_BUSWIDTH_16))
>  		chip->badblockpos =3D NAND_LARGE_BADBLOCK_POS;
[Saxena, Parth]=20

Tested-By: Saxena, Parth <parth.saxena@ti.com>
Acked By: Saxena, Parth <parth.saxena@ti.com>

> --
> 1.7.2.3
>=20
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
