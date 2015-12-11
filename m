Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7JJz-0004zv-9W
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2015 08:45:00 +0000
Received: by mail-wm0-x229.google.com with SMTP id l68so2636362wml.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Dec 2015 00:44:38 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20151210205449.GL144338@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUJXHs_OhT0da+kzc=D4MOFUT9BB3eJ+7a_p6DYx-PKBA@mail.gmail.com>
 <20151210205449.GL144338@google.com>
Date: Fri, 11 Dec 2015 09:44:37 +0100
Message-ID: <CAMuHMdV-uethsChWVZGSx1JNcAofODmg14ppGYJP2ewfwhEv1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Arlott <simon@fire.lp0.eu>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Jonas Gorski <jogo@openwrt.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>,
 David Hendricks <dhendrix@chromium.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Thu, Dec 10, 2015 at 9:54 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sat, Dec 05, 2015 at 11:15:54AM +0100, Geert Uytterhoeven wrote:
>> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > There have been several discussions [1] about adding a device tree binding for
>> > associating flash devices with the partition parser(s) that are used on the
>> > flash. There are a few reasons:
>> >
>> >  (1) drivers shouldn't have to be encoding platform knowledge by listing what
>> >      parsers might be used on a given system (this is the currently all that's
>> >      supported)
>> >  (2) we can't just scan for all supported parsers (like the block system does), since
>> >      there is a wide diversity of "formats" (no standardization), and it is not
>> >      always safe or efficient to attempt to do so, particularly since many of
>> >      them allow their data structures to be placed anywhere on the flash, and
>> >      so require scanning the entire flash device to find them.
>>
>> I read the second reason, but would it be useful to (partially) merge
>> block/partitions/ and drivers/mtd/partitions/, so I can use e.g. msdos
>> partitions
>> on an mtd device??
>
> I kinda agree with Michal: is there a good use case?

I don't have an immediate use case.
Just looking at it from a high-level viewpoint.

> Really, MTD partitioning is not a highly-scalable design. Particularly,
> it's not typically that well-suited to large (read: unreliable) NAND
> flash, where fixing partitions at the raw flash level mostly serves to
> restrict UBI's ability to wear-level across the device. For that sort of
> case, it's best if people are using UBI volumes on a (mostly?)
> unpartitioned MTD, instead of using MTD partitions as the main
> separation mechanism. Also, most partition designs (either MTD or block)
> aren't very robust against bitflips, read disturb, etc.
>
> IOW, I wouldn't expect MBR or GPT to work well on large raw NAND flash,
> and so I don't plan to do that sort of work myself. If you can provide
> some better argument for it, and some nice maintainable code to go with
> it, then of course it could be considered :)

There's also NOR FLASH (e.g. SPI-NOR), which is what most boards I'm
working on have.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
