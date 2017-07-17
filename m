Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dXCup-0006do-MF
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 20:46:53 +0000
Date: Mon, 17 Jul 2017 22:46:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: vf610_nfc: add NULL check on
 of_match_device() return value
Message-ID: <20170717224619.1615e13f@bbrezillon>
In-Reply-To: <20170707065926.GA25776@embeddedgus>
References: <20170707065926.GA25776@embeddedgus>
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

Le Fri, 7 Jul 2017 01:59:26 -0500,
"Gustavo A. R. Silva" <garsilva@embeddedor.com> a =C3=A9crit :

> Check return value from call to of_match_device()
> in order to prevent a NULL pointer dereference.
>=20
> In case of NULL print error message and return -ENODEV
>=20
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> ---
>  drivers/mtd/nand/vf610_nfc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 744ab10..ca0ab96 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -674,6 +674,11 @@ static int vf610_nfc_probe(struct platform_device *p=
dev)
>  	}
> =20
>  	of_id =3D of_match_device(vf610_nfc_dt_ids, &pdev->dev);
> +	if (!of_id) {
> +		dev_err(&pdev->dev, "Failed to match device!\n");
> +		return -ENODEV;
> +	}
> +

While this check is functionally correct, this case cannot happen,
because this is DT-only driver, and without a valid match in
vf610_nfc_dt_ids the dev wouldn't have been probed in the first place.

I'll let Stefan decide whether he wants it or not, but I see no real
reason for this extra check.=20

>  	nfc->variant =3D (enum vf610_nfc_variant)of_id->data;
> =20
>  	for_each_available_child_of_node(nfc->dev->of_node, child) {
