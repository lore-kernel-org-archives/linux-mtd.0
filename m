Date: Fri, 2 Apr 2010 18:09:37 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: Re: [PATCH] mtd/maps/physmap: catch failure to register
	MTD_PHYSMAP_COMPAT device
Message-Id: <20100402180937.6c4a455a.randy.dunlap@oracle.com>
In-Reply-To: <0D753D10438DA54287A00B0270842697636A7E9D36@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697636A7E9D36@AUSP01VMBX24.collaborationhost.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "randy.dunlap@oracle.com" <randy.dunlap@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 Apr 2010 17:46:30 -0500 H Hartley Sweeten wrote:

> If the default Kconfig values are used with MTD_PHYSMAP_COMPAT you end
> up with a resource where end < start.  This causes __request_resource to
> return a conflict which then returns an -EBUSY error code.  The current
> physmap.c code just assumes that the platfom_device_register will always
> succeed.
> 
> Catch this failure during the physmap_init and propogate the error.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Reported-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks, Hartley.

Tested-by: Randy Dunlap <randy.dunlap@oracle.com>

> ---
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index d9603f7..426461a 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -264,8 +264,11 @@ static int __init physmap_init(void)
>  
>  	err = platform_driver_register(&physmap_flash_driver);
>  #ifdef CONFIG_MTD_PHYSMAP_COMPAT
> -	if (err == 0)
> -		platform_device_register(&physmap_flash);
> +	if (err == 0) {
> +		err = platform_device_register(&physmap_flash);
> +		if (err)
> +			platform_driver_unregister(&physmap_flash_driver);
> +	}
>  #endif
>  
>  	return err;


---
~Randy
