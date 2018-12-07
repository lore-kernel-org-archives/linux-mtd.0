Date: Fri, 7 Dec 2018 10:24:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 <linux-mtd@lists.infradead.org>, Liang Yang <liang.yang@amlogic.com>, Yixun
 Lan <yixun.lan@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu
 <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic
 NAND flash controller
Message-ID: <20181207102456.1dc67e07@xps13>
In-Reply-To: <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
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

Hi Jianxin,

Looks good to me overall, a few comments inline.

Jianxin Pan <jianxin.pan@amlogic.com> wrote on Sat, 17 Nov 2018
00:40:38 +0800:

> From: Liang Yang <liang.yang@amlogic.com>
>=20
> Add initial support for the Amlogic NAND flash controller which found
> in the Meson-GXBB/GXL/AXG SoCs.
>=20
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/mtd/nand/raw/Kconfig      |   10 +
>  drivers/mtd/nand/raw/Makefile     |    1 +
>  drivers/mtd/nand/raw/meson_nand.c | 1417 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 1428 insertions(+)
>  create mode 100644 drivers/mtd/nand/raw/meson_nand.c
>=20
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index c7efc31..223b041 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -541,4 +541,14 @@ config MTD_NAND_TEGRA
>  	  is supported. Extra OOB bytes when using HW ECC are currently
>  	  not supported.
> =20
> +config MTD_NAND_MESON
> +	tristate "Support for NAND controller on Amlogic's Meson SoCs"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on COMMON_CLK_AMLOGIC
> +	select COMMON_CLK_REGMAP_MESON
> +	select MFD_SYSCON
> +	help
> +	  Enables support for NAND controller on Amlogic's Meson SoCs.
> +	  This controller is found on Meson GXBB, GXL, AXG SoCs.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 57159b3..a2cc2fe 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmnand/
>  obj-$(CONFIG_MTD_NAND_QCOM)		+=3D qcom_nandc.o
>  obj-$(CONFIG_MTD_NAND_MTK)		+=3D mtk_ecc.o mtk_nand.o
>  obj-$(CONFIG_MTD_NAND_TEGRA)		+=3D tegra_nand.o
> +obj-$(CONFIG_MTD_NAND_MESON)		+=3D meson_nand.o
> =20
>  nand-objs :=3D nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_=
ids.o
>  nand-objs +=3D nand_onfi.o
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/mes=
on_nand.c
> new file mode 100644
> index 0000000..c566636
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -0,0 +1,1417 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Amlogic Meson Nand Flash Controller Driver
> + *
> + * Copyright (c) 2018 Amlogic, inc.
> + * Author: Liang Yang <liang.yang@amlogic.com>
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/clk.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +
> +#define NFC_REG_CMD		0x00
> +#define NFC_CMD_DRD		(0x8 << 14)
> +#define NFC_CMD_IDLE		(0xc << 14)
> +#define NFC_CMD_DWR		(0x4 << 14)
> +#define NFC_CMD_CLE		(0x5 << 14)
> +#define NFC_CMD_ALE		(0x6 << 14)
> +#define NFC_CMD_ADL		((0 << 16) | (3 << 20))
> +#define NFC_CMD_ADH		((1 << 16) | (3 << 20))
> +#define NFC_CMD_AIL		((2 << 16) | (3 << 20))
> +#define NFC_CMD_AIH		((3 << 16) | (3 << 20))
> +#define NFC_CMD_SEED		((8 << 16) | (3 << 20))
> +#define NFC_CMD_M2N		((0 << 17) | (2 << 20))
> +#define NFC_CMD_N2M		((1 << 17) | (2 << 20))
> +#define NFC_CMD_RB		BIT(20)
> +#define NFC_CMD_IO6		((0xb << 10) | (1 << 18))
> +#define NFC_CMD_SCRAMBLER_ENABLE	BIT(19)
> +#define NFC_CMD_RB_INT		BIT(14)
> +
> +#define NFC_CMD_GET_SIZE(x)	(((x) >> 22) & GENMASK(4, 0))
> +
> +#define NFC_REG_CFG		0x04
> +#define NFC_REG_DADR		0x08
> +#define NFC_REG_IADR		0x0c
> +#define NFC_REG_BUF		0x10
> +#define NFC_REG_INFO		0x14
> +#define NFC_REG_DC		0x18
> +#define NFC_REG_ADR		0x1c
> +#define NFC_REG_DL		0x20
> +#define NFC_REG_DH		0x24
> +#define NFC_REG_CADR		0x28
> +#define NFC_REG_SADR		0x2c
> +#define NFC_REG_PINS		0x30
> +#define NFC_REG_VER		0x38
> +
> +#define NFC_RB_IRQ_EN		BIT(21)
> +#define NFC_INT_MASK		(3 << 20)
> +
> +#define CMDRWGEN(cmd_dir, ran, bch, short_mode, page_size, pages)	\
> +	(								\
> +		(cmd_dir)			|			\
> +		((ran) << 19)			|			\
> +		((bch) << 14)			|			\
> +		((short_mode) << 13)		|			\
> +		(((page_size) & 0x7f) << 6)	|			\
> +		((pages) & 0x3f)					\
> +	)
> +
> +#define GENCMDDADDRL(adl, addr)		((adl) | ((addr) & 0xffff))
> +#define GENCMDDADDRH(adh, addr)		((adh) | (((addr) >> 16) & 0xffff))
> +#define GENCMDIADDRL(ail, addr)		((ail) | ((addr) & 0xffff))
> +#define GENCMDIADDRH(aih, addr)		((aih) | (((addr) >> 16) & 0xffff))
> +
> +#define RB_STA(x)		(1 << (26 + (x)))
> +#define DMA_DIR(dir)		((dir) ? NFC_CMD_N2M : NFC_CMD_M2N)
> +
> +#define ECC_CHECK_RETURN_FF	(-1)
> +
> +#define NAND_CE0		(0xe << 10)
> +#define NAND_CE1		(0xd << 10)
> +
> +#define DMA_BUSY_TIMEOUT	0x100000
> +#define CMD_FIFO_EMPTY_TIMEOUT	1000
> +
> +#define MAX_CE_NUM		2
> +
> +/* eMMC clock register, misc control */
> +#define SD_EMMC_CLOCK		0x00
> +#define CLK_ALWAYS_ON		BIT(28)
> +#define CLK_SELECT_NAND		BIT(31)
> +#define CLK_DIV_MASK		GENMASK(5, 0)
> +
> +#define NFC_CLK_CYCLE		6
> +
> +/* nand flash controller delay 3 ns */
> +#define NFC_DEFAULT_DELAY	3000
> +
> +#define MAX_ECC_INDEX		10
> +
> +#define MUX_CLK_NUM_PARENTS	2
> +
> +#define ROW_ADDER(page, index)	(((page) >> (8 * (index))) & 0xff)
> +#define MAX_CYCLE_ADDRS		5
> +#define DIRREAD			1
> +#define DIRWRITE		0
> +
> +#define ECC_PARITY_BCH8_512B	14
> +
> +#define PER_INFO_BYTE		8
> +
> +#define ECC_COMPLETE            BIT(31)
> +#define ECC_ERR_CNT(x)		(((x) >> 24) & GENMASK(5, 0))
> +#define ECC_ZERO_CNT(x)		(((x) >> 16) & GENMASK(5, 0))
> +
> +struct meson_nfc_nand_chip {
> +	struct list_head node;
> +	struct nand_chip nand;
> +	unsigned long clk_rate;
> +	unsigned long level1_divider;
> +	u32 bus_timing;
> +	u32 twb;
> +	u32 tadl;
> +	u32 tbers_max;
> +
> +	u32 bch_mode;
> +	u8 *data_buf;
> +	__le64 *info_buf;
> +	u32 nsels;
> +	u8 sels[0];
> +};
> +
> +struct meson_nand_ecc {
> +	u32 bch;
> +	u32 strength;
> +};
> +
> +struct meson_nfc_data {
> +	const struct nand_ecc_caps *ecc_caps;
> +};
> +
> +struct meson_nfc_param {
> +	u32 chip_select;
> +	u32 rb_select;
> +};
> +
> +struct nand_rw_cmd {
> +	u32 cmd0;
> +	u32 addrs[MAX_CYCLE_ADDRS];
> +	u32 cmd1;
> +};
> +
> +struct nand_timing {
> +	u32 twb;
> +	u32 tadl;
> +	u32 tbers_max;
> +};
> +
> +struct meson_nfc {
> +	struct nand_controller controller;
> +	struct clk *core_clk;
> +	struct clk *device_clk;
> +	struct clk *phase_tx;
> +	struct clk *phase_rx;
> +
> +	unsigned long clk_rate;
> +	u32 bus_timing;
> +
> +	struct device *dev;
> +	void __iomem *reg_base;
> +	struct regmap *reg_clk;
> +	struct completion completion;
> +	struct list_head chips;
> +	const struct meson_nfc_data *data;
> +	struct meson_nfc_param param;
> +	struct nand_timing timing;
> +	union {
> +		int cmd[32];
> +		struct nand_rw_cmd rw;
> +	} cmdfifo;
> +
> +	dma_addr_t daddr;
> +	dma_addr_t iaddr;
> +
> +	unsigned long assigned_cs;
> +};
> +
> +enum {
> +	NFC_ECC_BCH8_1K		=3D 2,
> +	NFC_ECC_BCH24_1K,
> +	NFC_ECC_BCH30_1K,
> +	NFC_ECC_BCH40_1K,
> +	NFC_ECC_BCH50_1K,
> +	NFC_ECC_BCH60_1K,
> +};
> +
> +#define MESON_ECC_DATA(b, s)	{ .bch =3D (b),	.strength =3D (s)}
> +
> +static int meson_nand_calc_ecc_bytes(int step_size, int strength)
> +{
> +	int ecc_bytes;
> +
> +	if (step_size =3D=3D 512 && strength =3D=3D 8)
> +		return ECC_PARITY_BCH8_512B;
> +
> +	ecc_bytes =3D DIV_ROUND_UP(strength * fls(step_size * 8), 8);
> +	ecc_bytes =3D ALIGN(ecc_bytes, 2);
> +
> +	return ecc_bytes;
> +}
> +
> +NAND_ECC_CAPS_SINGLE(meson_gxl_ecc_caps,
> +		     meson_nand_calc_ecc_bytes, 1024, 8, 24, 30, 40, 50, 60);
> +NAND_ECC_CAPS_SINGLE(meson_axg_ecc_caps,
> +		     meson_nand_calc_ecc_bytes, 1024, 8);
> +
> +static struct meson_nfc_nand_chip *to_meson_nand(struct nand_chip *nand)
> +{
> +	return container_of(nand, struct meson_nfc_nand_chip, nand);
> +}
> +
> +static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	int ret, value;
> +
> +	if (chip < 0 || WARN_ON_ONCE(chip > MAX_CE_NUM))
> +		return;
> +
> +	nfc->param.chip_select =3D meson_chip->sels[chip] ? NAND_CE1 : NAND_CE0;
> +	nfc->param.rb_select =3D nfc->param.chip_select;
> +	nfc->timing.twb =3D meson_chip->twb;
> +	nfc->timing.tadl =3D meson_chip->tadl;
> +	nfc->timing.tbers_max =3D meson_chip->tbers_max;
> +
> +	if (chip >=3D 0) {
> +		if (nfc->clk_rate !=3D meson_chip->clk_rate) {
> +			ret =3D clk_set_rate(nfc->device_clk,
> +					   meson_chip->clk_rate);
> +			if (ret) {
> +				dev_err(nfc->dev, "failed to set clock rate\n");
> +				return;
> +			}
> +			nfc->clk_rate =3D meson_chip->clk_rate;
> +		}
> +		if (nfc->bus_timing !=3D meson_chip->bus_timing) {
> +			value =3D (NFC_CLK_CYCLE - 1)
> +				| (meson_chip->bus_timing << 5);
> +			writel(value, nfc->reg_base + NFC_REG_CFG);
> +			writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
> +			nfc->bus_timing =3D  meson_chip->bus_timing;
> +		}
> +	}

Don't you have timing registers to set?

> +}
> +
> +static void meson_nfc_cmd_idle(struct meson_nfc *nfc, u32 time)
> +{
> +	writel(nfc->param.chip_select | NFC_CMD_IDLE | (time & 0x3ff),
> +	       nfc->reg_base + NFC_REG_CMD);
> +}
> +
> +static void meson_nfc_cmd_seed(struct meson_nfc *nfc, u32 seed)
> +{
> +	writel(NFC_CMD_SEED | (0xc2 + (seed & 0x7fff)),
> +	       nfc->reg_base + NFC_REG_CMD);
> +}
> +
> +static void meson_nfc_cmd_access(struct nand_chip *nand, int raw, bool d=
ir)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	struct meson_nfc *nfc =3D nand_get_controller_data(mtd_to_nand(mtd));
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	u32 bch =3D meson_chip->bch_mode, cmd;
> +	int len =3D mtd->writesize, pagesize, pages;
> +	int scramble =3D (nand->options & NAND_NEED_SCRAMBLING) ? 1 : 0;

There are quite a few places where you use hardcoded values, I would
have preferred preprocessor defines for that. In this case, something
link:


        // naming is just as a reference, use whatever you want
        +#define CMD_SCRAMBLE BIT(19)=20
        [...]
        +int scramble =3D nand->options & NAND_NEED_SCRAMBLING) ? CMD_SCRAM=
BLE : 0;

would be better (you can extend to other places as well).

> +
> +	pagesize =3D nand->ecc.size;
> +
> +	if (raw) {
> +		len =3D mtd->writesize + mtd->oobsize;
> +		cmd =3D (len & 0x3fff) | (scramble << 19) | DMA_DIR(dir);
> +		writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +		return;
> +	}
> +
> +	pages =3D len / nand->ecc.size;
> +
> +	cmd =3D CMDRWGEN(DMA_DIR(dir), scramble, bch, 0, pagesize, pages);
> +
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +}
> +
> +static void meson_nfc_drain_cmd(struct meson_nfc *nfc)
> +{
> +	/*
> +	 * Insert two commands to make sure all valid commands are finished.
> +	 *
> +	 * The Nand flash controller is designed as two stages pipleline -
> +	 *  a) fetch and b) excute.
> +	 * There might be cases when the driver see command queue is empty,
> +	 * but the Nand flash controller still has two commands buffered,
> +	 * one is fetched into NFC request queue (ready to run), and another
> +	 * is actively executing. So pushing 2 "IDLE" commands guarantees that
> +	 * the pipeline is emptied.
> +	 */
> +	meson_nfc_cmd_idle(nfc, 0);
> +	meson_nfc_cmd_idle(nfc, 0);
> +}
> +
> +static int meson_nfc_wait_cmd_finish(struct meson_nfc *nfc,
> +				     unsigned int timeout_ms)
> +{
> +	u32 cmd_size =3D 0;
> +	int ret;
> +
> +	/* wait cmd fifo is empty */
> +	ret =3D readl_relaxed_poll_timeout(nfc->reg_base + NFC_REG_CMD, cmd_siz=
e,
> +					 !NFC_CMD_GET_SIZE(cmd_size),
> +					 10, timeout_ms * 1000);
> +	if (ret)
> +		dev_err(nfc->dev, "wait for empty cmd FIFO time out\n");
> +
> +	return ret;
> +}
> +
> +static int meson_nfc_wait_dma_finish(struct meson_nfc *nfc)
> +{
> +	meson_nfc_drain_cmd(nfc);
> +
> +	return meson_nfc_wait_cmd_finish(nfc, DMA_BUSY_TIMEOUT);
> +}
> +
> +static u8 *meson_nfc_oob_ptr(struct nand_chip *nand, int i)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	int len;
> +
> +	len =3D nand->ecc.size * (i + 1) + (nand->ecc.bytes + 2) * i;
> +
> +	return meson_chip->data_buf + len;
> +}
> +
> +static u8 *meson_nfc_data_ptr(struct nand_chip *nand, int i)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	int len, temp;
> +
> +	temp =3D nand->ecc.size + nand->ecc.bytes;
> +	len =3D (temp + 2) * i;
> +
> +	return meson_chip->data_buf + len;
> +}
> +
> +static void meson_nfc_get_data_oob(struct nand_chip *nand,
> +				   u8 *buf, u8 *oobbuf)
> +{
> +	int i, oob_len =3D 0;
> +	u8 *dsrc, *osrc;
> +
> +	oob_len =3D nand->ecc.bytes + 2;
> +	for (i =3D 0; i < nand->ecc.steps; i++) {
> +		if (buf) {
> +			dsrc =3D meson_nfc_data_ptr(nand, i);
> +			memcpy(buf, dsrc, nand->ecc.size);
> +			buf +=3D nand->ecc.size;
> +		}
> +		osrc =3D meson_nfc_oob_ptr(nand, i);
> +		memcpy(oobbuf, osrc, oob_len);
> +		oobbuf +=3D oob_len;
> +	}
> +}
> +
> +static void meson_nfc_set_data_oob(struct nand_chip *nand,
> +				   const u8 *buf, u8 *oobbuf)
> +{
> +	int i, oob_len =3D 0;
> +	u8 *dsrc, *osrc;
> +
> +	oob_len =3D nand->ecc.bytes + 2;
> +	for (i =3D 0; i < nand->ecc.steps; i++) {
> +		if (buf) {
> +			dsrc =3D meson_nfc_data_ptr(nand, i);
> +			memcpy(dsrc, buf, nand->ecc.size);
> +			buf +=3D nand->ecc.size;
> +		}
> +		osrc =3D meson_nfc_oob_ptr(nand, i);
> +		memcpy(osrc, oobbuf, oob_len);
> +		oobbuf +=3D oob_len;
> +	}
> +}
> +
> +static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
> +{
> +	u32 cmd, cfg;
> +	int ret =3D 0;
> +
> +	meson_nfc_cmd_idle(nfc, nfc->timing.twb);
> +	meson_nfc_drain_cmd(nfc);
> +	meson_nfc_wait_cmd_finish(nfc, CMD_FIFO_EMPTY_TIMEOUT);
> +
> +	cfg =3D readl(nfc->reg_base + NFC_REG_CFG);
> +	cfg |=3D (1 << 21);
> +	writel(cfg, nfc->reg_base + NFC_REG_CFG);
> +
> +	init_completion(&nfc->completion);
> +
> +	/* use the max erase time as the maximum clock for waiting R/B */
> +	cmd =3D NFC_CMD_RB | NFC_CMD_RB_INT
> +		| nfc->param.chip_select | nfc->timing.tbers_max;

Nit: I think the '|' should be on the previous line.

> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +
> +	ret =3D wait_for_completion_timeout(&nfc->completion,
> +					  msecs_to_jiffies(timeout_ms));
> +	if (ret =3D=3D 0)
> +		ret =3D -1;
> +
> +	return ret;
> +}
> +
> +static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	__le64 *info;
> +	int i, count;
> +
> +	for (i =3D 0, count =3D 0; i < nand->ecc.steps; i++, count +=3D 2) {
> +		info =3D &meson_chip->info_buf[i];
> +		*info |=3D oob_buf[count];
> +		*info |=3D oob_buf[count + 1] << 8;
> +	}
> +}
> +
> +static void meson_nfc_get_user_byte(struct nand_chip *nand, u8 *oob_buf)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	__le64 *info;
> +	int i, count;
> +
> +	for (i =3D 0, count =3D 0; i < nand->ecc.steps; i++, count +=3D 2) {
> +		info =3D &meson_chip->info_buf[i];
> +		oob_buf[count] =3D *info;
> +		oob_buf[count + 1] =3D *info >> 8;
> +	}
> +}
> +
> +static int meson_nfc_ecc_correct(struct nand_chip *nand)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	__le64 *info;
> +	u32 bitflips =3D 0, i;
> +	int scramble;
> +	u8 zero_cnt;
> +
> +	scramble =3D (nand->options & NAND_NEED_SCRAMBLING) ? 1 : 0;
> +
> +	for (i =3D 0; i < nand->ecc.steps; i++) {
> +		info =3D &meson_chip->info_buf[i];
> +		if (ECC_ERR_CNT(*info) =3D=3D 0x3f) {
> +			zero_cnt =3D ECC_ZERO_CNT(*info);
> +			if (scramble && zero_cnt < nand->ecc.strength)
> +				return ECC_CHECK_RETURN_FF;

This and what you do later with ECC_CHECK_RETURN_FF is pretty unclear
to me.

> +			mtd->ecc_stats.failed++;
> +			continue;
> +		}
> +		mtd->ecc_stats.corrected +=3D ECC_ERR_CNT(*info);
> +		bitflips =3D max_t(u32, bitflips, ECC_ERR_CNT(*info));
> +	}

Are you sure you handle correctly empty pages with bf?

> +
> +	return bitflips;
> +}
> +
> +static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, u8 *databu=
f,
> +				      int datalen, u8 *infobuf, int infolen,
> +				      enum dma_data_direction dir)
> +{
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	u32 cmd;
> +	int ret =3D 0;
> +
> +	nfc->daddr =3D dma_map_single(nfc->dev, (void *)databuf, datalen, dir);
> +	ret =3D dma_mapping_error(nfc->dev, nfc->daddr);
> +	if (ret) {
> +		dev_err(nfc->dev, "dma mapping error\n");
> +		return ret;
> +	}
> +	cmd =3D GENCMDDADDRL(NFC_CMD_ADL, nfc->daddr);
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +
> +	cmd =3D GENCMDDADDRH(NFC_CMD_ADH, nfc->daddr);
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +
> +	if (infobuf) {
> +		nfc->iaddr =3D dma_map_single(nfc->dev, infobuf, infolen, dir);
> +		ret =3D dma_mapping_error(nfc->dev, nfc->iaddr);
> +		if (ret) {
> +			dev_err(nfc->dev, "dma mapping error\n");
> +			dma_unmap_single(nfc->dev,
> +					 nfc->daddr, datalen, dir);
> +			return ret;
> +		}
> +		cmd =3D GENCMDIADDRL(NFC_CMD_AIL, nfc->iaddr);
> +		writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +
> +		cmd =3D GENCMDIADDRH(NFC_CMD_AIH, nfc->iaddr);
> +		writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +	}
> +
> +	return ret;
> +}
> +
> +static void meson_nfc_dma_buffer_release(struct nand_chip *nand,
> +					 int infolen, int datalen,
> +					 enum dma_data_direction dir)
> +{
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +
> +	dma_unmap_single(nfc->dev, nfc->daddr, datalen, dir);
> +	if (infolen)
> +		dma_unmap_single(nfc->dev, nfc->iaddr, infolen, dir);
> +}
> +
> +static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
> +{
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	int ret =3D 0;
> +	u32 cmd;
> +	u8 *info;
> +
> +	info =3D kzalloc(PER_INFO_BYTE, GFP_KERNEL);
> +	ret =3D meson_nfc_dma_buffer_setup(nand, buf, len, info,
> +					 PER_INFO_BYTE, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	cmd =3D NFC_CMD_N2M | (len & 0x3fff);
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +
> +	meson_nfc_drain_cmd(nfc);
> +	meson_nfc_wait_cmd_finish(nfc, 1000);
> +	meson_nfc_dma_buffer_release(nand, len, PER_INFO_BYTE, DMA_FROM_DEVICE);
> +	kfree(info);
> +
> +	return ret;
> +}
> +
> +static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
> +{
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	int ret =3D 0;
> +	u32 cmd;
> +
> +	ret =3D meson_nfc_dma_buffer_setup(nand, buf, len, NULL,
> +					 0, DMA_TO_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	cmd =3D NFC_CMD_M2N | (len & 0x3fff);
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +
> +	meson_nfc_drain_cmd(nfc);
> +	meson_nfc_wait_cmd_finish(nfc, 1000);
> +	meson_nfc_dma_buffer_release(nand, len, 0, DMA_TO_DEVICE);
> +
> +	return ret;
> +}
> +
> +static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
> +						int page, bool in)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	const struct nand_sdr_timings *sdr =3D
> +		nand_get_sdr_timings(&nand->data_interface);
> +	u32 *addrs =3D nfc->cmdfifo.rw.addrs;
> +	u32 cs =3D nfc->param.chip_select;
> +	u32 cmd0, cmd_num, row_start;
> +	int ret =3D 0, i;
> +
> +	cmd_num =3D sizeof(struct nand_rw_cmd) / sizeof(int);
> +
> +	cmd0 =3D in ? NAND_CMD_READ0 : NAND_CMD_SEQIN;
> +	nfc->cmdfifo.rw.cmd0 =3D cs | NFC_CMD_CLE | cmd0;
> +
> +	addrs[0] =3D cs | NFC_CMD_ALE | 0;
> +	if (mtd->writesize <=3D 512) {
> +		cmd_num--;
> +		row_start =3D 1;
> +	} else {
> +		addrs[1] =3D cs | NFC_CMD_ALE | 0;
> +		row_start =3D 2;
> +	}
> +
> +	addrs[row_start] =3D cs | NFC_CMD_ALE | ROW_ADDER(page, 0);
> +	addrs[row_start + 1] =3D cs | NFC_CMD_ALE | ROW_ADDER(page, 1);
> +
> +	if (nand->options & NAND_ROW_ADDR_3)
> +		addrs[row_start + 2] =3D
> +			cs | NFC_CMD_ALE | ROW_ADDER(page, 2);
> +	else
> +		cmd_num--;
> +
> +	/* subtract cmd1 */
> +	cmd_num--;
> +
> +	for (i =3D 0; i < cmd_num; i++)
> +		writel_relaxed(nfc->cmdfifo.cmd[i],
> +			       nfc->reg_base + NFC_REG_CMD);
> +
> +	if (in) {
> +		nfc->cmdfifo.rw.cmd1 =3D cs | NFC_CMD_CLE | NAND_CMD_READSTART;
> +		writel(nfc->cmdfifo.rw.cmd1, nfc->reg_base + NFC_REG_CMD);
> +		meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tR_max));
> +	} else {
> +		meson_nfc_cmd_idle(nfc, nfc->timing.tadl);
> +	}
> +
> +	return ret;
> +}
> +
> +static int meson_nfc_write_page_sub(struct nand_chip *nand,
> +				    int page, int raw)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	const struct nand_sdr_timings *sdr =3D
> +		nand_get_sdr_timings(&nand->data_interface);
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	int data_len, info_len;
> +	u32 cmd;
> +	int ret;
> +
> +	data_len =3D  mtd->writesize + mtd->oobsize;
> +	info_len =3D nand->ecc.steps * PER_INFO_BYTE;
> +
> +	ret =3D meson_nfc_rw_cmd_prepare_and_execute(nand, page, DIRWRITE);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
> +					 data_len, (u8 *)meson_chip->info_buf,
> +					 info_len, DMA_TO_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	meson_nfc_cmd_seed(nfc, page);
> +	meson_nfc_cmd_access(nand, raw, DIRWRITE);
> +	cmd =3D nfc->param.chip_select | NFC_CMD_CLE | NAND_CMD_PAGEPROG;
> +	writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +	meson_nfc_queue_rb(nfc, PSEC_TO_MSEC(sdr->tPROG_max));
> +
> +	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_TO_DEVICE);
> +
> +	return ret;
> +}
> +
> +static int meson_nfc_write_page_raw(struct nand_chip *nand, const u8 *bu=
f,
> +				    int oob_required, int page)
> +{
> +	u8 *oob_buf =3D nand->oob_poi;
> +
> +	meson_nfc_set_data_oob(nand, buf, oob_buf);
> +
> +	return meson_nfc_write_page_sub(nand, page, 1);
> +}
> +
> +static int meson_nfc_write_page_hwecc(struct nand_chip *nand,
> +				      const u8 *buf, int oob_required, int page)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	u8 *oob_buf =3D nand->oob_poi;
> +
> +	memcpy(meson_chip->data_buf, buf, mtd->writesize);
> +	memset(meson_chip->info_buf, 0, nand->ecc.steps * PER_INFO_BYTE);
> +	meson_nfc_set_user_byte(nand, oob_buf);
> +
> +	return meson_nfc_write_page_sub(nand, page, 0);
> +}
> +
> +static void meson_nfc_check_ecc_pages_valid(struct meson_nfc *nfc,
> +					    struct nand_chip *nand, int raw)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	__le64 *info;
> +	u32 neccpages;
> +	int ret;
> +
> +	neccpages =3D raw ? 1 : nand->ecc.steps;
> +	info =3D &meson_chip->info_buf[neccpages - 1];
> +	do {
> +		usleep_range(10, 15);
> +		/* info is updated by nfc dma engine*/
> +		smp_rmb();
> +		ret =3D *info & ECC_COMPLETE;
> +	} while (!ret);
> +}
> +
> +static int meson_nfc_read_page_sub(struct nand_chip *nand,
> +				   int page, int raw)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	int data_len, info_len;
> +	int ret;
> +
> +	data_len =3D  mtd->writesize + mtd->oobsize;
> +	info_len =3D nand->ecc.steps * PER_INFO_BYTE;
> +
> +	ret =3D meson_nfc_rw_cmd_prepare_and_execute(nand, page, DIRREAD);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D meson_nfc_dma_buffer_setup(nand, meson_chip->data_buf,
> +					 data_len, (u8 *)meson_chip->info_buf,
> +					 info_len, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	meson_nfc_cmd_seed(nfc, page);
> +	meson_nfc_cmd_access(nand, raw, DIRREAD);
> +	ret =3D meson_nfc_wait_dma_finish(nfc);
> +	meson_nfc_check_ecc_pages_valid(nfc, nand, raw);
> +
> +	meson_nfc_dma_buffer_release(nand, data_len, info_len, DMA_FROM_DEVICE);
> +
> +	return ret;
> +}
> +
> +static int meson_nfc_read_page_raw(struct nand_chip *nand, u8 *buf,
> +				   int oob_required, int page)
> +{
> +	u8 *oob_buf =3D nand->oob_poi;
> +	int ret;
> +
> +	ret =3D meson_nfc_read_page_sub(nand, page, 1);
> +	if (ret)
> +		return ret;
> +
> +	meson_nfc_get_data_oob(nand, buf, oob_buf);
> +
> +	return 0;
> +}
> +
> +static int meson_nfc_read_page_hwecc(struct nand_chip *nand, u8 *buf,
> +				     int oob_required, int page)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	u8 *oob_buf =3D nand->oob_poi;
> +	int ret;
> +
> +	ret =3D meson_nfc_read_page_sub(nand, page, 0);
> +	if (ret)
> +		return ret;
> +
> +	meson_nfc_get_user_byte(nand, oob_buf);
> +
> +	ret =3D meson_nfc_ecc_correct(nand);
> +	if (ret =3D=3D ECC_CHECK_RETURN_FF) {
> +		if (buf)
> +			memset(buf, 0xff, mtd->writesize);
> +
> +		memset(oob_buf, 0xff, mtd->oobsize);
> +		return 0;
> +	}
> +
> +	if (buf && buf !=3D meson_chip->data_buf)
> +		memcpy(buf, meson_chip->data_buf, mtd->writesize);
> +
> +	return ret;
> +}
> +
> +static int meson_nfc_read_oob_raw(struct nand_chip *nand, int page)
> +{
> +	return meson_nfc_read_page_raw(nand, NULL, 1, page);
> +}
> +
> +static int meson_nfc_read_oob(struct nand_chip *nand, int page)
> +{
> +	return meson_nfc_read_page_hwecc(nand, NULL, 1, page);
> +}
> +
> +void *
> +meson_nand_op_get_dma_safe_input_buf(const struct nand_op_instr *instr)
> +{
> +	if (WARN_ON(instr->type !=3D NAND_OP_DATA_IN_INSTR))
> +		return NULL;
> +	if (virt_addr_valid(instr->ctx.data.buf.in) &&
> +	    !object_is_on_stack(instr->ctx.data.buf.in))
> +		return instr->ctx.data.buf.in;
> +
> +	return kzalloc(instr->ctx.data.len, GFP_KERNEL);

I think allocating memory and using it without ever testing the
allocation succeeded is wrong. You do that in many places. I would like
to see allocations properly handled.

> +}
> +
> +void
> +meson_nand_op_put_dma_safe_input_buf(const struct nand_op_instr *instr,
> +				     void *buf)
> +{
> +	if (WARN_ON(instr->type !=3D NAND_OP_DATA_IN_INSTR) ||
> +	    WARN_ON(!buf))
> +		return;
> +	if (buf =3D=3D instr->ctx.data.buf.in)
> +		return;
> +
> +	memcpy(instr->ctx.data.buf.in, buf, instr->ctx.data.len);
> +	kfree(buf);
> +}
> +
> +const void *
> +meson_nand_op_get_dma_safe_output_buf(const struct nand_op_instr *instr)
> +{
> +	if (WARN_ON(instr->type !=3D NAND_OP_DATA_OUT_INSTR))
> +		return NULL;
> +
> +	if (virt_addr_valid(instr->ctx.data.buf.out) &&
> +	    !object_is_on_stack(instr->ctx.data.buf.out))

Can you please create helpers for that? I guess it will help removing
these checks once the core will have a DMA-safe approach.

> +		return instr->ctx.data.buf.out;
> +
> +	return kmemdup(instr->ctx.data.buf.out,
> +		       instr->ctx.data.len, GFP_KERNEL);
> +}
> +
> +void
> +meson_nand_op_put_dma_safe_output_buf(const struct nand_op_instr *instr,
> +				      const void *buf)
> +{
> +	if (WARN_ON(instr->type !=3D NAND_OP_DATA_OUT_INSTR) ||
> +	    WARN_ON(!buf))
> +		return;
> +
> +	if (buf !=3D instr->ctx.data.buf.out)
> +		kfree(buf);
> +}
> +
> +static int meson_nfc_exec_op(struct nand_chip *nand,
> +			     const struct nand_operation *op, bool check_only)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	const struct nand_op_instr *instr =3D NULL;
> +	void *buf;
> +	u32 op_id, delay_idle, cmd;
> +	int i;
> +
> +	for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
> +		instr =3D &op->instrs[op_id];
> +		delay_idle =3D DIV_ROUND_UP(PSEC_TO_NSEC(instr->delay_ns),
> +					  meson_chip->level1_divider *
> +					  NFC_CLK_CYCLE);
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			cmd =3D nfc->param.chip_select | NFC_CMD_CLE;
> +			cmd |=3D instr->ctx.cmd.opcode & 0xff;
> +			writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +			meson_nfc_cmd_idle(nfc, delay_idle);
> +			break;
> +
> +		case NAND_OP_ADDR_INSTR:
> +			for (i =3D 0; i < instr->ctx.addr.naddrs; i++) {
> +				cmd =3D nfc->param.chip_select | NFC_CMD_ALE;
> +				cmd |=3D instr->ctx.addr.addrs[i] & 0xff;
> +				writel(cmd, nfc->reg_base + NFC_REG_CMD);
> +			}
> +			meson_nfc_cmd_idle(nfc, delay_idle);
> +			break;
> +
> +		case NAND_OP_DATA_IN_INSTR:
> +			buf =3D meson_nand_op_get_dma_safe_input_buf(instr);
> +			meson_nfc_read_buf(nand, buf,
> +					   instr->ctx.data.len);
> +			meson_nand_op_put_dma_safe_input_buf(instr, buf);
> +			break;
> +
> +		case NAND_OP_DATA_OUT_INSTR:
> +			buf =3D
> +			(void *)meson_nand_op_get_dma_safe_output_buf(instr);
> +			meson_nfc_write_buf(nand, buf,
> +					    instr->ctx.data.len);
> +			meson_nand_op_put_dma_safe_output_buf(instr, buf);
> +			break;
> +
> +		case NAND_OP_WAITRDY_INSTR:
> +			meson_nfc_queue_rb(nfc, instr->ctx.waitrdy.timeout_ms);
> +			if (instr->delay_ns)
> +				meson_nfc_cmd_idle(nfc, delay_idle);
> +			break;
> +		}
> +	}
> +	meson_nfc_wait_cmd_finish(nfc, 1000);
> +	return 0;
> +}
> +
> +static int meson_ooblayout_ecc(struct mtd_info *mtd, int section,
> +			       struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *nand =3D mtd_to_nand(mtd);
> +
> +	if (section >=3D nand->ecc.steps)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D  2 + (section * (2 + nand->ecc.bytes));
> +	oobregion->length =3D nand->ecc.bytes;
> +
> +	return 0;
> +}
> +
> +static int meson_ooblayout_free(struct mtd_info *mtd, int section,
> +				struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *nand =3D mtd_to_nand(mtd);
> +
> +	if (section >=3D nand->ecc.steps)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D section * (2 + nand->ecc.bytes);
> +	oobregion->length =3D 2;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops meson_ooblayout_ops =3D {
> +	.ecc =3D meson_ooblayout_ecc,
> +	.free =3D meson_ooblayout_free,
> +};
> +
> +static int meson_nfc_clk_init(struct meson_nfc *nfc)
> +{
> +	int ret;
> +
> +	/* request core clock */
> +	nfc->core_clk =3D devm_clk_get(nfc->dev, "core");
> +	if (IS_ERR(nfc->core_clk)) {
> +		dev_err(nfc->dev, "failed to get core clk\n");
> +		return PTR_ERR(nfc->core_clk);
> +	}
> +
> +	nfc->device_clk =3D devm_clk_get(nfc->dev, "device");
> +	if (IS_ERR(nfc->device_clk)) {
> +		dev_err(nfc->dev, "failed to get device clk\n");
> +		return PTR_ERR(nfc->device_clk);
> +	}
> +
> +	nfc->phase_tx =3D devm_clk_get(nfc->dev, "tx");
> +	if (IS_ERR(nfc->phase_tx)) {
> +		dev_err(nfc->dev, "failed to get tx clk\n");
> +		return PTR_ERR(nfc->phase_tx);
> +	}
> +
> +	nfc->phase_rx =3D devm_clk_get(nfc->dev, "rx");
> +	if (IS_ERR(nfc->phase_rx)) {
> +		dev_err(nfc->dev, "failed to get rx clk\n");
> +		return PTR_ERR(nfc->phase_rx);
> +	}
> +
> +	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
> +	regmap_update_bits(nfc->reg_clk,
> +			   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
> +
> +	ret =3D clk_prepare_enable(nfc->core_clk);
> +	if (ret) {
> +		dev_err(nfc->dev, "failed to enable core clk\n");
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(nfc->device_clk);
> +	if (ret) {
> +		dev_err(nfc->dev, "failed to enable device clk\n");
> +		clk_disable_unprepare(nfc->core_clk);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(nfc->phase_tx);
> +	if (ret) {
> +		dev_err(nfc->dev, "failed to enable tx clk\n");
> +		clk_disable_unprepare(nfc->core_clk);
> +		clk_disable_unprepare(nfc->device_clk);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(nfc->phase_rx);
> +	if (ret) {
> +		dev_err(nfc->dev, "failed to enable rx clk\n");
> +		clk_disable_unprepare(nfc->core_clk);
> +		clk_disable_unprepare(nfc->device_clk);
> +		clk_disable_unprepare(nfc->phase_tx);

This error case is a good candidate to a goto statement.

> +		return ret;
> +	}
> +
> +	ret =3D clk_set_rate(nfc->device_clk, 24000000);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void meson_nfc_disable_clk(struct meson_nfc *nfc)
> +{
> +	clk_disable_unprepare(nfc->phase_rx);
> +	clk_disable_unprepare(nfc->phase_tx);
> +	clk_disable_unprepare(nfc->device_clk);
> +	clk_disable_unprepare(nfc->core_clk);
> +}
> +
> +static void meson_nfc_free_buffer(struct nand_chip *nand)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +
> +	kfree(meson_chip->info_buf);
> +	kfree(meson_chip->data_buf);
> +}
> +
> +static int meson_chip_buffer_init(struct nand_chip *nand)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	u32 page_bytes, info_bytes, nsectors;
> +
> +	nsectors =3D mtd->writesize / nand->ecc.size;
> +
> +	page_bytes =3D  mtd->writesize + mtd->oobsize;
> +	info_bytes =3D nsectors * PER_INFO_BYTE;
> +
> +	meson_chip->data_buf =3D kmalloc(page_bytes, GFP_KERNEL);
> +	if (!meson_chip->data_buf)
> +		return -ENOMEM;
> +
> +	meson_chip->info_buf =3D kmalloc(info_bytes, GFP_KERNEL);
> +	if (!meson_chip->info_buf) {
> +		kfree(meson_chip->data_buf);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static
> +int meson_nfc_setup_data_interface(struct nand_chip *nand, int csline,
> +				   const struct nand_data_interface *conf)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	const struct nand_sdr_timings *timings;
> +	u32 div, bt_min, bt_max, tbers_clocks;
> +
> +	timings =3D nand_get_sdr_timings(conf);
> +	if (IS_ERR(timings))
> +		return -ENOTSUPP;
> +
> +	if (csline =3D=3D NAND_DATA_IFACE_CHECK_ONLY)
> +		return 0;
> +
> +	div =3D DIV_ROUND_UP((timings->tRC_min / 1000), NFC_CLK_CYCLE);
> +	bt_min =3D (timings->tREA_max + NFC_DEFAULT_DELAY) / div;
> +	bt_max =3D (NFC_DEFAULT_DELAY + timings->tRHOH_min +
> +		  timings->tRC_min / 2) / div;
> +
> +	meson_chip->twb =3D DIV_ROUND_UP(PSEC_TO_NSEC(timings->tWB_max),
> +				       div * NFC_CLK_CYCLE);
> +	meson_chip->tadl =3D DIV_ROUND_UP(PSEC_TO_NSEC(timings->tADL_min),
> +					div * NFC_CLK_CYCLE);
> +	tbers_clocks =3D DIV_ROUND_UP(PSEC_TO_NSEC(timings->tBERS_max),
> +				    div * NFC_CLK_CYCLE);
> +	meson_chip->tbers_max =3D ilog2(tbers_clocks);
> +	if (!is_power_of_2(tbers_clocks))
> +		meson_chip->tbers_max++;
> +
> +	bt_min =3D DIV_ROUND_UP(bt_min, 1000);
> +	bt_max =3D DIV_ROUND_UP(bt_max, 1000);
> +
> +	if (bt_max < bt_min)
> +		return -EINVAL;
> +
> +	meson_chip->level1_divider =3D div;
> +	meson_chip->clk_rate =3D 1000000000 / meson_chip->level1_divider;
> +	meson_chip->bus_timing =3D (bt_min + bt_max) / 2 + 1;
> +
> +	return 0;
> +}
> +
> +static int meson_nand_bch_mode(struct nand_chip *nand)
> +{
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	struct meson_nand_ecc meson_ecc[] =3D {
> +		MESON_ECC_DATA(NFC_ECC_BCH8_1K, 8),
> +		MESON_ECC_DATA(NFC_ECC_BCH24_1K, 24),
> +		MESON_ECC_DATA(NFC_ECC_BCH30_1K, 30),
> +		MESON_ECC_DATA(NFC_ECC_BCH40_1K, 40),
> +		MESON_ECC_DATA(NFC_ECC_BCH50_1K, 50),
> +		MESON_ECC_DATA(NFC_ECC_BCH60_1K, 60),
> +	};

Maybe this array could be static?

> +	int i;
> +
> +	if (nand->ecc.strength > 60 || nand->ecc.strength < 8)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < sizeof(meson_ecc); i++) {
> +		if (meson_ecc[i].strength =3D=3D nand->ecc.strength) {
> +			meson_chip->bch_mode =3D meson_ecc[i].bch;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int meson_nand_attach_chip(struct nand_chip *nand)
> +{
> +	struct meson_nfc *nfc =3D nand_get_controller_data(nand);
> +	struct meson_nfc_nand_chip *meson_chip =3D to_meson_nand(nand);
> +	struct mtd_info *mtd =3D nand_to_mtd(nand);
> +	int nsectors =3D mtd->writesize / 1024;
> +	int ret;
> +
> +	if (!mtd->name) {
> +		mtd->name =3D devm_kasprintf(nfc->dev, GFP_KERNEL,
> +					   "%s:nand%d",
> +					   dev_name(nfc->dev),
> +					   meson_chip->sels[0]);
> +		if (!mtd->name)
> +			return -ENOMEM;
> +	}
> +
> +	if (nand->bbt_options & NAND_BBT_USE_FLASH)
> +		nand->bbt_options |=3D NAND_BBT_NO_OOB;
> +
> +	nand->options |=3D NAND_NO_SUBPAGE_WRITE;
> +
> +	ret =3D nand_ecc_choose_conf(nand, nfc->data->ecc_caps,
> +				   mtd->oobsize - 2 * nsectors);
> +	if (ret) {
> +		dev_err(nfc->dev, "failed to ecc init\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D meson_nand_bch_mode(nand);
> +	if (ret)
> +		return -EINVAL;
> +
> +	nand->ecc.mode =3D NAND_ECC_HW;
> +	nand->ecc.write_page_raw =3D meson_nfc_write_page_raw;
> +	nand->ecc.write_page =3D meson_nfc_write_page_hwecc;
> +	nand->ecc.write_oob_raw =3D nand_write_oob_std;
> +	nand->ecc.write_oob =3D nand_write_oob_std;
> +
> +	nand->ecc.read_page_raw =3D meson_nfc_read_page_raw;
> +	nand->ecc.read_page =3D meson_nfc_read_page_hwecc;
> +	nand->ecc.read_oob_raw =3D meson_nfc_read_oob_raw;
> +	nand->ecc.read_oob =3D meson_nfc_read_oob;
> +
> +	if (nand->options & NAND_BUSWIDTH_16) {
> +		dev_err(nfc->dev, "16bits buswidth not supported");
> +		return -EINVAL;
> +	}
> +	meson_chip_buffer_init(nand);
> +	if (ret)
> +		return -ENOMEM;
> +
> +	return ret;
> +}
> +
> +static const struct nand_controller_ops meson_nand_controller_ops =3D {
> +	.attach_chip =3D meson_nand_attach_chip,

Don't you need a ->detach_chip hook to free data_buf/info_buf
buffers?

> +};
> +
> +static int
> +meson_nfc_nand_chip_init(struct device *dev,
> +			 struct meson_nfc *nfc, struct device_node *np)
> +{
> +	struct meson_nfc_nand_chip *meson_chip;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	int ret, i;
> +	u32 tmp, nsels;
> +
> +	if (!of_get_property(np, "reg", &nsels))
> +		return -EINVAL;
> +
> +	nsels /=3D sizeof(u32);
> +	if (!nsels || nsels > MAX_CE_NUM) {
> +		dev_err(dev, "invalid reg property size\n");
> +		return -EINVAL;
> +	}
> +
> +	meson_chip =3D devm_kzalloc(dev,
> +				  sizeof(*meson_chip) + (nsels * sizeof(u8)),
> +				  GFP_KERNEL);
> +	if (!meson_chip)
> +		return -ENOMEM;
> +
> +	meson_chip->nsels =3D nsels;
> +
> +	for (i =3D 0; i < nsels; i++) {
> +		ret =3D of_property_read_u32_index(np, "reg", i, &tmp);
> +		if (ret) {
> +			dev_err(dev, "could not retrieve reg property: %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
> +			dev_err(dev, "CS %d already assigned\n", tmp);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	nand =3D &meson_chip->nand;
> +	nand->controller =3D &nfc->controller;
> +	nand->controller->ops =3D &meson_nand_controller_ops;
> +	nand_set_flash_node(nand, np);
> +	nand_set_controller_data(nand, nfc);
> +
> +	nand->options |=3D NAND_USE_BOUNCE_BUFFER;
> +	nand->select_chip =3D meson_nfc_select_chip;
> +	nand->exec_op =3D meson_nfc_exec_op;
> +	nand->setup_data_interface =3D meson_nfc_setup_data_interface;
> +	mtd =3D nand_to_mtd(nand);
> +	mtd->owner =3D THIS_MODULE;
> +	mtd->dev.parent =3D dev;
> +
> +	ret =3D nand_scan(nand, nsels);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to register mtd device: %d\n", ret);
> +		nand_cleanup(nand);
> +		return ret;
> +	}
> +
> +	list_add_tail(&meson_chip->node, &nfc->chips);
> +
> +	return 0;
> +}
> +
> +static int meson_nfc_nand_chip_cleanup(struct meson_nfc *nfc)
> +{
> +	struct meson_nfc_nand_chip *meson_chip;
> +	struct mtd_info *mtd;
> +	int ret;
> +
> +	while (!list_empty(&nfc->chips)) {
> +		meson_chip =3D list_first_entry(&nfc->chips,
> +					      struct meson_nfc_nand_chip, node);
> +		mtd =3D nand_to_mtd(&meson_chip->nand);
> +		ret =3D mtd_device_unregister(mtd);
> +		if (ret)
> +			return ret;
> +
> +		meson_nfc_free_buffer(&meson_chip->nand);
> +		nand_cleanup(&meson_chip->nand);
> +		list_del(&meson_chip->node);
> +	}
> +
> +	return 0;
> +}
> +
> +static int meson_nfc_nand_chips_init(struct device *dev,
> +				     struct meson_nfc *nfc)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *nand_np;
> +	int ret;
> +
> +	for_each_child_of_node(np, nand_np) {
> +		ret =3D meson_nfc_nand_chip_init(dev, nfc, nand_np);
> +		if (ret) {
> +			meson_nfc_nand_chip_cleanup(nfc);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t meson_nfc_irq(int irq, void *id)
> +{
> +	struct meson_nfc *nfc =3D id;
> +	u32 cfg;
> +
> +	cfg =3D readl(nfc->reg_base + NFC_REG_CFG);
> +	if (!(cfg & NFC_RB_IRQ_EN))
> +		return IRQ_NONE;
> +
> +	cfg &=3D ~(NFC_RB_IRQ_EN);
> +	writel(cfg, nfc->reg_base + NFC_REG_CFG);
> +
> +	complete(&nfc->completion);
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct meson_nfc_data meson_gxl_data =3D {
> +	.ecc_caps =3D &meson_gxl_ecc_caps,
> +};
> +
> +static const struct meson_nfc_data meson_axg_data =3D {
> +	.ecc_caps =3D &meson_axg_ecc_caps,
> +};
> +
> +static const struct of_device_id meson_nfc_id_table[] =3D {
> +	{
> +		.compatible =3D "amlogic,meson-gxl-nfc",
> +		.data =3D &meson_gxl_data,
> +	}, {
> +		.compatible =3D "amlogic,meson-axg-nfc",
> +		.data =3D &meson_axg_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
> +
> +static int meson_nfc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct meson_nfc *nfc;
> +	struct resource *res;
> +	int ret, irq;
> +
> +	nfc =3D devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	nfc->data =3D of_device_get_match_data(&pdev->dev);
> +	if (!nfc->data)
> +		return -ENODEV;
> +
> +	nand_controller_init(&nfc->controller);
> +	INIT_LIST_HEAD(&nfc->chips);
> +
> +	nfc->dev =3D dev;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nfc->reg_base =3D devm_ioremap_resource(dev, res);
> +	if (IS_ERR(nfc->reg_base))
> +		return PTR_ERR(nfc->reg_base);
> +
> +	nfc->reg_clk =3D
> +		syscon_regmap_lookup_by_phandle(dev->of_node,
> +						"amlogic,mmc-syscon");
> +	if (IS_ERR(nfc->reg_clk)) {
> +		dev_err(dev, "Failed to lookup clock base\n");
> +		return PTR_ERR(nfc->reg_clk);
> +	}
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "no nfi irq resource\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D meson_nfc_clk_init(nfc);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize nand clk\n");
> +		goto err;

Useless goto, a return would be enough.

> +	}
> +
> +	writel(0, nfc->reg_base + NFC_REG_CFG);
> +	ret =3D devm_request_irq(dev, irq, meson_nfc_irq, 0, dev_name(dev), nfc=
);
> +	if (ret) {
> +		dev_err(dev, "failed to request nfi irq\n");
> +		ret =3D -EINVAL;
> +		goto err_clk;
> +	}
> +
> +	ret =3D dma_set_mask(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(dev, "failed to set dma mask\n");

Nit: I prefer when acronyms are upper case in plain English (DMA, NAND,
IRQ, etc).

> +		goto err_clk;
> +	}
> +
> +	platform_set_drvdata(pdev, nfc);
> +
> +	ret =3D meson_nfc_nand_chips_init(dev, nfc);
> +	if (ret) {
> +		dev_err(dev, "failed to init nand chips\n");
> +		goto err_clk;
> +	}
> +
> +	return 0;
> +
> +err_clk:
> +	meson_nfc_disable_clk(nfc);
> +err:

This goto can be removed.

> +	return ret;
> +}
> +
> +static int meson_nfc_remove(struct platform_device *pdev)
> +{
> +	struct meson_nfc *nfc =3D platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret =3D meson_nfc_nand_chip_cleanup(nfc);
> +	if (ret)
> +		return ret;
> +
> +	meson_nfc_disable_clk(nfc);
> +
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver meson_nfc_driver =3D {
> +	.probe  =3D meson_nfc_probe,
> +	.remove =3D meson_nfc_remove,
> +	.driver =3D {
> +		.name  =3D "meson-nand",
> +		.of_match_table =3D meson_nfc_id_table,
> +	},
> +};
> +module_platform_driver(meson_nfc_driver);
> +
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_AUTHOR("Liang Yang <liang.yang@amlogic.com>");
> +MODULE_DESCRIPTION("Amlogic's Meson NAND Flash Controller driver");




Thanks,
Miqu=C3=A8l
