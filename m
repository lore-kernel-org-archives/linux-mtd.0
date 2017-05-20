Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dC8L1-0003q6-Lj
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 17:38:49 +0000
Date: Sat, 20 May 2017 19:38:25 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH 2/3] mtd: nand: create a wrapper for mtd_device_register
 for NAND specific initialization.
Message-ID: <20170520193825.1cccc62d@bbrezillon>
In-Reply-To: <20170520152428.9184-3-mrugiero@gmail.com>
References: <20170520152428.9184-1-mrugiero@gmail.com>
 <20170520152428.9184-2-mrugiero@gmail.com>
 <20170520152428.9184-3-mrugiero@gmail.com>
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

Le Sat, 20 May 2017 12:24:27 -0300,
"Mario J. Rugiero" <mrugiero@gmail.com> a =C3=A9crit :

> Drivers are updated to use this wrapper.

Try to be a bit more verbose in your commit messages. Explain why you
want to add this wrapper.

BTW, you only update mtd_device_register() callers, not those who
call mtd_device_parse_register(), which is wrong.

This being said, I wonder if we shouldn't have extra helpers to
assign default parts and part_parser_types and parser_data to a
nand_chip, and then have a nand_chip_register() which just takes
a nand_chip object and extract parts info from there.

Something like:

struct nand_parts_info {
	const char * const *part_parsers;
	struct mtd_part_parser_data *part_parser_data;
	const struct mtd_partition *defparts;
	int ndefparts;
};

struct nand_chip {
	...

	struct nand_parts_info parts_info;
	...
};


void nand_chip_set_default_parts(struct nand_chip *chip,
				 const struct mtd_partition *parts,
				 int nparts)
{
	chip->parts_info.defparts =3D parts;
	chip->parts_info.ndefparts =3D nparts;
}

void nand_chip_set_part_parsers(struct nand_chip *chip,
			const char * const *part_parsers)
{
	chip->parts_info.part_parsers =3D part_parsers;
}

void nand_chip_set_part_parser_data(struct nand_chip *chip,
				    struct mtd_part_parser_data *data)
{
	chip->parts_info.part_parser_data =3D part_parser_data;
}

int nand_chip_register(struct nand_chip *chip)
{
	return mtd_device_parse_register(nand_to_mtd(chip),
					 chip->parts_info.part_parsers,
					 chip->parts_info.part_parser_data,
					 chip->parts_info.defparts,
					 chip->parts_info.ndefparts);
}


>=20
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---

[...]

> +/* Register the MTD device and allocate resources for the NAND device */
> +int nand_device_register(struct mtd_info *mtd,
> +			 const struct mtd_partition *defparts,
> +			 int defnr_parts);
> +

I prefer nand_chip_register(), I reserve the nand_device_ prefix for
other reworks I'm planning to do ;-).

BTW, where is the nand_chip_unregister() I suggested to add to keep the
API symetric?

>  /* Unregister the MTD device and free resources held by the NAND device =
*/
>  void nand_release(struct mtd_info *mtd);
> =20
