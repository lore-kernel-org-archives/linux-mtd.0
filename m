Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N091l-0007pM-SI
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 07:21:10 +0000
Subject: Re: [PATCH] UBI: Fix check on unsigned in ytes_str_to_int()
From: Artem Bityutskiy <dedekind@infradead.org>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4AD86051.2040302@gmail.com>
References: <4AD86051.2040302@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Oct 2009 10:20:17 +0300
Message-Id: <1256023217.29856.122.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-16 at 14:00 +0200, Roel Kluin wrote:
> result is unsigned, the wrong check was used.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index e1f7d0a..14cec04 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -42,6 +42,7 @@
>  #include <linux/log2.h>
>  #include <linux/kthread.h>
>  #include <linux/reboot.h>
> +#include <linux/kernel.h>
>  #include "ubi.h"
>  
>  /* Maximum length of the 'mtd=' parameter */
> @@ -1257,7 +1258,7 @@ static int __init bytes_str_to_int(const char *str)
>  	unsigned long result;
>  
>  	result = simple_strtoul(str, &endp, 0);
> -	if (str == endp || result < 0) {
> +	if (str == endp || result >= INT_MAX) {
>  		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
>  		       str);
>  		return -EINVAL;

Pushed to ubi-2.6 tree, will send to Linus soon, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
