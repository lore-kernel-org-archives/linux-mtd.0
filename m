Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTtTH-0001t5-UY
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 08:48:32 +0000
Received: by fxm22 with SMTP id 22so23083560fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 00:48:27 -0800 (PST)
Subject: Re: [PATCH] omap2/3: mtd: fix compile warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sanjeev Premi <premi@ti.com>
In-Reply-To: <1262082892-5260-1-git-send-email-premi@ti.com>
References: <1262082892-5260-1-git-send-email-premi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 10:48:21 +0200
Message-Id: <1263113301.7315.130.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-12-29 at 16:04 +0530, Sanjeev Premi wrote:
> This patch fixes following compile warning:
> 
> drivers/mtd/nand/omap2.c:508: warning: passing argumen
> t 2 of 'omap_nand_dma_transfer' discards qualifiers fr
> om pointer target type
> 
> Signed-off-by: Sanjeev Premi <premi@ti.com>
> ---
>  drivers/mtd/nand/omap2.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 1bb799f..08c193c 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -505,7 +505,7 @@ static void omap_write_buf_dma_pref(struct mtd_info *mtd,
>  		omap_write_buf_pref(mtd, buf, len);
>  	else
>  		/* start transfer in DMA mode */
> -		omap_nand_dma_transfer(mtd, buf, len, 0x1);
> +		omap_nand_dma_transfer(mtd, (void *)buf, len, 0x1);
>  }

Pushed this patch to my l2-mtd-2.6/dunno tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
