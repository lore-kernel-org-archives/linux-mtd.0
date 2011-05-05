Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QI3hn-0000Ng-D5
	for linux-mtd@lists.infradead.org; Thu, 05 May 2011 18:55:20 +0000
Received: by eyh6 with SMTP id 6so847689eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 May 2011 11:55:17 -0700 (PDT)
Subject: Re: [PATCH] add a check to prevent the incrementing of possible
	NULL value for "region" in onenand_base.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: john.maxin@nokia.com
In-Reply-To: <77DFD0EF40BC5042BB7221A1EFFF75709578@008-AM1MPN1-021.mgdnok.nokia.com>
References: <77DFD0EF40BC5042BB7221A1EFFF75709578@008-AM1MPN1-021.mgdnok.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 May 2011 21:51:39 +0300
Message-ID: <1304621499.7222.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-05-04 at 11:26 +0000, john.maxin@nokia.com wrote:
> Hi,
> 
> Coverity has reported that inside the function "onenand_block_by_block_erase()" in onenand_base.c, we should add checks to prevent the incrementing of possible NULL value for "region"
> Thanks a lot to Adrian Hunter for suggesting a better solution.
> 
> Signed-off-by: Maxin B. John <john.maxin@nokia.com>

The commit message should not contain that long lines - use max 80
lines. The commit message should not start with "Hi". The subject should
be short and more high level - the details go to the commit message.
Could you please improve this and re-submit?

> ---
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index 56a8b20..fd659f8 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2424,7 +2424,7 @@ static int onenand_block_by_block_erase(struct mtd_info *mtd,
>                 len -= block_size;
>                 addr += block_size;
> 
> -               if (addr == region_end) {
> +               if (region && addr == region_end) {
>                         if (!len)
>                                 break;
>                         region++;
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
