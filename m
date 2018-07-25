Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiT9K-0001at-AB
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 23:24:55 +0000
Received: by mail-pg1-x542.google.com with SMTP id y4-v6so6264187pgp.9
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2018 16:24:43 -0700 (PDT)
Date: Wed, 25 Jul 2018 16:24:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: NeilBrown <neilb@suse.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
Message-ID: <20180725232439.GA154010@ban.mtv.corp.google.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
 <20180723181350.GA58212@ban.mtv.corp.google.com>
 <20180723221002.736e0830@bbrezillon>
 <CAN8TOE904WXMScHo1b2jhusz-L8eGBK=gzUUX079ZVfiFk+HoQ@mail.gmail.com>
 <87in55po3a.fsf@notabene.neil.brown.name>
 <20180724012226.307f578d@bbrezillon>
 <87fu09pfii.fsf@notabene.neil.brown.name>
 <20180724194110.GA190016@ban.mtv.corp.google.com>
 <877elkpaoq.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877elkpaoq.fsf@notabene.neil.brown.name>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Jul 25, 2018 at 07:48:21AM +1000, NeilBrown wrote:
> On Tue, Jul 24 2018, Brian Norris wrote:
> > On Tue, Jul 24, 2018 at 11:51:49AM +1000, NeilBrown wrote:
> >> On Tue, Jul 24 2018, Boris Brezillon wrote:
> >> > On Tue, 24 Jul 2018 08:46:33 +1000
> >> > NeilBrown <neilb@suse.com> wrote:
> >> >> One possibility that occurred to me when I was exploring this issue is
> >> >> to revert to 3-byte mode whenever 4-byte was not actively in use.
> >> >> So any access beyond 16Meg is:
> >> >>  switch-to-4-byte ; perform IO ; switch to 3-byte
> >> >> or similar.  On my hardware it would be more efficient to
> >> >> use the 4-byte opcode to perform the IO, then reset the cached
> >> >> 4th address byte that the NOR chip transparently remembered.
> >
> > Do these chips cache the last 4th-byte used? I don't recall reading
> > that, but that would be interesting. It also sounds like that would make
> > things even more difficult to do robustly.
> 
> That is how the Winbond W25Q256FV appears to behave in my experiments.
> Any time you use a 4-byte address, the high byte is saved.  Any time you
> use a 3-byte address, the saved high-byte is used.
> The data sheet seems to support this understanding, as detailed in
> 
> Commit: f134fbbb4ff8 ("mtd: spi-nor: clear Winbond Extended Address Reg on switch to 3-byte addressing.")

Thanks for the notes. I never really paid attention to that section of
the datasheet, since I always relied on a hardware reset.

By the way, doesn't this part support the dedicated (non-stateful)
4-byte address commands? Why not use those and avoid the problem
entirely? Although, it's not actually clear to me from the datasheet
whether, e.g., Fast Read with 4-byte Address (0Ch) will set the Extended
Address Register.

> >> >> This adds a little overhead, but should be fairly robust.
> >> >> It doesn't help if something goes terribly wrong while IO is happening,
> >> >> but I don't think any other software solution does either.
> >> >> 
> >> >> How would you see that approach?
> >> >
> >> > I think the problem stands: people that have proper HW mitigation for
> >> > this problem (NOR chip is reset when the Processor is reset) don't want
> >> > to pay the overhead. So, even if we go for this approach, we probably
> >> > want to only do that for broken HW.
> >
> > If it actually saves bytes on the wire to stay in 3-byte mode more
> > often, then that could be helpful to all systems. But otherwise, yes, it
> > doesn't really belong on a properly-designed system.
> 
> I'm not sure exactly what you encompass by the term "properly-designed",

I consider all systems with >16MiB SPI flash that have stateful
addressing modes and don't have a useful HW RESET signal to be
improperly designed. These SPI flash never had a standardized (or
easily-determined) software reset, so it's nearly impossible to write
robust software for them that is compatible with a relatively generic
boot ROM and/or bootloader.

> but with the SOC that I have (mt7621) and the flash chip (Winbond
> W25Q256FV) it is not possible to wire them up in any way that will work
> reliably without software support for leaving 3-byte mode.

> The SOC does not have an out-going reset line that signals a general
> system reset - it only has one that signals watchdog reset.
> The flash chip has an incoming reset line, but it shares a pin with
> "hold", and that is the default use.  So we would need to program the

(BTW, you could probably choose to reprogram the HOLD# line to RESET#
before switching to 4-byte mode. That still doesn't resolve the SoC
reset line issue on its own.)

> flash to listen for reset, and it would only catch a watchdog reset.
> For any other reset, the CPU is (should be) in complete control (even
> after a panic!) and it needs to reprogram the flash chip before
> resetting the system.

"Even after a panic" is a bit dubious. That presumes that the cause of
the panic didn't also corrupt your exception code, driver code, driver
data structures, etc., that would be needed to reset the SPI chip
without double-faulting. And what about a panic in your SPI flash
driver?

Overall, my point is that the existence of such non-hardware-resettable
flash guarantees the possibility of a hard enough crash that you cannot
possibly reset it to 3-byte addressing before system reset.

> But maybe you think either the SOC and/or the flash chip is not
> "properly-designed" - and you may be correct..

Yes, I believe I do. If your watchdog reset pin was routed to the flash
HOLD/RESET pin, then I suppose it would be *possible* to have robust
software. But otherwise, I believe it's impossible.

Brian
