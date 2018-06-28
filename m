Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRNP-0005jg-F3
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:30:05 +0000
Date: Thu, 28 Jun 2018 09:29:36 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: replace VMLINUX_SYMBOL_STR() with string literal
Message-ID: <20180628092936.6c4a097c@bbrezillon>
In-Reply-To: <1529768142-9989-1-git-send-email-yamada.masahiro@socionext.com>
References: <1529768142-9989-1-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 24 Jun 2018 00:35:42 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> With the special case handling for Blackfin and Metag was removed by
> commit 94e58e0ac312 ("export.h: remove code for prefixing symbols with
> underscore"), VMLINUX_SYMBOL_STR() can be replaced with string literal.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied.

Thanks,

Boris

> ---
> 
>  drivers/mtd/chips/gen_probe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
> index b57ceea..879bebf 100644
> --- a/drivers/mtd/chips/gen_probe.c
> +++ b/drivers/mtd/chips/gen_probe.c
> @@ -202,10 +202,10 @@ static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	__u16 type = primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;
>  #ifdef CONFIG_MODULES
> -	char probename[sizeof(VMLINUX_SYMBOL_STR(cfi_cmdset_%4.4X))];
> +	char probename[sizeof("cfi_cmdset_%4.4X")];
>  	cfi_cmdset_fn_t *probe_function;
>  
> -	sprintf(probename, VMLINUX_SYMBOL_STR(cfi_cmdset_%4.4X), type);
> +	sprintf(probename, "cfi_cmdset_%4.4X", type);
>  
>  	probe_function = __symbol_get(probename);
>  	if (!probe_function) {
