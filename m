Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QNPNk-0006ay-0c
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 13:04:44 +0000
Received: by wyb28 with SMTP id 28so3427012wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 06:04:42 -0700 (PDT)
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: maxin <john.maxin@nokia.com>
In-Reply-To: <4DD65673.8080801@nokia.com>
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>
	<4DD65673.8080801@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 13:20:01 +0300
Message-ID: <1305886801.2630.132.camel@localhost>
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

On Fri, 2011-05-20 at 12:54 +0100, maxin wrote:
> > Moreover, you should make the print consistent with the other prints
> > which start with MTDSWAP_PREFIX.
> > 
> 
> I have updated the patch as per your comments.
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

Sorry, but if I save this e-mail and feed it to "git am", the commit
message will contain the discussion (with quotes, etc), not the nice
original commit message. Would you please, send a patch which I can just
save and "git am"?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
