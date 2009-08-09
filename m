Message-ID: <4A7EED48.6050103@gmail.com>
Date: Sun, 09 Aug 2009 18:37:44 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Roel Kluin <roel.kluin@gmail.com>
Subject: Re: pmcmsp-flash.c: correct clean up?
References: <4A709A88.30103@gmail.com>
In-Reply-To: <4A709A88.30103@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/29/2009 09:52 PM, Roel Kluin wrote:
> Hi,
>
> I noted that cleanup_msp_flash() attempted to determine the size of
> msp_flash with `sizeof(msp_flash) / sizeof(struct mtd_info **)'
> this will not work since msp_flash is not an array.
>
> Also I made some changes to since init_msp_flash() to clean up
> after errors. Do you have problems with this?
>
> Thanks,
>
> Roel
>
> diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
> index 4768bd5..6133147 100644
> --- a/drivers/mtd/maps/pmcmsp-flash.c
> +++ b/drivers/mtd/maps/pmcmsp-flash.c
> @@ -50,7 +50,7 @@ static int fcnt;
>
>   static int __init init_msp_flash(void)
>   {
> -	int i, j;
> +	int i, j, ret = -ENOMEM;
>   	int offset, coff;
>   	char *env;
>   	int pcnt;
> @@ -75,14 +75,16 @@ static int __init init_msp_flash(void)
>   	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
>
>   	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
> +	if (!msp_flash)
> +		return -ENOMEM;
> +
>   	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
> +	if (!msp_parts)
> +		goto free_msp_flash;
> +
>   	msp_maps = kcalloc(fcnt, sizeof(struct mtd_info), GFP_KERNEL);
> -	if (!msp_flash || !msp_parts || !msp_maps) {
> -		kfree(msp_maps);
> -		kfree(msp_parts);
> -		kfree(msp_flash);
> -		return -ENOMEM;
> -	}
> +	if (!msp_maps)
> +		goto free_msp_parts;
>
>   	/* loop over the flash devices, initializing each */
>   	for (i = 0; i<  fcnt; i++) {
> @@ -100,13 +102,17 @@ static int __init init_msp_flash(void)
>
>   		msp_parts[i] = kcalloc(pcnt, sizeof(struct mtd_partition),
>   				       GFP_KERNEL);
> +		if (!msp_parts[i])
> +			goto free_in_loop;
>
>   		/* now initialize the devices proper */
>   		flash_name[5] = '0' + i;
>   		env = prom_getenv(flash_name);
>
> -		if (sscanf(env, "%x:%x",&addr,&size)<  2)
> -			return -ENXIO;
> +		if (sscanf(env, "%x:%x",&addr,&size)<  2) {
> +			ret = -ENXIO;
> +			goto free_msp_parts_arr;
> +		}
>   		addr = CPHYSADDR(addr);
>
>   		printk(KERN_NOTICE
> @@ -123,12 +129,19 @@ static int __init init_msp_flash(void)
>   		if (size>  CONFIG_MSP_FLASH_MAP_LIMIT)
>   			size = CONFIG_MSP_FLASH_MAP_LIMIT;
>   		msp_maps[i].virt = ioremap(addr, size);
> +
> +		if (msp_maps[i].virt == NULL) {
> +			ret = -ENXIO;
> +			goto free_msp_parts_arr;
> +		}
> +
>   		msp_maps[i].bankwidth = 1;
> -		msp_maps[i].name = strncpy(kmalloc(7, GFP_KERNEL),
> -					flash_name, 7);
> +		msp_maps[i].name = kmalloc(7, GFP_KERNEL);
> +		if (!msp_maps[i].name)
> +			goto iounmap_virt;
> +
> +		msp_maps[i].name = strncpy(msp_maps[i].name, flash_name, 7);
>
> -		if (msp_maps[i].virt == NULL)
> -			return -ENXIO;
>
>   		for (j = 0; j<  pcnt; j++) {
>   			part_name[5] = '0' + i;
> @@ -136,8 +149,10 @@ static int __init init_msp_flash(void)
>
>   			env = prom_getenv(part_name);
>
> -			if (sscanf(env, "%x:%x:%n",&offset,&size,&coff)<  2)
> -				return -ENXIO;
> +			if (sscanf(env, "%x:%x:%n",&offset,&size,&coff)<  2) {
> +				ret = -ENXIO;
> +				goto free_msp_maps_name;
> +			}
>
>   			msp_parts[i][j].size = size;
>   			msp_parts[i][j].offset = offset;
> @@ -152,18 +167,38 @@ static int __init init_msp_flash(void)
>   			add_mtd_partitions(msp_flash[i], msp_parts[i], pcnt);
>   		} else {
>   			printk(KERN_ERR "map probe failed for flash\n");
> -			return -ENXIO;
> +			ret = -ENXIO;
> +			goto free_msp_maps_name;
>   		}
>   	}
>
>   	return 0;
> +
> +	while (i--) {
> +                del_mtd_partitions(msp_flash[i]);
> +                map_destroy(msp_flash[i]);
> +free_msp_maps_name:
> +                kfree(msp_maps[i].name);
> +iounmap_virt:
> +                iounmap((void *)msp_maps[i].virt);
> +free_msp_parts_arr:
> +                kfree(msp_parts[i]);
> +free_in_loop:
> +	}

I think jumping into the middle of a loop is not nice. Would it
be better to free the recources belonging to the current interation
inside the allocation loop, and then jump to the beginning of
the freeing loop instead?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
