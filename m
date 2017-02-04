Received: from mail-wm0-f68.google.com ([74.125.82.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ca7yc-0003R4-OX
 for linux-mtd@lists.infradead.org; Sat, 04 Feb 2017 21:34:37 +0000
Received: by mail-wm0-f68.google.com with SMTP id v77so13121268wmv.0
 for <linux-mtd@lists.infradead.org>; Sat, 04 Feb 2017 13:34:14 -0800 (PST)
Subject: Re: [PATCH] mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
To: Arnd Bergmann <arnd@arndb.de>, Brian Norris <computersforpeace@gmail.com>
References: <20170203094946.2112158-1-arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0e6b1dc1-5311-91ba-10e3-1a13f866df6b@gmail.com>
Date: Sat, 4 Feb 2017 22:12:35 +0100
MIME-Version: 1.0
In-Reply-To: <20170203094946.2112158-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/03/2017 10:49 AM, Arnd Bergmann wrote:
> kernelci.org reports a warning for this driver, as it copies a local
> variable into a 'const char *' string:
> 
>     drivers/mtd/maps/pmcmsp-flash.c:149:30: warning: passing argument 1 of 'strncpy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> 
> Using kstrndup() simplifies the code and avoids the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/maps/pmcmsp-flash.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
> index f9fa3fad728e..2051f28ddac6 100644
> --- a/drivers/mtd/maps/pmcmsp-flash.c
> +++ b/drivers/mtd/maps/pmcmsp-flash.c
> @@ -139,15 +139,13 @@ static int __init init_msp_flash(void)
>  		}
>  
>  		msp_maps[i].bankwidth = 1;
> -		msp_maps[i].name = kmalloc(7, GFP_KERNEL);
> +		msp_maps[i].name = kstrndup(flash_name, 7, GFP_KERNEL);
>  		if (!msp_maps[i].name) {
>  			iounmap(msp_maps[i].virt);
>  			kfree(msp_parts[i]);
>  			goto cleanup_loop;
>  		}
>  
> -		msp_maps[i].name = strncpy(msp_maps[i].name, flash_name, 7);
> -
>  		for (j = 0; j < pcnt; j++) {
>  			part_name[5] = '0' + i;
>  			part_name[7] = '0' + j;
> 


-- 
Best regards,
Marek Vasut
