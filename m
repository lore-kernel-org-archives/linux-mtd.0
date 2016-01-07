Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHHm7-0006GX-Tr
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 21:07:17 +0000
Received: from localhost.localdomain ([127.0.0.1]:38974 "EHLO localhost"
 rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
 id S27010434AbcAGVGuYmyBb (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Thu, 7 Jan 2016 22:06:50 +0100
Date: Thu, 7 Jan 2016 21:06:50 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Brian Norris <computersforpeace@gmail.com>
cc: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>
Subject: Re: [PATCH] mtd: Make MTD_BCM47XXSFLASH to depend on MIPS
In-Reply-To: <20151104185341.GN7274@google.com>
Message-ID: <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 4 Nov 2015, Brian Norris wrote:

> > > The bcm47xxsflash driver uses the KSEG0ADDR() function to map an address
> > > to a certain kernel segment. But that is only defined if the MIPS config
> > > symbol is enabled. The driver does not have an explicit dependency on it
> > > and relies on a transitive dependency relation:
> > >
> > > MTD_BCM47XXSFLASH -> BCMA_SFLASH -> BCMA_DRIVER_MIPS -> BCMA && MIPS
> > >
> > > But BCMA_SFLASH and BCMA_DRIVER_MIPS have only runtime and not buildtime
> > > dependency with MIPS so can be changed to be built test using the config
> > > COMPILE_TEST symbol. But that would make MTD_BCM47XXSFLASH be built with
> > > MIPS not enabled and cause the following build error:
> > >
> > > drivers/mtd/devices//bcm47xxsflash.c: In function 'bcm47xxsflash_read':
> > > drivers/mtd/devices//bcm47xxsflash.c:112:2: error: implicit declaration of function 'KSEG0ADDR' [-Werror=implicit-function-declaration]
> > >   memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(b47s->window + from),
> > 
> > I think we're not really supposed to use KSEG0ADDR anyway. What about
> > replacing it with ioremap_nocache?
> 
> I'm not really a MIPS expert, but isn't KSEG0 actually *cached*? (And is
> that correct, then?)
> 
> AIUI, ioremap_nocache() will actually get you a KSEG1 address here, I
> think.

 Depending on configuration `ioremap_nocache' may give you a KSEG1, an 
XKPHYS or an uncached virtual (KSEG2) address.  Drivers are not supposed 
to use KSEG0ADDR, etc. macros, these are only for low-level core platform 
code.  Besides, KSEG0ADDR is not portable to 64-bit systems -- which may 
not be an issue here, but still this means it shouldn't appear in a driver 
as this causes a portability and maintenance issue.

 Use plain `ioremap' instead for a cached MMIO mapping; of course you need 
to place it elsewhere as at the very least you need to `iounmap' the area 
mappad later on.  In most cases it makes sense to handle the mapping and 
unmapping in device initialisation and shutdown respectively, and then 
carry the pointer obtained through and use it throughout the use of the 
device.

 HTH,

  Maciej
