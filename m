Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG4Gn-0005rn-Sp
 for linux-mtd@lists.infradead.org; Sat, 09 Aug 2014 10:53:06 +0000
Received: by mail-pa0-f47.google.com with SMTP id kx10so8465759pab.6
 for <linux-mtd@lists.infradead.org>; Sat, 09 Aug 2014 03:52:41 -0700 (PDT)
Date: Sat, 9 Aug 2014 18:52:34 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 7/8] mtd: spi-nor: factor out write_enable() for erase
 commands
Message-ID: <20140809105232.GA1571@localhost.localdomain>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 06, 2014 at 06:17:01PM -0700, Brian Norris wrote:
> write_enable() was being duplicated to both m25p80.c and fsl-quadspi.c.
> But this should be handled within the spi-nor abstraction layer.
> 
> At the same time, let's add write_disable() after erasing, so we don't
> leave the flash in a write-enabled state afterward.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c      | 5 -----
>  drivers/mtd/spi-nor/fsl-quadspi.c | 5 -----
>  drivers/mtd/spi-nor/spi-nor.c     | 7 ++++---
>  3 files changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 96226ea69f90..116d979ffdb9 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -158,11 +158,6 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
>  	dev_dbg(nor->dev, "%dKiB at 0x%08x\n",
>  		flash->mtd.erasesize / 1024, (u32)offset);
>  
> -	/* Send write enable, then erase commands. */
> -	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
> -	if (ret)
> -		return ret;
> -
>  	/* Set up command buffer. */
>  	flash->command[0] = nor->erase_opcode;
>  	m25p_addr2cmd(nor, offset, flash->command);
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 9c13622a0c7a..07fbfb0a7738 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -738,11 +738,6 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
>  	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
>  		nor->mtd->erasesize / 1024, q->chip_base_addr, (u32)offs);
>  
> -	/* Send write enable, then erase commands. */
> -	ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
> -	if (ret)
> -		return ret;
> -
This write-enable is used for per-sector-erase, not for the whole chip
erase.

So if you really want to remove this code, you should add an extra write-enable
in the spi_nor_erase.

thanks
Huang Shijie
