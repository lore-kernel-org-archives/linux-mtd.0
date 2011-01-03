From: "Nori, Sekhar" <nsekhar@ti.com>
To: "Ghorai, Sukumar" <s-ghorai@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>
Date: Mon, 3 Jan 2011 17:19:03 +0530
Subject: RE: [PATCH v7 4/7] omap3: nand: prefetch in irq mode support
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB593024816D63C@dbde02.ent.ti.com>
References: <1293629546-18831-1-git-send-email-s-ghorai@ti.com>
	<1293629546-18831-5-git-send-email-s-ghorai@ti.com>
In-Reply-To: <1293629546-18831-5-git-send-email-s-ghorai@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Vimal Singh <vimalsingh@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sukumar,

On Wed, Dec 29, 2010 at 19:02:23, Ghorai, Sukumar wrote:
> This patch enable prefetch-irq mode for nand transfer(read, write)
>=20
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
> ---
>  arch/arm/mach-omap2/board-flash.c      |    2 +
>  arch/arm/plat-omap/include/plat/nand.h |    4 +-
>  drivers/mtd/nand/omap2.c               |  169 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 174 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/mach-omap2/board-flash.c b/arch/arm/mach-omap2/boar=
d-flash.c
> index f6b7253..1964509 100644
> --- a/arch/arm/mach-omap2/board-flash.c
> +++ b/arch/arm/mach-omap2/board-flash.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/mtd/physmap.h>
>  #include <linux/io.h>
> +#include <plat/irqs.h>
> =20
>  #include <plat/gpmc.h>
>  #include <plat/nand.h>
> @@ -147,6 +148,7 @@ __init board_nand_init(struct mtd_partition *nand_par=
ts,
>  	board_nand_data.nr_parts	=3D nr_parts;
>  	board_nand_data.devsize		=3D nand_type;
> =20
> +	board_nand_data.gpmc_irq =3D OMAP_GPMC_IRQ_BASE + cs;
>  	gpmc_nand_init(&board_nand_data);
>  }
>  #else
> diff --git a/arch/arm/plat-omap/include/plat/nand.h b/arch/arm/plat-omap/=
include/plat/nand.h
> index 78c0bdb..ae5e053 100644
> --- a/arch/arm/plat-omap/include/plat/nand.h
> +++ b/arch/arm/plat-omap/include/plat/nand.h
> @@ -13,7 +13,8 @@
>  enum nand_io {
>  	NAND_OMAP_PREFETCH_POLLED =3D 0,	/* prefetch polled mode, default */
>  	NAND_OMAP_POLLED,		/* polled mode, without prefetch */
> -	NAND_OMAP_PREFETCH_DMA		/* prefetch enabled sDMA mode */
> +	NAND_OMAP_PREFETCH_DMA,		/* prefetch enabled sDMA mode */
> +	NAND_OMAP_PREFETCH_IRQ		/* prefetch enabled irq mode */
>  };
> =20
>  struct omap_nand_platform_data {
> @@ -26,6 +27,7 @@ struct omap_nand_platform_data {
>  	int			(*nand_setup)(void);
>  	int			(*dev_ready)(struct omap_nand_platform_data *);
>  	int			dma_channel;
> +	int			gpmc_irq;
>  	enum nand_io		xfer_type;
>  	unsigned long		phys_base;
>  	int			devsize;
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 66b7428..007862e 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/delay.h>
> +#include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/sched.h>
>  #include <linux/mtd/mtd.h>
> @@ -108,6 +109,13 @@ struct omap_nand_info {
>  	unsigned long			phys_base;
>  	struct completion		comp;
>  	int				dma_ch;
> +	int				gpmc_irq;
> +	enum {
> +		OMAP_NAND_IO_READ =3D 0,	/* read */
> +		OMAP_NAND_IO_WRITE,	/* write */
> +	} iomode;
> +	u_char				*buf;
> +	int					buf_len;
>  };
> =20
>  /**
> @@ -436,6 +444,153 @@ static void omap_write_buf_dma_pref(struct mtd_info=
 *mtd,
>  		omap_nand_dma_transfer(mtd, (u_char *) buf, len, 0x1);
>  }
> =20
> +/*
> + * omap_nand_irq - GMPC irq handler
> + * @this_irq: gpmc irq number
> + * @dev: omap_nand_info structure pointer is passed here
> + */
> +static irqreturn_t omap_nand_irq(int this_irq, void *dev)
> +{
> +	struct omap_nand_info *info =3D (struct omap_nand_info *) dev;
> +	u32 bytes;
> +	u32 irq_stat;
> +
> +	irq_stat =3D gpmc_read_status(GPMC_GET_IRQ_STATUS);
> +	bytes =3D gpmc_read_status(GPMC_PREFETCH_FIFO_CNT);
> +	bytes =3D bytes  & 0xFFFC; /* io in multiple of 4 bytes */
> +	if (info->iomode =3D=3D OMAP_NAND_IO_WRITE) { /* checks for write io */
> +		if (irq_stat & 0x2)
> +			goto done;
> +
> +		if (info->buf_len & (info->buf_len < bytes))

Meant to use logical AND here?

> +			bytes =3D info->buf_len;
> +		else if (!info->buf_len)
> +			bytes =3D 0;
> +		iowrite32_rep(info->nand.IO_ADDR_W,
> +						(u32 *)info->buf, bytes >> 2);
> +		info->buf =3D info->buf + bytes;
> +		info->buf_len -=3D bytes;
> +
> +	} else {
> +		ioread32_rep(info->nand.IO_ADDR_R,
> +						(u32 *)info->buf, bytes >> 2);
> +		info->buf =3D info->buf + bytes;
> +
> +		if (irq_stat & 0x2)
> +			goto done;
> +	}
> +	gpmc_cs_configure(info->gpmc_cs, GPMC_SET_IRQ_STATUS, irq_stat);
> +	irq_stat =3D gpmc_read_status(GPMC_GET_IRQ_STATUS);

irq_stat update remains unused.

> +
> +	return IRQ_HANDLED;
> +
> +done:
> +	complete(&info->comp);
> +	/* disable irq */
> +	gpmc_cs_configure(info->gpmc_cs, GPMC_ENABLE_IRQ, 0);
> +
> +	/* clear status */
> +	gpmc_cs_configure(info->gpmc_cs, GPMC_SET_IRQ_STATUS, irq_stat);
> +	irq_stat =3D gpmc_read_status(GPMC_GET_IRQ_STATUS);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * omap_read_buf_irq_pref - read data from NAND controller into buffer
> + * @mtd: MTD device structure
> + * @buf: buffer to store date
> + * @len: number of bytes to read
> + */
> +static void omap_read_buf_irq_pref(struct mtd_info *mtd, u_char *buf, in=
t len)
> +{
> +	struct omap_nand_info *info =3D container_of(mtd,
> +						struct omap_nand_info, mtd);
> +	int ret =3D 0;
> +
> +	if (len <=3D mtd->oobsize) {
> +		omap_read_buf_pref(mtd, buf, len);
> +		return;
> +	}
> +
> +	info->iomode =3D OMAP_NAND_IO_READ;
> +	info->buf =3D buf;
> +	init_completion(&info->comp);

You can use INIT_COMPLETION to reset the completion variable.
Same change can be done in write below.

> +
> +	/*  configure and start prefetch transfer */
> +	ret =3D gpmc_prefetch_enable(info->gpmc_cs, 0x0, len, 0x0);
> +	if (ret)
> +		/* PFPW engine is busy, use cpu copy methode */

s/methode/method

> +		goto out_copy;
> +
> +	info->buf_len =3D len;
> +	/* enable irq */
> +	gpmc_cs_configure(info->gpmc_cs, GPMC_ENABLE_IRQ,
> +		(GPMC_IRQ_FIFOEVENTENABLE | GPMC_IRQ_COUNT_EVENT));
> +
> +	/* waiting for read to complete */
> +	wait_for_completion(&info->comp);
> +
> +	/* disable and stop the PFPW engine */
> +	gpmc_prefetch_reset(info->gpmc_cs);
> +	return;
> +
> +out_copy:
> +	if (info->nand.options & NAND_BUSWIDTH_16)
> +		omap_read_buf16(mtd, buf, len);
> +	else
> +		omap_read_buf8(mtd, buf, len);
> +}
> +
> +/*
> + * omap_write_buf_irq_pref - write buffer to NAND controller
> + * @mtd: MTD device structure
> + * @buf: data buffer
> + * @len: number of bytes to write
> + */
> +static void omap_write_buf_irq_pref(struct mtd_info *mtd,
> +					const u_char *buf, int len)
> +{
> +	struct omap_nand_info *info =3D container_of(mtd,
> +						struct omap_nand_info, mtd);
> +	int ret =3D 0;
> +	if (len <=3D mtd->oobsize) {
> +		omap_write_buf_pref(mtd, buf, len);
> +		return;
> +	}
> +
> +	info->iomode =3D OMAP_NAND_IO_WRITE;
> +	info->buf =3D (u_char *) buf;
> +	init_completion(&info->comp);
> +
> +	/*  configure and start prefetch transfer */
> +	ret =3D gpmc_prefetch_enable(info->gpmc_cs, 0x0, len, 0x1);
> +	if (ret)
> +		/* PFPW engine is busy, use cpu copy methode */
> +		goto out_copy;
> +
> +	info->buf_len =3D len;
> +	/* enable irq */
> +	gpmc_cs_configure(info->gpmc_cs, GPMC_ENABLE_IRQ,
> +			(GPMC_IRQ_FIFOEVENTENABLE | GPMC_IRQ_COUNT_EVENT));
> +
> +	/* waiting for write to complete */
> +	wait_for_completion(&info->comp);
> +	/* wait for data to flushed-out before reset the prefetch */
> +	do {
> +		ret =3D gpmc_read_status(GPMC_PREFETCH_COUNT);
> +	} while (ret);

Please have a timeout for this while loop in case hardware does
not become ready. Also, consider using cpu_relax() inside the
tight loop.

> +	/* disable and stop the PFPW engine */
> +	gpmc_prefetch_reset(info->gpmc_cs);
> +	return;
> +
> +out_copy:
> +	if (info->nand.options & NAND_BUSWIDTH_16)
> +		omap_write_buf16(mtd, buf, len);
> +	else
> +		omap_write_buf8(mtd, buf, len);
> +}
> +
>  /**
>   * omap_verify_buf - Verify chip data against buffer
>   * @mtd: MTD device structure
> @@ -769,6 +924,7 @@ static int __devinit omap_nand_probe(struct platform_=
device *pdev)
> =20
>  	info->gpmc_cs		=3D pdata->cs;
>  	info->phys_base		=3D pdata->phys_base;
> +	info->gpmc_irq		=3D pdata->gpmc_irq;
> =20
>  	info->mtd.priv		=3D &info->nand;
>  	info->mtd.name		=3D dev_name(&pdev->dev);
> @@ -846,6 +1002,19 @@ static int __devinit omap_nand_probe(struct platfor=
m_device *pdev)
>  		}
>  		break;
> =20
> +	case NAND_OMAP_PREFETCH_IRQ:
> +		err =3D request_irq(info->gpmc_irq,
> +				omap_nand_irq, IRQF_SHARED, "gpmc-nand", info);

I was expecting to see a free_irq() in the remove.

Thanks,
Sekhar

> +		if (err) {
> +			dev_err(&pdev->dev, "requesting irq(%d) error:%d",
> +							info->gpmc_irq, err);
> +			goto out_release_mem_region;
> +		} else {
> +			info->nand.read_buf   =3D omap_read_buf_irq_pref;
> +			info->nand.write_buf  =3D omap_write_buf_irq_pref;
> +		}
> +		break;
> +
>  	default:
>  		dev_err(&pdev->dev,
>  			"xfer_type(%d) not supported!\n", pdata->xfer_type);
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
