Received: from smtp4-g21.free.fr ([212.27.42.4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMFs1-0002Yr-Jb
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 14:05:54 +0000
Subject: Re: Using a generic upstream driver with a custom NAND controller
To: Steve deRosier <derosier@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sebastian Frias <sf84@laposte.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <569E8EEA.6060106@free.fr>
 <CALupW3A8Wz72enL3Gqpx0=HdOQW0DqQtfVLUQmF=NeyoySn_aQ@mail.gmail.com>
From: Mason <slash.tmp@free.fr>
Message-ID: <56A0E59F.4090602@free.fr>
Date: Thu, 21 Jan 2016 15:05:19 +0100
MIME-Version: 1.0
In-Reply-To: <CALupW3A8Wz72enL3Gqpx0=HdOQW0DqQtfVLUQmF=NeyoySn_aQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19/01/2016 22:15, Steve deRosier wrote:

> Mason wrote:
>
>> Is there some generic driver upstream that I could try to see if
>> it works with this controller?
>>
>> Note: the SoC is using these chips:
>> nand: Micron NAND 512MiB 3,3V 8-bit
>> nand: 512MiB, SLC, page size: 2048, OOB size: 64
> 
> That's a common chip configuration. Calling out the chip ID
> specifically might also be of some help.

<confused> IIUC, /which NAND chips/ are connected to the
controller is not really relevant. What kind of info would
the chip ID give me?

> What you have to do is enable
> the driver for your NAND controller, the NAND chip isn't that
> relevant. Nearly every mainline SoC or processor would have a driver.

Note: the SoC isn't mainline yet as I'm the one trying to
make that happen (I work for the SoC manufacturer BTW).

The problem is that all our drivers were written in the
2.6.x era, and porting them to 4.4 is really involved
because

1) the APIs have often significantly changed (this is an issue
for all out-of-tree drivers)

2) the coders in my company will often pick the quick and dirty
solution, which often means altering core files, instead of
using registration APIs, custom call-backs, or what-have-you.

The result is that I get a deluge of conflicts just rebasing
the driver, and that's even before I get to the API issues.

> If it's truly custom, then in my opinion, you're going to need to
> write a driver. Though it should be provided to you by your SoC
> vendor. Shame on them for not building the driver right and
> upstreaming it.

(Maybe you can help me find convincing arguments why upstreaming
is good. The logic around here is "the hardware is custom, no one
will benefit from having the driver, no point in sharing".)

Anyway, I may not have been clear about this, but there /is/
a driver for this custom controller (it's not an IP block from
a third-party vendor). The driver works with the 3.4 kernel.

In my original message, I provided the diff between vanilla
3.4 and our custom 3.4 (for the drivers/mtd directory).

 drivers/mtd/Kconfig                                            |    3 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                            |  127 ++-
 drivers/mtd/devices/m25p80.c                                   |  100 +-
 drivers/mtd/maps/Kconfig                                       |   11 +-
 drivers/mtd/maps/physmap.c                                     |  195 ++++
 drivers/mtd/mtdchar.c                                          |   54 ++
 drivers/mtd/nand/Kconfig                                       |    8 +
 drivers/mtd/nand/Makefile                                      |    1 +
 drivers/mtd/nand/nand_base.c                                   |    6 +-
 drivers/mtd/nand/nand_ids.c                                    |   18 +
 drivers/mtd/nand/foobar_nand.c                                 | 1903 ++++++++++++++++++++

So foobar_nand.c is the NAND driver for this SoC.
The problem comes from the modifications "around" the driver,
in the "core" source files.

I guess I could make a zero-order approximation that
all these changes are unnecessary, and just port the
main driver code. But I have a feeling that won't work.

> Odds are they didn't create one from scratch however. That would be
> truly strange. Likely they took a stock one and made some custom
> changes. You might be able to ask what it was based on and make
> changes to the base driver.

That's a good idea. Although I fear it was indeed written
from scratch, since the controller is custom-made.

Anyway, I'm open to comments and suggestions about this issue.
I'm sure a lot of you have had to deal with these situations.

Regards.
