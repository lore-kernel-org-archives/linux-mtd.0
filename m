Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHl-00028W-9b
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:30 +0000
Received: by mail-wm0-x242.google.com with SMTP id u144so5312687wmu.0
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:13 -0800 (PST)
Subject: Re: [PATCH 07/11] mtd: nand: denali: use managed devm_irq_request()
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-8-git-send-email-yamada.masahiro@socionext.com>
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
Message-ID: <a5f5bd0f-0a80-8562-472a-6f6224cdead7@gmail.com>
Date: Sat, 12 Nov 2016 22:38:47 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-8-git-send-email-yamada.masahiro@socionext.com>
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
> Use the managed variant instead of request_irq() and free_irq().
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 548278b..44e075a 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -575,7 +575,6 @@ static void denali_irq_init(struct denali_nand_info *denali)
>  static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
>  {
>  	denali_set_intr_modes(denali, false);
> -	free_irq(irqnum, denali);
>  }
>  
>  static void denali_irq_enable(struct denali_nand_info *denali,
> @@ -1456,8 +1455,8 @@ int denali_init(struct denali_nand_info *denali)
>  	 * denali_isr register is done after all the hardware
>  	 * initilization is finished
>  	 */
> -	if (request_irq(denali->irq, denali_isr, IRQF_SHARED,
> -			DENALI_NAND_NAME, denali)) {
> +	if (devm_request_irq(denali->dev, denali->irq, denali_isr, IRQF_SHARED,
> +			     DENALI_NAND_NAME, denali)) {
>  		dev_err(denali->dev, "Unable to request IRQ\n");
>  		return -ENODEV;
>  	}
> 


-- 
Best regards,
Marek Vasut
