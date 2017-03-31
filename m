Message-ID: <1490927207.7262.7.camel@mhfsdcap03>
Subject: Re: [PATCH V1 1/1] mtd: mtk-nor: set controller to 4B mode with
 large capacity flash
From: Guochun Mao <guochun.mao@mediatek.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Mark Rutland
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>, Richard Weinberger
 <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-mtd@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 31 Mar 2017 10:26:47 +0800
In-Reply-To: <24d60072-4124-7ec4-6cd3-fd70f4f6b10a@wedev4u.fr>
References: <1490862222-723-1-git-send-email-guochun.mao@mediatek.com>
 <1490862222-723-2-git-send-email-guochun.mao@mediatek.com>
 <24d60072-4124-7ec4-6cd3-fd70f4f6b10a@wedev4u.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille, Marek,

Thanks for your suggestions.

On Thu, 2017-03-30 at 19:40 +0200, Cyrille Pitchen wrote:
> Hi Guochun,
> 
> Le 30/03/2017 à 10:23, Guochun Mao a écrit :
> > when nor's size larger than 16MByte, nor and controller should
> > enter 4Byte mode simultaneously.
> > 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > ---
> >  drivers/mtd/spi-nor/mtk-quadspi.c |    7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
> > index e661877..05cd8a8 100644
> > --- a/drivers/mtd/spi-nor/mtk-quadspi.c
> > +++ b/drivers/mtd/spi-nor/mtk-quadspi.c
> > @@ -369,6 +369,13 @@ static int mt8173_nor_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
> >  		/* We only handle 1 byte */
> >  		ret = mt8173_nor_wr_sr(mt8173_nor, *buf);
> >  		break;
> > +	case SPINOR_OP_EN4B:
> > +		/* Set nor controller to 4-byte address mode,
> > +		 * and simultaneously set nor flash.
> > +		 * This case should cooperate with default operation.
> > +		 */
> > +		writeb(readb(mt8173_nor->base + MTK_NOR_DUAL_REG) | 0x10,
> > +				mt8173_nor->base + MTK_NOR_DUAL_REG);
> 
> This is not good: you should check in both mt8173_nor_read() and
> mt8173_nor_write() whether nor->addr_width is either 3 or 4.
> 
> from include/linux/mtd/spi-nor.h:
>  * @addr_width:		number of address bytes
> 
> Besides SPI commands using an op code from 4-byte address instruction
> set always carry a 4-byte address. They can be used directly, without
> sending the SPINOR_OP_EN4B before. So you cannot assume that addresses
> will be 4-byte long only if your SPI controller driver has seen a
> SPINOR_OP_EN4B command before. This assumption is wrong.
Nor->addr_width is assigned in spi_nor_scan in spi-nor.c, and it's not
modified in later process.
Does it means that we will not switch nor between 3Byte address and
4Byte?
So, is it better to check nor->addr_width when do nor initialization?

> 
> SPI controller driver should never check SPINOR_OP_* op codes like this.
I agree that SPI controller driver should not check SPINOR_OP_* op codes
like what I do.
I will correct it next version.

Best Regards,
Guochun
> 
> Then, testing SPINOR_OP_RDSR from mt8173_nor_read_reg() or
> SPINOR_OP_WRSR from mt8173_nor_write_reg() is not a good practice too:
> op codes may change depending on the memory manufacturer. So testing op
> code values like you do can work with some memories but maybe not all.
> 
> Finally, don't use 0x10, please define a macro instead.
> 
> Best regards,
> 
> Cyrille
> 
> >  	default:
> >  		ret = mt8173_nor_do_tx_rx(mt8173_nor, opcode, buf, len, NULL, 0);
> >  		if (ret)
> > 
> 
