Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSWZM-0001p6-Sg
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 15:45:53 +0000
Received: by eyh6 with SMTP id 6so898455eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 08:45:51 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>, Roman Tereshonkov
	<roman.tereshonkov@nokia.com>
In-Reply-To: <20110602064832.GA7319@july>
References: <20110602064832.GA7319@july>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:41:41 +0300
Message-ID: <1307115701.3069.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-02 at 15:48 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> There's no case to use the subpage for 4KiB pagesize.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index ac9e959..337be7c 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -4047,13 +4047,11 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
>  	 */
>  	switch (mtd->oobsize) {
>  	case 128:
> -		if (FLEXONENAND(this)) {
> +		if (FLEXONENAND(this))
>  			this->ecclayout = &flexonenand_oob_128;
> -			mtd->subpage_sft = 0;
> -		} else {
> +		else
>  			this->ecclayout = &onenand_oob_128;
> -			mtd->subpage_sft = 2;
> -		}
> +		mtd->subpage_sft = 0;
>  		break;
>  	case 64:
>  		this->ecclayout = &onenand_oob_64;

Roman, are you happy with this change?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
