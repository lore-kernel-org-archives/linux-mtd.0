Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6rEp-0001UG-Ld
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 02:45:48 +0000
Received: by pacwq6 with SMTP id wq6so39386771pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 18:45:26 -0800 (PST)
Date: Wed, 9 Dec 2015 18:45:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Karl Zhang <shuangshuo@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 peterpandong@micron.com, beanhuo@micron.com, zszubbocsev@micron.com,
 Karl Zhang <karlzhang@micron.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: add Manufacturer ID for Micron
Message-ID: <20151210024524.GA29459@google.com>
References: <1449712740-22900-1-git-send-email-karlzhang@micron.com>
 <1449712740-22900-2-git-send-email-karlzhang@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449712740-22900-2-git-send-email-karlzhang@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 10, 2015 at 01:58:59AM +0000, Karl Zhang wrote:
> Micron Manufacturer ID assigned by JEDEC is 2Ch.
> Add this ID, for new Spi NOR from Micron.
> 
> ST's ID(20h) is Micron due to the history.
> 
> Signed-off-by: Karl Zhang <karlzhang@micron.com>
> ---
>  include/linux/mtd/cfi.h     | 1 +
>  include/linux/mtd/spi-nor.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index 9b57a9b..cbf7716 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -377,6 +377,7 @@ struct cfi_fixup {
>  #define CFI_MFR_SHARP		0x00B0
>  #define CFI_MFR_SST		0x00BF
>  #define CFI_MFR_ST		0x0020 /* STMicroelectronics */
> +#define CFI_MFR_MICRON		0x002C /* Micron */
>  #define CFI_MFR_TOSHIBA		0x0098
>  #define CFI_MFR_WINBOND		0x00DA
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index fac3f6f..b858e93 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -22,6 +22,8 @@
>   */
>  #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
>  #define SNOR_MFR_INTEL		CFI_MFR_INTEL
> +/* Micron Manufacturer ID assigned by JEDEC */
> +#define SNOR_MFR_MICRON_JEDEC	CFI_MFR_MICRON

Is this the ID Micron is going to use going forward?

Brian

>  #define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
>  #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
>  #define SNOR_MFR_SPANSION	CFI_MFR_AMD
> -- 
> 1.9.1
> 
