Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAMP1-0005eo-Dm
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 19:11:04 +0000
Date: Tue, 7 Jun 2016 21:10:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: John Crispin <john@phrozen.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
Subject: Re: [PATCH 0/6] MTD: xway: updates from OpenWrt/LEDE
Message-ID: <20160607211041.11464219@bbrezillon>
In-Reply-To: <20160607210155.4a2a45ca@bbrezillon>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
 <20160607114824.5f96228a@bbrezillon>
 <3f0aee29-c2c0-6e42-6f74-fac491438013@phrozen.org>
 <2dc426aa-0591-490f-07b3-84e95396fcc0@hauke-m.de>
 <20160607210155.4a2a45ca@bbrezillon>
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

On Tue, 7 Jun 2016 21:01:55 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Tue, 7 Jun 2016 19:36:15 +0200
> Hauke Mehrtens <hauke@hauke-m.de> wrote:
> 
> > On 06/07/2016 12:12 PM, John Crispin wrote:  
> > > 
> > > 
> > > On 07/06/2016 11:48, Boris Brezillon wrote:    
> > >> On Sun,  5 Jun 2016 23:20:03 +0200
> > >> Hauke Mehrtens <hauke@hauke-m.de> wrote:
> > >>    
> > >>> These patches are in OpenWrt for years now and should go upstream. They 
> > >>> are fixing some problems in the NAND driver.    
> > >>
> > >> Just had a closer look at the xway NAND controller driver, and it's
> > >> just a big pile of hacks :-(. I'll take those patches if nobody is
> > >> willing to maintain this driver, but honestly, I'd prefer a complete
> > >> rework of the driver.
> > >>    
> > > 
> > > Hi Boris,
> > > 
> > > it is indeed a horrific pile of doo doo. it has grown historically over
> > > a few years and then became sort of abandoned. i have been keeping it
> > > artificially alive inside openwrt as we have users with boards that have
> > > nand. i dont even own a lantiq board with nand, so patches were sort of
> > > merged on cruise control and with compile testing only.
> > > 
> > > the SoCs have 2 ways of controlling the nand core. the easy one is this,
> > > which is basically nothing more than a nand flash aware 16bit
> > > intel/hitachi bus interafec called EBU. There is a more advanced dma
> > > based way of doing nand I/O though.
> > > 
> > > ideally there should be a driver for the so called "high speed nand"
> > > interface which would allow us to nuke this one.    
> > 
> > Hi,
> > 
> > I want to look into other drivers first before looking into the DMA nand
> > driver, it took me some time to understand how this driver works and the
> > controller is strange and also this driver is strange. I was wondering
> > how this went into mainline kernel. ;-)  
> 
> I'm asking myself the same question, maybe the framework was not so 
> 
> > 
> > I could/would send a patch which converts this from some hack to the
> > generic platform driver to a normal platform driver, it will probably
> > add ~50 lines of code, but makes it a lot easier to understand.  
> 
> Yep, that would be a good start.
> 
> > 
> > I will also try to make handling of the IO_ADDR_R look better with less
> > casts.  
> 
> Actually, I would get rid of ->IO_ADDR_X completely. and implement my
> own set of ->read/write_buf() functions using a private __iomem pointer.
> 
> > 
> > What else do you not like about this driver when we still use this
> > hardware interface?  
> 
> Well, the first thing would be to properly separate the controller and
> chip concepts, and replacing all global variables by you own private
> chip structure that would be dynamically allocated at probe time.
> 
> Also, I see that this driver is mixing platform specific initialization
> [1] and driver implementation, but I guess this is part of your first
> suggestion (moving to a real platform driver and getting rid of the
> platform_nand abstraction layer).
> 
> Once you're there, you'll be able to add extra features, like DMA
> support.
> 
> If you need an example, you can have a look at the sunxi_nand driver.
> 

BTW, thanks for volunteering for this rework. Let me know if you need
help.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
