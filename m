Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHOOi-0000YY-Mv
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 02:02:29 +0000
Received: by mail-pd0-f182.google.com with SMTP id v10so4840389pde.13
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2014 18:01:28 -0800 (PST)
Date: Sat, 22 Feb 2014 18:01:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 1/2] mtd/ts5500: Add dependency
Message-ID: <20140223020119.GA11836@norris-Latitude-E6410>
References: <20140214112824.27b98f1d@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140214112824.27b98f1d@endymion.delvare>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 14, 2014 at 11:28:24AM +0100, Jean Delvare wrote:
> There is no point in displaying the TS5500-specific driver entries if
> TS5500 board support itself isn't enabled.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  drivers/mtd/maps/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-3.14-rc2.orig/drivers/mtd/maps/Kconfig	2014-02-14 11:21:15.116363700 +0100
> +++ linux-3.14-rc2/drivers/mtd/maps/Kconfig	2014-02-14 11:23:53.286863374 +0100
> @@ -124,7 +124,7 @@ config MTD_NETSC520
>  
>  config MTD_TS5500
>  	tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
> -	depends on X86
> +	depends on TS5500 || (X86 && COMPILE_TEST)

Shouldn't this just be

	depends on TS5500 || COMPILE_TEST

since it's such a simple driver, it can be compiled under any ARCH?

>  	select MTD_JEDECPROBE
>  	select MTD_CFI_AMDSTD
>  	help
> 
> 

Brian
