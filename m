Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xge7f-0004bd-Mu
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 18:25:32 +0000
Received: by mail-pa0-f43.google.com with SMTP id lf10so1953771pab.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2014 11:25:10 -0700 (PDT)
Date: Tue, 21 Oct 2014 11:25:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Ward <robert.ward114@googlemail.com>
Subject: Re: [PATCH] mtd: phram: Allow multiple phram devices on cmd line
Message-ID: <20141021182506.GD1193@ld-irv-0074>
References: <alpine.DEB.2.10.1410211859030.7838@rob-thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1410211859030.7838@rob-thinkpad>
Cc: dwmw2@infradead.org, joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd

On Tue, Oct 21, 2014 at 07:03:23PM +0100, Rob Ward wrote:
> From 9ddd010f1e2bf4fdfac5a7627c5de821a2dcd8f5 Mon Sep 17 00:00:00 2001
> From: Rob Ward <robert.ward114@googlemail.com>
> Date: Tue, 21 Oct 2014 17:46:53 +0100
> Subject: [PATCH] mtd: phram: Allow multiple phram devices on cmd line
> 
> Allow the phram module the ability to create multiple phram mtd
> devices via the kernel command line.
> 
> Currently the phram module only allows a single mtd device to be
> created via the kernel command line. This is due to the phram
> module having to store the values until it is initialised
> later. This storage is done using a single char[] meaning when
> the module_param_call is made the previous value is overidden.
> 
> This change modifies the phram system to use a char[][] allowing
> multiple devices to be created.
> 
> The array currently allows up to 64 devices to be created via the
> kernel command line.
> 
> If the array is full a message is printed to the console and the
> module_param_call returns.
> 
> To test, in all cases an area of memory needs to be reserved via
> the command line e.g. memmap=10M$114M
> 
> To test with phram build into the kernel on the command line add
> the following:
> 
> phram.phram=alpha,114Mi,1Mi phram.phram=beta,115Mi,1Mi
> 
> To test phram built as a module insmod with the following arguments:
> 
> phram=gamma,114Mi,1Mi phram=delta,115Mi,1Mi
> 
> In both cases two mtd devices should be created.
> 
> Signed-off-by: Rob Ward <robert.ward114@googlemail.com>
> ---
>  drivers/mtd/devices/phram.c | 41 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index effd9a4..bd409be 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -214,7 +214,7 @@ static int phram_init_called;
>   * size.
>   * Example: phram.phram=rootfs,0xa0000000,512Mi
>   */
> -static char phram_paramline[64 + 20 + 20];
> +static char phram_paramline[64][64 + 20 + 20];
>  #endif
>  
>  static int phram_setup(const char *val)
> @@ -271,6 +271,9 @@ static int phram_param_call(const char *val, struct kernel_param *kp)
>  #ifdef MODULE
>  	return phram_setup(val);
>  #else
> +	int paramline_it = 0;
> +	int arraysize = 0;
> +
>  	/*
>  	 * If more parameters are later passed in via
>  	 * /sys/module/phram/parameters/phram
> @@ -290,9 +293,27 @@ static int phram_param_call(const char *val, struct kernel_param *kp)
>  	 * phram_setup().
>  	 */
>  
> -	if (strlen(val) >= sizeof(phram_paramline))
> +	if (strlen(val) >= sizeof(phram_paramline[0]))
>  		return -ENOSPC;
> -	strcpy(phram_paramline, val);
> +
> +	arraysize = sizeof(phram_paramline)/sizeof(phram_paramline[0]);
> +
> +	/*
> +	 * Check if any space is left in the array. If no space
> +	 * is left then print warning and return 0
> +	 */
> +
> +	if (phram_paramline[arraysize - 1][0]) {
> +		pr_warn("exceeded limit via cmd_line - %s ignored", val);
> +		return 0;
> +	}
> +
> +	for (paramline_it = 0; paramline_it <= arraysize; paramline_it++) {
> +		if (!phram_paramline[paramline_it][0]) {
> +			strcpy(phram_paramline[paramline_it], val);
> +			break;
> +		}
> +	}
>  
>  	return 0;
>  #endif
> @@ -307,8 +328,18 @@ static int __init init_phram(void)
>  	int ret = 0;
>  
>  #ifndef MODULE
> -	if (phram_paramline[0])
> -		ret = phram_setup(phram_paramline);
> +	int arraysize = 0;
> +	int paramline_it = 0;
> +
> +	arraysize = sizeof(phram_paramline)/sizeof(phram_paramline[0]);
> +
> +	for (paramline_it = 0; paramline_it <= arraysize; paramline_it++) {
> +		if (phram_paramline[paramline_it][0]) {
> +			ret = phram_setup(phram_paramline[paramline_it]);
> +			if (ret)
> +				break;
> +		}
> +	}
>  	phram_init_called = 1;
>  #endif
>  
> -- 
> 2.0.2
> 
