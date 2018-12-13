Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXOg5-0007d9-LL
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 10:57:15 +0000
Date: Thu, 13 Dec 2018 11:57:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Fix JEDEC detection
Message-ID: <20181213115701.06cee323@xps13>
In-Reply-To: <20181213105526.30871-1-boris.brezillon@bootlin.com>
References: <20181213105526.30871-1-boris.brezillon@bootlin.com>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 13 Dec 2018
11:55:26 +0100:

> nand_jedec_detect() should return 1 when the PARAM page parsing
> succeeds, otherwise the core considers JEDEC detection failed and falls
> back to ID-based detection.
>=20
> Fixes: 480139d9229e ("mtd: rawnand: get rid of the JEDEC parameter page i=
n nand_chip")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_jedec.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nan=
d_jedec.c
> index 5c26492c841d..38b5dc22cb30 100644
> --- a/drivers/mtd/nand/raw/nand_jedec.c
> +++ b/drivers/mtd/nand/raw/nand_jedec.c
> @@ -107,6 +107,8 @@ int nand_jedec_detect(struct nand_chip *chip)
>  		pr_warn("Invalid codeword size\n");
>  	}
> =20
> +	ret =3D 1;
> +
>  free_jedec_param_page:
>  	kfree(p);
>  	return ret;

Sorry for the mistake.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
