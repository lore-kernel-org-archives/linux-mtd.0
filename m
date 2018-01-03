Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWpKE-0005Zs-O9
 for linux-mtd@lists.infradead.org; Wed, 03 Jan 2018 20:07:47 +0000
Subject: Re: [PATCH] mtd: fsl-quadspi: update hwcaps read capabilities as
 READ_1_4_4
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 han.xu@nxp.com, festevam@gmail.com, prabhakar.kushwaha@nxp.com,
 suresh.gupta@nxp.com
References: <1514976987-14082-1-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <894be40c-07d2-4676-4da8-03124169039b@wedev4u.fr>
Date: Wed, 3 Jan 2018 21:07:18 +0100
MIME-Version: 1.0
In-Reply-To: <1514976987-14082-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 03/01/2018 à 11:56, Yogesh Gaur a écrit :
> Update Read capabilities as SNOR_HWCAPS_READ_1_4_4 i.e. Quad I/O cmd
> protocol. Spansion flash, s25fl512s, supports Quad read with read
> capabilities as 1-4-4.
> 
> Patch added support for SNOR_HWCAPS_READ_1_4_4 protocol.
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index c22e3eb..178e621 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -959,6 +959,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  {
>  	const struct spi_nor_hwcaps hwcaps = {
>  		.mask = SNOR_HWCAPS_READ_1_1_4 |
> +			SNOR_HWCAPS_READ_1_4_4 |
>  			SNOR_HWCAPS_PP,
>  	};
>  	struct device_node *np = pdev->dev.of_node;
> 

NACK: adding the SNOR_HWCAPS_READ_1_4_4 hardware capability tells
spi_nor_scan() that the SPI (flash) controller, not the SPI flash memory,
supports the SPI 1-4-4 for Fast Read operations.

You cannot add this flag without adding real support of Fast Read 1-4-4 to
the fsl-quadspi.c driver.
