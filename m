Received: from exprod6og104.obsmtp.com ([64.18.1.187])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NShvS-0008K8-16
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 02:16:42 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd/nand: Fix build failure caused by typo
Date: Wed, 6 Jan 2010 21:16:35 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909020894AF@mi8nycmail19.Mi8.com>
In-Reply-To: <201001070301.58260.PeterHuewe@gmx.de>
References: <201001070301.58260.PeterHuewe@gmx.de>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: =?iso-8859-1?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>,
	"David Woodhouse" <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nico@marvell.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Uwe__Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, January 06, 2010 7:02 PM, Peter H=FCwe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
> Date: Thu, 7 Jan 2010 02:51:13 +0100
>=20
> This patch fixes a build failure[1] introduced by the patch
>     mtd: orion_nand.c: add error handling and use resource_size()
>     by H Hartley Sweeten [2]
> The patch assigns something to a undeclared variable 'err', whereas =
the
> rest of the code uses 'ret' for this task.
>=20
> This patch fixes this typo and thus removes the build failure.
>=20
> References:
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/1983354/
> [2] =
http://git.kernel.org/?p=3Dlinux/kernel/git/sfr/linux-next.git;a=3Dcommit=
diff;h=3De99030609e27abff7e1a868cb56384c678b09984
>=20
> Patch against linux-next of Do 7. Jan 02:58:41 CET 2010
>=20
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
>  drivers/mtd/nand/orion_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/orion_nand.c =
b/drivers/mtd/nand/orion_nand.c
> index 9903460..f16050c 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -92,7 +92,7 @@ static int __init orion_nand_probe(struct =
platform_device *pdev)
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
> -		err =3D -ENODEV;
> +		ret =3D -ENODEV;
>  		goto no_res;
>  	}

Sorry about that.

Reviewed-by: H Hartley Sweeten <hsweeten@visionengravers.com>
