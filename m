Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5Dq3-0002eo-8F
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 07:30:04 +0000
Subject: Re: [PATCH v12 4/4]: mtdoops: refactor as a kmsg_dumper
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091029134123.348b5126@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 09:29:52 +0200
Message-Id: <1257233392.21596.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-29 at 13:41 +0100, Simon Kagstrom wrote:
> The last messages which happens before a crash might contain interesting
> information about the crash. This patch reworks mtdoops using the
> kmsg_dumper support instead of a console, which simplifies the code and
> also includes the messages before the oops started.
> 
> On oops callbacks, the MTD device write is scheduled in a work queue (to
> be able to use the regular mtd->write call), while panics call
> mtd->panic_write directly. Thus, if panic_on_oops is set, the oops will
> be written out during the panic.
> 
> A parameter to specify which mtd device to use (number or name), as well
> as a flag, writable at runtime, to toggle wheter to dump oopses or only
> panics (since oopses can often be handled by regular syslog).
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
> ---
> ChangeLog:
>   * Rebased on top of "[PATCH v12 3/4]: mtdoops: Make page (record) size configurable"
> 
>  drivers/mtd/Kconfig   |    5 +-
>  drivers/mtd/mtdoops.c |  218 +++++++++++++++++++++----------------------------
>  2 files changed, 96 insertions(+), 127 deletions(-)
> 

... snip ...

> -static int __init mtdoops_console_init(void)
> +static int __init mtdoops_init(void)
>  {
>  	struct mtdoops_context *cxt = &oops_cxt;
> +	int mtd_index;
> +	char *endp;
>  
> +	if (strlen(mtddev) == 0) {
> +		printk(KERN_ERR "mtdoops: mtd device (mtddev=name/number) must be supplied\n");
> +		return -EINVAL;
> +	}
>  	if ((record_size & 4095) != 0) {
>  		printk(KERN_ERR "mtdoops: record_size must be a multiple of 4096\n");
>  		return -EINVAL;
> @@ -461,36 +426,39 @@ static int __init mtdoops_console_init(void)
>  		printk(KERN_ERR "mtdoops: record_size must be over 4096 bytes\n");
>  		return -EINVAL;
>  	}
> +
> +	/* Setup the MTD device to use */
>  	cxt->mtd_index = -1;
> +	mtd_index = simple_strtoul(mtddev, &endp, 0);
> +	if (endp != mtddev)
> +		cxt->mtd_index = mtd_index;

I think you should instead do

if (*endp == '\0')
	cxt->mtd_index = mtd_index;

instead. Otherwise the code will tread 'mtddev == 1xyz' as mtd1, which
is wrong.

And some sanity check to mtd_index would be nice, e.g., a check against
MAX_MTD_DEVICES.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
