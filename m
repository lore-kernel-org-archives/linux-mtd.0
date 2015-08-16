Received: from mail-qg0-f43.google.com ([209.85.192.43])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZR5fq-0006Ap-O1
 for linux-mtd@lists.infradead.org; Sun, 16 Aug 2015 21:41:03 +0000
Received: by qged69 with SMTP id d69so82699525qge.0
 for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2015 14:40:37 -0700 (PDT)
Date: Sun, 16 Aug 2015 18:36:55 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 3/3] mtd: nand: pxa3xx-nand: fix readid without keep_config
Message-ID: <20150816213655.GA4585@laptop.cereza>
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <1439323034-8820-3-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439323034-8820-3-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 Aug 09:57 PM, Robert Jarzmik wrote:
> The cases of READID detection are broken on pxa3xx. The reason is that
> in the early stages of nand probing, ie. at pxa3xx_nand_scan(), we
> always have :
>  - info->use_dma = 0 (regardless of dma support yet)
>  - info->chunk_size = 0 (not yet detected)
> 
> The READID issued by pxa3xx_nand_scan() will therefore end up in
> handle_data_pio(), and do_bytes will be 0, leading to not reading the
> nand id, and blocking detection.
> 
> This doesn't happen if "keep_config" is used, which is probably the most
> tested case.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Fixes: 70ed85232a93 ("mtd: nand: pxa3xx: Introduce multiple page I/O
> support")

To be fair, Antoine submitted this a while ago:

http://lists.infradead.org/pipermail/linux-mtd/2015-April/058739.html

Not sure which one takes precedence in such a case (and yours
has a proper Fixes tag).

> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index edfe329cc9db..b0737aec7caf 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1482,6 +1482,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  	int i, ret, num;
>  	uint16_t ecc_strength, ecc_step;
>  
> +	info->chunk_size = 512;
>  	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
>  		goto KEEP_CONFIG;
>  
> -- 
> 2.1.4
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
