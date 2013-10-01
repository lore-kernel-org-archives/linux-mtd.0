Received: from mms3.broadcom.com ([216.31.210.19])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQu6T-0001U9-DF
 for linux-mtd@lists.infradead.org; Tue, 01 Oct 2013 07:10:42 +0000
Date: Tue, 1 Oct 2013 12:56:13 +0530
From: "Kamlakant Patel" <kamlakant.patel@broadcom.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Staging: MTD: Micron SPINAND Driver support
Message-ID: <20131001072612.GA19332@kpatel.netlogicmircro.com>
References: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
 <20130925231540.GB21682@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20130925231540.GB21682@kroah.com>
Content-Type: text/plain;
 charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 04:15:40PM -0700, Greg KH wrote:
> On Mon, Sep 02, 2013 at 06:52:16PM +0530, Kamlakant Patel wrote:
> > This patch adds support for Micron SPINAND via MTD.
> > 
> > Signed-off-by: Mona Anonuevo <manonuevo@micron.com>
> > Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
> > ---
> > This patch has to be merged via staging tree.
> >   
> > This is a driver from Micron for MT29F1G01ZACH4 SPI based NAND chips. This driver had
> > been posted multiple times to the mtd list.
> > 1. http://lists.infradead.org/pipermail/linux-mtd/2010-May/031975.html
> > 2. http://lists.infradead.org/pipermail/linux-mtd/2010-April/029523.html
> > 3. patchwork.ozlabs.org/patch/258697/
> > This has not been merged into the main kernel yet.
> > 
> > I have cleaned and updated it for current kernel. Since there are many users for
> > this driver, it may be useful to add it to the staging tree, where further fixes and
> > cleanups can be done. Once it reaches to the standard will be moved to the mtd.
> > 
> > This driver has been tested with Micron SPINAND MT29F1G01ZACH4 chip on kernel 3.11 on 
> > the Netlogic XLP platform.
> >  
> > Mona Anonuevo, I have retained your sign-offs from the original patch.
> 
> With this applied, I get the following build error:
> 	../ERROR: "nand_scan" [drivers/staging/mt29f_spinand/mt29f_spinand.ko] undefined!
> 
> Can you please fix this and resend a working version?

Thank you for the review, I will fix the dependency issue and resubmit the
patch.

Thanks,
Kamlakant Patel
> 
> thanks,
> 
> greg k-h
> 
