Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8ERX-0000VV-BA
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 13:08:19 +0000
Date: Mon, 16 Jun 2008 15:08:10 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Robert Jarzmik <rjarzmik@free.fr>
Subject: Re: physmap without MTD partitions
Message-ID: <20080616130810.GA20814@logfs.org>
References: <87y75hz3u2.fsf@free.fr> <20080616095047.GA18998@logfs.org>
	<87k5gpv9qn.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k5gpv9qn.fsf@free.fr>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 June 2008 14:34:56 +0200, Robert Jarzmik wrote:
> 
> Don't call suspend/resume functions if they have not been
> defined.
> 
> Signed-off-by: Robert Jarzmik <rjarzmik@free.fr>

Acked-By: Joern Engel <joern@logfs.org>

> ---
>  drivers/mtd/maps/physmap.c |   11 +++++++----
>  1 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 183255f..73c770b 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -203,7 +203,8 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
>  	int i;
>  
>  	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
> -		ret |= info->mtd[i]->suspend(info->mtd[i]);
> +		if (info->mtd[i]->suspend)
> +			ret |= info->mtd[i]->suspend(info->mtd[i]);
>  
>  	return ret;
>  }
> @@ -214,7 +215,8 @@ static int physmap_flash_resume(struct platform_device *dev)
>  	int i;
>  
>  	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
> -		info->mtd[i]->resume(info->mtd[i]);
> +		if (info->mtd[i]->resume)
> +			info->mtd[i]->resume(info->mtd[i]);
>  
>  	return 0;
>  }
> @@ -225,8 +227,9 @@ static void physmap_flash_shutdown(struct platform_device *dev)
>  	int i;
>  
>  	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
> -		if (info->mtd[i]->suspend(info->mtd[i]) == 0)
> -			info->mtd[i]->resume(info->mtd[i]);
> +		if (info->mtd[i]->suspend && info->mtd[i]->resume)
> +			if (info->mtd[i]->suspend(info->mtd[i]) == 0)
> +				info->mtd[i]->resume(info->mtd[i]);
>  }
>  #else
>  #define physmap_flash_suspend NULL
> -- 
> 1.5.5.3
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Jörn

-- 
It is the mark of an educated mind to be able to entertain a thought
without accepting it.
-- Aristotle
