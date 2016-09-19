Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bm21x-0001Ec-6e
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 17:07:01 +0000
Date: Mon, 19 Sep 2016 19:06:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Sebastian Frias <sf84@laposte.net>, Jean-Baptiste Lescher
 <jblescher@gmail.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>,
 Mason <slash.tmp@free.fr>
Subject: Re: [PATCH v5] mtd: nand: tango: import driver for tango chips
Message-ID: <20160919190623.3b9d7842@bbrezillon>
In-Reply-To: <57DFE444.3000003@sigmadesigns.com>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon>
 <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com>
 <57D2DF96.7060705@sigmadesigns.com> <57D5530B.2060209@free.fr>
 <20160912210810.79ac23c9@bbrezillon>
 <57DFE444.3000003@sigmadesigns.com>
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

Hi Marc,

On Mon, 19 Sep 2016 15:12:36 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> This driver supports the NAND Flash controller embedded in recent
> Tango chips, such as SMP8758 and SMP8759.
>=20

Please send another patch to document the DT bindings, and Cc the DT
maintainers.

> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
> Tests done to validate this driver:
>   mtd_stresstest dev=3D1 count=3D500000
>   mtd_nandbiterrs dev=3D1
>   ubiattach -m 1 -d 3 && runtests.sh /dev/ubi3
> ---
>  drivers/mtd/nand/Kconfig      |   6 +
>  drivers/mtd/nand/Makefile     |   1 +
>  drivers/mtd/nand/tango_nand.c | 555 ++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 562 insertions(+)
>  create mode 100644 drivers/mtd/nand/tango_nand.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f05e0e9eb2f7..22eb5457c9f7 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -205,6 +205,12 @@ config MTD_NAND_S3C2410_CLKSTOP
>  	  when the is NAND chip selected or released, but will save
>  	  approximately 5mA of power when there is nothing happening.
> =20
> +config MTD_NAND_TANGO
> +	tristate "NAND Flash support for Tango chips"
> +	depends on ARCH_TANGO
> +	help
> +	  Enables the NAND Flash controller on Tango chips.
> +
>  config MTD_NAND_DISKONCHIP
>  	tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND reimple=
mentation)"
>  	depends on HAS_IOMEM
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index f55335373f7c..647f727223ef 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_MTD_NAND_DENALI_DT)	+=3D denali_dt.o
>  obj-$(CONFIG_MTD_NAND_AU1550)		+=3D au1550nd.o
>  obj-$(CONFIG_MTD_NAND_BF5XX)		+=3D bf5xx_nand.o
>  obj-$(CONFIG_MTD_NAND_S3C2410)		+=3D s3c2410.o
> +obj-$(CONFIG_MTD_NAND_TANGO)		+=3D tango_nand.o
>  obj-$(CONFIG_MTD_NAND_DAVINCI)		+=3D davinci_nand.o
>  obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+=3D diskonchip.o
>  obj-$(CONFIG_MTD_NAND_DOCG4)		+=3D docg4.o
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> new file mode 100644
> index 000000000000..ec18cad546fb
> --- /dev/null
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -0,0 +1,555 @@
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +
> +/* Offsets relative to chip->base */
> +#define PBUS_CMD	0
> +#define PBUS_ADDR	4
> +#define PBUS_DATA	8
> +
> +/* Offsets relative to reg_base */
> +#define NFC_STATUS	0x00
> +#define NFC_FLASH_CMD	0x04
> +#define NFC_DEVICE_CFG	0x08
> +#define NFC_TIMING1	0x0c
> +#define NFC_TIMING2	0x10
> +#define NFC_XFER_CFG	0x14
> +#define NFC_PKT_0_CFG	0x18
> +#define NFC_PKT_N_CFG	0x1c
> +#define NFC_BB_CFG	0x20
> +#define NFC_ADDR_PAGE	0x24
> +#define NFC_ADDR_OFFSET	0x28
> +#define NFC_XFER_STATUS	0x2c
> +
> +/* NFC_STATUS values */
> +#define CMD_READY	BIT(31)
> +
> +/* NFC_FLASH_CMD values */
> +#define NFC_READ	1
> +#define NFC_WRITE	2
> +
> +/* NFC_XFER_STATUS values */
> +#define PAGE_IS_EMPTY	BIT(16)
> +
> +/* Offsets relative to mem_base */
> +#define METADATA	0x000
> +#define ERROR_REPORT	0x1c0
> +
> +/*
> + * Error reports are split in two bytes:
> + * byte 0 for the first packet in a page (PKT_0)
> + * byte 1 for other packets in a page (PKT_N, for N > 0)
> + * ERR_COUNT_PKT_N is the max error count over all but the first packet.
> + */
> +#define DECODE_OK_PKT_0(v)	(v & BIT(7))
> +#define DECODE_OK_PKT_N(v)	(v & BIT(15))
> +#define ERR_COUNT_PKT_0(v)	((v >> 0) & 0x3f)
> +#define ERR_COUNT_PKT_N(v)	((v >> 8) & 0x3f)
> +
> +/* Offsets relative to pbus_base */
> +#define PBUS_CS_CTRL	0x83c
> +#define PBUS_PAD_MODE	0x8f0
> +
> +/* PBUS_CS_CTRL values */
> +#define PBUS_IORDY	BIT(31)
> +
> +/*
> + * PBUS_PAD_MODE values
> + * In raw mode, the driver communicates directly with the NAND chips.
> + * In NFC mode, the NAND Flash controller manages the communication.
> + * We use NFC mode for read and write; raw mode for everything else.
> + */
> +#define MODE_RAW	0
> +#define MODE_NFC	BIT(31)
> +
> +#define METADATA_SIZE	4
> +#define BBM_SIZE	6
> +#define FIELD_ORDER	15
> +
> +#define MAX_CS		4
> +
> +struct tango_nfc {
> +	struct nand_hw_control hw;
> +	void __iomem *reg_base;
> +	void __iomem *mem_base;
> +	void __iomem *pbus_base;
> +	struct tango_chip *chips[MAX_CS];
> +	struct dma_chan *chan;
> +};
> +
> +#define to_tango_nfc(ptr) container_of(ptr, struct tango_nfc, hw)
> +
> +struct tango_chip {
> +	struct nand_chip chip;
> +	void __iomem *base;

I'm still not convinced this is needed (->base can be calculated where
needed based on the chip->cs and nfc->reg_base values), but if you want
to keep it, let's keep it.

> +	u32 timing1;
> +	u32 timing2;
> +	u32 xfer_cfg;
> +	u32 pkt_0_cfg;
> +	u32 pkt_n_cfg;
> +	u32 bb_cfg;
> +	int cs;
> +};
> +
> +#define to_tango_chip(ptr) container_of(ptr, struct tango_chip, chip)
> +
> +#define XFER_CFG(cs, page_count, steps, metadata_size)	\
> +	((cs) << 24 | (page_count) << 16 | (steps) << 8 | (metadata_size) << 0)
> +
> +#define PKT_CFG(size, strength) ((size) << 16 | (strength) << 0)
> +
> +#define BB_CFG(bb_offset, bb_size) ((bb_offset) << 16 | (bb_size) << 0)
> +
> +#define TIMING(t0, t1, t2, t3) (t0 << 24 | t1 << 16 | t2 << 8 | t3 << 0)
> +
> +static void tango_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int c=
trl)
> +{
> +	struct tango_chip *chip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	if (ctrl & NAND_CLE)
> +		writeb_relaxed(dat, chip->base + PBUS_CMD);
> +
> +	if (ctrl & NAND_ALE)
> +		writeb_relaxed(dat, chip->base + PBUS_ADDR);
> +}
> +
> +static int tango_dev_ready(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct tango_nfc *nfc =3D to_tango_nfc(chip->controller);
> +
> +	return readl_relaxed(nfc->pbus_base + PBUS_CS_CTRL) & PBUS_IORDY;
> +}
> +
> +static uint8_t tango_read_byte(struct mtd_info *mtd)
> +{
> +	struct tango_chip *chip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	return readb_relaxed(chip->base + PBUS_DATA);
> +}
> +
> +static void tango_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	struct tango_chip *chip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	ioread8_rep(chip->base + PBUS_DATA, buf, len);
> +}
> +
> +static void tango_write_buf(struct mtd_info *mtd, const uint8_t *buf, in=
t len)
> +{
> +	struct tango_chip *chip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	iowrite8_rep(chip->base + PBUS_DATA, buf, len);
> +}
> +
> +static void tango_select_chip(struct mtd_info *mtd, int idx)
> +{
> +	struct nand_chip *nand =3D mtd_to_nand(mtd);
> +	struct tango_nfc *nfc =3D to_tango_nfc(nand->controller);
> +	struct tango_chip *chip =3D to_tango_chip(nand);
> +
> +	if (idx < 0) {
> +		chip->base =3D NULL;
> +		return;
> +	}
> +
> +	chip->base =3D nfc->pbus_base + (chip->cs * 256);

You support only one CS per chip, so this is something you can
configure at init time.

When I asked you to remove the chip->base field, I had multi-CS chips
in mind, but given this implementation, there's no need to set/reset
the chip->base field each time ->select_chip() is called.

> +
> +	writel_relaxed(chip->timing1,	nfc->reg_base + NFC_TIMING1);
> +	writel_relaxed(chip->timing2,	nfc->reg_base + NFC_TIMING2);
> +	writel_relaxed(chip->xfer_cfg,	nfc->reg_base + NFC_XFER_CFG);
> +	writel_relaxed(chip->pkt_0_cfg,	nfc->reg_base + NFC_PKT_0_CFG);
> +	writel_relaxed(chip->pkt_n_cfg,	nfc->reg_base + NFC_PKT_N_CFG);
> +	writel_relaxed(chip->bb_cfg,	nfc->reg_base + NFC_BB_CFG);

Nit: can you avoid these weird alignments. Use a single space after the
comma.

> +}
> +
> +static int decode_error_report(struct tango_nfc *nfc)
> +{
> +	u32 status, res;
> +
> +	status =3D readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
> +	if (status & PAGE_IS_EMPTY)
> +		return 0;
> +
> +	res =3D readl_relaxed(nfc->mem_base + ERROR_REPORT);
> +
> +	if (DECODE_OK_PKT_0(res) && DECODE_OK_PKT_N(res))
> +		return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
> +
> +	return -EBADMSG;
> +}
> +
> +static void tango_dma_callback(void *arg)
> +{
> +	complete(arg);
> +}
> +
> +static int do_dma(struct tango_nfc *nfc, int dir, int cmd,
> +		const void *buf, int len, int page)
> +{
> +	struct dma_async_tx_descriptor *desc;
> +	struct scatterlist sg;
> +	struct completion tx_done;
> +	int err =3D -EIO;
> +	u32 res, val;
> +
> +	sg_init_one(&sg, buf, len);
> +	if (dma_map_sg(nfc->chan->device->dev, &sg, 1, dir) !=3D 1)
> +		goto leave;

Return -EIO directly instead of creating this 'leave' label.

> +
> +	desc =3D dmaengine_prep_slave_sg(nfc->chan, &sg, 1, dir, DMA_PREP_INTER=
RUPT);

Put DMA_PREP_INTERRUPT on a second line to avoid >80 char lines.

> +	if (!desc)
> +		goto dma_unmap;
> +
> +	desc->callback =3D tango_dma_callback;
> +	desc->callback_param =3D &tx_done;
> +	init_completion(&tx_done);
> +
> +	writel_relaxed(MODE_NFC, nfc->pbus_base + PBUS_PAD_MODE);
> +
> +	writel_relaxed(page, nfc->reg_base + NFC_ADDR_PAGE);
> +	writel_relaxed(   0, nfc->reg_base + NFC_ADDR_OFFSET);
> +	writel_relaxed( cmd, nfc->reg_base + NFC_FLASH_CMD);
> +
> +	dmaengine_submit(desc);
> +	dma_async_issue_pending(nfc->chan);
> +
> +	res =3D wait_for_completion_timeout(&tx_done, HZ);
> +	if (res > 0) {
> +		void __iomem *addr =3D nfc->reg_base + NFC_STATUS;
> +		err =3D readl_poll_timeout(addr, val, val & CMD_READY, 0, 1000);

Why do you need this local variable?

		err =3D readl_poll_timeout(nfc->reg_base + NFC_STATUS,
					 val, val & CMD_READY, 0, 1000);

> +	}
> +
> +	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);

Add an extra blank line here.

> +dma_unmap:
> +	dma_unmap_sg(nfc->chan->device->dev, &sg, 1, dir);
> +leave:
> +	return err;
> +}
> +
> +static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> +		uint8_t *buf, int oob_required, int page)
> +{
> +	struct tango_nfc *nfc =3D to_tango_nfc(chip->controller);
> +	int err, res, len =3D mtd->writesize;
> +
> +	err =3D do_dma(nfc, DMA_FROM_DEVICE, NFC_READ, buf, len, page);
> +	if (err)
> +		return err;
> +
> +	if (oob_required)
> +		chip->ecc.read_oob(mtd, chip, page);
> +
> +	res =3D decode_error_report(nfc);
> +	if (res >=3D 0)
> +		return res;
> +
> +	chip->ecc.read_oob(mtd, chip, page);

There's no different in your case, but it should be read in raw mode.
How about calling ecc.read_oob_raw() so that you're safe even if you
want to differentiate the read_oob() and read_oob_raw() cases at some
point (IIUC, the METADATA section is ECC protected).

> +	res =3D nand_check_erased_ecc_chunk(buf, len, chip->oob_poi, mtd->oobsi=
ze,
> +			NULL, 0, chip->ecc.strength);

You should check each ECC packet/chunk independently, because ECC
strength is referring to an ECC packet not a full page.

> +	if (res < 0)
> +		mtd->ecc_stats.failed++;
> +
> +	return res;
> +}
> +
> +static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> +		const uint8_t *buf, int oob_required, int page)
> +{
> +	struct tango_nfc *nfc =3D to_tango_nfc(chip->controller);
> +	int err, len =3D mtd->writesize;
> +
> +	writel_relaxed(0xffffffff, nfc->mem_base + METADATA);
> +	err =3D do_dma(nfc, DMA_TO_DEVICE, NFC_WRITE, buf, len, page);
> +	if (err)
> +		return err;
> +
> +	if (oob_required)
> +		chip->ecc.write_oob(mtd, chip, page);
> +
> +	return 0;
> +}
> +
> +enum { OP_SKIP, OP_READ, OP_WRITE };
> +
> +static void raw_aux(struct mtd_info *mtd, u8 **buf, int len, int op, int=
 *lim)

Nit: please pass struct nand_chip *chip in first argument, and extract
the mtd using nand_to_mtd(). I know it's just a detail, but I'd like to
avoid passing mtd pointers, especially in internal functions.

> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	int pos =3D mtd->writesize - *lim;
> +
> +	if (op =3D=3D OP_SKIP)
> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, pos + len, -1);

Okay, we already discussed that one, and I already showed that this was
not working: NAND_CMD_RNDOUT is only valid for read accesses.

And I told you I'd like to avoid the const to non-const cast in write
accessors.

> +	else if (op =3D=3D OP_READ)
> +		tango_read_buf(mtd, *buf, len);
> +	else if (op =3D=3D OP_WRITE)
> +		tango_write_buf(mtd, *buf, len);
> +
> +	*lim -=3D len;
> +	*buf +=3D len;
> +}

I'm not sure factorizing this code is really important, but since you
insist, how about doing the following instead:

enum tango_raw_op { OP_READ, OP_WRITE };

union tango_raw_buffer {
	void *in;
	const void *out;
};

struct tango_raw_access {
	enum tango_raw_op op;
	union tango_raw_buffer *buf;
	int pos;
};

static void raw_aux(struct nand_chip *chip,
		    struct tango_raw_access *info,
		    union tango_raw_buffer *buf, int len)
{
	struct mtd_info *mtd =3D nand_to_mtd(chip);

	if (!buf) {
		if (info->op =3D=3D OP_READ)
			cmd =3D NAND_CMD_RNDOUT;
		else
			cmd =3D NAND_CMD_SEQIN;

		chip->cmdfunc(mtd, cmd, info->pos + len, -1);
	} else {
		if (info->op =3D=3D OP_READ)
			tango_read_buf(mtd, buf->out, len);
		else
			tango_write_buf(mtd, buf->in, len);

		buf->in +=3D len;
	}

	info->pos +=3D len;
}

> +
> +static int raw_access(struct mtd_info *mtd, uint8_t *buf, uint8_t *oob, =
int op)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	int pkt_size =3D chip->ecc.size;
> +	int ecc_size =3D chip->ecc.bytes;
> +	int buf_op =3D buf ? op : OP_SKIP;
> +	int oob_op =3D oob ? op : OP_SKIP;
> +	int rem, lim =3D mtd->writesize;
> +	u8 *oob_orig =3D oob;
> +
> +	oob +=3D BBM_SIZE;
> +	raw_aux(mtd, &oob, METADATA_SIZE, oob_op, &lim);
> +
> +	while (lim > pkt_size)
> +	{
> +		raw_aux(mtd, &buf, pkt_size, buf_op, &lim);
> +		raw_aux(mtd, &oob, ecc_size, oob_op, &lim);
> +	}
> +
> +	rem =3D pkt_size - lim;
> +	raw_aux(mtd, &buf, lim, buf_op, &lim);
> +	raw_aux(mtd, &oob_orig, BBM_SIZE, oob_op, &lim);
> +	raw_aux(mtd, &buf, rem, buf_op, &lim);
> +	raw_aux(mtd, &oob, ecc_size, oob_op, &lim);
> +
> +	return 0;
> +}

With the above changes this gives:

static int raw_access(struct nand_chip *chip,
		      union tango_raw_buffer *buf,
		      union tango_raw_buffer *oob,
		      int op)
{
	struct mtd_info *mtd =3D nand_to_mtd(chip);
	int pkt_size =3D chip->ecc.size;
	int ecc_size =3D chip->ecc.bytes;
	int steps =3D 0, rem =3D 0;
	struct tango_raw_access info =3D {
		.op =3D op,
		.pos =3D 0,
	};
	union tango_raw_buffer oob_orig;

	if (oob) {
		oob->in =3D chip->oob_poi + BBM_SIZE;
		oob_orig.in =3D chip->oob_poi;
	}

	raw_aux(chip, &info, oob, METADATA_SIZE);

	while (info.pos + pkt_size + ecc_size <=3D mtd->writesize) {
		raw_aux(chip, &info, buf, pkt_size);
		raw_aux(mtd, &info, oob, ecc_size);
		steps++;
	}

	if (steps < chip->ecc.steps)
		rem =3D pkt_size - (mtd->writesize - info.pos);
		raw_aux(mtd, &info, buf, mtd->writesize - info.pos);
	}

	raw_aux(mtd, &info, oob ? &oob_orig : NULL, BBM_SIZE);
	raw_aux(mtd, &info, buf, rem);

	rem =3D mtd->writesize + mtd->oobsize - info.pos;
	raw_aux(mtd, &info, oob, rem);

	return 0;
}

> +
> +static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *c=
hip,
> +		uint8_t *buf, int oob_required, int page)
> +{
> +	return raw_access(mtd, buf, chip->oob_poi, OP_READ);
> +}

static int tango_read_page_raw(struct mtd_info *mtd,
			       struct nand_chip *chip, uint8_t *buf,
			       int oob_required, int page)
{
	union tango_raw_buffer data_buf =3D { .in =3D buf }
	union tango_raw_buffer oob_buf;

	return raw_access(mtd, data_buf, oob_required ? oob_buf : NULL,
			  OP_READ);
}


> +
> +static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
> +		const uint8_t *buf, int oob_required, int page)
> +{
> +	return raw_access(mtd, (void *)buf, chip->oob_poi, OP_WRITE);
> +}
> +
> +static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip, =
int page)
> +{
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +	return raw_access(mtd, NULL, chip->oob_poi, OP_READ);
> +}
> +
> +static int tango_write_oob(struct mtd_info *mtd, struct nand_chip *chip,=
 int page)
> +{
> +	chip->pagebuf =3D -1;
> +	memset(chip->buffers->databuf, 0xff, mtd->writesize);
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
> +	raw_access(mtd, chip->buffers->databuf, chip->oob_poi, OP_WRITE);
> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	chip->waitfunc(mtd, chip);
> +	return 0;
> +}
> +
> +static int oob_ecc(struct mtd_info *mtd, int idx, struct mtd_oob_region =
*res)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> +
> +	if (idx >=3D ecc->steps)
> +		return -ERANGE;
> +
> +	res->offset =3D BBM_SIZE + METADATA_SIZE + ecc->bytes * idx;
> +	res->length =3D ecc->bytes;
> +
> +	return 0;
> +}
> +
> +static int oob_free(struct mtd_info *mtd, int idx, struct mtd_oob_region=
 *res)
> +{
> +	return -ERANGE; /* no free space in spare area */
> +}
> +
> +static const struct mtd_ooblayout_ops tango_nand_ooblayout_ops =3D {
> +	.ecc	=3D oob_ecc,
> +	.free	=3D oob_free,
> +};
> +
> +static u32 to_ticks(int kHz, int ps)
> +{
> +	return DIV_ROUND_UP_ULL((u64)kHz * ps, NSEC_PER_SEC);
> +}
> +
> +static int set_timings(struct tango_chip *p, int kHz)
> +{
> +	u32 Trdy, Textw, Twc, Twpw, Tacc, Thold, Trpw, Textr;
> +	const struct nand_sdr_timings *sdr;
> +	int mode =3D onfi_get_async_timing_mode(&p->chip);
> +
> +	if (mode & ONFI_TIMING_MODE_UNKNOWN)
> +		return -ENODEV;
> +
> +	sdr =3D onfi_async_timing_mode_to_sdr_timings(fls(mode) - 1);

We recently introduced a generic interface to automate nand timings
configuration [1].
Can you make use of it (the patches are in my nand/next branch=C2=A0[2], you
can rebase your patch series on top of this branch).

> +
> +	Trdy	=3D to_ticks(kHz, sdr->tCEA_max - sdr->tREA_max);
> +	Textw	=3D to_ticks(kHz, sdr->tWB_max);
> +	Twc	=3D to_ticks(kHz, sdr->tWC_min);
> +	Twpw	=3D to_ticks(kHz, sdr->tWC_min - sdr->tWP_min);
> +
> +	Tacc	=3D to_ticks(kHz, sdr->tREA_max);
> +	Thold	=3D to_ticks(kHz, sdr->tREH_min);
> +	Trpw	=3D to_ticks(kHz, sdr->tRC_min - sdr->tREH_min);
> +	Textr	=3D to_ticks(kHz, sdr->tRHZ_max);

Can you please be consistent in your indentation?
You're using spaces before '=3D' almost everywhere except in a few
places (like here).

> +
> +	p->timing1 =3D TIMING(Trdy, Textw, Twc, Twpw);
> +	p->timing2 =3D TIMING(Tacc, Thold, Trpw, Textr);
> +
> +	return 0;
> +}
> +
> +static int chip_init(struct device *dev, struct device_node *np, int kHz)
> +{
> +	int err;
> +	u32 cs, ecc_bits;
> +	struct nand_ecc_ctrl *ecc;
> +	struct tango_nfc *nfc =3D dev_get_drvdata(dev);
> +	struct tango_chip *p =3D devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	err =3D of_property_read_u32_index(np, "reg", 0, &cs);
> +	if (err)
> +		return err;
> +

Can you please check that you only have a single value in reg? Just to
make sure the user doesn't try to define a multi-CS chip.

> +	if (cs >=3D MAX_CS)
> +		return -ERANGE;
> +
> +	p->chip.read_byte	=3D tango_read_byte;
> +	p->chip.read_buf	=3D tango_read_buf;
> +	p->chip.select_chip	=3D tango_select_chip;
> +	p->chip.cmd_ctrl	=3D tango_cmd_ctrl;
> +	p->chip.dev_ready	=3D tango_dev_ready;
> +	p->chip.options		=3D NAND_USE_BOUNCE_BUFFER | NAND_NO_SUBPAGE_WRITE;
> +	p->chip.controller	=3D &nfc->hw;

Again, be consistent in you coding style: use spaces.

> +
> +	ecc			=3D &p->chip.ecc;
> +	ecc->mode		=3D NAND_ECC_HW;
> +	ecc->algo		=3D NAND_ECC_BCH;
> +	ecc->read_page_raw	=3D tango_read_page_raw;
> +	ecc->write_page_raw	=3D tango_write_page_raw;
> +	ecc->read_page		=3D tango_read_page;
> +	ecc->write_page		=3D tango_write_page;
> +	ecc->read_oob		=3D tango_read_oob;
> +	ecc->write_oob		=3D tango_write_oob;

Can you move this part after nand_scan_ident(). I'd also suggest to
support software ECC (it's just taking a few more lines), but that's up
to you.

> +
> +	nand_set_flash_node(&p->chip, np);
> +	mtd_set_ooblayout(&p->chip.mtd, &tango_nand_ooblayout_ops);
> +	err =3D nand_scan_ident(&p->chip.mtd, 1, NULL);
> +	if (err)
> +		return err;
> +
> +	ecc_bits =3D ecc->strength * FIELD_ORDER;
> +	p->chip.ecc.bytes =3D DIV_ROUND_UP(ecc_bits, BITS_PER_BYTE);
> +	set_timings(p, kHz);

You won't need that one if you implement the
chip->setup_data_interface() method.

> +
> +	err =3D nand_scan_tail(&p->chip.mtd);
> +	if (err)
> +		return err;
> +
> +	err =3D mtd_device_register(&p->chip.mtd, NULL, 0);
> +	if (err)
> +		return err;
> +
> +	nfc->chips[cs] =3D p;
> +
> +	p->xfer_cfg	=3D XFER_CFG(cs, 1, ecc->steps, METADATA_SIZE);
> +	p->pkt_0_cfg	=3D PKT_CFG(ecc->size + METADATA_SIZE, ecc->strength);
> +	p->pkt_n_cfg	=3D PKT_CFG(ecc->size, ecc->strength);
> +	p->bb_cfg	=3D BB_CFG(p->chip.mtd.writesize, BBM_SIZE);

This should go before nand_scan_tail(), because, as soon as you call
mtd_device_register(), someone might use your NAND device.

> +	p->cs		=3D cs;

And this one should go before nand_scan_ident().

> +
> +	return 0;
> +}
> +
> +static int tango_nand_probe(struct platform_device *pdev)
> +{
> +	int kHz;
> +	struct clk *clk;
> +	struct resource *res;
> +	struct tango_nfc *nfc;
> +	struct device_node *np;
> +
> +	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nfc->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(nfc->reg_base))
> +		return PTR_ERR(nfc->reg_base);
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	nfc->mem_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(nfc->mem_base))
> +		return PTR_ERR(nfc->mem_base);
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +	nfc->pbus_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(nfc->pbus_base))
> +		return PTR_ERR(nfc->pbus_base);
> +
> +	nfc->chan =3D dma_request_chan(&pdev->dev, "nfc_sbox");
> +	if (IS_ERR(nfc->chan))
> +		return PTR_ERR(nfc->chan);
> +
> +	clk =3D clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	platform_set_drvdata(pdev, nfc);
> +	nand_hw_control_init(&nfc->hw);
> +	kHz =3D clk_get_rate(clk) / 1000;
> +
> +	for_each_child_of_node(pdev->dev.of_node, np) {
> +		int err =3D chip_init(&pdev->dev, np, kHz);
> +		if (err)
> +			return err;

You should unregister all NAND/MTD devices before returning an error.

> +	}
> +
> +	/* TODO: tweak (?) Peripheral Bus setup (timings and CS config) */
> +
> +	return 0;
> +}
> +
> +static int tango_nand_remove(struct platform_device *pdev)
> +{
> +	int cs;
> +	struct tango_nfc *nfc =3D platform_get_drvdata(pdev);
> +
> +	dma_release_channel(nfc->chan);
> +	for (cs =3D 0; cs < MAX_CS; ++cs)
> +		if (nfc->chips[cs] !=3D NULL)
> +			nand_release(&nfc->chips[cs]->chip.mtd);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tango_nand_ids[] =3D {
> +	{ .compatible =3D "sigma,smp8758-nand" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver tango_nand_driver =3D {
> +	.probe	=3D tango_nand_probe,
> +	.remove	=3D tango_nand_remove,
> +	.driver	=3D {
> +		.name		=3D "tango-nand",
> +		.of_match_table	=3D tango_nand_ids,
> +	},
> +};
> +
> +module_platform_driver(tango_nand_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Sigma Designs");
> +MODULE_DESCRIPTION("Tango4 NAND Flash controller driver");

[1]http://www.spinics.net/lists/arm-kernel/msg530498.html
[2]https://github.com/linux-nand/linux/tree/nand/next
