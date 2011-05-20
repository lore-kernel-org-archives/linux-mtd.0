Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNIay-0003un-OE
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 05:49:57 +0000
Received: by ewy3 with SMTP id 3so1283802ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 22:49:55 -0700 (PDT)
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: maxin <john.maxin@nokia.com>
In-Reply-To: <4DD3B4C2.30301@nokia.com>
References: <4DD3B4C2.30301@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 08:46:05 +0300
Message-ID: <1305870365.2630.92.camel@localhost>
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

On Wed, 2011-05-18 at 13:00 +0100, maxin wrote:
> This patch fixes the possible null dereference of the variable "oinfo"
> Thanks to Coverity for spotting this.
> 
> Signed-off-by: Maxin B. John <john.maxin@nokia.com>
> ---
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index fed215c..863987c 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -1450,7 +1450,12 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
>  	}
>  
>  	oinfo = mtd->ecclayout;
> -	if (!mtd->oobsize || !oinfo || oinfo->oobavail < MTDSWAP_OOBSIZE) {
> +	if (!oinfo) {
> +		printk(KERN_ERR "Not enough free bytes available for ECC");
> +		return;
> +	}

Does this print makes sense? Which ECC? I think it should me something
like "mtd% does not have OOB", mtd->index.

Moreover, you should make the print consistent with the other prints
which start with MTDSWAP_PREFIX.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
