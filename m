Received: from intranet.asianux.com ([58.214.24.6])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGRQk-0004Kv-N6
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 10:32:25 +0000
Message-ID: <522468DC.3080007@asianux.com>
Date: Mon, 02 Sep 2013 18:30:52 +0800
From: Chen Gang <gang.chen@asianux.com>
MIME-Version: 1.0
To: joern@lazybastard.org, dwmw2@infradead.org, dedekind1@gmail.com
Subject: Re: [PATCH] drivers: mtd: remove '__init' from phram_param_call()
 and ubi_mtd_param_parse()
References: <52245FBD.30202@asianux.com>
In-Reply-To: <52245FBD.30202@asianux.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/02/2013 05:51 PM, Chen Gang wrote:
> phram_param_call() and ubi_mtd_param_parse() are used by
> module_param_call(), usually, it need normal funcitons (no '__init'),
> so recommend to remove '__init' from them.
> 

If remove '__init' from them, also need remove many other '__init' or
'__initdata' from another functions or variables.

Is this warning harmless ? (it not harmless, it seems we'd better to
keep them no touch)


Thanks.

> The related warnings:
> 
>   WARNING: drivers/mtd/devices/phram.o(.data+0xc): Section mismatch in reference from the variable ___param_ops_phram to the variable .init.text:_phram_param_call
>   The variable ___param_ops_phram references
>   the variable __init _phram_param_call
>   If the reference is valid then annotate the
>   variable with __init* or __refdata (see linux/init.h) or name the variable:
>   *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>   
>   WARNING: drivers/mtd/ubi/ubi.o(.data+0x1a4): Section mismatch in reference from the variable ___param_ops_mtd to the variable .init.text:_ubi_mtd_param_parse
>   The variable ___param_ops_mtd references
>   the variable __init _ubi_mtd_param_parse
>   If the reference is valid then annotate the
>   variable with __init* or __refdata (see linux/init.h) or name the variable:
>   *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> 
> 
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  drivers/mtd/devices/phram.c |    2 +-
>  drivers/mtd/ubi/build.c     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 67823de..bd7496a 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -264,7 +264,7 @@ static int __init phram_setup(const char *val)
>  	return ret;
>  }
>  
> -static int __init phram_param_call(const char *val, struct kernel_param *kp)
> +static int phram_param_call(const char *val, struct kernel_param *kp)
>  {
>  	/*
>  	 * This function is always called before 'init_phram()', whether
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 315dcc6..c8b9493 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1382,7 +1382,7 @@ static int __init bytes_str_to_int(const char *str)
>   * This function returns zero in case of success and a negative error code in
>   * case of error.
>   */
> -static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
> +static int ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
>  {
>  	int i, len;
>  	struct mtd_dev_param *p;
> 


-- 
Chen Gang
