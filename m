Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbk2G-0002GV-Mk
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 10:01:50 +0000
Date: Sat, 7 Jul 2018 12:01:37 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Use kasprintf() instead of fixed buffer formatting
Message-ID: <20180707120137.00220db0@bbrezillon>
In-Reply-To: <20180628082011.19553-1-geert+renesas@glider.be>
References: <20180628082011.19553-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 Jun 2018 10:20:11 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Using "%4.4X" in the calculation of the buffer size is misleading, as
> the format string literal has no relation to the actual size needed.
> Hence this is fragile w.r.t. future modification.
> 
> As this is not a hot path, fix this by replacing the formatting in a
> fixed buffer by kasprintf().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,

Boris

> ---
> Compile-tested only.
> 
> Interestingly, this decreases code size (by 16 resp. 24 bytes on arm32
> resp. arm64).
> ---
>  drivers/mtd/chips/gen_probe.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
> index 879bebf9d8b12038..837b04ab96a9c526 100644
> --- a/drivers/mtd/chips/gen_probe.c
> +++ b/drivers/mtd/chips/gen_probe.c
> @@ -202,16 +202,19 @@ static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	__u16 type = primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;
>  #ifdef CONFIG_MODULES
> -	char probename[sizeof("cfi_cmdset_%4.4X")];
>  	cfi_cmdset_fn_t *probe_function;
> +	char *probename;
>  
> -	sprintf(probename, "cfi_cmdset_%4.4X", type);
> +	probename = kasprintf(GFP_KERNEL, "cfi_cmdset_%4.4X", type);
> +	if (!probename)
> +		return NULL;
>  
>  	probe_function = __symbol_get(probename);
>  	if (!probe_function) {
>  		request_module("cfi_cmdset_%4.4X", type);
>  		probe_function = __symbol_get(probename);
>  	}
> +	kfree(probename);
>  
>  	if (probe_function) {
>  		struct mtd_info *mtd;
