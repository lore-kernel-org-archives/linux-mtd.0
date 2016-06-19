Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEb4s-00087W-V0
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 11:39:47 +0000
Date: Sun, 19 Jun 2016 13:39:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 2/8] MTD: xway: add some more documentation
Message-ID: <20160619133924.370eb360@bbrezillon>
In-Reply-To: <1466277252-13867-3-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-3-git-send-email-hauke@hauke-m.de>
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

On Sat, 18 Jun 2016 21:14:06 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> This adds some register documentation which should make it easier to
> understand how this controller works.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 867a636..2889e48 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -20,10 +20,20 @@
>  #define EBU_NAND_ECC0		0xB8
>  #define EBU_NAND_ECC_AC		0xBC
>  
> -/* nand commands */
> +/*
> + * nand commands
> + * The pins of the NAND chip are selected based on the address bits of the
> + * "register" read and write. There are no special registers, but an
> + * address range and the lower address bits are used to activate the
> + * correct line. For example when the bit (1 << 2) is set in the address
> + * the ALE pin will be activated.
> + */
>  #define NAND_CMD_ALE		(1 << 2)
>  #define NAND_CMD_CLE		(1 << 3)
>  #define NAND_CMD_CS		(1 << 4)
> +#define NAND_CMD_SE		(1 << 5)
> +#define NAND_CMD_WP		(1 << 6)
> +#define NAND_CMD_PRE		(1 << 7)

I see what _WP means, but what about _PRE and _SE? Can you document
these features?

>  #define NAND_WRITE_CMD_RESET	0xff
>  #define NAND_WRITE_CMD		(NAND_CMD_CS | NAND_CMD_CLE)
>  #define NAND_WRITE_ADDR		(NAND_CMD_CS | NAND_CMD_ALE)
