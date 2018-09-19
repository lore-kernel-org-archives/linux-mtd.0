Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2fG9-00051a-K1
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 16:23:49 +0000
Subject: Re: [RESEND PATCH 2/2] mtd: spi-nor: add entry for mt35xu512aba flash
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
CC: <boris.brezillon@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <marek.vasut@gmail.com>, <frieder.schrempf@exceet.de>,
 <cyrille.pitchen@wedev4u.fr>, <computersforpeace@gmail.com>
References: <1537332608-19561-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1537332608-19561-3-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <b5858a4e-617a-4b06-8743-521e20489268@microchip.com>
Date: Wed, 19 Sep 2018 19:23:05 +0300
MIME-Version: 1.0
In-Reply-To: <1537332608-19561-3-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 09/19/2018 07:50 AM, Yogesh Gaur wrote:
> Add entry for mt35xu512aba Micron NOR flash.
> This flash is having uniform sector erase size of 128KB, have
> support of FSR(flag status register), flash size is 64MB and
> supports 4-byte commands.
> 

Seems that the datasheet for mt35xu512aba is not public, I couldn't verify your
statement.

> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 33a55bc..6042df8 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1113,6 +1113,9 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  
> +	/* Micron */
> +	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512, SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES) },

nitpick on style: Brian picked a style that seems reasonable for splitting up
the flags, see 9648388fc7737365be7a8092e77df78ccc2cd1a4.

Best,
ta
