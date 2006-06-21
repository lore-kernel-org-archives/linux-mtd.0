Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft15l-0006IS-Hz
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 12:41:56 +0100
Subject: Re: [PATCH] NAND: fix nand_write_oob_std return value
From: Thomas Gleixner <tglx@linutronix.de>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0606210436w7196e009o82ac67a86e41ee9c@mail.gmail.com>
References: <fe810cf0606210436w7196e009o82ac67a86e41ee9c@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 21 Jun 2006 13:43:02 +0200
Message-Id: <1150890182.6780.356.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-21 at 15:36 +0400, Alexander Belyakov wrote:
> It seems nand_write_oob_std should not return just status value
> 
> Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 27083ed..79eae5d 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1176,7 +1176,7 @@ static int nand_write_oob_std(struct mtd
> 
>  	status = chip->waitfunc(mtd, chip);
> 
> -	return status;
> +	return status & NAND_STATUS_FAIL ? -EIO : 0;
>  }

You are the second one to notice. Already fixed.

Thanks anyway,

	tglx


	
