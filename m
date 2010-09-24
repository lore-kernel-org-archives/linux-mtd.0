Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz3qb-0008Tf-EF
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 08:41:38 +0000
Received: by fxm4 with SMTP id 4so2037328fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:41:35 -0700 (PDT)
Subject: Re: [PATCH 1/2][MTD]MLC device check in OneNAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
In-Reply-To: <000101cb5b16$59d2dab0$0d789010$%hs@samsung.com>
References: <000101cb5b16$59d2dab0$0d789010$%hs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 11:39:53 +0300
Message-ID: <1285317593.29268.155.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: v.dalal@samsung.com, gupta.raghav@samsung.com,
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

Hi,

few minor things. I could just do this all myself, but since this is not
the first non-perfect patch you send, I think I'll be a little nasty and
ask you should do the exercise :-)

On Thu, 2010-09-23 at 17:26 +0530, Rohit Hassan Sathyanarayan wrote:
> Hi Artem,
> 
> Adding driver check for MLC flash type.
> 
> 
> Signed-off-by: Rohit HS <rohit.hs@samsung.com>
> Signed-off-by: Raghav Gupta <gupta.raghav@samsung.com>

1. Do no add extra line between the message and signed off.

2. Ideally, your patches should be applicable with git-am without the
   need to edit them. Try git am for your patches and see the result -
   the commit message will contain 'Hi Artem,' phrase, which should not
   be there.

> ---
>  drivers/mtd/onenand/onenand_base.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index a2bb520..33e0dbb 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -4027,7 +4027,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
>  	mtd->ecclayout = this->ecclayout;
>  
>  	/* Fill in remaining MTD driver data */
> -	mtd->type = MTD_NANDFLASH;
> +	mtd->type = ONENAND_IS_MLC(this) ? MTD_MLCNANDFLASH : MTD_NANDFLASH;
>  	mtd->flags = MTD_CAP_NANDFLASH;
>  	mtd->erase = onenand_erase;
>  	mtd->point = NULL;

The kernel does not compile with this patch. You should make this patch
the second, the first one should introduce MTD_MLCNANDFLASH.

The kernel has to be bisectable, you patches should not break
bisectability.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
