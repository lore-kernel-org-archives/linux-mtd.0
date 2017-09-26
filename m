Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dwjbW-0007c4-FJ
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 06:44:28 +0000
Date: Tue, 26 Sep 2017 08:43:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: wait for tWHR after NAND_CMD_STATUS /
 NAND_CMD_READID
Message-ID: <20170926084356.553867a1@bbrezillon>
In-Reply-To: <1506397164-3648-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506397164-3648-1-git-send-email-yamada.masahiro@socionext.com>
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

On Tue, 26 Sep 2017 12:39:24 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Read Status and Read ID require tWHR before reading the first data.
> Insert a very short wait to make sure to meet the spec.
> 
> I have not seen any problem report for now, but nand_command() and
> nand_command_lP() are generic hooks, so it makes sense to implement
> fail-safe code here.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/nand_base.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index b1cf32c..55c0ba5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -742,9 +742,12 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
>  	case NAND_CMD_ERASE1:
>  	case NAND_CMD_ERASE2:
>  	case NAND_CMD_SEQIN:
> +	case NAND_CMD_SET_FEATURES:
> +		return;
> +
>  	case NAND_CMD_STATUS:
>  	case NAND_CMD_READID:
> -	case NAND_CMD_SET_FEATURES:
> +		ndelay(200);	/* tWHR */
>  		return;
>  
>  	case NAND_CMD_RESET:
> @@ -871,9 +874,12 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
>  	case NAND_CMD_ERASE1:
>  	case NAND_CMD_ERASE2:
>  	case NAND_CMD_SEQIN:
> +	case NAND_CMD_SET_FEATURES:
> +		return;
> +
>  	case NAND_CMD_STATUS:
>  	case NAND_CMD_READID:
> -	case NAND_CMD_SET_FEATURES:
> +		ndelay(200);	/* tWHR */

Can you do something like nand_ccs_delay() [1] instead of
unconditionally adding this 200ns delay here? I'm not worried about the
overhead introduced by this ndelay(), but I don't want to risk
introducing a regression.
 

>  		return;
>  
>  	case NAND_CMD_RNDIN:

[1]http://elixir.free-electrons.com/linux/v4.14-rc2/source/drivers/mtd/nand/nand_base.c#L793
