Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUGbo-0000m8-5s
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 11:07:37 +0000
Received: by fxm14 with SMTP id 14so308542fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 04:07:32 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20110608015625.GA27537@july>
References: <20110608015625.GA27537@july>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 14:03:14 +0300
Message-ID: <1307530994.31223.46.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 10:56 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> There are two different 4KiB pagesize chips
> KFM4G16Q4M series have NOP 4 with version ID 0x0131
> But KFM4G16Q5M has NOP 1 with versoin ID 0x013e
> 
> Note that Q5M means that it has NOP 1.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index ac9e959..2adca63 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -3429,6 +3429,13 @@ static void onenand_check_features(struct mtd_info *mtd)
>  		else if (numbufs == 1) {
>  			this->options |= ONENAND_HAS_4KB_PAGE;
>  			this->options |= ONENAND_HAS_CACHE_PROGRAM;
> +			/*
> +			 * There are two different 4KiB pagesize chips
> +			 * KFM4G16Q4M has NOP 4 with version ID 0x0131
> +			 * KFM4G16Q5M has NOP 1 with versoin ID 0x013e
> +			 */

If you confirm that it is impossible to detect NOP and distinguish
between KFM4G16Q4M and KFM4G16Q5M, then can we take the following steps:

1. Add a comment that this is a hacky quirk to work around HW
   identification flaw, to make it clear for the people who read the
   code.
2. Make sure the default is NOP4 (you already do).
3. Compare _both_ device ID and version ID. This means that we'll end up
   with NOP1 only for your device, all the other will be NOP4. If then
   someone has issues, they'll have to reporte about them and add their
   device ID to this hack.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
