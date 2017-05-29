Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFPkp-0003tZ-3i
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 18:51:00 +0000
Date: Mon, 29 May 2017 20:50:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: Support 'EXIT GET STATUS' command in
 nand_command_lp()
Message-ID: <20170529205037.7a3f7cb2@bbrezillon>
In-Reply-To: <1494952545-5089-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1494952545-5089-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Tue, 16 May 2017 18:35:45 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> READ0 is sometimes used to exit GET STATUS mode. When this is the case
> no address cycles are requested, and we can use this information to
> detect that READSTART should not be issued after READ0 or that we
> shouldn't wait for the chip to be ready.
> 

Applied to nand/next.

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 08ff98c47e1f..fe87bd3513fa 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -753,6 +753,16 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
>  		return;
>  
>  		/* This applies to read commands */
> +	case NAND_CMD_READ0:
> +		/*
> +		 * READ0 is sometimes used to exit GET STATUS mode. When this
> +		 * is the case no address cycles are requested, and we can use
> +		 * this information to detect that we should not wait for the
> +		 * device to be ready.
> +		 */
> +		if (column == -1 && page_addr == -1)
> +			return;
> +
>  	default:
>  		/*
>  		 * If we don't have access to the busy pin, we apply the given
> @@ -887,6 +897,15 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
>  		return;
>  
>  	case NAND_CMD_READ0:
> +		/*
> +		 * READ0 is sometimes used to exit GET STATUS mode. When this
> +		 * is the case no address cycles are requested, and we can use
> +		 * this information to detect that READSTART should not be
> +		 * issued.
> +		 */
> +		if (column == -1 && page_addr == -1)
> +			return;
> +
>  		chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
>  			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
>  		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
