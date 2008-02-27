Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JUOUw-0005jV-KG
	for linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 15:47:11 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JWW00K3CMI5IZ10@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 27 Feb 2008 10:46:54 -0500 (EST)
Date: Wed, 27 Feb 2008 10:46:53 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Subject: Re: [PATCH] MTD-XIP: Use generic xip_iprefetch() instead of asm
	volatile (...)
In-reply-to: <fq285f$isa$1@ger.gmane.org>
Message-id: <alpine.LFD.1.00.0802271046180.3167@xanadu.home>
References: <fq285f$isa$1@ger.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Feb 2008, Paulius Zaleckas wrote:

> Untested, but shouldn't break anything...
> Makes MTD_XIP arch independent. I guess this is why xip_iprefetch() was made for.
> 
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>

Acked-by: Nicolas Pitre <nico@cam.org>


> 
> ---
>   drivers/mtd/chips/cfi_cmdset_0001.c |    4 ++--
>   drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++--
>   drivers/mtd/chips/cfi_probe.c       |    2 +-
>   drivers/mtd/chips/cfi_util.c        |    2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 1707f98..c54d0b6 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -1007,10 +1007,10 @@ static int __xipram xip_wait_for_operation(
>   			chip->state = newstate;
>   			map_write(map, CMD(0xff), adr);
>   			(void) map_read(map, adr);
> -			asm volatile (".rep 8; nop; .endr");
> +			xip_iprefetch();
>   			local_irq_enable();
>   			spin_unlock(chip->mutex);
> -			asm volatile (".rep 8; nop; .endr");
> +			xip_iprefetch();
>   			cond_resched();
> 
>   			/*
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 389acc6..f71cd70 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -717,10 +717,10 @@ static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
>   			chip->erase_suspended = 1;
>   			map_write(map, CMD(0xf0), adr);
>   			(void) map_read(map, adr);
> -			asm volatile (".rep 8; nop; .endr");
> +			xip_iprefetch();
>   			local_irq_enable();
>   			spin_unlock(chip->mutex);
> -			asm volatile (".rep 8; nop; .endr");
> +			xip_iprefetch();
>   			cond_resched();
> 
>   			/*
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index 60e11a0..648a0a5 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -39,7 +39,7 @@ struct mtd_info *cfi_probe(struct map_info *map);
>   #define xip_allowed(base, map) \
>   do { \
>   	(void) map_read(map, base); \
> -	asm volatile (".rep 8; nop; .endr"); \
> +	xip_iprefetch(); \
>   	local_irq_enable(); \
>   } while (0)
> 
> diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
> index 2e51496..72e0022 100644
> --- a/drivers/mtd/chips/cfi_util.c
> +++ b/drivers/mtd/chips/cfi_util.c
> @@ -65,7 +65,7 @@ __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* n
> 
>   #ifdef CONFIG_MTD_XIP
>   	(void) map_read(map, base);
> -	asm volatile (".rep 8; nop; .endr");
> +	xip_iprefetch();
>   	local_irq_enable();
>   #endif
> 
> -- 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


Nicolas
