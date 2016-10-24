Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bygtk-0008L2-Kp
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 15:10:52 +0000
Date: Mon, 24 Oct 2016 17:10:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v6 4/4] mtd: nand: tango: import driver for tango chips
Message-ID: <20161024171026.710d0f6a@bbrezillon>
In-Reply-To: <580E04B4.7040102@sigmadesigns.com>
References: <580E0318.5020004@sigmadesigns.com>
 <580E04B4.7040102@sigmadesigns.com>
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

On Mon, 24 Oct 2016 14:55:16 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> This driver supports the NAND Flash controller embedded in recent
> Tango chips, such as SMP8758 and SMP8759.

A few comments below (most of them are about coding style).

>=20
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/mtd/nand/Kconfig      |   6 +
>  drivers/mtd/nand/Makefile     |   1 +
>  drivers/mtd/nand/tango_nand.c | 654 ++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 661 insertions(+)
>  create mode 100644 drivers/mtd/nand/tango_nand.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 7b7a887b4709..844ab20a23a4 100644
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
> index cafde6f3d957..4904ad3614fb 100644
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
> index 000000000000..375ca8e4a3aa
> --- /dev/null
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -0,0 +1,654 @@
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
> + * byte 0 for the first packet in the page (PKT_0)
> + * byte 1 for other packets in the page (PKT_N, for N > 0)
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
> +	int freq_kHz;
> +};
> +
> +#define to_tango_nfc(ptr) container_of(ptr, struct tango_nfc, hw)
> +
> +struct tango_chip {
> +	struct nand_chip nand_chip;
> +	void __iomem *base;
> +	u32 timing1;
> +	u32 timing2;
> +	u32 xfer_cfg;
> +	u32 pkt_0_cfg;
> +	u32 pkt_n_cfg;
> +	u32 bb_cfg;
> +};
> +
> +#define to_tango_chip(ptr) container_of(ptr, struct tango_chip, nand_chi=
p)
> +
> +#define XFER_CFG(cs, page_count, steps, metadata_size)	\
> +	((cs) << 24 | (page_count) << 16 | (steps) << 8 | (metadata_size) << 0)
> +
> +#define PKT_CFG(size, strength) ((size) << 16 | (strength) << 0)
> +
> +#define BB_CFG(bb_offset, bb_size) ((bb_offset) << 16 | (bb_size) << 0)
> +
> +#define TIMING(t0, t1, t2, t3) (t0 << 24 | t1 << 16 | t2 << 8 | t3 << 0)

Wrap tX params with parenthesis to make sure the shift operation is
applied to the correct value (for example, if t0 =3D a + b, then the
resulting operation will be a + (b << 24) instead of (a + b) << 24 if
you don't put those parenthesis).

> +
> +static void tango_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int c=
trl)
> +{
> +	struct tango_chip *tchip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	if (ctrl & NAND_CLE)
> +		writeb_relaxed(dat, tchip->base + PBUS_CMD);
> +
> +	if (ctrl & NAND_ALE)
> +		writeb_relaxed(dat, tchip->base + PBUS_ADDR);
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
> +	struct tango_chip *tchip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	return readb_relaxed(tchip->base + PBUS_DATA);
> +}
> +
> +static void tango_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	struct tango_chip *tchip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	ioread8_rep(tchip->base + PBUS_DATA, buf, len);
> +}
> +
> +static void tango_write_buf(struct mtd_info *mtd, const uint8_t *buf, in=
t len)
> +{
> +	struct tango_chip *tchip =3D to_tango_chip(mtd_to_nand(mtd));
> +
> +	iowrite8_rep(tchip->base + PBUS_DATA, buf, len);
> +}
> +
> +static void tango_select_chip(struct mtd_info *mtd, int idx)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct tango_nfc *nfc =3D to_tango_nfc(chip->controller);
> +	struct tango_chip *tchip =3D to_tango_chip(chip);
> +
> +	if (idx < 0)
> +		return; /* No "chip unselect" function */
> +
> +	writel_relaxed(tchip->timing1, nfc->reg_base + NFC_TIMING1);
> +	writel_relaxed(tchip->timing2, nfc->reg_base + NFC_TIMING2);
> +	writel_relaxed(tchip->xfer_cfg, nfc->reg_base + NFC_XFER_CFG);
> +	writel_relaxed(tchip->pkt_0_cfg, nfc->reg_base + NFC_PKT_0_CFG);
> +	writel_relaxed(tchip->pkt_n_cfg, nfc->reg_base + NFC_PKT_N_CFG);
> +	writel_relaxed(tchip->bb_cfg, nfc->reg_base + NFC_BB_CFG);
> +}
> +
> +/*
> + * The controller does not check for bitflips in erased pages,
> + * therefore software must check instead.
> + */
> +static int check_erased_page(struct nand_chip *chip, u8 *buf)
> +{
> +	u8 *meta =3D chip->oob_poi + BBM_SIZE;
> +	u8 *ecc =3D chip->oob_poi + BBM_SIZE + METADATA_SIZE;
> +	const int ecc_size =3D chip->ecc.bytes;
> +	const int pkt_size =3D chip->ecc.size;
> +	int i, res, meta_len, bitflips =3D 0;
> +
> +	for (i =3D 0; i < chip->ecc.steps; ++i)
> +	{
> +		meta_len =3D i ? 0 : METADATA_SIZE;
> +		res =3D nand_check_erased_ecc_chunk(buf, pkt_size, ecc, ecc_size,
> +				meta, meta_len, chip->ecc.strength);
> +		if (res < 0)
> +			return res;
> +
> +		bitflips =3D max(res, bitflips);
> +		buf +=3D pkt_size;
> +		ecc +=3D ecc_size;
> +	}
> +
> +	return bitflips;
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
> +	struct dma_chan *chan =3D nfc->chan;
> +	struct dma_async_tx_descriptor *desc;
> +	struct scatterlist sg;
> +	struct completion tx_done;
> +	int err =3D -EIO;
> +	u32 res, val;
> +
> +	sg_init_one(&sg, buf, len);
> +	if (dma_map_sg(chan->device->dev, &sg, 1, dir) !=3D 1)
> +		return -EIO;
> +
> +	desc =3D dmaengine_prep_slave_sg(chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
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

A vestige of you weird alignment policy ;). Please fix that.

> +
> +	dmaengine_submit(desc);
> +	dma_async_issue_pending(chan);
> +
> +	res =3D wait_for_completion_timeout(&tx_done, HZ);
> +	if (res > 0) {
> +		void __iomem *addr =3D nfc->reg_base + NFC_STATUS;
> +		err =3D readl_poll_timeout(addr, val, val & CMD_READY, 0, 1000);
> +	}

I'd still prefer:

	if (res > 0)
		err =3D readl_poll_timeout(addr, val, val & CMD_READY, 0,
					 1000);

> +
> +	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
> +
> +dma_unmap:
> +	dma_unmap_sg(chan->device->dev, &sg, 1, dir);
> +
> +	return err;
> +}
> +
> +static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> +		uint8_t *buf, int oob_required, int page)
> +{
> +	struct tango_nfc *nfc =3D to_tango_nfc(chip->controller);
> +	int err, res, len =3D mtd->writesize;
> +
> +	if (oob_required)
> +		chip->ecc.read_oob(mtd, chip, page);
> +
> +	err =3D do_dma(nfc, DMA_FROM_DEVICE, NFC_READ, buf, len, page);
> +	if (err)
> +		return err;
> +
> +	res =3D decode_error_report(nfc);
> +	if (res < 0) {
> +		chip->ecc.read_oob_raw(mtd, chip, page);
> +		res =3D check_erased_page(chip, buf);
> +	}

You should not return an error, when the ECC engine detected
uncorrectable errors. You should just increment ecc->failed.

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
> +		return -ENOTSUPP; /* Sending PAGEPROG twice is forbidden */

Please put the comment before the oob_required test.
You should probably test that before lauching the DMA transfer.

> +
> +	return 0;
> +}
> +
> +static void aux_read(struct nand_chip *chip, u8 **buf, int len, int *pos)
> +{
> +	*pos +=3D len;
> +
> +	if (*buf =3D=3D NULL) /* skip over len bytes */
> +		chip->cmdfunc(&chip->mtd, NAND_CMD_RNDOUT, *pos, -1);
> +	else {
> +		tango_read_buf(&chip->mtd, *buf, len);
> +		*buf +=3D len;
> +	}

	if (*buf =3D=3D NULL) {
		/* skip over len bytes */
		chip->cmdfunc(&chip->mtd, NAND_CMD_RNDOUT, *pos, -1);
	} else {
		tango_read_buf(&chip->mtd, *buf, len);
		*buf +=3D len;
	}

> +}
> +
> +static void aux_write(struct nand_chip *chip, const u8 **buf, int len, i=
nt *pos)
> +{
> +	*pos +=3D len;
> +
> +	if (*buf =3D=3D NULL) /* skip over len bytes */
> +		chip->cmdfunc(&chip->mtd, NAND_CMD_SEQIN, *pos, -1);
> +	else {
> +		tango_write_buf(&chip->mtd, *buf, len);
> +		*buf +=3D len;
> +	}

Ditto.

> +}
> +
> +/*
> + * Physical page layout (not drawn to scale)
> + *
> + * NB: Bad Block Marker area splits PKT_N in two (N1, N2).
> + *
> + * +---+-----------------+-------+-----+-----------+-----+----+-------+
> + * | M |      PKT_0      | ECC_0 | ... |     N1    | BBM | N2 | ECC_N |
> + * +---+-----------------+-------+-----+-----------+-----+----+-------+
> + *
> + * Logical page layout:
> + *
> + *       +-----+---+-------+-----+-------+
> + * oob =3D | BBM | M | ECC_0 | ... | ECC_N |
> + *       +-----+---+-------+-----+-------+
> + *
> + *       +-----------------+-----+-----------------+
> + * buf =3D |      PKT_0      | ... |      PKT_N      |
> + *       +-----------------+-----+-----------------+
> + */
> +static int raw_read(struct nand_chip *chip, u8 *buf, u8 *oob)
> +{
> +	u8 *oob_orig =3D oob;
> +	const int page_size =3D chip->mtd.writesize;
> +	const int ecc_size =3D chip->ecc.bytes;
> +	const int pkt_size =3D chip->ecc.size;
> +	int pos =3D 0; /* position within physical page */
> +	int rem =3D page_size; /* bytes remaining until BBM area */
> +
> +	if (oob !=3D NULL)
> +		oob +=3D BBM_SIZE;
> +
> +	aux_read(chip, &oob, METADATA_SIZE, &pos);
> +
> +	while (rem > pkt_size) {
> +		aux_read(chip, &buf, pkt_size, &pos);
> +		aux_read(chip, &oob, ecc_size, &pos);
> +		rem =3D page_size - pos;
> +	}
> +
> +	aux_read(chip, &buf, rem, &pos);
> +	aux_read(chip, &oob_orig, BBM_SIZE, &pos);
> +	aux_read(chip, &buf, pkt_size - rem, &pos);
> +	aux_read(chip, &oob, ecc_size, &pos);
> +
> +	return 0;
> +}
> +
> +static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oo=
b)
> +{
> +	const u8 *oob_orig =3D oob;
> +	const int page_size =3D chip->mtd.writesize;
> +	const int ecc_size =3D chip->ecc.bytes;
> +	const int pkt_size =3D chip->ecc.size;
> +	int pos =3D 0; /* position within physical page */
> +	int rem =3D page_size; /* bytes remaining until BBM area */
> +
> +	if (oob !=3D NULL)
> +		oob +=3D BBM_SIZE;
> +
> +	aux_write(chip, &oob, METADATA_SIZE, &pos);
> +
> +	while (rem > pkt_size) {
> +		aux_write(chip, &buf, pkt_size, &pos);
> +		aux_write(chip, &oob, ecc_size, &pos);
> +		rem =3D page_size - pos;
> +	}
> +
> +	aux_write(chip, &buf, rem, &pos);
> +	aux_write(chip, &oob_orig, BBM_SIZE, &pos);
> +	aux_write(chip, &buf, pkt_size - rem, &pos);
> +	aux_write(chip, &oob, ecc_size, &pos);
> +
> +	return 0;
> +}
> +
> +static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *c=
hip,
> +		uint8_t *buf, int oob_required, int page)
> +{
> +	return raw_read(chip, buf, chip->oob_poi);
> +}
> +
> +static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
> +		const uint8_t *buf, int oob_required, int page)
> +{
> +	return raw_write(chip, buf, chip->oob_poi);
> +}
> +
> +static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip, =
int page)
> +{
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +	return raw_read(chip, NULL, chip->oob_poi);
> +}
> +
> +static int tango_write_oob(struct mtd_info *mtd, struct nand_chip *chip,=
 int page)
> +{
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
> +	raw_write(chip, NULL, chip->oob_poi);
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
> +static int tango_set_timings(struct mtd_info *mtd,
> +		const struct nand_data_interface *conf, bool check_only)
> +{
> +	const struct nand_sdr_timings *sdr =3D nand_get_sdr_timings(conf);
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct tango_nfc *nfc =3D to_tango_nfc(chip->controller);
> +	struct tango_chip *tchip =3D to_tango_chip(chip);
> +	u32 Trdy, Textw, Twc, Twpw, Tacc, Thold, Trpw, Textr;
> +	int kHz =3D nfc->freq_kHz;
> +
> +	if (IS_ERR(sdr))
> +		return PTR_ERR(sdr);
> +
> +	if (check_only)
> +		return 0;
> +
> +	Trdy =3D to_ticks(kHz, sdr->tCEA_max - sdr->tREA_max);
> +	Textw =3D to_ticks(kHz, sdr->tWB_max);
> +	Twc =3D to_ticks(kHz, sdr->tWC_min);
> +	Twpw =3D to_ticks(kHz, sdr->tWC_min - sdr->tWP_min);
> +
> +	Tacc =3D to_ticks(kHz, sdr->tREA_max);
> +	Thold =3D to_ticks(kHz, sdr->tREH_min);
> +	Trpw =3D to_ticks(kHz, sdr->tRC_min - sdr->tREH_min);
> +	Textr =3D to_ticks(kHz, sdr->tRHZ_max);
> +
> +	tchip->timing1 =3D TIMING(Trdy, Textw, Twc, Twpw);
> +	tchip->timing2 =3D TIMING(Tacc, Thold, Trpw, Textr);
> +
> +	return 0;
> +}
> +
> +static int chip_init(struct device *dev, struct device_node *np)
> +{
> +	int err, res;
> +	u32 cs, ecc_bits;
> +	struct mtd_info *mtd;
> +	struct nand_chip *chip;
> +	struct tango_chip *tchip;
> +	struct nand_ecc_ctrl *ecc;
> +	struct tango_nfc *nfc =3D dev_get_drvdata(dev);
> +
> +	tchip =3D devm_kzalloc(dev, sizeof(*tchip), GFP_KERNEL);
> +	if (!tchip)
> +		return -ENOMEM;
> +
> +	res =3D of_property_count_u32_elems(np, "reg");
> +	if (res < 0)
> +		return res;
> +
> +	if (res !=3D 1)
> +		return -ENOTSUPP; /* Multi-CS chips are not supported */
> +
> +	err =3D of_property_read_u32_index(np, "reg", 0, &cs);
> +	if (err)
> +		return err;
> +
> +	if (cs >=3D MAX_CS)
> +		return -EINVAL;
> +
> +	chip =3D &tchip->nand_chip;
> +	ecc =3D &chip->ecc;
> +	mtd =3D &chip->mtd;
> +
> +	chip->read_byte =3D tango_read_byte;
> +	chip->write_buf =3D tango_write_buf;
> +	chip->read_buf =3D tango_read_buf;
> +	chip->select_chip =3D tango_select_chip;
> +	chip->cmd_ctrl =3D tango_cmd_ctrl;
> +	chip->dev_ready =3D tango_dev_ready;
> +	chip->setup_data_interface =3D tango_set_timings;
> +	chip->options =3D 0
> +		| NAND_USE_BOUNCE_BUFFER
> +		| NAND_NO_SUBPAGE_WRITE
> +		| NAND_WAIT_TCCS;

	chip->options =3D NAND_USE_BOUNCE_BUFFER |=C2=A0NAND_NO_SUBPAGE_WRITE |
			NAND_WAIT_TCCS;

> +	chip->controller =3D &nfc->hw;
> +	tchip->base =3D nfc->pbus_base + (cs * 256);
> +
> +	nand_set_flash_node(chip, np);
> +	mtd_set_ooblayout(mtd, &tango_nand_ooblayout_ops);
> +	mtd->dev.parent =3D dev;
> +
> +	ecc->mode =3D NAND_ECC_HW;
> +	ecc->algo =3D NAND_ECC_BCH;

You only support HW ECC, so please put these two line after
nand_scan_ident(). Otherwise, the DT parsing done in nand_base.c might
override the ->mode and ->algo values.

> +
> +	err =3D nand_scan_ident(mtd, 1, NULL);
> +	if (err)
> +		return err;
> +
> +	ecc->read_page_raw =3D tango_read_page_raw;
> +	ecc->write_page_raw =3D tango_write_page_raw;
> +	ecc->read_page =3D tango_read_page;
> +	ecc->write_page =3D tango_write_page;
> +	ecc->read_oob =3D tango_read_oob;
> +	ecc->write_oob =3D tango_write_oob;
> +
> +	ecc_bits =3D ecc->strength * FIELD_ORDER;
> +	ecc->bytes =3D DIV_ROUND_UP(ecc_bits, BITS_PER_BYTE);
> +
> +	err =3D nand_scan_tail(mtd);
> +	if (err)
> +		return err;
> +
> +	tchip->xfer_cfg =3D XFER_CFG(cs, 1, ecc->steps, METADATA_SIZE);
> +	tchip->pkt_0_cfg =3D PKT_CFG(ecc->size + METADATA_SIZE, ecc->strength);
> +	tchip->pkt_n_cfg =3D PKT_CFG(ecc->size, ecc->strength);
> +	tchip->bb_cfg =3D BB_CFG(mtd->writesize, BBM_SIZE);
> +
> +	err =3D mtd_device_register(mtd, NULL, 0);
> +	if (err)
> +		return err;
> +
> +	nfc->chips[cs] =3D tchip;
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
> +
> +	for (cs =3D 0; cs < MAX_CS; ++cs)
> +		if (nfc->chips[cs] !=3D NULL)
> +			nand_release(&nfc->chips[cs]->nand_chip.mtd);

Please add curly braces around the for loop.

> +
> +	return 0;
> +}
> +
> +static int tango_nand_probe(struct platform_device *pdev)
> +{
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
> +	clk =3D clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	nfc->chan =3D dma_request_chan(&pdev->dev, "nfc_sbox");
> +	if (IS_ERR(nfc->chan))
> +		return PTR_ERR(nfc->chan);
> +
> +	platform_set_drvdata(pdev, nfc);
> +	nand_hw_control_init(&nfc->hw);
> +	nfc->freq_kHz =3D clk_get_rate(clk) / 1000;
> +
> +	for_each_child_of_node(pdev->dev.of_node, np) {
> +		int err =3D chip_init(&pdev->dev, np);
> +		if (err) {
> +			tango_nand_remove(pdev);
> +			return err;
> +		}
> +	}
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
