Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSK5Z-0005yO-Gl
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 02:26:18 +0000
Received: by fxm14 with SMTP id 14so1560950fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 19:26:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307065913.10001.2.camel@phoenix>
References: <1307065913.10001.2.camel@phoenix>
From: Wan ZongShun <mcuos.com@gmail.com>
Date: Fri, 3 Jun 2011 10:25:52 +0800
Message-ID: <BANLkTikeK=bPMSrWEmjk6x=KwREJyajzvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nuc900_nand: add missing nand_release in
	nuc900_nand_remove
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/6/3 Axel Lin <axel.lin@gmail.com>:
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Wan ZongShun <mcuos.com@gmail.com>

Thanks!

> ---
> =C2=A0drivers/mtd/nand/nuc900_nand.c | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nan=
d.c
> index 9c30a0b..fa8faed 100644
> --- a/drivers/mtd/nand/nuc900_nand.c
> +++ b/drivers/mtd/nand/nuc900_nand.c
> @@ -339,6 +339,7 @@ static int __devexit nuc900_nand_remove(struct platfo=
rm_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nuc900_nand *nuc900_nand =3D platform_g=
et_drvdata(pdev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;
>
> + =C2=A0 =C2=A0 =C2=A0 nand_release(&nuc900_nand->mtd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(nuc900_nand->reg);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 0);
> --
> 1.7.4.1
>
>
>
>



--=20
Wan ZongShun.
www.mcuos.com
