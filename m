From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>
References: <470F200A.9090404@nokia.com>
Subject: RE: [PATCH] MTD: OneNAND: Return only negative error codes
Date: Fri, 12 Oct 2007 18:30:34 +0900
Message-ID: <003801c80cb2$8d594910$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <470F200A.9090404@nokia.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The OneNAND driver was confusing JFFS2 by returning positive error
> codes.

It's only possible the write case error and it returns the positive 'ctrl' error.
Other case, "2-bit ecc error' is handled with 'mtd->ecc_stat' correctly.

Well, no problem to change to the negative value.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

> 
> ---
>  drivers/mtd/onenand/onenand_base.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index f633941..a8c426b 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -327,7 +327,7 @@ static int onenand_wait(struct mtd_info *mtd, int state)
>  		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n", ctrl);
>  		if (ctrl & ONENAND_CTRL_LOCK)
>  			printk(KERN_ERR "onenand_wait: it's locked error.\n");
> -		return ctrl;
> +		return -EIO;
>  	}
> 
>  	if (interrupt & ONENAND_INT_READ) {
> @@ -336,7 +336,7 @@ static int onenand_wait(struct mtd_info *mtd, int state)
>  			if (ecc & ONENAND_ECC_2BIT_ALL) {
>  				printk(KERN_ERR "onenand_wait: ECC error = 0x%04x\n", ecc);
>  				mtd->ecc_stats.failed++;
> -				return ecc;
> +				return -EBADMSG;
>  			} else if (ecc & ONENAND_ECC_1BIT_ALL) {
>  				printk(KERN_INFO "onenand_wait: correctable ECC error = 0x%04x\n", ecc);
>  				mtd->ecc_stats.corrected++;
> --
> 1.4.4.2
