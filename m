Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VytbQ-0004da-WD
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 01:31:09 +0000
Received: by mail-oa0-f50.google.com with SMTP id n16so15484099oag.23
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2014 17:30:47 -0800 (PST)
Date: Thu, 2 Jan 2014 17:30:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 00/23] mtd: nand: Remove unnecessary OOM messages
Message-ID: <20140103013044.GD5631@ld-irv-0074>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 26, 2013 at 11:58:57AM +0900, Jingoo Han wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message. For example,
> k.alloc and v.alloc failures use dump_stack().
> 
> Jingoo Han (23):
>       mtd: atmel_nand: Remove unnecessary OOM messages
>       mtd: orion_nand: Remove unnecessary OOM messages
>       mtd: sharpsl: Remove unnecessary OOM messages
>       mtd: au1550nd: Remove unnecessary OOM messages
>       mtd: bf5xx_nand: Remove unnecessary OOM messages
>       mtd: cafe_nand: Remove unnecessary OOM messages
>       mtd: cmx270_nand: Remove unnecessary OOM messages
>       mtd: cs553x_nand: Remove unnecessary OOM messages
>       mtd: diskonchip: Remove unnecessary OOM messages
>       mtd: fsl_elbc_nand: Remove unnecessary OOM messages
>       mtd: fsl_ifc_nand: Remove unnecessary OOM messages
>       mtd: jz4740_nand: Remove unnecessary OOM messages
>       mtd: pasemi_nand: Remove unnecessary OOM messages
>       mtd: txx9ndfmc: Remove unnecessary OOM messages
>       mtd: davinci_nand: Remove unnecessary OOM messages
>       mtd: fsmc_nand: Remove unnecessary OOM messages
>       mtd: nand-gpio: Remove unnecessary OOM messages
>       mtd: lpc32xx_mlc: Remove unnecessary OOM messages
>       mtd: lpc32xx_slc: Remove unnecessary OOM messages
>       mtd: mpc5121_nfc: Remove unnecessary OOM messages
>       mtd: plat_nand: Remove unnecessary OOM messages
>       mtd: s3c2410: Remove unnecessary OOM messages
>       mtd: sh_flctl: Remove unnecessary OOM messages

Pushed all but patch 21 (plat_nand; it had dependencies on a previous
patch that I skipped) to l2-mtd.git. Thanks.

Brian
