Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeSdN-00029w-K4
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 10:45:46 +0000
Date: Sat, 13 Sep 2008 12:45:42 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Zev Weiss <zevweiss@gmail.com>
Subject: Re: [PATCH 1/3] [MTD] physmap.c: Check return of
	platform_device_register()
Message-ID: <20080913104542.GD21603@xi.wantstofly.org>
References: <48CB5E9A.4010000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48CB5E9A.4010000@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 12, 2008 at 11:32:58PM -0700, Zev Weiss wrote:

> The PHYSMAP_COMPAT code had been ignoring the return value of
> platform_device_register() in the physmap_init() function.
> 
> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
> ---
>   drivers/mtd/maps/physmap.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> index 42d844f..6fba0d4 100644
> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -312,7 +312,7 @@ static int __init physmap_init(void)
>   	err = platform_driver_register(&physmap_flash_driver);
>   #ifdef PHYSMAP_COMPAT
>   	if (err == 0)
> -		platform_device_register(&physmap_flash);
> +		err = platform_device_register(&physmap_flash);
>   #endif

I don't think you want the registration of the physmap driver to fail
if the compat platform device fails to register.

One reason that the compat platform device can fail to register can be
that there is already a non-compat platform device for the compat flash
chip, and in that case I don't think you want to fail the driver init
(while leaving the physmap_flash_driver registered, too!).
