Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHs-00028f-Eu
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:38 +0000
Received: by mail-wm0-x243.google.com with SMTP id m203so5292603wma.3
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:17 -0800 (PST)
Subject: Re: [PATCH 09/11] mtd: nand: denali: return error code from
 nand_scan_ident/tail on error
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-10-git-send-email-yamada.masahiro@socionext.com>
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Dinh Nguyen
 <dinguyen@altera.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2c28311c-bef0-a3f4-7b65-51bf122f5911@gmail.com>
Date: Sat, 12 Nov 2016 22:40:03 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-10-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/09/2016 05:35 AM, Masahiro Yamada wrote:
> The nand_scan_ident/tail() returns an appropriate error value when
> it fails.  Use it instead of the fixed -ENXIO.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index f188a48..d482d8d 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1474,10 +1474,9 @@ int denali_init(struct denali_nand_info *denali)
>  	 * this is the first stage in a two step process to register
>  	 * with the nand subsystem
>  	 */
> -	if (nand_scan_ident(mtd, denali->max_banks, NULL)) {
> -		ret = -ENXIO;
> +	ret = nand_scan_ident(mtd, denali->max_banks, NULL);
> +	if (ret)
>  		goto failed_req_irq;
> -	}
>  
>  	/* allocate the right size buffer now */
>  	devm_kfree(denali->dev, denali->buf.buf);
> @@ -1580,10 +1579,9 @@ int denali_init(struct denali_nand_info *denali)
>  	denali->nand.ecc.write_oob = denali_write_oob;
>  	denali->nand.erase = denali_erase;
>  
> -	if (nand_scan_tail(mtd)) {
> -		ret = -ENXIO;
> +	ret = nand_scan_tail(mtd);
> +	if (ret)
>  		goto failed_req_irq;
> -	}
>  
>  	ret = mtd_device_register(mtd, NULL, 0);
>  	if (ret) {
> 


-- 
Best regards,
Marek Vasut
