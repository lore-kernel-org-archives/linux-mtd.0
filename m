Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a612B-0002Jc-3p
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2015 19:01:15 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 0C69A20562
 for <linux-mtd@lists.infradead.org>; Mon,  7 Dec 2015 19:00:53 +0000 (UTC)
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
 [209.85.220.173])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE3192054C
 for <linux-mtd@lists.infradead.org>; Mon,  7 Dec 2015 19:00:50 +0000 (UTC)
Received: by qkdb5 with SMTP id b5so36669008qkd.0
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 11:00:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151207181308.GN120110@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
 <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w@mail.gmail.com>
 <20151207181308.GN120110@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 7 Dec 2015 13:00:30 -0600
Message-ID: <CAL_JsqJ_dN6tDhjmB29Li6zxTcOcNRbr8Hw2MfnUAT3uWDgzuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and
 of_mtd_match_mtd_parser() helpers
To: Brian Norris <computersforpeace@gmail.com>
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
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 7, 2015 at 12:13 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sun, Dec 06, 2015 at 08:45:40PM -0600, Rob Herring wrote:
>> On Fri, Dec 4, 2015 at 11:19 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> >  drivers/of/of_mtd.c            | 33 +++++++++++++++++++++++++++++++++
>>
>> BTW, this file should be moved to drivers/mtd/ at some point.
>
> How about s/at some point/now/ ?

Great.

> I can send a separate patch. It also
> seems like these should just get linked into the 'mtd' module (when
> CONFIG_OF=y) instead of having a tiny module for just a few functions.

Agreed.

> Why did files like this get placed here anyway? Is there a reason that
> there are things like of_net and of_pci here too?

Things started out here, but as the number of subsystems and
associated bindings grew it became evident that binding specific
things should go with the subsystems. I also have a secret goal to
eliminate drivers/of. Don't tell anyone.

of_net should probably move, just no one has had the itch to do it.
PCI is a bit special and somewhat tied into the rest of the core.

Rob
