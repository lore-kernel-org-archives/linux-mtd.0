Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWYt-0003sk-WE
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:13:09 +0000
Received: by bwz14 with SMTP id 14so882098bwz.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:13:06 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: nand: add check for out of page read
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Liu <r64343@freescale.com>
In-Reply-To: <1290156045-11719-1-git-send-email-r64343@freescale.com>
References: <1290156045-11719-1-git-send-email-r64343@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 17:12:37 +0200
Message-ID: <1292339557.2538.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-11-19 at 16:40 +0800, Jason Liu wrote:
> When run mtd_oobtest case, there will be one error for step(4),
> which turned out it need add one check for out of page read in
> nand_do_read_oob just like mtd_do_write_oob did it already.
> This commit also fix one typo error for comments in mtd_do_write_oob
> 
> Signed-off-by: Jason Liu <r64343@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 1f75a1b..75d199e 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1782,6 +1782,13 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
>  	else
>  		len = mtd->oobsize;
>  
> +	/* Do not allow read past end of page */
> +	if ((ops->ooboffs + readlen) > len) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to read "
> +				"past end of page\n", __func__);
> +		return -EINVAL;
> +	}

As you reported to me in a private e-mail (although I prefer to always
have a public ML in CC when dealing with open source stuff) this patch
is wrong. Indeed, it limits the maximum amount of bytes which can be
read at one go to the OOB size, which is incorrect, because
mtd->read_oob() allows reading multiple pages at a time, see comment
near "struct mtd_oob_ops" at include/linux/mtd/mtd.h. So this patch
breaks ABI and hence, has to be reverted.

>  	if (unlikely(ops->ooboffs >= len)) {
>  		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start read "
>  					"outside oob\n", __func__);

Side note: nand_base.c has a bunch of senseless unlikely() hints, would
be nice to clean that up some day.

> -	/* Do not allow reads past end of device */
> +	/* Do not allow write past end of device */

Care to make this a separate clean-up patch meanwhile?

Thank!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
