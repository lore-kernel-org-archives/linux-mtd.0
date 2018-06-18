Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUtqf-0005ai-UH
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 13:05:41 +0000
Date: Mon, 18 Jun 2018 15:05:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH 1/2] mtd: rawnand: handle ONFI revision number field
 being 0
Message-ID: <20180618150521.067ef156@xps13>
In-Reply-To: <20180618045255.8015-2-chris.packham@alliedtelesis.co.nz>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
 <20180618045255.8015-2-chris.packham@alliedtelesis.co.nz>
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

Hi Chris,

On Mon, 18 Jun 2018 16:52:54 +1200, Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> Some Micron NAND chips (MT29F1G08ABAFAWP-ITE:F) report 00 00 for the
> revision number field of the ONFI parameter page. Rather than rejecting
> these outright assume ONFI version 1.0 if the revision number is 00 00.
>=20

Thanks for getting your hands into this.

> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> At the moment I haven't qualified this check on anything, I should
> probably at least include vendor =3D=3D MICRON.

The more I think about it the more I convince myself that this is not
needed. If the 4 first bytes are "ONFI", then the chip is ONFI...

Then what you do below is simple and readable and (sadly) probably
right.

>=20
> As far as I can tell revision number =3D=3D 0 is not permitted by the ONFI
> spec but this wouldn't be the first time a vendor has ignored a spec. On
> the other hand maybe I'm reading the spec wrong and someone here will
> say "oh 0 means ...".
>=20
>  drivers/mtd/nand/raw/nand_base.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand=
_base.c
> index 0cd3e216b95c..1691c7005ae4 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5184,6 +5184,8 @@ static int nand_flash_detect_onfi(struct nand_chip =
*chip)
>  		chip->parameters.onfi.version =3D 20;
>  	else if (val & (1 << 1))
>  		chip->parameters.onfi.version =3D 10;
> +	else if (val =3D=3D 0)
> +		chip->parameters.onfi.version =3D 10;
> =20
>  	if (!chip->parameters.onfi.version) {
>  		pr_info("unsupported ONFI version: %d\n", val);

Regards,
Miqu=C3=A8l
