Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7Q62-0007I0-19
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2015 15:59:02 +0000
Received: by wmnn186 with SMTP id n186so37601360wmn.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Dec 2015 07:58:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151210204324.GK144338@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box> <20151210204324.GK144338@google.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 11 Dec 2015 16:58:00 +0100
Message-ID: <CAOMqctQyS0dTAn6nifNzTFTqAZ3caJTj=yKnawP-A3Z4=Sv5rw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Jonas Gorski <jogo@openwrt.org>,
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

Hello,

On 10 December 2015 at 21:43, Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, Dec 07, 2015 at 12:36:28PM +1100, David Gibson wrote:
>> On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
>> > On 5 December 2015 at 12:39, Jonas Gorski <jogo@openwrt.org> wrote:
>> > > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
>> > > <computersforpeace@gmail.com> wrote:
>> >
>> > >> +
>> > >> +Examples:
>> > >> +
>> > >> +flash@0 {
>> > >> +       partitions {
>> > >> +               compatible = "google,fmap";
>> > >> +       };
>> > >> +};
>> > >
>> > > I wonder if this wouldn't be better served in a separate binding doc
>> > > with its compatible name as the filename, like we do with
>> > > driver^Whardware blocks, especially if we want to add more parsers.
>> >
>> >
>> > I find that *very* counter productive for bindings that go to the same
>> > node. You have a description of a node, and then suddenly there you
>> > have another file with another description of the same node. Totally
>> > awesome.
>>
>> I can't actually work out from that if you're agreeing with the
>> original post or the first reply.
>
> Perhaps I'm biased, but I think he was agreeing with the first reply.
> (Particularly, "I find that *very* counter productive" uses the word
> "that" to refer to "separate binding doc[s]".)
>
>
> I believe Michal is bringing up the (important, IMO) point that if
> distinct partition types are being described in the same node, then any
> use of additional properties *must* be closely coordinated. We can't
> have two parsers "foo" and "bar" defining conflicting uses of the same
> property in the same node, like this:
>

I have seen some MFD bindings which are described in multiple files
with no crossreference whatsoever.

If on-flash partition table bindings are going to be the same then
people are not going to find there are even some on-flash partition
table bindings (because the document describing the in-DT bindings is
complete and exhaustive, right). Can't even imagine coordination.

When you have to grep the tree for docs anyway what's even the point
of the Documentation directory?

You can just grep the whole tree.

Thanks

Michal
