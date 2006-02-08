Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F6s1l-0006Rq-Li
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2006 11:18:54 -0500
Message-ID: <43EA19C9.40909@intel.com>
Date: Wed, 08 Feb 2006 19:18:17 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: jwboyer@gmail.com, dwmw2@infradead.org
References: <F92C2EFE7C3BA745855BF7036E1F3F9A018F2071@NNSMSX401>
In-Reply-To: <F92C2EFE7C3BA745855BF7036E1F3F9A018F2071@NNSMSX401>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] CFI cmdset_0001 A small fixup of wrong cache
	invalidationregions.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David, Josh

Would you please review this patch.
This small patch shouldn't break anything. It just fixes read error 
issues found by our test engine.
If you found it acceptable I would be much appreciate if you commit it 
into CVS repository.

Please see details and patch  below.

Thanks,
Alexey


> Hi all,
>  
> I found issue in cfi_cmdset0001.c. It related to setting up of cache
> regions for invalidating in buffered write porcedure.
> Code performs cache invalidation from "cmd_addr" to "cmd_adr + len" in
> do_write_buffer function. In fact we modify region from "adr" to
> "adr+len".
> The issue affects when you try to write and read data by small chunks.
> This case you may catch read errors on SND configurations.
>  
> I made fix for it. Please take a look at the patch.
> =================================================================
> --- b/drivers/mtd/chips/cfi_cmdset_0001.c 2006-01-26 18:59:52.000000000
> +0300
> +++ a/drivers/mtd/chips/cfi_cmdset_0001.c 2006-01-31 18:56:01.315227496
> +0300
> @@ -1019,8 +1019,8 @@
>  #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
>   INVALIDATE_CACHED_RANGE(map, from, size)
>  
> -#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \
> - UDELAY(map, chip, adr, usec)
> +#define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
> + UDELAY(map, chip, cmd_adr, usec)
>  
>  /*
>   * Extra notes:
> @@ -1052,7 +1052,7 @@
>   spin_lock(chip->mutex);  \
>  } while (0)
>  
> -#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \
> +#define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
>  do {  \
>   spin_unlock(chip->mutex);  \
>   INVALIDATE_CACHED_RANGE(map, adr, len);  \
> @@ -1284,7 +1284,7 @@
>   map_write(map, datum, adr);
>   chip->state = mode;
>  
> - INVALIDATE_CACHE_UDELAY(map, chip,
> + INVALIDATE_CACHE_UDELAY(map, chip, adr,
>      adr, map_bankwidth(map),
>      chip->word_write_time);
>  
> @@ -1572,8 +1572,8 @@
>   map_write(map, CMD(0xd0), cmd_adr);
>   chip->state = FL_WRITING;
>  
> - INVALIDATE_CACHE_UDELAY(map, chip,
> -    cmd_adr, len,
> + INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
> +    adr, len,
>      chip->buffer_write_time);
>  
>   timeo = jiffies + (HZ/2);
> @@ -1749,7 +1749,7 @@
>   chip->state = FL_ERASING;
>   chip->erase_suspended = 0;
>  
> - INVALIDATE_CACHE_UDELAY(map, chip,
> + INVALIDATE_CACHE_UDELAY(map, chip, adr,
>      adr, len,
>      chip->erase_time*1000/2);
>  
> =====================================================
>  
> Thanks,
> Alexey
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
