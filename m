Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmR7Y-0005Cg-Ek
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 17:45:21 +0000
Date: Thu, 6 Nov 2014 09:44:59 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Ionela Voinescu <ionela.voinescu@imgtec.com>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
Message-ID: <20141106174459.GA3945@kroah.com>
References: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
 <20141106160548.GB21363@kroah.com> <545BB0BB.3040905@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <545BB0BB.3040905@imgtec.com>
Cc: abrestic@chromium.org, dehrenberg@chromium.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@imgtec.com,
 sourav.poddar@ti.com, computersforpeace@gmail.com, james.hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 06, 2014 at 05:32:43PM +0000, Ionela Voinescu wrote:
> On 11/06/14 16:05, Greg KH wrote:
> >On Thu, Nov 06, 2014 at 03:51:17PM +0000, Ionela Voinescu wrote:
> >>Hi,
> >>
> >>These patches add support for GigaDevice 4Gb SPI NAND flash.
> >>This is an initial version, adding it to staging, as there is no existing
> >>framework for SPI NAND as there is for SPI NOR in MTD.
> >>
> >>Therefore, I want to start an early discussion about this in order to find
> >>the best way to integrate it. I am at the beginning regarding both upstreaming
> >>and understanding all of the MTD layer, so your comments and ideas are
> >>welcomed.
> >>
> >>I've structured this driver similar to the existing Micron SPI NAND
> >>(mt29f_spinand), in order to make it easier to understand the common code.
> >>I know there is an atempt to add support for a generic SPI NAND based
> >>framework from Sourav Poddar but that never got merged, and it would be
> >>a valid option to consider.
> >>
> >>http://lists.infradead.org/pipermail/linux-mtd/2013-July/047373.html
> >>
> >>This initial version does not implement all the functionality and I will
> >>add to it once we decide on a structure. This is based on linux-next.
> >>
> >>Thank you and I welcome all comments,
> >If you want to add code to the staging tree, you need a TODO file that
> >lists what is needed to be done to the driver in order to get it out of
> >the staging tree.  Otherwise I don't know why the code is in staging at
> >all, and not in the "real" part of the kernel.
> >
> >thanks,
> >
> >greg k-h
> Hi Greg,
> 
> For now I am submitting this for staging, but I am interested in having
> a discussion about the best way to integrate it and hopefully merge
> this in drivers/mtd/spinand/.

Then why not just go directly for drivers/mtd/?  Why even stop at
drivers/staging/ at all?  I need an ACK from the MTD maintainer to get
this into staging as well.

thanks,

greg k-h
