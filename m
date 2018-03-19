Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exr7M-0001nn-R0
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 09:30:20 +0000
Date: Mon, 19 Mar 2018 10:30:00 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: OuYang ZhiZhong <ouyzz@yealink.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oyzhizhong@gmail.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v4] mtdchar: fix usage of mtd_ooblayout_ecc()
Message-ID: <20180319103000.2c1902f7@bbrezillon>
In-Reply-To: <1520755147-4414-1-git-send-email-ouyzz@yealink.com>
References: <1520755147-4414-1-git-send-email-ouyzz@yealink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 11 Mar 2018 15:59:07 +0800
OuYang ZhiZhong <ouyzz@yealink.com> wrote:

> Section was not properly computed. The value of OOB region definition is
> always ECC section 0 information in the OOB area, but we want to get all
> the ECC bytes information, so we should call
> mtd_ooblayout_ecc(mtd, section++, &oobregion) until it returns -ERANGE.

Applied.

Thanks,

Boris

> 
> Fixes: c2b78452a9db ("mtd: use mtd_ooblayout_xxx() helpers where appropriate")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: OuYang ZhiZhong <ouyzz@yealink.com>
> ---
>  drivers/mtd/mtdchar.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index de8c902..7d80a8b 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -479,7 +479,7 @@ static int shrink_ecclayout(struct mtd_info *mtd,
>  	for (i = 0; i < MTD_MAX_ECCPOS_ENTRIES;) {
>  		u32 eccpos;
>  
> -		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
> +		ret = mtd_ooblayout_ecc(mtd, section++, &oobregion);
>  		if (ret < 0) {
>  			if (ret != -ERANGE)
>  				return ret;
> @@ -526,7 +526,7 @@ static int get_oobinfo(struct mtd_info *mtd, struct nand_oobinfo *to)
>  	for (i = 0; i < ARRAY_SIZE(to->eccpos);) {
>  		u32 eccpos;
>  
> -		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
> +		ret = mtd_ooblayout_ecc(mtd, section++, &oobregion);
>  		if (ret < 0) {
>  			if (ret != -ERANGE)
>  				return ret;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
