Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBuz2-0007Xx-1B
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 00:41:52 +0000
Date: Fri, 16 Jan 2015 08:39:35 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH] MAINTAINERS: add maintainer entry for FREESCALE QUAD SPI
 driver
Message-ID: <20150116003935.GA17777@hsj.sh.intel.com>
References: <1421350157-13490-1-git-send-email-han.xu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421350157-13490-1-git-send-email-han.xu@freescale.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2015 at 03:29:17AM +0800, Han Xu wrote:
> Add a maintainer entry for FREESCALE QUAD SPI driver and add myself as a
> maintainer.
> 
> Signed-off-by: Han Xu <han.xu@freescale.com>
> ---
>  MAINTAINERS |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dbc17b3..f6f6e58 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4032,6 +4032,12 @@ S:	Maintained
>  F:	include/linux/platform_data/video-imxfb.h
>  F:	drivers/video/fbdev/imxfb.c
>  
> +FREESCALE QUAD SPI DRIVER
> +M:	Han Xu <han.xu@freescale.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Maintained
> +F:	drivers/mtd/spi-nor/fsl-quadspi.c
> +
>  FREESCALE SOC FS_ENET DRIVER
>  M:	Pantelis Antoniou <pantelis.antoniou@gmail.com>
>  M:	Vitaly Bordug <vbordug@ru.mvista.com>
> -- 
Acked-by: Huang Shijie <shijie.huang@intel.com>

great!

I can take my rest since now. I am happy you can take over this driver.

Huang Shijie
