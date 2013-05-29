Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhaS9-0006FN-Ms
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 07:05:46 +0000
Message-ID: <1369811298.5446.215.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtdchar: Exit write loop when hitting end of OTP
 memory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Date: Wed, 29 May 2013 10:08:18 +0300
In-Reply-To: <29483dd6-387c-4b28-b689-88795e0bbbde@mary.at.omicron.at>
References: <29483dd6-387c-4b28-b689-88795e0bbbde@mary.at.omicron.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-04-26 at 19:56 +0200, Christian Riesch wrote:
> If a write to one time programmable memory (OTP) hits the end
> of this memory area, no more data can be written and count does not
> decrease anymore. We are trapped in the loop forever.
> 
> Therefore drop the remaining data if retlen != len.
> 
> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
> ---
>  drivers/mtd/mtdchar.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index e0e59bf..70c18c2 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -321,6 +321,10 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
>  		case MTD_FILE_MODE_OTP_USER:
>  			ret = mtd_write_user_prot_reg(mtd, *ppos, len,
>  						      &retlen, kbuf);
> +
> +			/* if we hit the end of otp memory, drop the rest */
> +			if (retlen != len)
> +				count -= len - retlen;
>  			break;

I think the problem is that 'mtd_write_user_prot_reg()' should return an
error if you try to write more data than it is available. At least this
is the behavior of 'mtd_write()'.

-- 
Best Regards,
Artem Bityutskiy
