Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aargU-0002Hz-Ih
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2016 21:18:27 +0000
Date: Tue, 1 Mar 2016 22:17:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: fcooper@ti.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com
Subject: Re: [PATCH] mtd: nand: tests: fix regression introduced in
 mtd_nandectest
Message-ID: <20160301221755.093f5223@bbrezillon>
In-Reply-To: <1456866240-26119-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1456866240-26119-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

Hi Jorge,

On Tue,  1 Mar 2016 16:04:00 -0500
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> Offending Commit: 6e94119 "mtd: nand: return consistent error codes in
> ecc.correct() implementations"
> 
> The new error code was not being handled properly in double bit error
> detection.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> ---
>  drivers/mtd/tests/mtd_nandecctest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
> index 7931615..88b6c81 100644
> --- a/drivers/mtd/tests/mtd_nandecctest.c
> +++ b/drivers/mtd/tests/mtd_nandecctest.c
> @@ -187,7 +187,7 @@ static int double_bit_error_detect(void *error_data, void *error_ecc,
>  	__nand_calculate_ecc(error_data, size, calc_ecc);
>  	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size);
>  
> -	return (ret == -1) ? 0 : -EINVAL;
> +	return (ret == -EBADMSG) ? 0 : -EINVAL;
>  }
>  
>  static const struct nand_ecc_test nand_ecc_test[] = {



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
