Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcQo8-0007dT-V2
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 07:42:06 +0000
Date: Mon, 9 Jul 2018 09:41:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: hynix: Use ->exec_op() in
 hynix_nand_reg_write_op()
Message-ID: <20180709094152.006ff9ab@xps13>
In-Reply-To: <20180704140858.28424-1-boris.brezillon@bootlin.com>
References: <20180704140858.28424-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed,  4 Jul 2018
16:08:58 +0200:

> Modern NAND controller drivers implement ->exec_op() instead of
> ->cmdfunc(), make sure we don't end up with a NULL pointer dereference =20
> when hynix_nand_reg_write_op() is called.
>=20
> Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_hynix.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nan=
d_hynix.c
> index 8cbe77f447c7..4ffbb26e76d6 100644
> --- a/drivers/mtd/nand/raw/nand_hynix.c
> +++ b/drivers/mtd/nand/raw/nand_hynix.c
> @@ -100,6 +100,16 @@ static int hynix_nand_reg_write_op(struct nand_chip =
*chip, u8 addr, u8 val)
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
>  	u16 column =3D ((u16)addr << 8) | addr;
> =20
> +	if (chip->exec_op) {
> +		struct nand_op_instr instrs[] =3D {
> +			NAND_OP_ADDR(1, &addr, 0),
> +			NAND_OP_8BIT_DATA_OUT(1, &val, 0),
> +		};
> +		struct nand_operation op =3D NAND_OPERATION(instrs);
> +
> +		return nand_exec_op(chip, &op);
> +	}
> +
>  	chip->cmdfunc(mtd, NAND_CMD_NONE, column, -1);
>  	chip->write_byte(mtd, val);
> =20

Applied to nand/next.

Thanks,
Miqu=C3=A8l
