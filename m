Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQIR9-0002dQ-Br
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 17:38:52 +0000
Received: by mail-pf0-x22a.google.com with SMTP id n128so86639281pfn.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 09:38:30 -0800 (PST)
Date: Mon, 1 Feb 2016 09:38:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 uml-devel <user-mode-linux-devel@lists.sourceforge.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Stefan Agner <stefan@agner.ch>, Alex Smith <alex.smith@imgtec.com>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Anup Patel <anup.patel@broadcom.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 21/22] mtd: cs553x: Fix dependencies for !HAS_IOMEM archs
Message-ID: <20160201173827.GE19540@google.com>
References: <1453760661-1444-1-git-send-email-richard@nod.at>
 <1453760661-1444-22-git-send-email-richard@nod.at>
 <CAMuHMdX_nH9U9gU4NH0KWPDVXBZmLbQDUp8MVXFpcciwKjmwuA@mail.gmail.com>
 <56A77B7B.2000305@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56A77B7B.2000305@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 26, 2016 at 02:58:19PM +0100, Richard Weinberger wrote:
> Am 26.01.2016 um 12:00 schrieb Geert Uytterhoeven:
> > On Mon, Jan 25, 2016 at 11:24 PM, Richard Weinberger <richard@nod.at> wrote:
> >> Not every arch has io memory nor can this driver ever work
> >> on UML/i386.
> >> So, unbreak the build by fixing the dependencies.
> >>
> >> Signed-off-by: Richard Weinberger <richard@nod.at>
> >> ---
> >>  drivers/mtd/nand/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >> index 545d82b..b253654 100644
> >> --- a/drivers/mtd/nand/Kconfig
> >> +++ b/drivers/mtd/nand/Kconfig
> >> @@ -311,6 +311,7 @@ config MTD_NAND_CAFE
> >>  config MTD_NAND_CS553X
> >>         tristate "NAND support for CS5535/CS5536 (AMD Geode companion chip)"
> >>         depends on X86_32
> >> +       depends on !UML && HAS_IOMEM
> > 
> > I don't think there's a need for the !UML dependency?
> > Hence just "depends on X86_32 && HAS_IOMEM"?
> 
> Strictly speaking this would work as HAS_IOMEM implies !UML.
> The build error shows that it fails also because UML/i386 is x86_32
> but lacks some x86_32 stuff:
> 

[...]

> 
> Maybe a "depends on X86_32 && !UML" would make more sense. hmm?

That may be slightly clearer, but it's equivalent, so I've applied this
patch as-is.

Thanks,
Brian
