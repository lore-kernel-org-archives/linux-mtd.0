Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZyl-0001l5-Qb
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 07:48:37 +0000
Received: by fxm14 with SMTP id 14so1137869fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 00:48:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 10:44:16 +0300
Message-ID: <1307605456.7374.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 11:25 -0700, Brian Norris wrote:
> Also fix some punctuation, indentation, and capitalization that went
> along with the affected lines.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c |   65 ++++++++++++++++++++----------------------
>  drivers/mtd/nand/nand_bbt.c  |   39 ++++++++++++-------------
>  2 files changed, 50 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 019187b..7550cea 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2167,8 +2167,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
>  
>  	/* Reject writes, which are not page aligned */
>  	if (NOTALIGNED(to) || NOTALIGNED(ops->len)) {
> -		printk(KERN_NOTICE "%s: Attempt to write not "
> -				"page aligned data\n", __func__);
> +		pr_notice("%s: attempt to write non page aligned data\n",
> +			   __func__);
>  		return -EINVAL;

Wait, and why are we using pr_* while it is better to use dbg_* ? :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
