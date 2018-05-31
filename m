Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOI2R-0004y4-4d
 for linux-mtd@lists.infradead.org; Thu, 31 May 2018 07:30:24 +0000
Date: Thu, 31 May 2018 09:30:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Vignesh R <vigneshr@ti.com>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Peter Pan <peterpandong@micron.com>
Subject: Re: [PATCH v7 2/5] mtd: nand: Add core infrastructure to support
 SPI NANDs
Message-ID: <20180531093005.47fb5409@xps13>
In-Reply-To: <20180515150825.19835-3-boris.brezillon@bootlin.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
 <20180515150825.19835-3-boris.brezillon@bootlin.com>
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

On Tue, 15 May 2018 17:08:22 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> +static bool spinand_isbad(struct nand_device *nand, const struct nand_po=
s *pos)
> +{
> +	struct spinand_device *spinand =3D nand_to_spinand(nand);
> +	struct nand_page_io_req req =3D {
> +		.pos =3D *pos,
> +		.ooblen =3D 2,
> +		.ooboffs =3D 0,
> +		.oobbuf.in =3D spinand->oobbuf,
> +		.mode =3D MTD_OPS_RAW,
> +	};
> +	int ret;
> +
> +	memset(spinand->oobbuf, 0, 2);
> +	spinand_select_target(spinand, pos->target);
> +	ret =3D spinand_read_page(spinand, &req, false);

I got a warning here because ret is not checked, maybe a:

        if (ret) {
                dev_err(dev, "...");
                return false;
        }

?

> +	if (spinand->oobbuf[0] !=3D 0xff || spinand->oobbuf[1] !=3D 0xff)
> +		return true;
> +
> +	return false;
> +}

Thanks,
Miqu=C3=A8l
