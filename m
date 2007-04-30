Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiSFi-0002Oy-PM
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 05:33:04 -0400
Subject: Re: [PATCH] nand: add cmd_ctrl to platform_nand_chip
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vitalywool@gmail.com>
In-Reply-To: <4635B58D.9020709@gmail.com>
References: <4635B58D.9020709@gmail.com>
Content-Type: text/plain
Date: Mon, 30 Apr 2007 11:35:14 +0200
Message-Id: <1177925714.5791.192.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-04-30 at 13:23 +0400, Vitaly Wool wrote:
> Hello Thomas,
> 
> please find the patch that extends struct platform_nand_chip with 
> cmd_ctrl field.

Looks good. Can you please resend with a useful changelog ?

Thanks,

	tglx

>  include/linux/mtd/nand.h |    4 ++++
>  1 files changed, 4 insertions(+)
> 
> Signed-off-by: Vitaly Wool <vitalywool@gmail.com>
> 
> Index: linux-2.6/include/linux/mtd/nand.h
> ===================================================================
> --- linux-2.6.orig/include/linux/mtd/nand.h
> +++ linux-2.6/include/linux/mtd/nand.h
> @@ -577,6 +577,8 @@ struct platform_nand_chip {
>   * @hwcontrol:		platform specific hardware control structure
>   * @dev_ready:		platform specific function to read ready/busy pin
>   * @select_chip:	platform specific chip select function
> + * @cmd_ctrl:		platform specific function for controlling
> + *			ALE/CLE/nCE. Also used to write command and address
>   * @priv:		private data to transport driver specific settings
>   *
>   * All fields are optional and depend on the hardware driver requirements
> @@ -585,6 +587,8 @@ struct platform_nand_ctrl {
>  	void		(*hwcontrol)(struct mtd_info *mtd, int cmd);
>  	int		(*dev_ready)(struct mtd_info *mtd);
>  	void		(*select_chip)(struct mtd_info *mtd, int chip);
> +	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
> +				    unsigned int ctrl);
>  	void		*priv;
>  };
>  
> 
