Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYFXX-0004Oq-2B
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 18:19:24 +0000
Subject: Re: [PATCH 1/2] mtd: fsl-quadspi: update hwcaps read capabilities as
 READ_1_4_4
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 han.xu@nxp.com, festevam@gmail.com, prabhakar.kushwaha@nxp.com,
 suresh.gupta@nxp.com
References: <1515064334-509-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1515064334-509-2-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <62931ed6-4c64-9750-c9e0-177c9bf30e28@wedev4u.fr>
Date: Sun, 7 Jan 2018 19:19:08 +0100
MIME-Version: 1.0
In-Reply-To: <1515064334-509-2-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Hi Yogesh,

Le 04/01/2018 à 12:12, Yogesh Gaur a écrit :
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

Sorry but I still don't agree on this patch: it should be squashed into
the patch adding a proper support to Fast Read 1-4-4 commands.

I understand this patch belongs to a series but even individual patches of
a series should not introduce bug. Like this, the spi_nor_scan() could
select the SPI 1-4-4 protocol for Fast Read operation.
However fsl_qspi_get_seqid() still only cares about the SPINOR_OP_READ_1_1_4
op code but not about the SPINOR_OP_READ_1_4_4. So it's not correct.

When looking for a bug, we need to be able to bissect. However testing right
after this patch would fail with SPI flash memories supporting Fast Read
1-4-4.

Best regards,

Cyrille

>  			SNOR_HWCAPS_PP,
>  	};
>  	struct device_node *np = pdev->dev.of_node;
> 
