Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5HFX-0004vh-Nx
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 18:08:00 +0000
Received: by wmec201 with SMTP id c201so103136342wme.1
 for <linux-mtd@lists.infradead.org>; Sat, 05 Dec 2015 10:07:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUJXHs_OhT0da+kzc=D4MOFUT9BB3eJ+7a_p6DYx-PKBA@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUJXHs_OhT0da+kzc=D4MOFUT9BB3eJ+7a_p6DYx-PKBA@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Sat, 5 Dec 2015 19:06:57 +0100
Message-ID: <CAOMqctTPq56Ukp89+KfLW8n2FUWv_=UoeK0SJ3NzGpq4Lr6Pzw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 devicetree-spec@vger.kernel.org,
 Simon Arlott <simon@fire.lp0.eu>, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 David Hendricks <dhendrix@chromium.org>,
 Jonas Gorski <jogo@openwrt.org>, Rob Herring <robh+dt@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 December 2015 at 11:15, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> There have been several discussions [1] about adding a device tree binding for
>> associating flash devices with the partition parser(s) that are used on the
>> flash. There are a few reasons:
>>
>>  (1) drivers shouldn't have to be encoding platform knowledge by listing what
>>      parsers might be used on a given system (this is the currently all that's
>>      supported)
>>  (2) we can't just scan for all supported parsers (like the block system does), since
>>      there is a wide diversity of "formats" (no standardization), and it is not
>>      always safe or efficient to attempt to do so, particularly since many of
>>      them allow their data structures to be placed anywhere on the flash, and
>>      so require scanning the entire flash device to find them.
>
> I read the second reason, but would it be useful to (partially) merge
> block/partitions/ and drivers/mtd/partitions/, so I can use e.g. msdos
> partitions
> on an mtd device??
>

Using msdos partition on a MTD device does not sound terribly useful.
On what kind of non-block device would you expect to find one?

On the other hand, using FMAP on a block device might work an even
might have some uses.

Thanks

Michal
