Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YM1SZ-0006CO-PE
 for linux-mtd@lists.infradead.org; Thu, 12 Feb 2015 21:38:08 +0000
Received: by mail-pa0-f44.google.com with SMTP id kq14so14089751pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Feb 2015 13:37:45 -0800 (PST)
Date: Thu, 12 Feb 2015 13:37:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: hisilicon: && vs & typo
Message-ID: <20150212213740.GA18140@ld-irv-0074>
References: <20150211102509.GB18515@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150211102509.GB18515@mwanda>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Zhou Wang <wangzhou1@hisilicon.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
> The intent was to mask away some bits here, not to test true or false.
> 
> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
> index 484e1db..289ad3a 100644
> --- a/drivers/mtd/nand/hisi504_nand.c
> +++ b/drivers/mtd/nand/hisi504_nand.c
> @@ -495,7 +495,7 @@ static void hisi_nfc_cmdfunc(struct mtd_info *mtd, unsigned command, int column,
>  		flag = hinfc_read(host, HINFC504_CON);
>  		if (chip->ecc.mode == NAND_ECC_HW)
>  			hinfc_write(host,
> -				    flag && ~(HINFC504_CON_ECCTYPE_MASK <<
> +				    flag & ~(HINFC504_CON_ECCTYPE_MASK <<

Looks good to me. Zhou, can I get an ack?

>  				    HINFC504_CON_ECCTYPE_SHIFT), HINFC504_CON);
>  
>  		host->offset = 0;

Brian
