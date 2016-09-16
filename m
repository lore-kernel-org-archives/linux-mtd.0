Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkt0U-0007wK-AD
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 13:16:47 +0000
Date: Fri, 16 Sep 2016 15:16:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix nand_command_lp() for 8bits opcodes
Message-ID: <20160916151620.0572d21d@bbrezillon>
In-Reply-To: <1465988991-1220-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465988991-1220-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Wed, 15 Jun 2016 13:09:51 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> 8 bits opcodes should be followed by a single address cycle. Make the
> 2nd address cycle dependent of !nand_opcode_8bits(command).

Applied.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0b0dc29..c2f83236 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -745,7 +745,10 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
>  				column >>= 1;
>  			chip->cmd_ctrl(mtd, column, ctrl);
>  			ctrl &= ~NAND_CTRL_CHANGE;
> -			chip->cmd_ctrl(mtd, column >> 8, ctrl);
> +
> +			/* Only ouput a single addr cycle for 8bits opcodes. */
> +			if (!nand_opcode_8bits(command))
> +				chip->cmd_ctrl(mtd, column >> 8, ctrl);
>  		}
>  		if (page_addr != -1) {
>  			chip->cmd_ctrl(mtd, page_addr, ctrl);
