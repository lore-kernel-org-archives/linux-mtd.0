Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cC05N-0005Gp-Og
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 08:17:51 +0000
Date: Wed, 30 Nov 2016 09:17:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 00/39] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
Message-ID: <20161130091722.2e35f32a@bbrezillon>
In-Reply-To: <CAK7LNAQPm7w0_iSDLJihFaxSdMp5UMnpDZH5nBTyVnoLL9KYjg@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <20161127160459.5894be93@bbrezillon>
 <CAK7LNAQPm7w0_iSDLJihFaxSdMp5UMnpDZH5nBTyVnoLL9KYjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 Nov 2016 17:02:16 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi.
> 
> 2016-11-28 0:04 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > +Andy
> >
> > Hi Masahiro,
> >
> > On Sun, 27 Nov 2016 03:05:46 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> As I said in the 1st round series, I am tackling on this driver
> >> to use it for my SoCs.
> >>
> >> The previous series was just cosmetic things, but this series
> >> includes *real* changes.
> >>
> >> After some more cleanups, I will start to add changes that
> >> are really necessary.
> >> One of the biggest problems I want to solve is a bunch of
> >> hard-coded parameters that prevent me from using this driver for
> >> my SoCs.
> >>
> >> I will introduce capability flags that are associated with DT
> >> compatible and make platform-dependent parameters overridable.
> >>
> >> I still have lots of reworks to get done (so probably 3rd round
> >> series will come), but I hope it is getting better and
> >> I am showing a big picture now.
> >>  
> >
> > Thanks for posting this 2nd round of patches, I know have a clearer
> > view of what you're trying to achieve.
> > Could you be a bit more specific about the remaining rework (your 3rd
> > round)?  
> 
> 
> [1]
> I want to remove
> get_samsung_nand_para()
> get_onfi_nand_para()
> 
> The driver should not hard-code timing parameters of Samsung specific
> chips.  For ONFI, it is duplicating effort of the core framework.

Definitely.

> 
> I am thinking if it would be possible to implement
> chip->setup_data_interface() in order to set up
> timings in a generic way.

Indeed, and that'd be really cool to have this driver converted to this
new interface.

> 
> [2]
> Remove driver-internal bounce buffer.
> The current Denali driver allocate DMA_BIDIRECTIONAL buffer
> to use it as a driver-internal bounce buffer.
> 
> The hardware transfer page data into the bounce buffer,
> then CPU copies from the bounce buffer to a given buf (and oob_poi).
> This is not efficient.
> 
> So, I want to set NAND_USE_BOUNCE_BUFFER flag
> and do dma_map_single directly for a given buffer.

Sounds good. Be careful though, when you use the generic bounce buffer
interface you might have to clear the page cache info (->pagebuf = -1).

> 
> [3]
> Fix raw and oob callbacks.
> 
> I asked in another thread,
> the current driver just puts the physically accessed OOB data
> into oob_poi, which is not a collection of ECC data.
> Raw write/read() are wrong as well.

That's all good things too.

> 
> After fixing those, enable BBT scan by removing the following flag:
>     /* skip the scan for now until we have OOB read and write support */
>     chip->options |= NAND_SKIP_BBTSCAN;
> 

Hm, here you have a problem. The layout you described replaces BBMs by
payload data, thus preventing the BBM scan approach (or at least, it
won't work with factory BBMs).

Some drivers/controllers have an extra 'switch BBM/data bytes' step to
restore the BBM at the correct place before flushing the data to the
NAND or after reading a page, but I'm not sure this is the case here.

> 
> 
> > Also, if you don't mind, I'd like to have reviews and testing from intel
> > users before applying the series. Can you Cc Andy (and possibly other
> > intel maintainers) for the next round.  
> 
> Sure.
> 
> Anyway, this series already missed the pull-req for 4.10-rc1,
> we have plenty of time until 4.11-rc1.
> 
> Review/test from Intel engineers are very appreciated
> because I have no access to their boards.
> 
> 
