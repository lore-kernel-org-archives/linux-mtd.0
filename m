Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NJ4nU-0003rH-Ql
	for linux-mtd@lists.infradead.org; Fri, 11 Dec 2009 12:40:37 +0000
Date: Fri, 11 Dec 2009 13:40:35 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Eric Benard <eric@eukrea.com>
Subject: Re: [PATCH 1/1] mxc_nand : add RESET command support
Message-ID: <20091211124035.GN15126@pengutronix.de>
References: <1260347150.19669.1206.camel@localhost>
	<1260357163-5367-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1260357163-5367-1-git-send-email-eric@eukrea.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 09, 2009 at 12:12:43PM +0100, Eric Benard wrote:
> mxc_nand driver must support the RESET Command in order to support
> Micron NAND which need a reset before any other command.
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

> ---
>  drivers/mtd/nand/mxc_nand.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index d5445cd..0207525 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -638,6 +638,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
>  
>  	case NAND_CMD_ERASE1:
>  	case NAND_CMD_ERASE2:
> +	case NAND_CMD_RESET:
>  		send_cmd(host, command, false);
>  		mxc_do_addr_cycle(mtd, column, page_addr);
>  
> -- 
> 1.6.3.3
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
