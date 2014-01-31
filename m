Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9IV3-0000VP-9t
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 18:07:34 +0000
Received: by mail-ee0-f44.google.com with SMTP id c13so2434336eek.17
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2014 10:07:10 -0800 (PST)
Subject: Re: [PROBLEM] buffer write error (status timeout) due to
 unexpected behavior of P30 Micron flashes during state change "erase ->
 erase suspend"
From: Andrea Adami <andrea.adami@gmail.com>
To: BRUNMAYR Peter <Peter.BRUNMAYR@frequentis.com>
In-Reply-To: <5FAE9987B8383445A4ECA479C08AC4816BBBD81A@vie197nt>
References: <5FAE9987B8383445A4ECA479C08AC4816BBBD81A@vie197nt>
Content-Type: text/plain; charset="us-ascii"
Date: Fri, 31 Jan 2014 19:00:43 +0100
Message-ID: <1391191243.2501.3.camel@mizar.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-01-31 at 14:58 +0000, BRUNMAYR Peter wrote:
> We are using two Micron P30 PC28F00AP30EFA flashes in parallel connected to a P1022 PowerPC with Linux 3.4.61. During extensive erase/suspend/resume cycles,
> one of the flashes sometimes sends seemingly random data instead of the expected content of the status register. Due to a misinterpretation of the received data,
> the flash driver may issue the next command before the flash is actually ready. In our setup this lead to buffer write errors. 
> 
> The problem concerns the chip_ready() function in drivers/mtd/chips/cfi_cmdset_0001.c. In the case the flashes are currently erasing, the driver sends 0xB0 to
> suspend the current operation and 0x70 to ensure "read status" mode. After that the driver polls the flashes until bit 7 in the status register is set (device ready).
> Our observations showed, that sometimes one of the flashes sends seemingly random data (e.g. 0x3ff0) right before it has finished suspending the erase operation.
> If bit 7 is accidentally set, the driver misinterprets this as the status "device ready" and aborts the loop to issue the next command. In our system, the following buffer
> write command was not recognized by the concerned flash, which further lead to the aforementioned buffer write error.
> 
> (01) write: 0x00b000b0 @0xd1d800	erase suspend command
> (02) write: 0x00700070 @0xd1d800	read status register command
> (03) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
> (04) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
> (05) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
> (06) read:  @0xd1d800: 0x00000000 	flash1: device busy flash2: device busy
> (07) read:  @0xd1d800: 0x00400000	flash1: device busy, erase suspend in effect, flash2: device busy
> (08) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in effect, flash2: device busy, erase suspend in effect
> (09) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in effect, flash2: device busy, erase suspend in effect
> (10) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in effect, flash2: device busy, erase suspend in effect
> (11) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in effect, flash2: device busy, erase suspend in effect
> (12) read:  @0xd1d800: 0x00400040	flash1: device busy, erase suspend in effect, flash2: device busy, erase suspend in effect
> (13) read:  @0xd1d800: 0x00c03ff0	flash1: device ready, erase suspend in effect, flash2: not ready and sends garbage
> (14) read:  @0xd1d800: 0x00c03ff0	flash1: device ready, erase suspend in effect, flash2: not ready and sends garbage
> (15) read:  @0xd1d800: 0x00c000c0	flash1: device ready, erase suspend in effect, flash2: device ready, erase suspend in effect
> 
>  
> Did anyone observe a similar behavior with Micron flashes respectively does anyone have an explanation for this behavior? 
> 

Hi Peter,

I experience similar issues. See actual patches still work in progress
[1]

you are surely aware of
http://www.micron.com/~/media/Documents/Products/Technical%20Note/NOR%
20Flash/tn1206_p30_p33_j3_linux.pdf

Check out the specific fixes.
I've tested that on my NOR but w/out much luck...

One question: do you force CFI detection or does it 'just work'?

Regards

Andrea



[1]
http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd

> Thanks & best regards,
> Peter
> _____________________________________ 
> Peter Brunmayr
> FREQUENTIS AG
> 
> Innovationsstrasse 1, 1100 Vienna, Austria
> Web www.frequentis.com
> Handelsgericht Wien (Vienna Commercial Court): FN 72115 b
> DVR 0364797, ATU 14715600
> ______________________________________ 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
