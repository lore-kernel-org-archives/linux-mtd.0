Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBoYS-0007Sq-3Q
 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2013 15:40:57 +0000
Message-ID: <1362238884.2745.28.camel@sauron>
Subject: Re: [PATCH] mtdchar: handle chips that have user otp but no factory
 otp
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Sat, 02 Mar 2013 17:41:24 +0200
In-Reply-To: <1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-02-18 at 11:19 +0100, Uwe Kleine-König wrote:
> Before this patch mtd_read_fact_prot_reg was used to check availability
> for both MTD_OTP_FACTORY and MTD_OTP_USER access. This made accessing
> user otp for chips that don't have a factory otp area impossible. So use
> the right wrapper depending on the intended area to be accessed.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> I'm currently working on accessing the user otp area of MT29F2G nand
> flash that doesn't have a factory otp. Reading and writing are not ready
> yet, but this change is an obvious prerequisite.
> 
> Best regards
> Uwe
> 
>  drivers/mtd/mtdchar.c |   30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index a6e7451..1f4034a 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -371,26 +371,34 @@ static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
>  	struct mtd_info *mtd = mfi->mtd;
>  	size_t retlen;
>  	int ret = 0;
> -
> -	/*
> -	 * Make a fake call to mtd_read_fact_prot_reg() to check if OTP
> -	 * operations are supported.
> -	 */
> -	if (mtd_read_fact_prot_reg(mtd, -1, 0, &retlen, NULL) == -EOPNOTSUPP)
> -		return -EOPNOTSUPP;
> +	int (*func)(struct mtd_info *, loff_t, size_t, size_t *, u_char *) =
> +		NULL;
> +	enum mtd_file_modes outmode = MTD_FILE_MODE_NORMAL;

In this particular case when we only have 2 modes I'd prefer to not
introduce a function pointer variable but directly call the function.
>  
>  	switch (mode) {
>  	case MTD_OTP_FACTORY:
> -		mfi->mode = MTD_FILE_MODE_OTP_FACTORY;
> +		outmode = MTD_FILE_MODE_OTP_FACTORY;
> +		func = mtd_read_fact_prot_reg;
>  		break;
>  	case MTD_OTP_USER:
> -		mfi->mode = MTD_FILE_MODE_OTP_USER;
> +		outmode = MTD_FILE_MODE_OTP_USER;
> +		func = mtd_read_user_prot_reg;
>  		break;
> -	default:
> -		ret = -EINVAL;
>  	case MTD_OTP_OFF:
>  		break;
> +	default:
> +		ret = -EINVAL;

Probably in this case you need to 'return -EINVAL', otherwise you modify
'mfi->mode' below which is an unexpected side-effect of '-EINVAL'.
>  	}
> +
> +	/*
> +	 * Make a fake call to mtd_read_fact_prot_reg() or
> +	 * mtd_read_user_prot_reg() to check if OTP operations are supported.
> +	 */
> +	if (func && func(mtd, -1, 0, &retlen, NULL) == -EOPNOTSUPP)
> +		return -EOPNOTSUPP;
> +
> +	mfi->mode = outmode;
> +
>  	return ret;
>  }
>  #else

-- 
Best Regards,
Artem Bityutskiy
