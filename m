Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avO4c-0002MB-7k
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 11:56:07 +0000
Subject: Re: [PATCH v10] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
To: Jiancheng Xue <xuejiancheng@hisilicon.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <jteki@openedev.com>, <ezequiel@vanguardiasur.com.ar>, <juhosg@openwrt.org>,
 <furquan@google.com>, <robh+dt@kernel.org>
References: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <suwenping@hisilicon.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <yanhaifeng@hisilicon.com>,
 <raojun@hisilicon.com>, <linux-mtd@lists.infradead.org>,
 <jiangheng@hisilicon.com>, <ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
 <yanghongwei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
 <hermit.wangheming@hisilicon.com>
Message-ID: <5720A8BD.90302@atmel.com>
Date: Wed, 27 Apr 2016 13:55:41 +0200
MIME-Version: 1.0
In-Reply-To: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jiancheng,

Le 19/04/2016 09:27, Jiancheng Xue a écrit :
> From: Jiancheng Xue <xuejiancheng@huawei.com>
> 
> Add hisilicon spi-nor flash controller driver

[...]
> +enum hifmc_iftype {
> +	IF_TYPE_STD,
> +	IF_TYPE_DUAL,
> +	IF_TYPE_DIO,
> +	IF_TYPE_QUAD,
> +	IF_TYPE_QIO,
> +};

Just for my own information, the hisilicon controller supports:
- SPI 1-1-1 : IF_TYPE_STD
- SPI 1-1-2 : IF_TYPE_DUAL
- SPI 1-2-2 : IF_TYPE_DIO
- SPI 1-1-4 : IF_TYPE_QUAD
- SPI 1-4-4 : IF_TYPE_QIO

but not the SPI protocols 2-2-2 or 4-4-4, does it?

If I ask you this question, it's because I wonder how to make the difference
between SPI controllers supporting both SPI 1-4-4 and 4-4-4 and those
supporting only SPI 1-4-4 in the case they rely on the m25p80 driver as an
adaptation layer between the spi-nor framework et the spi framework.

I guess the "spi-tx-bus-width" and "spi-rx-bus-width" DT properties are not
enough to make the difference between these two kinds of SPI controller.

I understand your driver doesn't use the m25p80 driver as it directly calls
spi_nor_scan() and implements the .read_reg, .write_reg, .read, .write and
.erase hooks, but its a general question :)

> +static int get_if_type(enum read_mode flash_read)
> +{
> +	enum hifmc_iftype if_type;
> +
> +	switch (flash_read) {
> +	case SPI_NOR_DUAL:
> +		if_type = IF_TYPE_DUAL;
> +		break;
> +	case SPI_NOR_QUAD:
> +		if_type = IF_TYPE_QUAD;
> +		break;
> +	case SPI_NOR_NORMAL:
> +	case SPI_NOR_FAST:
> +	default:
> +		if_type = IF_TYPE_STD;
> +		break;
> +	}
> +
> +	return if_type;
> +}

Here I understand your QSPI controller could support SPI 1-4-4 and SPI 1-2-2
but you limit it to SPI 1-1-4 and SPI 1-1-2 because the spi-nor framework
doesn't support those protocols yet.

[...]

> +static void hisi_spi_nor_cmd_prepare(struct hifmc_host *host, u8 cmd,
> +		u32 *opcfg)
> +{
> +	u32 reg;
> +
> +	*opcfg |= FMC_OP_CMD1_EN;
> +	switch (cmd) {
> +	case SPINOR_OP_RDID:
> +	case SPINOR_OP_RDSR:
> +	case SPINOR_OP_RDCR:
> +		*opcfg |= FMC_OP_READ_DATA_EN;
> +		break;
> +	case SPINOR_OP_WREN:
> +		reg = readl(host->regbase + FMC_GLOBAL_CFG);
> +		if (reg & FMC_GLOBAL_CFG_WP_ENABLE) {
> +			reg &= ~FMC_GLOBAL_CFG_WP_ENABLE;
> +			writel(reg, host->regbase + FMC_GLOBAL_CFG);
> +		}
> +		break;
> +	case SPINOR_OP_WRSR:
> +		*opcfg |= FMC_OP_WRITE_DATA_EN;
> +		break;
> +	case SPINOR_OP_BE_4K:
> +	case SPINOR_OP_BE_4K_PMC:
> +	case SPINOR_OP_SE_4B:
> +	case SPINOR_OP_SE:
> +		*opcfg |= FMC_OP_ADDR_EN;
> +		break;
> +	case SPINOR_OP_EN4B:
> +		reg = readl(host->regbase + FMC_CFG);
> +		reg |= SPI_NOR_ADDR_MODE;
> +		writel(reg, host->regbase + FMC_CFG);
> +		break;
> +	case SPINOR_OP_EX4B:
> +		reg = readl(host->regbase + FMC_CFG);
> +		reg &= ~SPI_NOR_ADDR_MODE;
> +		writel(reg, host->regbase + FMC_CFG);
> +		break;
> +	case SPINOR_OP_CHIP_ERASE:
> +	default:
> +		break;
> +	}
> +}

IMHO, this is exactly what should be avoided in (Q)SPI controller drivers:
they should not analyse the command op code to guess some settings such as
the SPI protocol to be used or in your case whether some address or data
cycles are included inside the command.

Why? Just because your driver won't know what to do when we introduce new
op codes. Right now, hisi_spi_nor_cmd_prepare() is not aware of op code 0x15
use by Macronix to read its Configuration Register or Micron op codes to
read/write their Volatile Configuration Register and Enhanced Volatile
Configuration Register. So your driver won't support those memories any longer
when new features using those registers will be added in the spi-nor framework.


Since your driver implements struct spi_nor hooks, here is what you could do
instead:

1 - hisi_spi_nor_read_reg(..., u8 *buf, int len)

if buf != NULL then you should set FMC_OP_READ_DATA_EN, don't set it otherwise.


2 - hisi_spi_nor_write_reg(..., u8 *buf, int len)

buf should always be != NULL so I guess you can always set FMC_OP_WRITE_DATA_EN

For the special case of SPINOR_OP_WREN (Write Enable), your driver seems
to clear the FMC_GLOBAL_CFG_WP_ENABLE bit from the FMC_GLOBAL_CFG register, if
set, but never set it again... So why not clear this bit once for all?

Reading the current source code, the support of the hardware write protect
feature is a little bit odd, isn't it?

3 - hisi_spi_nor_read(struct spi_nor *nor, ...)

your driver doesn't seem to call hisi_spi_nor_send_cmd() /
hisi_spi_nor_cmd_prepare() from _read() so I don't know whether you have to
set the FMC_OP_READ_DATA_EN bit here.

Also you can check nor->addr_width to know whether you need SPI_NOR_ADDR_MODE.


4 - hisi_spi_nor_write(struct spi_nor *nor, ...)

Almost the same comment as for _read(): just replace FMC_OP_READ_DATA_EN by
FMC_OP_WRITE_DATA_EN I guess.


5 - hisi_spi_nor_erase(struct spi_nor *nor, ...)

Here again you should check nor->addr_width to know when to set the
SPI_NOR_ADDR_MODE bit in the FMC_CFG register.

The FMC_OP_ADDR_EN bit should always be set for erase operations.


> +static int hisi_spi_nor_send_cmd(struct spi_nor *nor, u8 cmd, int len)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	u32 reg, op_cfg = 0;
> +
> +	hisi_spi_nor_cmd_prepare(host, cmd, &op_cfg);
[...]

Just get rid of hisi_spi_nor_cmd_prepare(), it would simplify the support of
your driver a lot. For sure, I don't know the hisilicon spi-nor flash
controller as much as you do but I'm pretty sure its driver doesn't need to
analyse the op code to guess some hardware settings. There are other means to
find out these settings.

Anyway, I hope these few comments will help you.

Best regards,

Cyrille
