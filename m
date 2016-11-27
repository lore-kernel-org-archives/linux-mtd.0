Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB18V-0007DX-UH
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 15:13:00 +0000
Date: Sun, 27 Nov 2016 16:12:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 04/39] mtd: nand: denali: remove more unused struct members
Message-ID: <20161127161238.750ca39a@bbrezillon>
In-Reply-To: <1480183585-592-5-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-5-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:05:50 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

Please add a description here.

Also, this commit tends to validate my fears: you should have wait for
the full rework/cleanup to be done before submitting the first round of
cleanups. Indeed, commit c4ae0977f57d ("mtd: nand: denali: remove unused
struct member denali_nand_info::idx") was removing one of these unused
fields, leaving 2 of them behind.

While I like when things I clearly separated in different commits, when
you push the logic too far, you end up with big series which are not
necessarily easier to review, and several commits that are achieving
the same goal...

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index fd1ae08..4fad43b 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -407,7 +407,6 @@ struct denali_nand_info {
>  	struct nand_buf buf;
>  	struct device *dev;
>  	int total_used_banks;
> -	uint32_t block;  /* stored for future use */
>  	uint16_t page;
>  	void __iomem *flash_reg;  /* Mapped io reg base address */
>  	void __iomem *flash_mem;  /* Mapped io reg base address */
> @@ -416,7 +415,6 @@ struct denali_nand_info {
>  	struct completion complete;
>  	spinlock_t irq_lock;
>  	uint32_t irq_status;
> -	int irq_debug_array[32];
>  	int irq;
>  
>  	uint32_t devnum;	/* represent how many nands connected */
