Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOyJN-0002j3-RS
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 23:16:02 +0000
Date: Wed, 25 Sep 2013 16:15:40 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH] Staging: MTD: Micron SPINAND Driver support
Message-ID: <20130925231540.GB21682@kroah.com>
References: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
Cc: linux-mtd@lists.infradead.org, manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 02, 2013 at 06:52:16PM +0530, Kamlakant Patel wrote:
> This patch adds support for Micron SPINAND via MTD.
> 
> Signed-off-by: Mona Anonuevo <manonuevo@micron.com>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
> ---
> This patch has to be merged via staging tree.
>   
> This is a driver from Micron for MT29F1G01ZACH4 SPI based NAND chips. This driver had
> been posted multiple times to the mtd list.
> 1. http://lists.infradead.org/pipermail/linux-mtd/2010-May/031975.html
> 2. http://lists.infradead.org/pipermail/linux-mtd/2010-April/029523.html
> 3. patchwork.ozlabs.org/patch/258697/
> This has not been merged into the main kernel yet.
> 
> I have cleaned and updated it for current kernel. Since there are many users for
> this driver, it may be useful to add it to the staging tree, where further fixes and
> cleanups can be done. Once it reaches to the standard will be moved to the mtd.
> 
> This driver has been tested with Micron SPINAND MT29F1G01ZACH4 chip on kernel 3.11 on 
> the Netlogic XLP platform.
>  
> Mona Anonuevo, I have retained your sign-offs from the original patch.

With this applied, I get the following build error:
	../ERROR: "nand_scan" [drivers/staging/mt29f_spinand/mt29f_spinand.ko] undefined!

Can you please fix this and resend a working version?

thanks,

greg k-h
