Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUAA8-0007x6-9O
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 08:00:28 +0000
Received: by mail-pd0-f174.google.com with SMTP id v10so1609404pde.5
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 01:00:07 -0700 (PDT)
Date: Wed, 17 Sep 2014 01:00:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: nand: fix return code for uncorrectable error
Message-ID: <20140917080000.GA7362@norris-Latitude-E6410>
References: <1410731102-26765-1-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410731102-26765-1-git-send-email-hauke@hauke-m.de>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 14, 2014 at 11:45:02PM +0200, Hauke Mehrtens wrote:
> nand_correct_data() should return -EBADMSG when it finds an
> uncorrectable error and not just -1.

Why should it? Is there any bug here, or is this just a cosmetic fix
along the lines of "we should use meaningful error codes"?

> This is based on OpenWrt patch:
> https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.10/451-mtd-nand-fix-return-code-of-nand_correct_data-function.patcht
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/nand_ecc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index 97c4c02..244a634 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -507,7 +507,7 @@ int __nand_correct_data(unsigned char *buf,
>  		return 1;	/* error in ECC data; no action needed */
>  
>  	pr_err("%s: uncorrectable ECC error\n", __func__);
> -	return -1;
> +	return -EBADMSG;

I think this will break at least one piece of code which relies on the
fact that the implicit standard for the correct() function is that it
returns -1 for ECC errors; see drivers/mtd/tests/mtd_nandecctest.c:

static int double_bit_error_detect(void *error_data, void *error_ecc,
                                void *correct_data, const size_t size)
{
        unsigned char calc_ecc[3];
        int ret;

        __nand_calculate_ecc(error_data, size, calc_ecc);
        ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size);

        return (ret == -1) ? 0 : -EINVAL;
}

So, if you're going to change error codes like this, I'd prefer a little
more explanation and a more comprehensive look at the existing body of
code.

>  }
>  EXPORT_SYMBOL(__nand_correct_data);
>  

Brian
