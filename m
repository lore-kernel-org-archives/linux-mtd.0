Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHs-00028b-Fk
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:39 +0000
Received: by mail-wm0-x243.google.com with SMTP id u144so5312781wmu.0
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:15 -0800 (PST)
Subject: Re: [PATCH 08/11] mtd: nand: denali: return error code from
 devm_request_irq() on error
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-9-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Richard Weinberger <richard@nod.at>,
 Jason Roberts <jason.e.roberts@intel.com>, linux-kernel@vger.kernel.org,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>,
 Alan Cox <alan@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2e07f61f-1d93-cb41-f3b7-81481c058a5e@gmail.com>
Date: Sat, 12 Nov 2016 22:39:46 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-9-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
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
> The devm_request_irq() returns an appropriate error value when it
> fails.  Use it instead of the fixed -ENODEV.
> 
> While we are here, reword the comment to make it fit in a single
> line, fixing the misspelling of "initialization".
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 44e075a..f188a48 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1451,14 +1451,12 @@ int denali_init(struct denali_nand_info *denali)
>  	denali_hw_init(denali);
>  	denali_drv_init(denali);
>  
> -	/*
> -	 * denali_isr register is done after all the hardware
> -	 * initilization is finished
> -	 */
> -	if (devm_request_irq(denali->dev, denali->irq, denali_isr, IRQF_SHARED,
> -			     DENALI_NAND_NAME, denali)) {
> +	/* request IRQ after all the hardware initialization is finished */

You can use capital letter to start the sentence -- Request ....

Otherwise:
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> +	ret = devm_request_irq(denali->dev, denali->irq, denali_isr,
> +			       IRQF_SHARED, DENALI_NAND_NAME, denali);
> +	if (ret) {
>  		dev_err(denali->dev, "Unable to request IRQ\n");
> -		return -ENODEV;
> +		return ret;
>  	}
>  
>  	/* now that our ISR is registered, we can enable interrupts */
> 


-- 
Best regards,
Marek Vasut
