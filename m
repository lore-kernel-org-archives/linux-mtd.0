Subject: Re: physmap and pointless shutdown() function ?
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0906051642i6a270831peddba0f49e22b75@mail.gmail.com>
References: <8bd0f97a0905061941s6055c6dfrf467a6b2b837c8f8@mail.gmail.com>
	<1244224312.3751.187.camel@macbook.infradead.org>
	<8bd0f97a0906051642i6a270831peddba0f49e22b75@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 06 Jun 2009 13:27:55 +0100
Message-Id: <1244291275.3751.1749.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-05 at 19:42 -0400, Mike Frysinger wrote:
> On Fri, Jun 5, 2009 at 13:51, David Woodhouse wrote:
> > On Wed, 2009-05-06 at 22:41 -0400, Mike Frysinger wrote:
> >> waaaay back when power management support was added to the physmap.c
> >> driver, it added the standard suspend/resume functions.  no problem
> >> there.  but it also added a shutdown function which causes the flash
> >> to suspend/resume when rebooting:
> >> static void physmap_flash_shutdown(struct platform_device *dev)
> >> {
> >>     struct physmap_flash_info *info = platform_get_drvdata(dev);
> >>     int i;
> >>     for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
> >>         if (info->mtd[i]->suspend && info->mtd[i]->resume)
> >>             if (info->mtd[i]->suspend(info->mtd[i]) == 0)
> >>                 info->mtd[i]->resume(info->mtd[i]);
> >> }
> >>
> >> i cant see any point in doing this.  it isnt like the flash has
> >> buffers that need flushing, and if they did, using suspend/resume as a
> >> hack for flushing sounds pretty broken to me.
> >>
> >> seems to me the function should just be dropped completely.
> >
> > Wasn't that just to put it into read mode in case the bootloader is
> > running from the same chip?
> 
> the flash isnt put into read mode though.  if i add printk's to the
> shutdown function like so:
> then during reboot i see:
> physmap_flash_shutdown: 0: before: aded5006
> physmap_flash_shutdown: 0: after: 800080
> the first value is the correct value

That's odd, and would seem to indicate that the attempt to ensure the
flash is in read mode isn't _working_. But I still think that was the
_intent_ of this code. It was just coincidence that it was in read mode
before the call; we needed to make 100% sure.

> the first value is the correct value
> 
> > Reboot doesn't work very well if all you
> > have is flash status bits at your reset vector,
> 
> your assumption is faulty in that the reset vector is the base of the
> flash.  i.e. the physmap base is 0x20000000 as is the reset vector.

The reset vector may or may not be in the physmap flash. If it's not, of
course, then the shutdown state doesn't matter. If it _is_, then the
shutdown state _might_ matter (depending on the hardware reset
arrangements).

It doesn't matter whether it's at the base of the flash, at the end of
the flash, or in the middle -- does it?

> physmap platform flash device: 02000000 at 20000000
> physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
>  Intel/Sharp Extended Query Table at 0x010A
> Using buffer write method
> Using auto-unlock on power-up/resume
> cfi_cmdset_0001: Erase suspend on write enabled
> RedBoot partition parsing not available
> Using physmap partition information
> Creating 3 MTD partitions on "physmap-flash.0":
> 0x00000000-0x00040000 : "bootloader(nor)"
> 0x00040000-0x00440000 : "linux kernel(nor)"
> 0x00440000-0x01000000 : "file system(nor)"
> 
> > because you didn't bother to wire up a hardware reset line to the flash.
> 
> i'm not disputing the hardware sucks, except your assertion that
> "didnt bother" is simply wrong.  there is no hardware reset line that
> could possibly be wired up in the first place (deficiency in the
> processor itself).

OK, so the CPU architectures didn't bother to give you an outward-facing
reset line that you _could_ hook up to your flash. We're still arguing
semantics :)

The point remains -- I don't think we can remove the shutdown() function
-- I think it needs to be fixed to leave the flash in read mode.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
