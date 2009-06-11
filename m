Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEghz-0001R3-Qa
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 09:36:38 +0000
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Amul Saha <amul.saha@samsung.com>
In-Reply-To: <9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Jun 2009 12:35:06 +0300
Message-Id: <1244712906.5847.414.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-06-11 at 14:53 +0530, Amul Saha wrote:
> This patch now adds support for Flex-OneNAND to be used as a module,
> it also supports Boundary setting at module insertion time
> 
> Signed-off-by: Amul Kumar Saha <amul.saha at samsung.com>
> Signed-off-by: Vishak G <vishak.g at samsung.com>
> ---
>  onenand_base.c |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index 8d4c9c2..a91133b 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -20,6 +20,7 @@
> 
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/moduleparam.h>
>  #include <linux/init.h>
>  #include <linux/sched.h>
>  #include <linux/delay.h>
> @@ -31,6 +32,18 @@
> 
>  #include <asm/io.h>
> 
> +#ifdef MODULE
> +static char *flex_bdry_info;
> +
> +module_param(flex_bdry_info, charp, 0400);
> +MODULE_PARM_DESC(flex_bdry_info, "SLC Boundary information for Flex-OneNAND"
> +				 "Syntax:flex_bdry_info=DIE_BDRY,LOCK,..."
> +				 "DIE_BDRY: SLC boundary of the die"
> +				 "LOCK: Locking information for SLC boundary"
> +				 "    : 0->Set boundary in unlocked status"
> +				 "    : 1->Set boundary in locked status");
> +#endif
> +
>  /* Default Flex-OneNAND boundary and lock respectively */
>  static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };
> 
> @@ -3271,7 +3284,9 @@ static int flexonenand_setup(char *s)
>  	return 1;
>  }
> 
> +#ifndef MODULE
>  __setup("onenand.bdry=", flexonenand_setup);
> +#endif

Why you still need this? Module parameters still work if your stuff
is compiled in - you just pass the "onenand.flex_bdry_info=" kernel
parameter.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
