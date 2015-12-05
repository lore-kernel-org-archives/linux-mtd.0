Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5KTP-000834-Jc
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 21:34:32 +0000
Received: by wmec201 with SMTP id c201so106399755wme.1
 for <linux-mtd@lists.infradead.org>; Sat, 05 Dec 2015 13:34:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Sat, 5 Dec 2015 22:33:30 +0100
Message-ID: <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
To: Jonas Gorski <jogo@openwrt.org>
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

On 5 December 2015 at 12:39, Jonas Gorski <jogo@openwrt.org> wrote:
> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:

>> +
>> +Examples:
>> +
>> +flash@0 {
>> +       partitions {
>> +               compatible = "google,fmap";
>> +       };
>> +};
>
> I wonder if this wouldn't be better served in a separate binding doc
> with its compatible name as the filename, like we do with
> driver^Whardware blocks, especially if we want to add more parsers.


I find that *very* counter productive for bindings that go to the same
node. You have a description of a node, and then suddenly there you
have another file with another description of the same node. Totally
awesome.

Also how do you plan to write partitioning schemes with parameters
like with non-zero offset of the partition table.

Thanks

Michal
