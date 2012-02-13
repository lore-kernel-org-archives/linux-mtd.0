Received: from mo5.mail-out.ovh.net ([178.32.228.5])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RwrdC-000260-P4
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 08:51:32 +0000
Received: from mail98.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo5.mail-out.ovh.net (Postfix) with SMTP id 7FBBEFF9C15
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 09:53:48 +0100 (CET)
Date: Mon, 13 Feb 2012 09:45:16 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Hong Xu <hong.xu@atmel.com>
Subject: Re: [PATCH] MTD: atmel_nand: Update driver to support Programmable
 HW ECC controller
Message-ID: <20120213084516.GB3378@game.jcrosoft.org>
References: <1329117469-23637-1-git-send-email-hong.xu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1329117469-23637-1-git-send-email-hong.xu@atmel.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15:17 Mon 13 Feb     , Hong Xu wrote:
> The Programmable Hardware ECC (PMECC) controller is a programmable binary
> BCH(Bose, Chaudhuri and Hocquenghem) encoder and decoder. This controller
> can be used to support both SLC and MLC NAND Flash devices. It supports to
> generate ECC to correct 2, 4, 8, 12 or 24 bits of error per sector of data.
> 
> To use this driver, the user needs to pass in the correction capability and
> the sector size.
> 
> This driver has been tested on AT91SAM9X5-EK and AT91SAM9N12-EK with JFFS2,
> YAFFS2, UBIFS and mtd-utils.
> 
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> ---
this patch must be based on the nand fixes and DT support

and pass the rom code base via resoruces

and drop the ifdef

Best Regards,
J.
