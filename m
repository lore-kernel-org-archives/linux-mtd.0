Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mtiy7-0006HV-5y
	for linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 14:18:53 +0000
Date: Fri, 2 Oct 2009 16:18:37 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Aaro Koskinen <aaro.koskinen@nokia.com>
Subject: Re: [PATCH 1/2] mtdoops: do not schedule work if we are going to die
Message-ID: <20091002161837.18a5ac94@marrow.netinsight.se>
In-Reply-To: <1254410216-24444-1-git-send-email-aaro.koskinen@nokia.com>
References: <1254410216-24444-1-git-send-email-aaro.koskinen@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	aaro.koskinen@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was working on the same fix :-)

On Thu,  1 Oct 2009 18:16:55 +0300
Aaro Koskinen <aaro.koskinen@nokia.com> wrote:

> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 1060337..ac67833 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
>  	cxt->ready = 0;
>  	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
>  
> -	if (mtd->panic_write && in_interrupt())
> +	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
>  		/* Interrupt context, we're going to panic so try and log */
>  		mtdoops_write(cxt, 1);

I believe we'll also need to make this module in-kernel with this
change, since panic_on_oops is not exported. I've sent another patch
that does these two things together.

I also get problems when mtd->read is called from mtdoops_inc_counter,
so my patch also skips this if we have panic_on_oops set (there is also
no point since the board will hang / be restarted after that).

// Simon
