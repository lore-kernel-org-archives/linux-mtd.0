Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUnpq-0004CW-IR
 for linux-mtd@lists.infradead.org; Sat, 12 Oct 2013 01:17:39 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: N25Q256A 13E40
Date: Sat, 12 Oct 2013 03:17:11 +0200
References: <201310071824.01028.marex@denx.de>
 <201310091214.02740.marex@denx.de>
 <20131009214401.GD23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131009214401.GD23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310120317.12174.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Sorry for the late reply :(

> Hi,
> 
> On Wed, Oct 09, 2013 at 12:14:02PM +0200, Marek Vasut wrote:
> > > On Mon, Oct 7, 2013 at 9:24 AM, Marek Vasut <marex@denx.de> wrote:
> > > > Let's talk about our favourite chip :) I just got my hands on
> > > > N25Q256A . Since there was quite a flurry of patches for this and
> > > > similar chips and I got it working on a different chip with exactly
> > > > the same IDs and type, I'd would expect linux to work with this one
> > > > too. Guess what ... ;-)
> > > > 
> > > > This particular incarnation of N25Q256A completely ignores the 4-byte
> > > > ERASE (0xdc) command. Apparently, if I look closely, it's N25Q256A
> > > > 13E40 variant and seeing the Note #14 (datasheet page 30 / below
> > > > Table 18. Command set), quoting:
> > > > 
> > > > 14.This command is only for part numbers N25Q256A83ESF40x and
> > > > N25Q256A83E1240x.
> > > 
> > > This note also applies to PAGE_PROGRAM_4B (0x12) as well, right?
> > 
> > Yeah, both ERASE_4B and PP_4B or whatever they're called there.
> > Interestingly enough, READ_4B works ;-/
> 
> Well, the READ_4B consistency is (unintentionally?) helpful for my
> systems, as we have begun implementing a jumper switch so that the boot
> ROM will know whether to use FAST_READ or FAST_READ_4B. Since
> essentially all large SPI flash at *least* support the READ_4B command
> (as you noted), we can reliably boot from the flash, no matter what mode
> it is left in. After booting, we can choose the appropriate mode for
> programming/erasing.

I wish I had such a bootrom. In my case (freescale imx28), the bootrom can just 
do 3-byte operation and that's it. I believe the only way around here is to 
power-cycle the spi flash before the bootrom starts using it.

> > > [Now that I went back to look at some more code:] Wait, but we don't
> > > even try to use the 4-byte dedicated commands like 0xdc on Micron
> > > flash, so why are you having this problem? The code currently stands
> > 
> > > as:
> > The JEDEC_MFR for this flash Micron N25Q256A is CFI_MFR_ST (I wonder
> > why).
> 
> Probably some series of acquisitions?
> 
> But you didn't quite answer my question. Are you having problems with
> this Micron/ST/something-that's-not-AMD-or-Spansion flash using the
> current mainline? Or did you only have trouble when you tried modifying
> the code to use the dedicated 4-byte addressing commands?

Urgh, I just noticed I did exactly this. I modified the driver to enable this 4-
byte opcodes and then just forgot about it. Pardon my stupidity :(

Best regards,
Marek Vasut
