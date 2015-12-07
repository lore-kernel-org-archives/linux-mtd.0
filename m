Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a60I0-0003Mu-OX
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2015 18:13:33 +0000
Received: by pabfh17 with SMTP id fh17so132118067pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 10:13:11 -0800 (PST)
Date: Mon, 7 Dec 2015 10:13:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Arlott <simon@fire.lp0.eu>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Jonas Gorski <jogo@openwrt.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and
 of_mtd_match_mtd_parser() helpers
Message-ID: <20151207181308.GN120110@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
 <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 06, 2015 at 08:45:40PM -0600, Rob Herring wrote:
> On Fri, Dec 4, 2015 at 11:19 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> >  drivers/of/of_mtd.c            | 33 +++++++++++++++++++++++++++++++++
> 
> BTW, this file should be moved to drivers/mtd/ at some point.

How about s/at some point/now/ ? I can send a separate patch. It also
seems like these should just get linked into the 'mtd' module (when
CONFIG_OF=y) instead of having a tiny module for just a few functions.

Why did files like this get placed here anyway? Is there a reason that
there are things like of_net and of_pci here too?

Brian
