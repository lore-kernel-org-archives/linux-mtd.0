Received: from mail-bn1on0085.outbound.protection.outlook.com ([157.56.110.85]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9xn2-0005rO-90
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 15:49:41 +0000
Message-ID: <5592B8FE.3050601@opensource.altera.com>
Date: Tue, 30 Jun 2015 10:42:54 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@xilinx.com>, <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <beanhuo@micron.com>
Subject: Re: [PATCH] mtd: spi-nor: Only set Micron quad-read mode when
 controller in 4-lane TX mode
References: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/30/2015 06:17 AM, Mike Looijmans wrote:
> Micron QUAD mode expects command, address and data on 4 lanes instead of just
> one for command (extended SPI mode). This requires the controller to be in a
> special mode, so check first if the controller could be in that mode. If a
> controller does not have the SPI_TX_QUAD mode set, this setting has no chance
> of being valid at all, so don't try to enable it then, and just keep using
> the extended SPI mode.
>
> Tested on a Zynq 7000 with a n25q256a flash chip, this failed to function
> because of the introduction of:
> "driver:mtd:spi-nor: Add quad I/O support for Micron spi nor"
> This commit sets QUAD mode for most Micron chips without asking the controller
> whether it's possible to do so, and without telling the controller that a
> different mode is required, so it couldn't work.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   drivers/mtd/spi-nor/spi-nor.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e8f6131..10ba94f 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1398,6 +1398,8 @@ static int set_quad_mode(struct spi_nor *nor, struct flash_info *info)
>   		}
>   		return status;
>   	case CFI_MFR_ST:
> +		if (!(nor->spi->mode & SPI_TX_QUAD))
> +			return 0;

This is a great idea, but what codebase are you working from?  My l2-mtd 
tree doesn't have a 'spi' member of spi_nor, and this case statement is 
around line 977, not 1398.

>   		status = micron_quad_enable(nor);
>   		if (status) {
>   			dev_err(nor->dev, "Micron quad-read not enabled\n");
>

Regards,
Graham
