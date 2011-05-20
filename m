Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNOxe-0007te-4l
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 12:37:47 +0000
Received: by wwb39 with SMTP id 39so2863359wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 05:37:32 -0700 (PDT)
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: maxin <john.maxin@nokia.com>
In-Reply-To: <4DD66B11.4070605@nokia.com>
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>
	<4DD65673.8080801@nokia.com> <1305886801.2630.132.camel@localhost>
	<4DD66B11.4070605@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 15:08:08 +0300
Message-ID: <1305893288.2630.141.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-20 at 14:22 +0100, maxin wrote:
> This patch fixes the possible null dereference of the variable "oinfo"
> Thanks to Coverity for spotting this.
> 
> Signed-off-by: Maxin B. John <john.maxin@nokia.com>
> ---
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index fed215c..62ddb3a 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -1450,7 +1450,13 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
>  	}
>  
>  	oinfo = mtd->ecclayout;
> -	if (!mtd->oobsize || !oinfo || oinfo->oobavail < MTDSWAP_OOBSIZE) {
> +	if (!oinfo) {
> +		printk(KERN_ERR "%s: mtd%d does not have OOB"
> +			"\n", MTDSWAP_PREFIX, mtd->index);

Sorry for not noticing this immediately, but we never split the strings
if it is not really necessary. What is the fundamental reason to put
"\n" separately?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
