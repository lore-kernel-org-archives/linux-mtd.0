Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlSU5-0001uR-GJ
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 23:56:02 +0000
Received: by mail-ob0-f169.google.com with SMTP id wm4so6698983obc.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 15:55:40 -0800 (PST)
Date: Tue, 26 Nov 2013 15:50:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH] MIPS: Alchemy: add missing platform_set_drvdata() in
 au1550nd_probe()
Message-ID: <20131126235026.GN9468@ld-irv-0074.broadcom.com>
References: <CAPgLHd-qf8Zj0gWgJh3_WMZOAx5-H6aABrVFqRsAw=XkOfDdmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd-qf8Zj0gWgJh3_WMZOAx5-H6aABrVFqRsAw=XkOfDdmw@mail.gmail.com>
Cc: artem.bityutskiy@linux.intel.com, jg1.han@samsung.com,
 linux-kernel@vger.kernel.org, yongjun_wei@trendmicro.com.cn,
 wfp5p@virginia.edu, linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 11, 2013 at 02:18:29PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Add missing platform_set_drvdata() in au1550nd_probe(), otherwise
> calling platform_get_drvdata() in remove returns NULL.

An alternative solution: just allocate ctx with devm_kzalloc(). Then you
don't have to kfree() it at all.

I don't mind one solution over the other too much. Let me know which
you'd prefer.

> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/mtd/nand/au1550nd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
> index ae8dd7c..909b673 100644
> --- a/drivers/mtd/nand/au1550nd.c
> +++ b/drivers/mtd/nand/au1550nd.c
> @@ -480,6 +480,8 @@ static int au1550nd_probe(struct platform_device *pdev)
>  
>  	mtd_device_register(&ctx->info, pd->parts, pd->num_parts);
>  
> +	platform_set_drvdata(pdev, ctx);
> +

Personally, I'd choose to call platform_set_drvdata() earlier in the
probe routine (e.g., immediately after its allocation), in case we end
up calling platform_get_drvdata() from some sub-routine in the future.

>  	return 0;
>  
>  out3:
> 

Brian
