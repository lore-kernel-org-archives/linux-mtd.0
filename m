Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSIOQ-0008W9-MD
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 05:28:03 +0000
From: Marek Vasut <marex@denx.de>
To: vikas <vikas.manocha@st.com>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Thu, 20 Aug 2015 06:03:19 +0200
Cc: Graham Moore <grmoore@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <55D3819D.1040009@opensource.altera.com> <55D39319.70108@st.com>
In-Reply-To: <55D39319.70108@st.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508200603.19962.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, August 18, 2015 at 10:18:33 PM, vikas wrote:
> Hi,
> 
> On 08/18/2015 12:03 PM, Graham Moore wrote:
> > Hi all,
> > 
> > On 08/18/2015 12:48 AM, Vikas MANOCHA wrote:
> > 
> > [...]
> > 
> >>>>> +Required properties:
> >>>>> +- compatible : Should be "cdns,qspi-nor".
> >>>>> +- reg : Contains two entries, each of which is a tuple consisting of
> >>>>> a +    physical address and length.  The first entry is the address
> >>>>> and +    length of the controller register set.  The second entry is
> >>>>> the +    address and length of the QSPI Controller data area.
> >>>> 
> >>>> "Controller data area", i think it means mapped NOR Flash address ?
> >>> 
> >>> Probably ; Graham ?
> >>> 
> >>>> If yes, it would be more clear with "Physical base address & size of
> >>>> NOR Flash".
> >>> 
> >>> This is the Direct mode thing, correct ? We don't support this, so I
> >>> think we should drop this bit altogether and keep only one single
> >>> address in this field.
> >> 
> >> No it's not.
> > 
> > It's the location of the SRAM fifo.  Also direct mode location I think,
> > if that were ever used.
> 
> Hmm...It is the base address of NOR flash. SRAM is not memory mapped.

Huh ? I am inclined to trust Graham more -- I have seen memory mapped SRAM,
but I have yet to see memory mapped SPI NOR. Also, the driver code clearly
uses that area in a way one would use a memory mapped SRAM with FIFO on the
other side. I think the above description is pretty much OK.

> > The size is determined by a configuration parameter during system
> > design.  On Altera Cyclone5 the size is really big compared to SRAM
> > fifo.  I don't know why, maybe some hw engineer thought it would be
> > better to have a large size in case direct mode was used.
> 
> my comment is about second parameter of property "reg" which is NOR flash
> address, so above explanation does not make sense for it.
> Also in direct mode, sram does not come into play.

This is absolutelly not a SPI NOR address.

Best regards,
Marek Vasut
