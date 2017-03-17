Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cow02-0008Ia-Vx
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 17:49:17 +0000
Date: Fri, 17 Mar 2017 18:48:52 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, richard@nod.at,
 computersforpeace@gmail.com, thomas.petazzoni@free-electrons.com,
 linux-mtd@lists.infradead.org, peterpansjtu@gmail.com,
 linshunquan1@hisilicon.com
Subject: Re: [PATCH v3 7/8] nand: spi: Add generic SPI controller support
Message-ID: <20170317184852.030709de@bbrezillon>
In-Reply-To: <3efc4b1f-7391-03f9-497d-8ea5f89f5d59@gmail.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-8-git-send-email-peterpandong@micron.com>
 <20170317152048.1eca677e@bbrezillon>
 <3efc4b1f-7391-03f9-497d-8ea5f89f5d59@gmail.com>
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

On Fri, 17 Mar 2017 18:32:28 +0100
Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:

> On 17/03/2017 15:20, Boris Brezillon wrote:
> > [...]
> > Should be done before calling spinand_detect(), just in case some DT
> > props need to be parsed before the detection step.
> >
> > This being said, I'm not sure we should let the spinand controller
> > driver do the registration step. I'm currently trying to rework the
> > parallel NAND framework to act like all other busses, and I think SPI
> > NAND controllers should also follow this road:
> >
> > 1/ spinand controller driver register a controller to the spinand core
> >    (spinand_controller_register())
> > 2/ the core parses the DT (or board info if DT is not available) and
> >     creates N spinand devices (the N value depends on the number of SPI
> >     nands connected to the controller)
> > 3/ for each spinand device the detection/initialization takes place
> >     directly in the core (the spinand_controller_ops should contain
> >     anything required to do the detection)
> > 4/ for each spinand dev the spinand_controller_ops->add() is called, to
> >     let the controller driver attach private data to the device (if
> >     required), and/or let it use it's own ECC engine (optional as well).
> > 5/ underlying MTD device registered by spinand core code and spinand
> >     dev added to the list of devices controlled by this controller (done
> >     in the core)
> >
> > When removing a device, you just have the reverse steps:
> >
> > 1/ remove from list and unregister the MTD dev
> > 2/ call spinand_controller_ops->remove()
> > 3/ core/manufacturer cleanup
> >
> > Not sure how feasible this is, especially for the generic SPI NAND
> > controller case where the SPI NAND controller does not have a node in
> > the DT, but that would avoid all this boiler-plate duplication we have
> > in the // NAND framework.  
> 
> Since the probe for generic spi devices is generally triggered by the 
> SPI layer, it will not match easily in the way you would like the 
> registration done.

That's true, but I think we can find something to handle this case.

> Can we let this registration question not be a showstopper for Peter's 
> effort ?

Sure, I was just thinking out loud.
