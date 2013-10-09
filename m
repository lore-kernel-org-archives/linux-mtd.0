Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VU1YT-0001xu-Kf
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 21:44:30 +0000
Received: by mail-oa0-f52.google.com with SMTP id n2so805384oag.39
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 14:44:08 -0700 (PDT)
Date: Wed, 9 Oct 2013 14:44:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: N25Q256A 13E40
Message-ID: <20131009214401.GD23337@ld-irv-0074.broadcom.com>
References: <201310071824.01028.marex@denx.de>
 <CAN8TOE_C+uU+JXn2OJ_5y6DbvxQXTQK7emEqoxXkCHkCzSQ13g@mail.gmail.com>
 <201310091214.02740.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201310091214.02740.marex@denx.de>
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

Hi,

On Wed, Oct 09, 2013 at 12:14:02PM +0200, Marek Vasut wrote:
> > On Mon, Oct 7, 2013 at 9:24 AM, Marek Vasut <marex@denx.de> wrote:
> > > Let's talk about our favourite chip :) I just got my hands on N25Q256A .
> > > Since there was quite a flurry of patches for this and similar chips and
> > > I got it working on a different chip with exactly the same IDs and type,
> > > I'd would expect linux to work with this one too. Guess what ... ;-)
> > > 
> > > This particular incarnation of N25Q256A completely ignores the 4-byte
> > > ERASE (0xdc) command. Apparently, if I look closely, it's N25Q256A 13E40
> > > variant and seeing the Note #14 (datasheet page 30 / below Table 18.
> > > Command set), quoting:
> > > 
> > > 14.This command is only for part numbers N25Q256A83ESF40x and
> > > N25Q256A83E1240x.
> > 
> > This note also applies to PAGE_PROGRAM_4B (0x12) as well, right?
> 
> Yeah, both ERASE_4B and PP_4B or whatever they're called there. Interestingly 
> enough, READ_4B works ;-/

Well, the READ_4B consistency is (unintentionally?) helpful for my
systems, as we have begun implementing a jumper switch so that the boot
ROM will know whether to use FAST_READ or FAST_READ_4B. Since
essentially all large SPI flash at *least* support the READ_4B command
(as you noted), we can reliably boot from the flash, no matter what mode
it is left in. After booting, we can choose the appropriate mode for
programming/erasing.

> > [Now that I went back to look at some more code:] Wait, but we don't
> > even try to use the 4-byte dedicated commands like 0xdc on Micron
> > flash, so why are you having this problem? The code currently stands
> > as:
> 
> The JEDEC_MFR for this flash Micron N25Q256A is CFI_MFR_ST (I wonder why).

Probably some series of acquisitions?

But you didn't quite answer my question. Are you having problems with
this Micron/ST/something-that's-not-AMD-or-Spansion flash using the
current mainline? Or did you only have trouble when you tried modifying
the code to use the dedicated 4-byte addressing commands?

> >   if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
> >           /* Dedicated 4-byte command set */
> >           ...

Brian
