Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeK4T-0007nV-5f
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 07:32:06 +0000
Received: by mail-pd0-f171.google.com with SMTP id w10so203508pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 23:31:43 -0800 (PST)
Date: Wed, 6 Nov 2013 23:31:39 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Subject: Re: [PATCH v2] mtd: phram: Repair multiple instances support
Message-ID: <20131107073139.GC3805@norris.computersforpeace.net>
References: <525C2147.9060605@nsn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <525C2147.9060605@nsn.com>
Cc: Joern Engel <joern@lazybastard.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 =?iso-8859-1?Q?Herv=E9?= Fache <h-fache@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Mon, Oct 14, 2013 at 06:52:23PM +0200, Alexander Sverdlin wrote:
> mtd: phram: Repair multiple instances support
> 
> Commit b2a2a84d35e0f42ad26e326ec4258f6a8b8eecbe (mtd: phram: dot not crash when
> built-in and passing boot param) claims to be "based on Ville Herva's similar
> patch to block2mtd" (c4e7fb313771ac03dfdca26d30e8b721731c562b), but it has
> missed the crucial point of the original path: all these "if(n)def MODULE".
> It has broken the possibility to create several phram instances when phram is
> compiled as module. The possibility to add instances via /sys writes to
> /sys/module/phram/parameters/phram was also broken with mentioned patch.
> Proposed patch takes the idea of original block2mtd patch to its full extent.
> Assumtion "This function is always called before 'init_phram()'" was also
> incorrect, so removed the comment. This patch effectively reverts also
> b11ec57fc6e6d4882ef01a0c09a1dde58f50492e (mtd: phram: fix section mismatch for
> phram_setup).
> 
> v2 changes: Fixed error handling in init_phram(). 
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nsn.com>

Can we get any testers? Perhaps Hervé can confirm this?

> ---
> --- linux.orig/drivers/mtd/devices/phram.c
> +++ linux/drivers/mtd/devices/phram.c
> @@ -205,6 +205,8 @@ static inline void kill_final_newline(ch
>  	return 1;		\
>  } while (0)
>  
> +#ifndef MODULE
> +static int phram_init_called = 0;
>  /*
>   * This shall contain the module parameter if any. It is of the form:
>   * - phram=<device>,<address>,<size> for module case
> @@ -213,9 +215,10 @@ static inline void kill_final_newline(ch
>   * size.
>   * Example: phram.phram=rootfs,0xa0000000,512Mi
>   */
> -static __initdata char phram_paramline[64 + 20 + 20];
> +static char phram_paramline[64 + 20 + 20];
> +#endif
>  
> -static int __init phram_setup(const char *val)
> +static int phram_setup(const char *val)
>  {
>  	char buf[64 + 20 + 20], *str = buf;
>  	char *token[3];
> @@ -264,17 +267,36 @@ static int __init phram_setup(const char
>  	return ret;
>  }
>  
> -static int __init phram_param_call(const char *val, struct kernel_param *kp)
> +static int phram_param_call(const char *val, struct kernel_param *kp)
>  {
> +#ifdef MODULE
> +	return phram_setup(val);
> +#else
>  	/*
> -	 * This function is always called before 'init_phram()', whether
> -	 * built-in or module.
> +	 * If more parameters are later passed in via
> +	 * /sys/module/phram/parameters/phram
> +	 * and init_phram() has already been called,
> +	 * we can parse the argument now.
>  	 */
> +
> +	if (phram_init_called)
> +		return phram_setup(val);
> +
> +	/*
> +	 * During early boot stage, we only save the parameters
> +	 * here. We must parse them later: if the param passed
> +	 * from kernel boot command line, phram_param_call() is
> +	 * called so early that it is not possible to resolve
> +	 * the device (even kmalloc() fails). Defer that work to
> +	 * phram_setup().
> +	 */
> +
>  	if (strlen(val) >= sizeof(phram_paramline))
>  		return -ENOSPC;
>  	strcpy(phram_paramline, val);
>  
>  	return 0;
> +#endif
>  }
>  
>  module_param_call(phram, phram_param_call, NULL, NULL, 000);
> @@ -283,10 +305,15 @@ MODULE_PARM_DESC(phram, "Memory region t
>  
>  static int __init init_phram(void)
>  {
> +	int ret = 0;
> +
> +#ifndef MODULE
>  	if (phram_paramline[0])
> -		return phram_setup(phram_paramline);
> +		ret = phram_setup(phram_paramline);
> +	phram_init_called = 1;
> +#endif
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void __exit cleanup_phram(void)

Brian
