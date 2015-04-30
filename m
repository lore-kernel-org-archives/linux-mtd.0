Received: from lb1-smtp-cloud2.xs4all.net ([194.109.24.21])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnwXu-00036t-4l
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 22:03:03 +0000
Message-ID: <1430431357.2187.43.camel@x220>
Subject: Re: [PATCH] mtd: Introduce CONFIG_MTD_RESERVE_END
From: Paul Bolle <pebolle@tiscali.nl>
To: Ben Shelton <ben.shelton@ni.com>
Date: Fri, 01 May 2015 00:02:37 +0200
In-Reply-To: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
References: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While you're discussing more substantial questions with Brian, I found
some nits.

On Wed, 2015-04-29 at 14:28 -0500, Ben Shelton wrote:
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig


> +config MTD_RESERVE_END
> +	int "Reserved space at the end of an all remaining space partition"
> +	depends on MTD_CMDLINE_PARTS = "y"

(The quotes are unneeded.)

MTD_CMDLINE_PARTS is tristate. Why does it need to be built-in for this
symbol?

> +	default 0
> +	---help---
> +	  Specify an amount of reserved space at the end of the last MTD
> +	  partition when the size is specified with '-' to denote all
> +	  remaining space.
> +
> +	  This can be useful if, for example, the BBT is stored at the end
> +	  of the flash, and you don't want those blocks counted as part of
> +	  the last MTD partition. This is less heavyweight than reserving
> +	  the BBT blocks with a separate MTD partition. The BBT marks its
> +	  own blocks as bad blocks, which prevents an MTD driver such as
> +	  UBI from getting an accurate count of the actual bad blocks in
> +	  the MTD partition that contains the BBT.
> +
> +	  The value is specified in bytes. As an example, a typical BBT
> +	  reserves four erase blocks, and a typical erase block size is
> +	  128kB. To reserve that much space at the end of the flash, the
> +	  value for this config option would be 524288.
> +
> +	  If unsure, use the default value of zero.

> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -340,7 +340,8 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  			offset = part->parts[i].offset;
>  
>  		if (part->parts[i].size == SIZE_REMAINING)
> -			part->parts[i].size = master->size - offset;
> +			part->parts[i].size = master->size - offset -
> +					      CONFIG_MTD_RESERVE_END;

I haven't tested this. (Quite often that means: I'm wrong.) But if
MTD_CMDLINE_PARTS is set to "m" I think MTD_RESERVE_END will not be set.
In that case CPP will helpfully set CONFIG_MTD_RESERVE_END to zero
(which is what you want). But it should also trigger this warning:
    "CONFIG_MTD_RESERVE_END" is not defined [-Wundef]

>  
>  		if (offset + part->parts[i].size > master->size) {
>  			printk(KERN_WARNING ERRP


Paul Bolle
