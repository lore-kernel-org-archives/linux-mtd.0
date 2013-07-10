Received: from ozlabs.org ([203.10.76.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UwlZ1-0001ae-TY
 for linux-mtd@lists.infradead.org; Wed, 10 Jul 2013 03:59:36 +0000
From: Rusty Russell <rusty@rustcorp.com.au>
To: Kees Cook <keescook@chromium.org>, akpm@linux-foundation.org
Subject: Re: [RESEND][PATCH] mtd: refactor call to request_module
In-Reply-To: <20130708130512.GA24315@www.outflux.net>
References: <20130708130512.GA24315@www.outflux.net>
Date: Wed, 10 Jul 2013 12:40:35 +0930
Message-ID: <87hag3cdp0.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, James Hogan <james.hogan@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kees Cook <keescook@chromium.org> writes:
> This reduces the size of the stack frame when calling request_module().
> Performing the sprintf before the call is not needed.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Thanks,
Rusty.

> ---
>  drivers/mtd/chips/gen_probe.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
> index 74dbb6b..ffb36ba 100644
> --- a/drivers/mtd/chips/gen_probe.c
> +++ b/drivers/mtd/chips/gen_probe.c
> @@ -211,9 +211,7 @@ static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
>  
>  	probe_function = __symbol_get(probename);
>  	if (!probe_function) {
> -		char modname[sizeof("cfi_cmdset_%4.4X")];
> -		sprintf(modname, "cfi_cmdset_%4.4X", type);
> -		request_module(modname);
> +		request_module("cfi_cmdset_%4.4X", type);
>  		probe_function = __symbol_get(probename);
>  	}
>  
> -- 
> 1.7.9.5
>
>
> -- 
> Kees Cook
> Chrome OS Security
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
