Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeiWF-0005Y2-0Y
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 10:42:55 +0000
Message-ID: <1413456043.7906.164.camel@sauron.fi.intel.com>
Subject: Re: UBI: ignore/overwrite old data/PEBs after flashing
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 16 Oct 2014 13:40:43 +0300
In-Reply-To: <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Felix Fietkau <nbd@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-10-16 at 12:29 +0200, Rafał Miłecki wrote:
> On 16 October 2014 12:09, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Thu, 2014-10-16 at 07:34 +0200, Rafał Miłecki wrote:
> >> Hi,
> >>
> >> I need some help with flashing UBI images.
> >>
> >> I work with Broadcom ARM SoCs that use a CFE bootloader. In most cases
> >> it doesn't provide a way to clear flash content before flashing the
> >> firmware. It means that if I have 120 MiB of space for the firmware
> >> and I flash 20 MiB firmware, the rest of flash (100 MiB) won't be
> >> cleared. My partitioner driver will create 2 MiB partition for kernel
> >> and 118 MiB partition for UBI.
> >
> > So what I hear is that the flasher does not provide users the "erase"
> > operation, but only provides users a "write" operation?
> 
> That's right (at least for some/most of the CFE versions). Some
> vendors hack CFE on their own, but the main problem still affects many
> devices.
> 
> 
> > Then the solution would be to pad your image with 0xFFs and write it.
> > UBI will notice PEBs which do not contain UBI headers and will erase
> > them in background.
> 
> That would be trivial trick to implement, however it's far from being
> user friendly. Most devices have 128 MiB flash and our firmware
> (OpenWrt) is only ~4 MiB big. It would be a waste of
> space/bandwidth/time to provide firmware images padded with over 120
> MiB of 0xFF.

Right, this is a work-around, and it is OK for a work-around to be
suboptimal, generally speaking.

If you want a more optimal work-around, it will be more intrusive. One
idea would be to can create a small specialized kernel driver which will
start before UBI and clean-up your flash: erase PEBs you specify it.
Something like 'mtd/flashcleaner.ko'.

May be you can invent an nice UBI feature to do this, but so far I feel
like a separate driver should be a better way to go.
