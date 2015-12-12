Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7Z4f-0008U2-75
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 01:34:13 +0000
Received: by pabur14 with SMTP id ur14so73848001pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Dec 2015 17:33:52 -0800 (PST)
Date: Fri, 11 Dec 2015 17:33:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>,
 David Hendricks <dhendrix@chromium.org>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
Message-ID: <20151212013349.GA86087@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUJXHs_OhT0da+kzc=D4MOFUT9BB3eJ+7a_p6DYx-PKBA@mail.gmail.com>
 <20151210205449.GL144338@google.com>
 <CAMuHMdV-uethsChWVZGSx1JNcAofODmg14ppGYJP2ewfwhEv1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV-uethsChWVZGSx1JNcAofODmg14ppGYJP2ewfwhEv1Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 11, 2015 at 09:44:37AM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 10, 2015 at 9:54 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > IOW, I wouldn't expect MBR or GPT to work well on large raw NAND flash,
> > and so I don't plan to do that sort of work myself. If you can provide
> > some better argument for it, and some nice maintainable code to go with
> > it, then of course it could be considered :)
> 
> There's also NOR FLASH (e.g. SPI-NOR), which is what most boards I'm
> working on have.

OK. But these flash are often used for the boot firmware, no? And then,
does the boot code have to be provided at one end of the flash (e.g.,
bottom)? If so, then something like MBR or GPT will likely not apply,
since they reserve the first (and sometimes last) blocks of the medium.

Brian
