Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a59t1-0003gL-5f
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 10:16:15 +0000
Received: by oixx65 with SMTP id x65so78824238oix.0
 for <linux-mtd@lists.infradead.org>; Sat, 05 Dec 2015 02:15:54 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Date: Sat, 5 Dec 2015 11:15:54 +0100
Message-ID: <CAMuHMdUJXHs_OhT0da+kzc=D4MOFUT9BB3eJ+7a_p6DYx-PKBA@mail.gmail.com>
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

On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> There have been several discussions [1] about adding a device tree binding for
> associating flash devices with the partition parser(s) that are used on the
> flash. There are a few reasons:
>
>  (1) drivers shouldn't have to be encoding platform knowledge by listing what
>      parsers might be used on a given system (this is the currently all that's
>      supported)
>  (2) we can't just scan for all supported parsers (like the block system does), since
>      there is a wide diversity of "formats" (no standardization), and it is not
>      always safe or efficient to attempt to do so, particularly since many of
>      them allow their data structures to be placed anywhere on the flash, and
>      so require scanning the entire flash device to find them.

I read the second reason, but would it be useful to (partially) merge
block/partitions/ and drivers/mtd/partitions/, so I can use e.g. msdos
partitions
on an mtd device??

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
