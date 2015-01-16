Received: from mail-qc0-f172.google.com ([209.85.216.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC5Xj-0001u0-9G
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 11:58:23 +0000
Received: by mail-qc0-f172.google.com with SMTP id i8so7860386qcq.3
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2015 03:58:01 -0800 (PST)
MIME-Version: 1.0
Sender: root@kryo.se
In-Reply-To: <alpine.DEB.2.02.1501161050150.27318@lnxricardw1.se.axis.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
 <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
 <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
 <CAGgu=sBLzZa=iWjo39fcrx1ph-WjErg6FuxQqBMZaF1=1gcJ0Q@mail.gmail.com>
 <alpine.DEB.2.02.1501161031561.27318@lnxricardw1.se.axis.com>
 <CAGgu=sAtqj-Jj3xqsSkuzUXeUwbztKbYLqavhoN1MhzszE=7tA@mail.gmail.com>
 <alpine.DEB.2.02.1501161050150.27318@lnxricardw1.se.axis.com>
Date: Fri, 16 Jan 2015 12:58:01 +0100
Message-ID: <CAGgu=sB54RE4SreSuHti+TpAXshqvrU=F=f-DyEnqBQg0oVRZA@mail.gmail.com>
Subject: Re: Flash filesystem questions
From: Erik Ekman <erik@kryo.se>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2015 at 11:02 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Fri, 16 Jan 2015, Erik Ekman wrote:
>
>> On Fri, Jan 16, 2015 at 10:33 AM, Ricard Wanderlof
>> <ricard.wanderlof@axis.com> wrote:
>> >
>> > On Thu, 15 Jan 2015, Erik Ekman wrote:
>> >
>> >> Next problem is bad blocks. I have not found anything in the hardware
>> >> that keeps track of them. I am thinking about using the first two
>> >> working blocks as maps, one u8 per erase block. Since I only have 8k,
>> >> 16k or 32k erase blocks it should not wear them out too much during
>> >> updates.
>> >
>> > Normally flashes never keep track of bad blocks themselves, except that
>> > bad blocks are usually marked as such during the manufacturing process,
>> > but it is completely up to software to make use of the that information.
>> >
>> >> Is this a valid strategy or is there a common smart solution?
>> >
>> > The mtd driver layer has a bad block table mechanism which does all this
>> > for you. (see nand_bbt.c). It just has to be enabled using a flag in the
>> > board driver.
>>
>> I found that, but it requires the driver to be at the nand layer, I am just
>> implementing the MTD interface. I saw in some other threads in the list
>> that a generic bbt implementation might be needed (for SPI NAND, my
>> device, and Dan Ehrenberg).
>
> So you mean you have a driver which behaves like an mtd device, but does
> not use the mtd layer at all?

It does not use the nand layer at all.
>
>> My flash complains when writing or erasing to bad blocks, but reads
>> return no error. Is that the normal case?
>
> Normally when writing using mtd, there is a software mechanism (in
> nand_base.c) which prevents the erasure of blocks that have been marked
> bad. It's easy to remove or comment out, and when that is done it can be
> possible to erase certain bad blocks.
>
> I say certain, because in my experience there seem to be two types of bad
> blocks.
>
> One I would term 'soft' bad blocks, because after erasure, they
> behave just like good blocks, except that there's probably some region of
> them that is not up to spec. For the 1-2 Gb SLC flashes I have
> experience with, 'soft' bad blocks look like good blocks, except for
> the bad block markers. The main area of the flash is all 0xff, and I can't
> remember if the whole OOB is usually 0x00, or it is just the bad block
> marker byte(s).
>
> The other I would term 'hard' bad blocks. They read as 0x00 (although one
> never gets a read error) and attempting to erase them has no effect. (I
> can't remember if the erase procedure terminates with an error or not).
>
> Because of these different properties, my speculation is that 'hard' bad
> blocks are marked bad during actual chip manufacture, by actually
> disconnecting that block from the rest of the chip, whereas 'soft' bad
> blocks are determined by performance testing after chip manufacture.
>
> As I said I can't remember if erasing or writing to 'hard' bad blocks
> results in an error, but it would not seem unlikely. Writing or erasing
> 'soft' bad blocks works just like with the good blocks.
>
>> Should I try making a version of nand_bbt.c for the more generic case?
>
> I'm still trying to figure out exactly what your driver does. Normally one
> would write a driver which would interface with the rest of the NAND
> framework, which can be a relatively small driver as it basically just has
> to implement a couple of functions: a command function to send commands to
> the flash, and a wait function to wait for the flash to become ready. Even
> the data transfer can be handled by the NAND framework if it can be done
> via an 8-bit port associated with a memory address.
>
> If the hardware you have is more complex, or does more work itself (for
> instance, has a DMA for data transfer, or does its own ECC management),
> the resulting board driver will be more complex too, and you sometimes
> have to jump through loops to get interact with the NAND framework, as it
> was originally based on a relatively basic interface, with additional
> parts to handle hardware ECC tacked on afterwards.
>

The device does not give access to the raw nand. The driver creates transfer
commands by writing address, number of sectors and a dma bus address
of the source/destination data to a buffer. The bus address of that command
buffer is then written to a register on the PCI device and an interrupt is
received when the transfer is done. Had it not been for the erase command
and some restrictions on sector count and alignment would it have been a
perfect block device interface.

The OOB data/ECC handling is hidden, and the only operations
possible are read, write and erase of sectors. This fits well with the
MTD interface (struct mtd_info) so I was planning to add my driver to
/drivers/mtd/devices instead of under the /drivers/mtd/nand directory more
commonly used for nand controllers.

I have looked at nand.h and its structs but since I cannot get access to the
raw NAND chips I didn't feel those interfaces helped me in any way.

Thanks,

Erik
