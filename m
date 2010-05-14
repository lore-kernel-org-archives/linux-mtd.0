Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCq8K-000775-5w
	for linux-mtd@lists.infradead.org; Fri, 14 May 2010 08:20:37 +0000
Message-ID: <4BED07BD.7090403@pengutronix.de>
Date: Fri, 14 May 2010 10:20:13 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 11/20] mtd: pxa3xx_nand: add debug messege
References: <AANLkTilMUQHJDzVrO5FXeEE8udXkDwS240Vrl1lIkdyG@mail.gmail.com>
In-Reply-To: <AANLkTilMUQHJDzVrO5FXeEE8udXkDwS240Vrl1lIkdyG@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigBEB1F47B0E215D90685FF0EA"
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Eric Miao <eric.y.miao@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBEB1F47B0E215D90685FF0EA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Haojian Zhuang wrote:
>>From 10e0c31fac5a8ebeb314d609cea24351097b1aae Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Tue, 30 Mar 2010 20:58:58 +0800
> Subject: [PATCH] mtd: pxa3xx_nand: add debug messege
>=20
> Add debug messege to those key route to help find out problem.
>=20
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c |   23 ++++++++++++++++++++++-
>  1 files changed, 22 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_n=
and.c
> index fb1af4c..0674b52 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -30,6 +30,12 @@
>  #define NAND_STOP_DELAY		(2 * HZ/50)
>  #define PAGE_CHUNK_SIZE		(2048)
>  #define BCH_THRESHOLD           (8)
> +#undef PXA3XX_NAND_DEBUG
> +#ifdef PXA3XX_NAND_DEBUG
> +#define DBG_NAND(x)	do{x;}while(0)
> +#else
> +#define DBG_NAND(x)
> +#endif

If you really need to get this in mainline, try using pr_debug() for
this, add

#if PXA3XX_NAND_DEBUG
#define DEBUG
#endif

to activate debugging.

>=20
>  /* registers and bit definitions */
>  #define NDCR		(0x00) /* Control register */
> @@ -411,6 +417,8 @@ static void pxa3xx_nand_start(struct pxa3xx_nand *n=
and)
>  	}
>=20
>  	/* clear status bits and run */
> +	DBG_NAND(printk("@@@ndcr set: %x, ndeccctrl set %x\n",
> +				ndcr, ndeccctrl));
>  	nand_writel(nand, NDCR, 0);
>  	nand_writel(nand, NDECCCTRL, ndeccctrl);
>  	nand_writel(nand, NDSR, NDSR_MASK);
> @@ -456,6 +464,8 @@ static void handle_data_pio(struct pxa3xx_nand *nan=
d)
>  {
>  	struct pxa3xx_nand_info *info =3D nand->info[nand->chip_select];
>=20
> +	DBG_NAND(printk("data size %x, oob size %x\n",
> +				nand->data_size, nand->oob_size));
>  	if (nand->state & STATE_IS_WRITE) {
>  		__raw_writesl(nand->mmio_base + NDDB, info->data_buff,
>  				DIV_ROUND_UP(nand->data_size, 4));
> @@ -492,6 +502,8 @@ static void start_data_dma(struct pxa3xx_nand
> *nand, int dir_out)
>  		desc->dcmd |=3D DCMD_INCTRGADDR | DCMD_FLOWSRC;
>  	}
>=20
> +	DBG_NAND(printk("DMA START:DMA dcmd %x, dsadr %x, dtadr %x, len %x\n"=
,
> +				desc->dcmd, desc->dsadr, desc->dtadr, dma_len));
>  	DRCMR(nand->drcmr_dat) =3D DRCMR_MAPVLD | info->data_dma_ch;
>  	DDADR(info->data_dma_ch) =3D info->data_desc_addr;
>  	DCSR(info->data_dma_ch) |=3D DCSR_RUN;
> @@ -505,6 +517,7 @@ static void pxa3xx_nand_data_dma_irq(int channel,
> void *data)
>  	dcsr =3D DCSR(channel);
>  	DCSR(channel) =3D dcsr;
>=20
> +	DBG_NAND(printk("DMA IRQ: dcsr %x\n", dcsr));
>  	if (dcsr & DCSR_BUSERR) {
>  		nand->retcode =3D ERR_DMABUSERR;
>  	}
> @@ -528,6 +541,8 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *d=
evid)
>  	info            =3D nand->info[cs];
>=20
>  	status =3D nand_readl(nand, NDSR);
> +	DBG_NAND(if (status !=3D 0)
> +		printk("\t\tstatus %x, cs %x\n", status, cs));
>  	nand->bad_count =3D (status & NDSR_ERR_CNT_MASK) >> 16;
>  	if (status & NDSR_DBERR)
>  		nand->retcode =3D ERR_DBERR;
> @@ -562,6 +577,8 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *d=
evid)
>  		nand_writel(nand, NDCB0, info->ndcb0);
>  		nand_writel(nand, NDCB0, info->ndcb1);
>  		nand_writel(nand, NDCB0, info->ndcb2);
> +		DBG_NAND(printk("\tndcb0 %x ndcb1 %x ndcb2 %x\n",
> +				info->ndcb0, info->ndcb1, info->ndcb2));
>  	}
>=20
>  	/* clear NDSR to let the controller exit the IRQ */
> @@ -754,6 +771,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
> *mtd, unsigned command,
>  		nand_writel(nand, NDTR1CS0, info->ndtr1cs0);
>  	}
>=20
> +	DBG_NAND(printk("command %x, page %x\n", command, page_addr));
>  	exec_cmd =3D prepare_command_pool(nand, command, column, page_addr);
>  	if (exec_cmd) {
>  		init_completion(&nand->cmd_complete);
> @@ -940,6 +958,7 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_i=
nfo *mtd,
>  	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>=20
>  	if (nand->retcode =3D=3D ERR_SBERR) {
> +		DBG_NAND(printk("###correctable error detected\n"););
>  		switch (nand->use_ecc) {
>  		case ECC_BCH:
>  			if (nand->bad_count > BCH_THRESHOLD)
> @@ -956,8 +975,10 @@ static int pxa3xx_nand_read_page_hwecc(struct
> mtd_info *mtd,
>  		int buf_blank;
>=20
>  		buf_blank =3D is_buf_blank(buf, mtd->writesize);
> -		if (!buf_blank)
> +		if (!buf_blank) {
> +			DBG_NAND(printk("###uncorrectable error!!!\n"));
>  			mtd->ecc_stats.failed++;
> +		}
>  	}
>=20
>  	return 0;


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigBEB1F47B0E215D90685FF0EA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkvtB8YACgkQjTAFq1RaXHNfgwCcCGNFxAjIVdhtrIERGpZwrl6a
dnkAnjLmE/TTcb945V+dtTHGWKE3nQTk
=6uVK
-----END PGP SIGNATURE-----

--------------enigBEB1F47B0E215D90685FF0EA--
