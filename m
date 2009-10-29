Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3WuQ-0000Bm-4x
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 15:27:34 +0000
Subject: Re: [PATCH v12 2/4]: mtdoops: Add a maximum MTD partition size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091029134116.354237ba@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134116.354237ba@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Oct 2009 17:27:09 +0200
Message-Id: <1256830029.29885.860.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-29 at 13:41 +0100, Simon Kagstrom wrote:
> A configurable maximum MTD partition size for mtdoops avoids mistakes
> where the user gives e.g., a rootfs partition to mtdoops (which will
> happily erase it).
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> ---
>  drivers/mtd/Kconfig   |   13 +++++++++++++
>  drivers/mtd/mtdoops.c |   11 +++++++----
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index ecf90f5..9a69af8 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -315,6 +315,19 @@ config MTD_OOPS
>  	  To use, add console=ttyMTDx to the kernel command line,
>  	  where x is the MTD device number to use.
>  
> +config MTD_OOPS_MAX_MTD_SIZE
> +	int "Maximum MTD oops partition size (kbytes)"
> +	default 4096
> +	range 8 1048576
> +	depends on MTD_OOPS
> +	help
> +	  This parameter sets the maximum MTD partition size for use with
> +	  MTD oops. The default value is used as a safeguard against using
> +	  e.g., a root filesystem partition as a MTDoops device (in which
> +	  case it will be erased).
> +
> +	  No need to change unless you have a very large MTDoops partition.
> +
>  source "drivers/mtd/chips/Kconfig"

Could we please just make it hard limited to something like 64MiB in the
driver itself. This configuration option is not really needed. There are
not many users of this driver, and I do not think any of them would ever
need a big partition for mtdoops, so there is not reason to make things
more complex than they are by introducing this configuration option.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
