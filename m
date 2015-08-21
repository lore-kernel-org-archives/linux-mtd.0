Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSelF-0005Ft-7f
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 05:21:06 +0000
From: Marek Vasut <marex@denx.de>
To: vikas <vikas.manocha@st.com>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Fri, 21 Aug 2015 05:46:28 +0200
Cc: Graham Moore <grmoore@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <201508200603.19962.marex@denx.de> <55D5FB19.9010402@st.com>
In-Reply-To: <55D5FB19.9010402@st.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508210546.28932.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 20, 2015 at 06:06:49 PM, vikas wrote:
> Hi,

Hi!

[...]

> >>> It's the location of the SRAM fifo.  Also direct mode location I think,
> >>> if that were ever used.
> >> 
> >> Hmm...It is the base address of NOR flash. SRAM is not memory mapped.
> > 
> > Huh ? I am inclined to trust Graham more -- I have seen memory mapped
> > SRAM, but I have yet to see memory mapped SPI NOR.
> 
> Well, SPI NOR flash in SOCs normally is memory mapped.

I'm afraid you have some very disturbed views of how SPI NORs are operated
most of the time. No, SPI NOR is most often hanging off of some sort of SPI
controller just like any other SPI device. It is definitelly not common for
a SPI NOR to be memory mapped.

> To give some mainline examples, all Spear family SOCs (spear300, 320, 1310,
> 1340).

That's an exception, not a rule :)

> > Also, the driver code clearly
> > uses that area in a way one would use a memory mapped SRAM with FIFO on
> > the other side. I think the above description is pretty much OK.
> 
> that is the purpose of making NOR flash memory mapped.

I'm not sure if you agree with me or not anymore. I am pretty sure the 
discussion went quite far for such a trivial matter though.

> >>> The size is determined by a configuration parameter during system
> >>> design.  On Altera Cyclone5 the size is really big compared to SRAM
> >>> fifo.  I don't know why, maybe some hw engineer thought it would be
> >>> better to have a large size in case direct mode was used.
> >> 
> >> my comment is about second parameter of property "reg" which is NOR
> >> flash address, so above explanation does not make sense for it.
> >> Also in direct mode, sram does not come into play.
> > 
> > This is absolutelly not a SPI NOR address.
> 
> Then i can only suggest to check out the controller literature.
> 
> Think like this : what is the purpose of SRAM in all this flash access
> business, It can work without SRAM also, the only purpose of sram (& in
> fact indirect mode) is to access data from flash memory without AHB access
> to trigger it. Once the data is available in SRAM(in case of read), AHB
> Master can access it with low letency. Same is true for writes. SRAM is
> integral internal part of state machine in case of indirect mode, there is
> no need for it to memory mapped. If the controller does not support
> indirect mode, there is no need of sram in the system.
> 
> Hope it is little bit more clear.

It is, I understand what you're trying to convey now.

Yes, this register area can be used in certain modes of the controller in
such a way that it presents a window of the SPI NOR, which can be directly
accessed.

This register area can also be used as a FIFO, which is the way we used this
area in the driver . We read/write the first four bytes when communicating
with the flash.

So I don't really see a problem with calling the second register a "Controller
data area", that's what the IP documentation also calls it.
