Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIb5f-00062Q-Qw
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 13:33:41 +0000
Date: Wed, 7 Jun 2017 15:33:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao
 Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH v5 07/23] mtd: nand: denali: do not propagate
 NAND_STATUS_FAIL to waitfunc()
Message-ID: <20170607153318.7e341dff@bbrezillon>
In-Reply-To: <1496836352-8016-8-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-8-git-send-email-yamada.masahiro@socionext.com>
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

On Wed,  7 Jun 2017 20:52:16 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Currently, the error handling of denali_write_page(_raw) is a bit
> complicated.  If the program command fails, NAND_STATUS_FAIL is set
> to the driver internal denali->status, then read out later by
> denali_waitfunc().
>=20
> We can avoid it by exploiting the nand_write_page() implementation.
> If chip->ecc.write_page(_raw) returns negative code (i.e. -EIO), it
> errors out immediately.  This gives the same result as returning
> NAND_STATUS_FAIL from chip->waitfunc.  In either way, -EIO is
> returned to the upper MTD layer.

Actually, this is how it's supposed to work now (when they set
the NAND_ECC_CUSTOM_PAGE_ACCESS flag, drivers are expected to wait for
the program operation to finish and return -EIO if it failed), so you're
all good ;-).

>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
>   - Newly added
>=20
>  drivers/mtd/nand/denali.c | 12 ++++--------
>  drivers/mtd/nand/denali.h |  1 -
>  2 files changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 1897fe238290..22acfc34b546 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1005,6 +1005,7 @@ static int write_page(struct mtd_info *mtd, struct =
nand_chip *chip,
>  	size_t size =3D mtd->writesize + mtd->oobsize;
>  	uint32_t irq_status;
>  	uint32_t irq_mask =3D INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;

As mentioned in my previous patch, I think you should wait for
INTR__PROGRAM_COMP |=C2=A0INTR__PROGRAM_FAIL here.

> +	int ret =3D 0;
> =20
>  	denali->page =3D page;
> =20
> @@ -1038,13 +1039,13 @@ static int write_page(struct mtd_info *mtd, struc=
t nand_chip *chip,
>  	if (irq_status =3D=3D 0) {
>  		dev_err(denali->dev, "timeout on write_page (type =3D %d)\n",
>  			raw_xfer);
> -		denali->status =3D NAND_STATUS_FAIL;
> +		ret =3D -EIO;
>  	}

	if (irq_status & INTR__PROGRAM_FAIL) {
		dev_err(denali->dev, "page program failed (type =3D %d)\n",
  			raw_xfer);
		ret =3D -EIO;
	}
> =20
>  	denali_enable_dma(denali, false);
>  	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_TO_DEVICE);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  /* NAND core entry points */
> @@ -1196,12 +1197,7 @@ static void denali_select_chip(struct mtd_info *mt=
d, int chip)
> =20
>  static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
>  {
> -	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
> -	int status =3D denali->status;
> -
> -	denali->status =3D 0;
> -
> -	return status;
> +	return 0;
>  }
> =20
>  static int denali_erase(struct mtd_info *mtd, int page)
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index a06ed741b550..352d8328b94a 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -323,7 +323,6 @@ struct nand_buf {
>  struct denali_nand_info {
>  	struct nand_chip nand;
>  	int flash_bank; /* currently selected chip */
> -	int status;
>  	int platform;
>  	struct nand_buf buf;
>  	struct device *dev;
