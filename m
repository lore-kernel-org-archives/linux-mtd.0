Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCNP1-0007PE-4g
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 10:16:13 +0000
Date: Wed, 8 Nov 2017 11:15:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: fix interpretation of NAND_CMD_NONE in core
 ->cmdfunc()
Message-ID: <20171108111536.7266af29@bbrezillon>
In-Reply-To: <20171106220704.2340-1-miquel.raynal@free-electrons.com>
References: <20171106220704.2340-1-miquel.raynal@free-electrons.com>
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

Hi Miquel,

I would change the subject to:

mtd: nand: fix interpretation of NAND_CMD_NONE in nand_command[_lp]()

On Mon,  6 Nov 2017 23:07:04 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Some drivers (like nand_hynix.c) call ->cmdfunc() with NAND_CMD_NONE
> and an address byte in order to only send one address cycle to the
> flash chip.
> 
> Fix the current implementation that actually send NAND_CMD_NONE, which
> is defined as -1 (cast in a u8), thus sending an 0xFF command to the
> chip, which is actually a reset command.

Well, that's not exactly true, if any, the cast is done in the
->cmd_ctrl() implementation, not in nand_command[_lp]().

> 
> Add the condition in both nand_command() and nand_command_lp() to
> avoid calling ->cmd_ctrl() in that case.

How about rewording it like that:

"
Some drivers (like nand_hynix.c) call ->cmdfunc() with NAND_CMD_NONE
and a column address and expect the controller to only send address
cycles. Right now, the default ->cmdfunc() implementations provided by
the core do not filter out the command cycle in this case and forwards
the request to the controller driver through the ->cmd_ctrl() method.
The thing is, NAND controller drivers can get is wrong and send a
command cycle with a NAND_CMD_NONE opcode and since NAND_CMD_NONE is
-1, and the command field is usually casted to an u8, we end up sending
the 0xFF command which is actually a RESET operation.


Add conditions in nand_command[_lp]() functions to sending the initial
command cycle when command == NAND_CMD_NONE.
"

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c
> b/drivers/mtd/nand/nand_base.c index c63e4a88a653..851f25383622 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -710,7 +710,8 @@ static void nand_command(struct mtd_info *mtd,
> unsigned int command, chip->cmd_ctrl(mtd, readcmd, ctrl);
>  		ctrl &= ~NAND_CTRL_CHANGE;
>  	}
> -	chip->cmd_ctrl(mtd, command, ctrl);
> +	if (command != NAND_CMD_NONE)
> +		chip->cmd_ctrl(mtd, command, ctrl);
>  
>  	/* Address cycle, when necessary */
>  	ctrl = NAND_CTRL_ALE | NAND_CTRL_CHANGE;

You should probably also add a new case in the switch-case block to
bail-out when command == NAND_CMD_NONE.

> @@ -831,7 +832,9 @@ static void nand_command_lp(struct mtd_info *mtd,
> unsigned int command, }
>  
>  	/* Command latch cycle */
> -	chip->cmd_ctrl(mtd, command, NAND_NCE | NAND_CLE |
> NAND_CTRL_CHANGE);
> +	if (command != NAND_CMD_NONE)
> +		chip->cmd_ctrl(mtd, command,
> +			       NAND_NCE | NAND_CLE |
> NAND_CTRL_CHANGE); 
>  	if (column != -1 || page_addr != -1) {
>  		int ctrl = NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;

Ditto.

Thanks,

Boris
