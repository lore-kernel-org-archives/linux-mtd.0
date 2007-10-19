Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iin3g-0005H8-2U
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 09:18:18 +0100
Date: Fri, 19 Oct 2007 08:47:33 +0100
From: Ben Dooks <ben@fluff.org>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: [PATCH] MTD: add s3c2440-specific read_buf/write_buf
Message-ID: <20071019074733.GA12390@fluff.org.uk>
References: <1192754587-25256-1-git-send-email-mattjreimer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1192754587-25256-1-git-send-email-mattjreimer@gmail.com>
Cc: Matt Reimer <mreimer@vpop.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 18, 2007 at 05:43:07PM -0700, Matt Reimer wrote:
> From: Matt Reimer <mreimer@vpop.net>
> 
> Add read_buf/write_buf for s3c2440, which can read/write 32 bits at a
> time rather than just 8. In my testing on an s3c2440a running at 400 MHz
> with a 100 MHz HCLK, read performance improves by 36% (from 5.19 MB/s
> to 7.07 MB/s).
> 
> Signed-off-by: Matt Reimer <mreimer@vpop.net>
Acked-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  drivers/mtd/nand/s3c2410.c |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 5fac4c4..903db18 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -488,12 +488,24 @@ static void s3c2410_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
>  	readsb(this->IO_ADDR_R, buf, len);
>  }
>  
> +static void s3c2440_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
> +{
> +	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> +	readsl(info->regs + S3C2440_NFDATA, buf, len / 4);
> +}
> +
>  static void s3c2410_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
>  {
>  	struct nand_chip *this = mtd->priv;
>  	writesb(this->IO_ADDR_W, buf, len);
>  }
>  
> +static void s3c2440_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
> +{
> +	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> +	writesl(info->regs + S3C2440_NFDATA, buf, len / 4);
> +}
> +
>  /* device management functions */
>  
>  static int s3c2410_nand_remove(struct platform_device *pdev)
> @@ -604,6 +616,8 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
>  		info->sel_bit	= S3C2440_NFCONT_nFCE;
>  		chip->cmd_ctrl  = s3c2440_nand_hwcontrol;
>  		chip->dev_ready = s3c2440_nand_devready;
> +		chip->read_buf  = s3c2440_nand_read_buf;
> +		chip->write_buf	= s3c2440_nand_write_buf;
>  		break;
>  
>  	case TYPE_S3C2412:
> -- 
> 1.5.3.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
