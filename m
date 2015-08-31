Received: from mail-bn1bon0089.outbound.protection.outlook.com
 ([157.56.111.89] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWSz1-0005my-9l
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 17:35:04 +0000
Message-ID: <55E48F3D.3030800@opensource.altera.com>
Date: Mon, 31 Aug 2015 12:30:37 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: <linux-mtd@lists.infradead.org>, Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, "Vikas
 MANOCHA" <vikas.manocha@st.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
References: <1440148851-14621-1-git-send-email-marex@denx.de>
 <1440148851-14621-2-git-send-email-marex@denx.de>
In-Reply-To: <1440148851-14621-2-git-send-email-marex@denx.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Having some compile issues...see below

On 08/21/2015 04:20 AM, Marek Vasut wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
>
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.
>
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

[...]

> +static int cqspi_set_protocol(struct spi_nor *nor, enum spi_protocol proto)
> +{
> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> +
> +	switch (proto) {
> +	case SPI_PROTO_1_1_1:
> +	case SPI_PROTO_1_1_2:
> +	case SPI_PROTO_1_1_4:
> +	case SPI_PROTO_1_2_2:
> +	case SPI_PROTO_1_4_4:
> +		f_pdata->inst_width = CQSPI_INST_TYPE_SINGLE;
> +		break;
> +	case SPI_PROTO_2_2_2:
> +		f_pdata->inst_width = CQSPI_INST_TYPE_DUAL;
> +		break;
> +	case SPI_PROTO_4_4_4:
> +		f_pdata->inst_width = CQSPI_INST_TYPE_QUAD;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (proto) {
> +	case SPI_PROTO_1_1_1:
> +	case SPI_PROTO_1_1_2:
> +	case SPI_PROTO_1_1_4:
> +		f_pdata->addr_width = CQSPI_INST_TYPE_SINGLE;
> +		break;
> +	case SPI_PROTO_1_2_2:
> +	case SPI_PROTO_2_2_2:
> +		f_pdata->addr_width = CQSPI_INST_TYPE_DUAL;
> +		break;
> +	case SPI_PROTO_1_4_4:
> +	case SPI_PROTO_4_4_4:
> +		f_pdata->addr_width = CQSPI_INST_TYPE_QUAD;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

I think you have some other patches in your tree, the above doesn't 
compile on l2-mtd/master:

~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: ‘enum 
spi_protocol’ declared inside parameter list [enabled by default]
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: its 
scope is only this definition or declaration, which is probably not what 
you want [enabled by default]
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:70: error: parameter 
2 (‘proto’) has incomplete type
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:12: error: function 
declaration isn’t a prototype [-Werror=strict-prototypes]
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c: In function 
‘cqspi_set_protocol’:
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:706:7: error: 
‘SPI_PROTO_1_1_1’ undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:706:7: note: each 
undeclared identifier is reported only once for each function it appears in
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:707:7: error: 
‘SPI_PROTO_1_1_2’ undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:708:7: error: 
‘SPI_PROTO_1_1_4’ undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:709:7: error: 
‘SPI_PROTO_1_2_2’ undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:710:7: error: 
‘SPI_PROTO_1_4_4’ undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:713:7: error: 
‘SPI_PROTO_2_2_2’ undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:716:7: error: 
‘SPI_PROTO_4_4_4’ undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c: In function 
‘cqspi_setup_flash’:
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:1087:6: error: ‘struct 
spi_nor’ has no member named ‘dn’
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:1096:6: error: ‘struct 
spi_nor’ has no member named ‘set_protocol’

[...]

Regards,
Graham
