Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVCJt-0007nC-UF
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 22:03:38 +0000
Date: Thu, 5 Feb 2009 14:02:55 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Bryan Wu <cooloney@kernel.org>
Subject: Re: [PATCH 2/3] mtd/maps: blackfin async flash maps: bfin-async mtd
	driver needs complex mappings
Message-Id: <20090205140255.b711b929.akpm@linux-foundation.org>
In-Reply-To: <1233822411-10210-3-git-send-email-cooloney@kernel.org>
References: <1233822411-10210-1-git-send-email-cooloney@kernel.org>
	<1233822411-10210-3-git-send-email-cooloney@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, cooloney@kernel.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(all three patches were sent to "inux-mtd".  Fixed here).

On Thu,  5 Feb 2009 16:26:50 +0800
Bryan Wu <cooloney@kernel.org> wrote:

> From: Mike Frysinger <vapier.adi@gmail.com>
> 
> Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
> Signed-off-by: Bryan Wu <cooloney@kernel.org>

This is an underwhelming changelog.

>  drivers/mtd/maps/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 0225cbb..043d50f 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -491,7 +491,7 @@ config MTD_PCMCIA_ANONYMOUS
>  
>  config MTD_BFIN_ASYNC
>  	tristate "Blackfin BF533-STAMP Flash Chip Support"
> -	depends on BFIN533_STAMP && MTD_CFI
> +	depends on BFIN533_STAMP && MTD_CFI && MTD_COMPLEX_MAPPINGS
>  	select MTD_PARTITIONS
>  	default y
>  	help

I assume this corrects a build error?
