Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDfW2-00041a-17
 for linux-mtd@lists.infradead.org; Tue, 20 Jan 2015 20:35:10 +0000
Received: by mail-pa0-f47.google.com with SMTP id lj1so3634160pab.6
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2015 12:34:46 -0800 (PST)
Date: Tue, 20 Jan 2015 12:34:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Masanari Iida <standby24x7@gmail.com>
Subject: Re: [PATCH] staging: mt29f_spinand: Fix typo in Kconfig
Message-ID: <20150120203443.GO9759@ld-irv-0074>
References: <1421318844-18203-1-git-send-email-standby24x7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421318844-18203-1-git-send-email-standby24x7@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-mtd@lists.infradead.org, kamlakant.patel@broadcom.com,
 manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 15, 2015 at 07:47:24PM +0900, Masanari Iida wrote:
> This patch fix a spelling typo in Kconfig.
> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>

Greg, do you take these patches, or should they go through me?

FWIW, we have high hopes to kill and replace this driver soon, as there
have been some better spi-nand patches floating around linux-mtd.

> ---
>  drivers/staging/mt29f_spinand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/mt29f_spinand/Kconfig b/drivers/staging/mt29f_spinand/Kconfig
> index 4031748..f3f9cb3 100644
> --- a/drivers/staging/mt29f_spinand/Kconfig
> +++ b/drivers/staging/mt29f_spinand/Kconfig
> @@ -12,5 +12,5 @@ config MTD_SPINAND_ONDIEECC
>  	bool "Use SPINAND internal ECC"
>  	depends on MTD_SPINAND_MT29F
>  	help
> -	  Internel ECC.
> +	  Internal ECC.
>  	  Enables Hardware ECC support for Micron SPI NAND.

Brian
