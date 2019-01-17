From: Tudor.Ambarus@microchip.com (Tudor.Ambarus at microchip.com)
Date: Thu, 17 Jan 2019 07:16:01 +0000
Subject: [PATCH v7 3/5] mtd: m25p80: add support of octal mode I/O transfer
In-Reply-To: <1547546584-5254-4-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1547546584-5254-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1547546584-5254-4-git-send-email-yogeshnarayan.gaur@nxp.com>
Message-ID: <8381785e-95c2-8dfc-6fac-ea4710b3c943@microchip.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org



On 01/15/2019 12:05 PM, Yogesh Narayan Gaur wrote:
> Add support for octal mode I/O data transfer based on the controller (spi)
> mode.
> Assign hw-capability mask bits for octal transfer.
> 
> Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/devices/m25p80.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c4a1d04b8c80..651bab6d4e31 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -195,7 +195,14 @@ static int m25p_probe(struct spi_mem *spimem)
>  	spi_mem_set_drvdata(spimem, flash);
>  	flash->spimem = spimem;
>  
> -	if (spi->mode & SPI_RX_QUAD) {
> +	if (spi->mode & SPI_RX_OCTAL) {
> +		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> +
> +		if (spi->mode & SPI_TX_OCTAL)
> +			hwcaps.mask |= (SNOR_HWCAPS_READ_1_8_8 |
> +					SNOR_HWCAPS_PP_1_1_8 |
> +					SNOR_HWCAPS_PP_1_8_8);
> +	} else if (spi->mode & SPI_RX_QUAD) {
>  		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>  
>  		if (spi->mode & SPI_TX_QUAD)
> 
