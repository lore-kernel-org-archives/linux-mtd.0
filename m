Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvozR-0003YW-CW
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 16:08:19 +0000
Date: Mon, 9 Nov 2015 16:07:26 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-acpi@vger.kernel.org, drbd-user@lists.linbit.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleg Drokin <oleg.drokin@intel.com>,
 Andreas Dilger <andreas.dilger@intel.com>, codalist@coda.cs.cmu.edu,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] tree wide: Use kvfree() than conditional kfree()/vfree()
Message-ID: <20151109160726.GB8644@n2100.arm.linux.org.uk>
References: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 09, 2015 at 08:56:10PM +0900, Tetsuo Handa wrote:
> There are many locations that do
> 
>   if (memory_was_allocated_by_vmalloc)
>     vfree(ptr);
>   else
>     kfree(ptr);
> 
> but kvfree() can handle both kmalloc()ed memory and vmalloc()ed memory
> using is_vmalloc_addr(). Unless callers have special reasons, we can
> replace this branch with kvfree(). Please check and reply if you found
> problems.
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Russell King <linux@arm.linux.org.uk> # arm

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

In so far as this ARM specific change looks reasonable.  Thanks.

> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index e62400e..492bf3e 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -1200,10 +1200,7 @@ error:
>  	while (i--)
>  		if (pages[i])
>  			__free_pages(pages[i], 0);
> -	if (array_size <= PAGE_SIZE)
> -		kfree(pages);
> -	else
> -		vfree(pages);
> +	kvfree(pages);
>  	return NULL;
>  }
>  
> @@ -1211,7 +1208,6 @@ static int __iommu_free_buffer(struct device *dev, struct page **pages,
>  			       size_t size, struct dma_attrs *attrs)
>  {
>  	int count = size >> PAGE_SHIFT;
> -	int array_size = count * sizeof(struct page *);
>  	int i;
>  
>  	if (dma_get_attr(DMA_ATTR_FORCE_CONTIGUOUS, attrs)) {
> @@ -1222,10 +1218,7 @@ static int __iommu_free_buffer(struct device *dev, struct page **pages,
>  				__free_pages(pages[i], 0);
>  	}
>  
> -	if (array_size <= PAGE_SIZE)
> -		kfree(pages);
> -	else
> -		vfree(pages);
> +	kvfree(pages);
>  	return 0;
>  }
>  

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
