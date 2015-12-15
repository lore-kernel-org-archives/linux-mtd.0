Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8mSo-0006TW-93
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 10:04:10 +0000
Received: by mail-oi0-x233.google.com with SMTP id i186so1975958oia.2
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2015 02:03:49 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20151215060056.GB3011@voom.redhat.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box>
 <20151210204324.GK144338@google.com>
 <20151212055105.GA17011@voom.fritz.box>
 <CAMuHMdXA4-BZpvtCM8_9fYWLzoVsuCXDqvF3G4cVd50Cqsfv0g@mail.gmail.com>
 <20151215060056.GB3011@voom.redhat.com>
Date: Tue, 15 Dec 2015 11:03:48 +0100
Message-ID: <CAMuHMdVUMHEAGSwF=nvbncHEj6Co9f6CofeVqZbrWzhaprBvGQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, Jonas Gorski <jogo@openwrt.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 devicetree-spec@vger.kernel.org,
 Simon Arlott <simon@fire.lp0.eu>, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Rob Herring <robh+dt@kernel.org>,
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

Hi David,

On Tue, Dec 15, 2015 at 7:00 AM, David Gibson
<david@gibson.dropbear.id.au> wrote:
>> If the only property needed is the partition table offset, it can be encoded
>> in the unit-address, and the "reg" property:
>>
>>         partitions {
>>
>>                 partition-table@xxxx {
>>                         reg = <0xxxx ...>;
>>                         ...
>>                 };
>>
>>                 ...
>>         };
>
> Urgh.. and that's abusing the unit address.

Why? The partition is part of the FLASH. In this respect, it doesn't differ
from other hardcoded partitions using the same DT syntax.
It would just have a compatible value indicating it's a partition table.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
