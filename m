Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKFE1-0007nx-O5
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 20:09:54 +0000
Received: by bke11 with SMTP id 11so2675318bke.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Oct 2011 13:09:51 -0700 (PDT)
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: h-fache@ti.com
Date: Sat, 29 Oct 2011 23:09:46 +0300
In-Reply-To: <1318866038-11781-1-git-send-email-h-fache@ti.com>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319918989.2126.13.camel@koala>
Mime-Version: 1.0
Cc: joern@lazybastard.org, joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-10-17 at 17:40 +0200, h-fache@ti.com wrote:
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 23423bd..6d58bf0 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -233,7 +233,10 @@ static inline void kill_final_newline(char *str)
>  	return 1;		\
>  } while (0)
>  
> -static int phram_setup(const char *val, struct kernel_param *kp)
> +static int phram_init_called;

You should not need this variable. I think it should work this way:

1. You declare the phram_setup param_call.
2. This function will be called before 'init_phram()' in both cases -
   module and compiled-in.
3. pram_setup should parse the parameters and save them in a temporary
   data structure marked as __initdata. In your case it is
   'phram_paramline'.
4. The 'init_phram()' parses that temporary data structure for real.

> +static __initdata char phram_paramline[64+12+12];
Please, add comment about 64 and 12.

> +
> +static int phram_setup2(const char *val)
>  {
>  	char buf[64+12+12], *str = buf;
>  	char *token[3];
> @@ -282,13 +285,41 @@ static int phram_setup(const char *val, struct kernel_param *kp)
>  	return ret;
>  }
>  
> +static int phram_setup(const char *val, struct kernel_param *kp)
> +{
> +	/* If more parameters are later passed in via
> +	   /sys/module/phram/parameters/phram
> +	   and init_phram() has already been called,
> +	   we can parse the argument directly. */
> +
> +	if (phram_init_called)
> +		return phram_setup2(val);
This if should not be needed - I think this function is called before
'init_phram()' always. So this check should be always false.
> +
> +	/* During early boot stage, we only save the parameters
> +	   here. We must parse them later: if the param passed
> +	   from kernel boot command line, phram_setup() is
> +	   called so early that it is not possible to resolve
> +	   the device (kmalloc() fails). Defer that work to
> +	   phram_setup2(), called by init_phram(). */
> +
> +	strlcpy(phram_paramline, val, sizeof(phram_paramline));

No please, do not silently truncate possibly longer command line. Do
proper strlen here and if it is longer than you array - return an error.

> +
> +	return 0;
> +}
> +
>  module_param_call(phram, phram_setup, NULL, NULL, 000);
>  MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>\"");
>  
> 
>  static int __init init_phram(void)
>  {
> -	return 0;
> +	int ret = 0;
> +
> +	if (strlen(phram_paramline))
> +		ret = phram_setup2(phram_paramline);

Well, matter of taste, but I think strlen is too much for this, I'd use
if (*phram_paramline) or if (phram_paramline[0]) ...


> +	phram_init_called = 1;
> +
> +	return ret;
>  }
>  
>  static void __exit cleanup_phram(void)
