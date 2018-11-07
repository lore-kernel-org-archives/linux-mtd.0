Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKIM8-0003sa-Rl
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 07:34:30 +0000
Received: by mail-lf1-x143.google.com with SMTP id f23so6192197lfc.13
 for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2018 23:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20181106214416.11342-1-geert@linux-m68k.org>
 <20181106225829.5ecbe19e@bbrezillon>
 <CAMuHMdUQhsikcBzRFAvrCwZwzFK_Coh=fqpSihFP6jEtugCMQw@mail.gmail.com>
 <20181106233432.76df6bbf@bbrezillon>
In-Reply-To: <20181106233432.76df6bbf@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 7 Nov 2018 08:33:57 +0100
Message-ID: <CAPybu_0c115rhqO4RTa27H2j78t9z=rfOy9ukL1h4z18J8MBDQ@mail.gmail.com>
Subject: Re: [PATCH next] mtd: maps: physmap: Fix infinite loop crash in ROM
 type probing
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org,
 linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris and Geert

On Tue, Nov 6, 2018 at 11:34 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Tue, 6 Nov 2018 23:19:14 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > Hi Boris,
> >
> > On Tue, Nov 6, 2018 at 10:58 PM Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:
> > > On Tue,  6 Nov 2018 22:44:16 +0100
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Toshiba RBTX4927, where map_probe is supposed to fail:
> > > >
> > > >     Creating 2 MTD partitions on "physmap-flash.0":
> > > >     0x000000c00000-0x000001000000 : "boot"
> > > >     0x000000000000-0x000000c00000 : "user"
> > > >     physmap-flash physmap-flash.1: physmap platform flash device: [mem 0x1e000000-0x1effffff]
> > > >     CPU 0 Unable to handle kernel paging request at virtual address 00000000, epc == 80320f40, ra == 80321004
> > > >     ...
> > > >     Call Trace:
> > > >     [<80320f40>] get_mtd_chip_driver+0x30/0x8c
> > > >     [<80321004>] do_map_probe+0x20/0x90
> > > >     [<80328448>] physmap_flash_probe+0x484/0x4ec
> > > >
> > > > The access to rom_probe_types[] was changed from a sentinel-based loop
> > > > to an infinite loop, causing a crash when reaching the sentinel.
> > >
> > > Oops. Do you mind if I fix that in-place (squash your changes in
> > > Ricardo's original commit)?
>
> Done.
>
> >
> > No problem. Thanks!
>

Thanks to both of you for fixing this .
> Thanks for reporting/fixing the bug.
>
> Boris
>


-- 
Ricardo Ribalda
