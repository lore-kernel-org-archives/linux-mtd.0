Received: from mail-bl2lp0212.outbound.protection.outlook.com
 ([207.46.163.212] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXZGV-0001Jp-Kw
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 16:52:53 +0000
From: Insop Song <Insop.Song@gainspeed.com>
To: "grmoore@altera.com" <grmoore@altera.com>, "ggrahammoore@gmail.com"
 <ggrahammoore@gmail.com>
Subject: RE: [PATCH] Add support for flag status register on Micron chips.
Date: Tue, 8 Apr 2014 16:52:19 +0000
Message-ID: <56e0c8db22bc41a7887243ea61220589@BY2PR07MB011.namprd07.prod.outlook.com>
References: <1396973570-13995-1-git-send-email-grmoore@altera.com>
 <1396973570-13995-2-git-send-email-grmoore@altera.com>
In-Reply-To: <1396973570-13995-2-git-send-email-grmoore@altera.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yves Vandervennet <rocket.yvanderv@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tuesday, April 08, 2014 9:13 AM, Graham Moore <grmoore@altera.com>
>=20
> From: Graham Moore <grmoore@altera.com>
>=20
> Some new Micron flash chips require reading the flag status register to
> determine when operations have completed.
>=20
> Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> require reading the status register before reading the flag status regist=
er.
>=20
> This patch adds support for the flag status register in the n25q512a1 and
> n25q00 Micron QSPI flash chips.
>=20

Reviewed his change, and it is more generic then my previous patch.

Reviewed-by: Insop Song <insop.song@gainspeed.com>

> Signed-off-by: Graham Moore <grmoore@altera.com>
> ---
>  drivers/mtd/devices/m25p80.c |   94
> +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 80 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ad19139..38306aa 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -39,6 +39,7 @@
>  #define	OPCODE_WREN		0x06	/* Write enable */
>  #define	OPCODE_RDSR		0x05	/* Read status register */
>  #define	OPCODE_WRSR		0x01	/* Write status
> register 1 byte */
> +#define	OPCODE_RDFSR		0x70  /* read flag status
> register */
>  #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low
> frequency) */
>  #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high
> frequency) */
>  #define	OPCODE_QUAD_READ        0x6b    /* Read data bytes */
> @@ -81,6 +82,9 @@
>=20
>  #define SR_QUAD_EN_MX           0x40    /* Macronix Quad I/O */
>=20
> +/* Flag Status Register bits */
> +#define FSR_READY               0x80    /* FSR ready */
> +
>  /* Configuration Register bits. */
>  #define CR_QUAD_EN_SPAN		0x2     /* Spansion Quad I/O */
>=20
> @@ -108,6 +112,7 @@ struct m25p {
>  	u8			read_opcode;
>  	u8			program_opcode;
>  	u8			*command;
> +	int (*wait_till_ready)(struct m25p *flash);
>  	enum read_type		flash_read;
>  };
>=20
> @@ -145,6 +150,27 @@ static int read_sr(struct m25p *flash)  }
>=20
>  /*
> + * Read the flag status register, returning its value in the location
> + * Return the status register value.
> + * Returns negative if error occurred.
> + */
> +static int read_fsr(struct m25p *flash) {
> +	ssize_t retval;
> +	u8 code =3D OPCODE_RDFSR;
> +	u8 val;
> +
> +	retval =3D spi_write_then_read(flash->spi, &code, 1, &val, 1);
> +
> +	if (retval < 0) {
> +		dev_err(&flash->spi->dev, "error %d reading FSR\n",
> +				(int) retval);
> +		return retval;
> +	}
> +
> +	return val;
> +}
> +/*
>   * Read configuration register, returning its value in the
>   * location. Return the configuration register value.
>   * Returns negative if error occured.
> @@ -233,7 +259,7 @@ static inline int set_4byte(struct m25p *flash, u32
> jedec_id, int enable)
>   * Service routine to read status register until ready, or timeout occur=
s.
>   * Returns non-zero if error.
>   */
> -static int wait_till_ready(struct m25p *flash)
> +static int _wait_till_ready(struct m25p *flash)
>  {
>  	unsigned long deadline;
>  	int sr;
> @@ -254,6 +280,37 @@ static int wait_till_ready(struct m25p *flash)  }
>=20
>  /*
> + * Service routine to read flag status register until ready, or timeout =
occurs.
> + * Returns non-zero if error.
> + */
> +static int _wait_till_fsr_ready(struct m25p *flash) {
> +	unsigned long deadline;
> +	int fsr;
> +	int sr;
> +
> +	deadline =3D jiffies + MAX_READY_WAIT_JIFFIES;
> +
> +	do {
> +		sr =3D read_sr(flash);
> +		if (sr < 0)
> +			break;
> +		/* only check fsr if sr not busy */
> +		if (!(sr & SR_WIP)) {
> +			fsr =3D read_fsr(flash);
> +			if (fsr < 0)
> +				break;
> +			if (fsr & FSR_READY)
> +				return 0;
> +		}
> +
> +		cond_resched();
> +
> +	} while (!time_after_eq(jiffies, deadline));
> +
> +	return 1;
> +}
> +/*
>   * Write status Register and configuration register with 2 bytes
>   * The first byte will be written to the status register, while the
>   * second byte will be written to the configuration register.
> @@ -280,7 +337,7 @@ static int macronix_quad_enable(struct m25p *flash)
>=20
>  	spi_write(flash->spi, &cmd, 2);
>=20
> -	if (wait_till_ready(flash))
> +	if (flash->wait_till_ready(flash))
>  		return 1;
>=20
>  	ret =3D read_sr(flash);
> @@ -351,7 +408,7 @@ static int erase_chip(struct m25p *flash)
>  			(long long)(flash->mtd.size >> 10));
>=20
>  	/* Wait until finished previous write command. */
> -	if (wait_till_ready(flash))
> +	if (flash->wait_till_ready(flash))
>  		return 1;
>=20
>  	/* Send write enable, then erase commands. */ @@ -391,7 +448,7
> @@ static int erase_sector(struct m25p *flash, u32 offset)
>  			__func__, flash->mtd.erasesize / 1024, offset);
>=20
>  	/* Wait until finished previous write command. */
> -	if (wait_till_ready(flash))
> +	if (flash->wait_till_ready(flash))
>  		return 1;
>=20
>  	/* Send write enable, then erase commands. */ @@ -536,7 +593,7
> @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	mutex_lock(&flash->lock);
>=20
>  	/* Wait till previous write/erase is done. */
> -	if (wait_till_ready(flash)) {
> +	if (flash->wait_till_ready(flash)) {
>  		/* REVISIT status return?? */
>  		mutex_unlock(&flash->lock);
>  		return 1;
> @@ -585,7 +642,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t
> to, size_t len,
>  	mutex_lock(&flash->lock);
>=20
>  	/* Wait until finished previous write command. */
> -	if (wait_till_ready(flash)) {
> +	if (flash->wait_till_ready(flash)) {
>  		mutex_unlock(&flash->lock);
>  		return 1;
>  	}
> @@ -628,7 +685,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t
> to, size_t len,
>  			t[1].tx_buf =3D buf + i;
>  			t[1].len =3D page_size;
>=20
> -			wait_till_ready(flash);
> +			flash->wait_till_ready(flash);
>=20
>  			write_enable(flash);
>=20
> @@ -668,7 +725,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to,
> size_t len,
>  	mutex_lock(&flash->lock);
>=20
>  	/* Wait until finished previous write command. */
> -	ret =3D wait_till_ready(flash);
> +	ret =3D flash->wait_till_ready(flash);
>  	if (ret)
>  		goto time_out;
>=20
> @@ -683,7 +740,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to,
> size_t len,
>  		/* write one byte. */
>  		t[1].len =3D 1;
>  		spi_sync(flash->spi, &m);
> -		ret =3D wait_till_ready(flash);
> +		ret =3D flash->wait_till_ready(flash);
>  		if (ret)
>  			goto time_out;
>  		*retlen +=3D m.actual_length - m25p_cmdsz(flash); @@ -702,7
> +759,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t le=
n,
>  		t[1].tx_buf =3D buf + actual;
>=20
>  		spi_sync(flash->spi, &m);
> -		ret =3D wait_till_ready(flash);
> +		ret =3D flash->wait_till_ready(flash);
>  		if (ret)
>  			goto time_out;
>  		*retlen +=3D m.actual_length - cmd_sz;
> @@ -710,7 +767,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to,
> size_t len,
>  		to +=3D 2;
>  	}
>  	write_disable(flash);
> -	ret =3D wait_till_ready(flash);
> +	ret =3D flash->wait_till_ready(flash);
>  	if (ret)
>  		goto time_out;
>=20
> @@ -724,7 +781,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to,
> size_t len,
>  		t[1].tx_buf =3D buf + actual;
>=20
>  		spi_sync(flash->spi, &m);
> -		ret =3D wait_till_ready(flash);
> +		ret =3D flash->wait_till_ready(flash);
>  		if (ret)
>  			goto time_out;
>  		*retlen +=3D m.actual_length - m25p_cmdsz(flash); @@ -745,7
> +802,7 @@ static int m25p80_lock(struct mtd_info *mtd, loff_t ofs, uint64=
_t
> len)
>=20
>  	mutex_lock(&flash->lock);
>  	/* Wait until finished previous command */
> -	if (wait_till_ready(flash)) {
> +	if (flash->wait_till_ready(flash)) {
>  		res =3D 1;
>  		goto err;
>  	}
> @@ -790,7 +847,7 @@ static int m25p80_unlock(struct mtd_info *mtd, loff_t
> ofs, uint64_t len)
>=20
>  	mutex_lock(&flash->lock);
>  	/* Wait until finished previous command */
> -	if (wait_till_ready(flash)) {
> +	if (flash->wait_till_ready(flash)) {
>  		res =3D 1;
>  		goto err;
>  	}
> @@ -856,6 +913,7 @@ struct flash_info {
>  #define	M25P_NO_FR	0x08		/* Can't do fastread */
>  #define	SECT_4K_PMC	0x10		/* OPCODE_BE_4K_PMC
> works uniformly */
>  #define	M25P80_QUAD_READ	0x20    /* Flash supports Quad Read
> */
> +#define	USE_FSR		0x40		/* use flag status
> register */
>  };
>=20
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
> @@ -941,6 +999,8 @@ static const struct spi_device_id m25p_ids[] =3D {
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> +	{ "n25q512a1",   INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },
> +	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR) },
>=20
>  	/* PMC */
>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> @@ -1206,6 +1266,12 @@ static int m25p_probe(struct spi_device *spi)
>  	if (info->flags & M25P_NO_ERASE)
>  		flash->mtd.flags |=3D MTD_NO_ERASE;
>=20
> +	if (info->flags & USE_FSR)
> +		flash->wait_till_ready =3D &_wait_till_fsr_ready;
> +	else
> +		flash->wait_till_ready =3D &_wait_till_ready;
> +
> +
>  	ppdata.of_node =3D spi->dev.of_node;
>  	flash->mtd.dev.parent =3D &spi->dev;
>  	flash->page_size =3D info->page_size;
> --
> 1.7.10.4
