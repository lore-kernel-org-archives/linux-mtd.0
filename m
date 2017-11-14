Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEeh1-00009V-7e
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 17:08:13 +0000
Date: Tue, 14 Nov 2017 18:07:38 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Quentin Schulz
 <quentin.schulz@free-electrons.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: nand: add the infrastructure to retrieve the
 ONFI unique ID
Message-ID: <20171114180738.0754fcae@xps13>
In-Reply-To: <20171114154622.5493-3-miquel.raynal@free-electrons.com>
References: <20171114154622.5493-1-miquel.raynal@free-electrons.com>
 <20171114154622.5493-3-miquel.raynal@free-electrons.com>
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

Hello,

In the cover letter I forgot to give a link to the series this work is
based on:
http://patchwork.ozlabs.org/project/linux-mtd/list/?series=3D12308

I also spotted a mistake there:

> +static int nand_read_unique_id(struct nand_chip *chip, char *dest)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	u8 id[ONFI_UNIQUEID_LEN * 2];
> +	int string_len =3D ONFI_FULL_UNIQUEID_STRING_LEN;
> +	int ret, i, j, pos;
> +
> +	/* ->exec_op related definitions */
> +	const struct nand_sdr_timings *sdr =3D
> +		nand_get_sdr_timings(&chip->data_interface);
> +	u8 addr =3D 0;
> +	struct nand_op_instr instrs[] =3D {
> +		NAND_OP_CMD(NAND_CMD_READ_UNIQUEID, 0),
> +		NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tWB_max)),
> +		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
> +				 PSEC_TO_NSEC(sdr->tRR_min)),
> +	};
> +	struct nand_operation op =3D NAND_OPERATION(instrs);
> +
> +	if (!chip->exec_op)
> +		return -ENOTSUPP;
> +
> +	if (!dest)
> +		return -EINVAL;
> +
> +	if (!(onfi_opt_cmd(chip) & ONFI_OPT_CMD_READ_UNIQUEID))
> +		return -ENOTSUPP;
> +
> +	ret =3D nand_exec_op(chip, &op);
> +	if (ret)
> +		return ret;
> +
> +	/* Pattern is repeated 16 times */
> +	for (i =3D 0; i < ONFI_UNIQUEID_REPETITIONS; i++) {
> +		/* Each pattern is 32B wide (the ID + the ID XORed)
> */
> +		if (chip->exec_op) {
> +			struct nand_op_instr instrs[] =3D {
> +				NAND_OP_8BIT_DATA_IN(sizeof(id), id,
> 0),
> +			};
> +			struct nand_operation op =3D
> NAND_OPERATION(instrs); +
> +			ret =3D nand_exec_op(chip, &op);
> +			if (ret)
> +				return ret;
> +		} else {
> +			chip->read_buf(mtd, id, sizeof(id));
> +		}

No need for that 'else' statement as this function will not run without
->exec_op() support.


Sorry about that, I will correct it in a later version.
Miqu=C3=A8l
