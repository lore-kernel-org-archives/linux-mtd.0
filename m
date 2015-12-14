Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8SG0-0007ES-GH
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 12:29:37 +0000
Received: by wmpp66 with SMTP id p66so58620723wmp.1
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 04:29:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXA4-BZpvtCM8_9fYWLzoVsuCXDqvF3G4cVd50Cqsfv0g@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box> <20151210204324.GK144338@google.com>
 <20151212055105.GA17011@voom.fritz.box>
 <CAMuHMdXA4-BZpvtCM8_9fYWLzoVsuCXDqvF3G4cVd50Cqsfv0g@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 14 Dec 2015 13:28:34 +0100
Message-ID: <CAOMqctTPfLGZpdnTtv4PKJZHQwW8Zhz+s-P86ZM5uQZg7KEV5w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Brian Norris <computersforpeace@gmail.com>,
 Jonas Gorski <jogo@openwrt.org>,
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

On 14 December 2015 at 11:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, Dec 12, 2015 at 6:51 AM, David Gibson
> <david@gibson.dropbear.id.au> wrote:
>> On Thu, Dec 10, 2015 at 12:43:24PM -0800, Brian Norris wrote:
>>> On Mon, Dec 07, 2015 at 12:36:28PM +1100, David Gibson wrote:
>>> > On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
>>> > > On 5 December 2015 at 12:39, Jonas Gorski <jogo@openwrt.org> wrote:
>>> > > > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
>>> > > > <computersforpeace@gmail.com> wrote:
>>> > >
>>> > > >> +
>>> > > >> +Examples:
>>> > > >> +
>>> > > >> +flash@0 {
>>> > > >> +       partitions {
>>> > > >> +               compatible = "google,fmap";
>>> > > >> +       };
>>> > > >> +};
>>> > > >
>>> > > > I wonder if this wouldn't be better served in a separate binding doc
>>> > > > with its compatible name as the filename, like we do with
>>> > > > driver^Whardware blocks, especially if we want to add more parsers.
>>> > >
>>> > >
>>> > > I find that *very* counter productive for bindings that go to the same
>>> > > node. You have a description of a node, and then suddenly there you
>>> > > have another file with another description of the same node. Totally
>>> > > awesome.
>>> >
>>> > I can't actually work out from that if you're agreeing with the
>>> > original post or the first reply.
>>>
>>> Perhaps I'm biased, but I think he was agreeing with the first reply.
>>> (Particularly, "I find that *very* counter productive" uses the word
>>> "that" to refer to "separate binding doc[s]".)
>>>
>>> > > Also how do you plan to write partitioning schemes with parameters
>>> > > like with non-zero offset of the partition table.
>>>
>>> If you are directing this question at me: I don't have a specific plan
>>> for it. MTD parsers don't currently take external input for this; many
>>> scan the whole device, but some might also have conventions built into
>>> the parser itself too, so this just gets hooked based on "compatible".
>>> But if the need arose, I would hope we could work out a common binding.
>>>
>>> > Presumably with properties in the patitions node.  Not seeing the
>>> > problem here.
>>>
>>> I believe Michal is bringing up the (important, IMO) point that if
>>> distinct partition types are being described in the same node, then any
>>> use of additional properties *must* be closely coordinated. We can't
>>> have two parsers "foo" and "bar" defining conflicting uses of the same
>>> property in the same node, like this:
>>>
>>>       partitions {
>>>               compatible = "foo", "bar";
>>>               property-baz = ...; // e.g., reg = <...>;
>>>       };
>>>
>>> where if "foo" is not found, we fall back to "bar". But what if "foo"
>>> and "bar" use "property-baz" differently?
>>
>> Ah.. that is an excellent point, and leads me to realise that using
>> compatible in this way is wrong.  The whole point of compatible is
>> that the node is, well, compatible with *all* the things in the list,
>> and therefore the things in the list are compatible with each other.
>>
>> Using it for a list of entirely different things to attempt in order
>> is not correct.
>
> Isn't the idea behind a partition table that all partition information is
> stored on the device in a well-known format, so you don't need additional
> properties?
>
> If the only property needed is the partition table offset, it can be encoded
> in the unit-address, and the "reg" property:
>
>         partitions {
>
>                 partition-table@xxxx {
>                         reg = <0xxxx ...>;
>                         ...
>                 };
>
>                 ...
>         };
>
> If you do need additional properties, you'll have to add separate partition
> table nodes.
> Where? Outside the "partitions" subnode?
> What with multiple partition tables
>   - some needing properties (outside "partitions"),
>   - others not (outside/inside "partitions"),
>   - others needing the offset (inside "partitions"?

Hello,

IIRC there is RedBoot on-flash partition format support in kernel
which has the partition table offset as compile time configuration
parameter. Moving this to DT would make unified kernel for boards with
different RedBoot table offsets possible.

I don't use any board with RedBoot so I would not know if there is
other issue preventing such unified kernel.

It might be an actual use case for both the binding and the extra
argument with current partitioning scheme, though.

Thanks

Michal
