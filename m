Received: from mail-he1eur01on0104.outbound.protection.outlook.com
 ([104.47.0.104] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUCyv-0000iU-2P
 for linux-mtd@lists.infradead.org; Wed, 27 Dec 2017 14:46:59 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Added ISSI is25lp080d support
To: cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexander.sverdlin@nokia.com, pascal.fabreges@nokia.com
References: <20171219134325.3315-1-romain.porte@nokia.com>
 <20171227135809.2407-1-romain.porte@nokia.com>
From: Romain Porte <romain.porte@nokia.com>
Message-ID: <c668b55b-f35e-cdfd-1f90-dc1289a73b40@nokia.com>
Date: Wed, 27 Dec 2017 15:46:37 +0100
MIME-Version: 1.0
In-Reply-To: <20171227135809.2407-1-romain.porte@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27/12/2017 14:58, Romain Porte wrote:
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 8bafd462f..18e826d36 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1050,6 +1050,8 @@ static const struct flash_info spi_nor_ids[] = {
>   			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>   	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
>   			SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>   
Please note that the new SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ options 
have not been tested on our hardware for the moment. The Tested-by flag 
applies only for the previous configuration without these two new flags. 
We may be able to test these additional flags in the future, but they 
were added only from your (Cyrille's) review from previous patch.

Please let me know if you want to wait for our hardware test results 
before merging into spi-nor/next, or if you are confident enough to 
merge it as this.

Romain.
