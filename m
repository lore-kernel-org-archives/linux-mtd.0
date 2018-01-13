Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eaOdA-00014C-Lv
 for linux-mtd@lists.infradead.org; Sat, 13 Jan 2018 16:26:08 +0000
Date: Sat, 13 Jan 2018 17:25:51 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, kernel@pengutronix.de, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH 6/8] mtd: nand: mxc: Add own write_page
Message-ID: <20180113172551.5dab8a7c@xps13>
In-Reply-To: <20180109101148.13728-7-s.hauer@pengutronix.de>
References: <20180109101148.13728-1-s.hauer@pengutronix.de>
 <20180109101148.13728-7-s.hauer@pengutronix.de>
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

Hi Sascha,

On Tue,  9 Jan 2018 11:11:46 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Now that we have our own read_page function add a write_page function
> for consistency aswell. This can be a lot easier than the generic
> function since we do not have to iterate over subpages but can write
> the whole page at once. Also add write_page_raw and write_oob for
> proper raw and oob write support.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 56
> +++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 56
> insertions(+)
>=20
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 83bb01ab7079..6fbf98851a96 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -893,6 +893,59 @@ static int mxc_nand_read_oob(struct mtd_info
> *mtd, struct nand_chip *chip, page);
>  }
> =20
> +static int __mxc_nand_write_page(struct mtd_info *mtd, struct
> nand_chip *chip,
> +				 const uint8_t *buf, int
> oob_required, int page) +{
> +	struct mxc_nand_host *host =3D nand_get_controller_data(chip);
> +
> +	host->devtype_data->send_cmd(host, NAND_CMD_SEQIN, false);
> +	mxc_do_addr_cycle(mtd, 0, page);
> +
> +	memcpy32_toio(host->main_area0, buf, mtd->writesize);
> +	copy_spare(mtd, false, chip->oob_poi);

If I remember correctly, there was a "spare only" mechanism to avoid
doing full page read/write when unnecessary. What about using it here
when (buf =3D=3D NULL && oob_required)?

> +
> +	host->devtype_data->send_page(mtd, NFC_INPUT);
> +	host->devtype_data->send_cmd(host, NAND_CMD_PAGEPROG, true);
> +	mxc_do_addr_cycle(mtd, 0, page);
> +
> +	return 0;
> +}
> +
> +static int mxc_nand_write_page(struct mtd_info *mtd, struct
> nand_chip *chip,
> +			       const uint8_t *buf, int oob_required,
> int page) +{
> +	struct nand_chip *nand_chip =3D mtd_to_nand(mtd);
> +	struct mxc_nand_host *host =3D nand_get_controller_data(chip);
> +
> +	host->devtype_data->enable_hwecc(nand_chip, true);
> +
> +	return __mxc_nand_write_page(mtd, chip, buf, oob_required,
> page); +}
> +
> +static int mxc_nand_write_page_raw(struct mtd_info *mtd, struct
> nand_chip *chip,
> +				   const uint8_t *buf, int
> oob_required, int page) +{
> +	struct nand_chip *nand_chip =3D mtd_to_nand(mtd);
> +	struct mxc_nand_host *host =3D nand_get_controller_data(chip);
> +
> +	host->devtype_data->enable_hwecc(nand_chip, false);
> +
> +	return __mxc_nand_write_page(mtd, chip, buf, oob_required,
> page); +}
> +
> +static int mxc_nand_write_oob(struct mtd_info *mtd, struct nand_chip
> *chip,
> +			      int page)
> +{
> +	struct nand_chip *nand_chip =3D mtd_to_nand(mtd);
> +	struct mxc_nand_host *host =3D nand_get_controller_data(chip);
> +
> +	memset(host->data_buf, 0xff, mtd->writesize);

If the above solution works, this won't be needed anymore.

> +
> +	host->devtype_data->enable_hwecc(nand_chip, false);
> +
> +	return __mxc_nand_write_page(mtd, chip, host->data_buf, 1,
> page);

And this could be:
    return __mxc_nand_write_page(mtd, chip, NULL, 1, page);

> +}
> +
>  static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char
> *dat, u_char *ecc_code)
>  {
> @@ -1907,6 +1960,9 @@ static int mxcnd_probe(struct platform_device
> *pdev) this->ecc.read_page =3D mxc_nand_read_page;
>  		this->ecc.read_page_raw =3D mxc_nand_read_page_raw;
>  		this->ecc.read_oob =3D mxc_nand_read_oob;
> +		this->ecc.write_page =3D mxc_nand_write_page;
> +		this->ecc.write_page_raw =3D mxc_nand_write_page_raw;
> +		this->ecc.write_oob =3D mxc_nand_write_oob;
>  		this->ecc.calculate =3D mxc_nand_calculate_ecc;
>  		this->ecc.hwctl =3D mxc_nand_enable_hwecc;
>  		this->ecc.correct =3D host->devtype_data->correct_data;


Thanks,
Miqu=C3=A8l
