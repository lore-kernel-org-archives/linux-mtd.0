Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOva-0004nN-2y
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:18:08 +0000
Date: Tue, 17 Jul 2018 14:17:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: tegra: fix error handling of subop helpers
Message-ID: <20180717141733.61bc9c71@bbrezillon>
In-Reply-To: <20180714163251.7773-1-miquel.raynal@bootlin.com>
References: <20180714163251.7773-1-miquel.raynal@bootlin.com>
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

On Sat, 14 Jul 2018 18:32:51 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> A report from Colin Ian King pointed a CoverityScan issue where error
> values on these helpers where not checked in the drivers. These
> helpers could error out only in case of a software bug in driver code,
> not because of a runtime/hardware error but in any cases it is safer
> to handle these errors properly.
>=20
> Fix the Tegra NAND controller driver implementation by checking
> potential negative error values coming from these helpers.

Hm, ok. I thought you were opting for a return 0 + WARN_ON() approach,
what made you change your mind?

>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>=20
> This patch should have been part of the following series:
> http://lists.infradead.org/pipermail/linux-mtd/2018-July/082654.html
> It will be squashed with original commit introducing this driver.
>=20
> Thanks,
> Miqu=C3=A8l
>=20
> drivers/mtd/nand/raw/tegra_nand.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/teg=
ra_nand.c
> index 22d6a7f9ff80..59ead8f41718 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -379,6 +379,9 @@ static int tegra_nand_cmd(struct nand_chip *chip,
>  		case NAND_OP_ADDR_INSTR:
>  			offset =3D nand_subop_get_addr_start_off(subop, op_id);
>  			naddrs =3D nand_subop_get_num_addr_cyc(subop, op_id);
> +			if (offset < 0 || naddrs < 0)
> +				return -EINVAL;
> +
>  			addrs =3D &instr->ctx.addr.addrs[offset];
> =20
>  			cmd |=3D COMMAND_ALE | COMMAND_ALE_SIZE(naddrs);
> @@ -395,6 +398,8 @@ static int tegra_nand_cmd(struct nand_chip *chip,
>  		case NAND_OP_DATA_IN_INSTR:
>  			size =3D nand_subop_get_data_len(subop, op_id);
>  			offset =3D nand_subop_get_data_start_off(subop, op_id);
> +			if (size < 0 || offset < 0)
> +				return -EINVAL;
> =20
>  			cmd |=3D COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
>  				COMMAND_RX | COMMAND_A_VALID;
> @@ -405,6 +410,8 @@ static int tegra_nand_cmd(struct nand_chip *chip,
>  		case NAND_OP_DATA_OUT_INSTR:
>  			size =3D nand_subop_get_data_len(subop, op_id);
>  			offset =3D nand_subop_get_data_start_off(subop, op_id);
> +			if (size < 0 || offset < 0)
> +				return -EINVAL;
> =20
>  			cmd |=3D COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
>  				COMMAND_TX | COMMAND_A_VALID;
