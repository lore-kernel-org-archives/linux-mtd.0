Received: from ug-out-1314.google.com ([66.249.92.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iumff-0001Nc-Me
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 05:19:10 -0500
Received: by ug-out-1314.google.com with SMTP id 23so64559ugr
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 02:19:02 -0800 (PST)
To: rpurdie@openedhand.com
Subject: Re: [PATCH] mtdoops cleanup
References: <87wssvve0t.fsf@nanv.dk>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2007 11:18:47 +0100
In-Reply-To: <87wssvve0t.fsf@nanv.dk> (Peter Korsgaard's message of "Tue\,
	06 Nov 2007 11\:56\:02 +0100")
Message-ID: <87lk8rgauw.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Peter" == Peter Korsgaard <jacmet@sunsite.dk> writes:

Comments?

 Peter> Use memcpy instead of open coding a copy loop.
 Peter> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Peter> ---
 Peter>  drivers/mtd/mtdoops.c |    7 ++-----
 Peter>  1 files changed, 2 insertions(+), 5 deletions(-)

 Peter> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
 Peter> index f8af627..20eaf29 100644
 Peter> --- a/drivers/mtd/mtdoops.c
 Peter> +++ b/drivers/mtd/mtdoops.c
 Peter> @@ -286,7 +286,6 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 Peter>  {
 Peter>  	struct mtdoops_context *cxt = co->data;
 Peter>  	struct mtd_info *mtd = cxt->mtd;
 Peter> -	int i;
 
 Peter>  	if (!oops_in_progress) {
 Peter>  		mtdoops_console_sync();
 Peter> @@ -305,10 +304,8 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 Peter>  	if ((count + cxt->writecount) > OOPS_PAGE_SIZE)
 Peter>  		count = OOPS_PAGE_SIZE - cxt->writecount;
 
 Peter> -	for (i = 0; i < count; i++, s++)
 Peter> -		*((char *)(cxt->oops_buf) + cxt->writecount + i) = *s;
 Peter> -
 Peter> -	cxt->writecount = cxt->writecount + count;
 Peter> +	memcpy(cxt->oops_buf + cxt->writecount, s, count);
 Peter> +	cxt->writecount += count;
 Peter>  }
 
 Peter>  static int __init mtdoops_console_setup(struct console *co, char *options)
 Peter> -- 
 Peter> 1.5.3.4

 Peter> -- 
 Peter> Bye, Peter Korsgaard

 Peter> ______________________________________________________
 Peter> Linux MTD discussion mailing list
 Peter> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Bye, Peter Korsgaard
