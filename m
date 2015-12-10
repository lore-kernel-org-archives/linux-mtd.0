Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a78Qr-00082x-Mi
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 21:07:22 +0000
Received: by pfbu66 with SMTP id u66so9990773pfb.3
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2015 13:07:00 -0800 (PST)
Date: Thu, 10 Dec 2015 13:06:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Arlott <simon@fire.lp0.eu>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>,
 David Hendricks <dhendrix@chromium.org>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
Message-ID: <20151210210656.GM144338@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <CAOiHx==8TFK9t4h2C0Q+j==nuRP3EbyVa+nuYuSEj_LCDa820Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx==8TFK9t4h2C0Q+j==nuRP3EbyVa+nuYuSEj_LCDa820Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 05, 2015 at 12:35:42PM +0100, Jonas Gorski wrote:
> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > Hi,
> >
> > There have been several discussions [1] about adding a device tree binding for
> > associating flash devices with the partition parser(s) that are used on the
> > flash. There are a few reasons:
> >
> >  (1) drivers shouldn't have to be encoding platform knowledge by listing what
> >      parsers might be used on a given system (this is the currently all that's
> >      supported)
> >  (2) we can't just scan for all supported parsers (like the block system does), since
> >      there is a wide diversity of "formats" (no standardization), and it is not
> >      always safe or efficient to attempt to do so, particularly since many of
> >      them allow their data structures to be placed anywhere on the flash, and
> >      so require scanning the entire flash device to find them.
> >
> > So instead, let's support a new binding so that a device tree can specify what
> > partition formats might be used. This seems like a reasonable choice (even
> > though it's not strictly a hardware description) because the flash layout /
> > partitioning is often very closely tied with the bootloader/firmware, at
> > production time.
> 
> On a first glance this looks good to me, and looks easily extensible
> for application of non-complete partition parsers.
> 
> E.g. for the "brcm,bcm6345-imagetag" we would want to actually do something like
> 
> partitions {
>     ....
> 
>     partition@0 {
>         reg = <0x0 0x10000>;
>         label = "cfe";
>         read-only;
>     };
> 
>     partition@10000 {
>         reg = <0x10000 0x3d0000>;
>         label = "firmware";
>         compatible = "brcm,bcm6345-imagetag";
>     };
> 
>     partition@3e0000 {
>         reg = <0x3e0000 0x10000>;
>         label = "art";
>         read-only;
>     };
> 
>    partition@3f0000 {
>         reg = <0x3f0000 0x10000>;
>         label = "nvram";
>         read-only;
>     };
> };
> 
> as the image tag can only specify the offsets and sizes of the rootfs
> and kernel parts, but not of any other parts.

I had your (and others') prior attempts and suggestions in mind when
planning this, and I agree that the binding looks extendible to cases
like that. I haven't yet worked out what a good MTD infrastructure for
that would look like, so I stuck with defining and implementing only
what I know use :)

> > Also, as an example first-use of this mechanism, I support Google's FMAP flash
> > structure, used on Chrome OS devices.
> >
> > Note that this is an RFC, mainly for the reason noted in patch 6 ("RFC: mtd:
> > partitions: enable of_match_table matching"): the of_match_table support won't
> > yet autoload a partition parser that is built as a module. I'm not quite sure
> > if there's a lot of value in supporting MTD parsers as modules (block partition
> > support can't be), but that is supported for "by-name" parser lookups in MTD
> > already, so I don't feel like dropping that feature yet. Tips or thoughts are
> > particularly welcome on this aspect!
> 
> I would assume a lot of the cases these would be a chicken-egg
> problem, you need the parser to be able to find and mount the rootfs,
> but you you need mount the rootfs to load the parser.

Not necessarily. One of my current use cases has a boot SPI NOR flash +
an eMMC rootfs. Modules can be loaded from eMMC.

BTW, I'm realizing that if partition parsers are forced to built-in
only, then we'd have to do the same for the MTD core (or at least, the
MTD core that handles partitioning). Not sure if that's a desirable
trade-off. (Again, block support is 'bool' in Kconfig, if we're trying
to compare.)

Brian
