Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6Hs7-00042V-Fq
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 13:32:15 +0000
Date: Fri, 27 May 2016 15:31:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, devicetree@vger.kernel.org, =?UTF-8?B?UmFm?=
 =?UTF-8?B?YcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Documentation: dt: mtd: drop "soft_bch" from example
Message-ID: <20160527153153.420c86e7@bbrezillon>
In-Reply-To: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch@tkos.co.il>
References: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch@tkos.co.il>
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

Brian,

On Wed, 25 May 2016 06:45:10 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Commit 32698aafc9f0 (Documentation: devicetree: deprecate "soft_bch"
> nand-ecc-mode value, 2016-04-22) deprecated "soft_bch". Update the exampl=
e to
> match.
>=20
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I don't know if we should consider this as a bugfix. If that's the
case, can you take it directly in your tree with my

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentati=
on/devicetree/bindings/mtd/nand.txt
> index 68342eac2383..3733300de8dd 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -53,7 +53,8 @@ Example:
> =20
>  		nand@0 {
>  			reg =3D <0>;
> -			nand-ecc-mode =3D "soft_bch";
> +			nand-ecc-mode =3D "soft";
> +			nand-ecc-algo =3D "bch";
> =20
>  			/* controller specific properties */
>  		};



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
