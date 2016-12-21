Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJXjj-00035u-Cu
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 03:38:40 +0000
Received: by mail-wm0-x243.google.com with SMTP id l2so2449971wml.2
 for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2016 19:38:18 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: add support for ESMT_f25l32qa and
 ESMT_f25l64qa
To: John Crispin <john@phrozen.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1482266481-20700-1-git-send-email-john@phrozen.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Larry D. Pinney" <ldpinney@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4500be8e-56fe-5435-3f5a-cd7f20d1112e@gmail.com>
Date: Wed, 21 Dec 2016 04:37:14 +0100
MIME-Version: 1.0
In-Reply-To: <1482266481-20700-1-git-send-email-john@phrozen.org>
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

On 12/20/2016 09:41 PM, John Crispin wrote:
> From: "Larry D. Pinney" <ldpinney@gmail.com>
> 
> Add Support for the ESMT_F25L32QA and ESMT_F25L64QA
> These are 4MB and 8MB SPI NOR Chips from Elite Semiconductor Memory
> Technology
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Larry D. Pinney <ldpinney@gmail.com>

It looks OK:

Acked-by: Marek Vasut <marex@denx.de>

> ---
> Sorry, forgot to add this to the series I sent earlier
> 
>  drivers/mtd/spi-nor/spi-nor.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f9a41dc..ac4155d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -821,6 +821,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  
>  	/* ESMT */
>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
> +	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K) },
> +	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K) },
>  
>  	/* Everspin */
>  	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 


-- 
Best regards,
Marek Vasut
