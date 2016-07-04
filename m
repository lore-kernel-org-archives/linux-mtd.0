Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK3CN-0005jr-8i
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 12:42:03 +0000
Date: Mon, 4 Jul 2016 14:41:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: jz4780: Update MODULE_AUTHOR email address
Message-ID: <20160704144141.7daedb14@bbrezillon>
In-Reply-To: <20160630154949.14684-1-harvey.hunt@imgtec.com>
References: <20160630154949.14684-1-harvey.hunt@imgtec.com>
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

On Thu, 30 Jun 2016 16:49:49 +0100
Harvey Hunt <harvey.hunt@imgtec.com> wrote:

> Emails will bounce from my imgtec address, so update it to a new one.
> 
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>

Applied.

BTW, would you mind adding an entry for this driver in MAINTAINERS :)?

Thanks,

Boris

> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: linux-mtd@lists.infradead.org 
> Cc: linux-kernel@vger.kernel.org 
> ---
>  drivers/mtd/nand/jz4780_bch.c  | 2 +-
>  drivers/mtd/nand/jz4780_nand.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
> index d74f4ba..731c605 100644
> --- a/drivers/mtd/nand/jz4780_bch.c
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -375,6 +375,6 @@ static struct platform_driver jz4780_bch_driver = {
>  module_platform_driver(jz4780_bch_driver);
>  
>  MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
> -MODULE_AUTHOR("Harvey Hunt <harvey.hunt@imgtec.com>");
> +MODULE_AUTHOR("Harvey Hunt <harveyhuntnexus@gmail.com>");
>  MODULE_DESCRIPTION("Ingenic JZ4780 BCH error correction driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index daf3c42..175f67d 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -412,6 +412,6 @@ static struct platform_driver jz4780_nand_driver = {
>  module_platform_driver(jz4780_nand_driver);
>  
>  MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
> -MODULE_AUTHOR("Harvey Hunt <harvey.hunt@imgtec.com>");
> +MODULE_AUTHOR("Harvey Hunt <harveyhuntnexus@gmail.com>");
>  MODULE_DESCRIPTION("Ingenic JZ4780 NAND driver");
>  MODULE_LICENSE("GPL v2");
