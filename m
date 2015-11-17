Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyUJw-0004uw-Nj
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 00:40:29 +0000
Received: by padhx2 with SMTP id hx2so191649316pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 16:40:08 -0800 (PST)
Date: Mon, 16 Nov 2015 16:40:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Arlott <simon@fire.lp0.eu>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Cernekee <cernekee@gmail.com>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] brcmnand: Clear EXT_ADDR error registers in PIO mode
Message-ID: <20151117004005.GU8456@google.com>
References: <564A5333.9000200@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564A5333.9000200@simon.arlott.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ bcm-kernel-feedback-list

On Mon, Nov 16, 2015 at 10:05:39PM +0000, Simon Arlott wrote:
> If an error occurs in flash above 4GB in PIO mode then the EXT_ADDR
> registers will be set to the location of the error and never cleared.
> 
> Reset them to 0 before reading.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>

Patch looks OK. Did you see this problem in practice, or is this just
theoretical? I thought the documentation seemed to suggest these
registers were cleared together with their non-_EXT counterparts. But
implementation definitely trumps documentation for HW.

Brian

> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 12c6190..2c8f67f 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1400,6 +1400,8 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>  	/* Clear error addresses */
>  	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_ADDR, 0);
>  	brcmnand_write_reg(ctrl, BRCMNAND_CORR_ADDR, 0);
> +	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_EXT_ADDR, 0);
> +	brcmnand_write_reg(ctrl, BRCMNAND_CORR_EXT_ADDR, 0);
>  
>  	brcmnand_write_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS,
>  			(host->cs << 16) | ((addr >> 32) & 0xffff));
> -- 
> 2.1.4
> 
> -- 
> Simon Arlott
