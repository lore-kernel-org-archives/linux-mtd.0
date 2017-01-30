Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYBdn-0001jS-Jf
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2017 13:05:07 +0000
Subject: Re: [PATCH V2 3/3] mtd: spi-nor: add support for ESMT_f25l32qa and
 ESMT_f25l64qa
To: John Crispin <john@phrozen.org>, Marek Vasut <marek.vasut@gmail.com>
References: <1482304990-23942-1-git-send-email-john@phrozen.org>
 <1482304990-23942-4-git-send-email-john@phrozen.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Larry
 D. Pinney" <ldpinney@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <215ff33d-29a2-e340-9ce9-8c623a11575c@atmel.com>
Date: Mon, 30 Jan 2017 14:04:39 +0100
MIME-Version: 1.0
In-Reply-To: <1482304990-23942-4-git-send-email-john@phrozen.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Le 21/12/2016 à 08:23, John Crispin a écrit :
> From: "Larry D. Pinney" <ldpinney@gmail.com>
> 
> Add Support for the ESMT_F25L32QA and ESMT_F25L64QA
> These are 4MB and 8MB SPI NOR Chips from Elite Semiconductor Memory
> Technology
> 
> Acked-by: Marek Vasut <marex@denx.de>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Larry D. Pinney <ldpinney@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index bfff159..2b150b5 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -821,6 +821,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  
>  	/* ESMT */
>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
> +	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K) },
> +	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K) },
>  

This patch cannot be applied to the github spi-nor tree.
Another recent patch [1] has updated the "f25l32pa" entry to add the
SPI_NOR_HAS_LOCK flag. I guess the "f25l{32|64}qa" entries need this flag
as well.

[1] on the spi-nor tree, commit 252c36bb9c7b ("mtd: spi-nor: Add
lock/unlock support for f25l32pa")

Best regards,

Cyrille


>  	/* Everspin */
>  	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 
