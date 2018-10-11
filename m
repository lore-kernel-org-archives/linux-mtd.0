Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAdQz-0007OC-Pu
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2018 16:03:35 +0000
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add entry for mt35xu512aba flash
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
CC: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1539245630-26611-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1539245630-26611-3-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <d390e12b-94e3-ab5a-3b7e-05381c090724@microchip.com>
Date: Thu, 11 Oct 2018 19:03:09 +0300
MIME-Version: 1.0
In-Reply-To: <1539245630-26611-3-git-send-email-yogeshnarayan.gaur@nxp.com>
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



On 10/11/2018 11:15 AM, Yogesh Narayan Gaur wrote:
> Add entry for mt35xu512aba Micron NOR flash.
> This flash is having uniform sector erase size of 128KB, have
> support of FSR(flag status register), flash size is 64MB and
> supports 4-byte commands.
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
> Changes for v2:
> - Removed checkpatch warning, 80 character limit.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b8b494f..e0d95ac 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1405,6 +1405,10 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  
> +	/* Micron */
> +	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
> +		SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES) },
> +

The style is slightly different from what Brian proposed back in
9648388fc7737365be7a8092e77df78ccc2cd1a4. For consistency reasons, I think we
should use the same style in all entries.

Since I verified the correctness of the patch and my comment targets just a
cosmetic change, I'll let the maintainers decide:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
