Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHg-00027I-9L
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:25 +0000
Received: by mail-wm0-x242.google.com with SMTP id u144so5312239wmu.0
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:07 -0800 (PST)
Subject: Re: [PATCH 03/11] mtd: nand: denali: remove bogus comment about
 interrupt handler setup
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-4-git-send-email-yamada.masahiro@socionext.com>
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
Message-ID: <421bd929-f60f-78a9-d563-0b5972f48c0c@gmail.com>
Date: Sat, 12 Nov 2016 22:29:32 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-4-git-send-email-yamada.masahiro@socionext.com>
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
> The interrupt handler is setup in denali_init(), not in
> denali_drv_init().  This comment is false.
> 
> Such a comment adds no value, so just delete it instead of move.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 51ddb84..d6f1b29 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1436,7 +1436,6 @@ static int denali_ooblayout_free(struct mtd_info *mtd, int section,
>  /* initialize driver data structures */
>  static void denali_drv_init(struct denali_nand_info *denali)
>  {
> -	/* setup interrupt handler */
>  	/*
>  	 * the completion object will be used to notify
>  	 * the callee that the interrupt is done
> 


-- 
Best regards,
Marek Vasut
