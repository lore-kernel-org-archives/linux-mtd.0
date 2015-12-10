Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7845-0005a5-LI
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 20:43:50 +0000
Received: by pacwq6 with SMTP id wq6so52816610pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2015 12:43:28 -0800 (PST)
Date: Thu, 10 Dec 2015 12:43:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Michal Suchanek <hramrach@gmail.com>, Jonas Gorski <jogo@openwrt.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 devicetree-spec@vger.kernel.org, Simon Arlott <simon@fire.lp0.eu>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Rob Herring <robh+dt@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
Message-ID: <20151210204324.GK144338@google.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151207013628.GC20139@voom.fritz.box>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 07, 2015 at 12:36:28PM +1100, David Gibson wrote:
> On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
> > On 5 December 2015 at 12:39, Jonas Gorski <jogo@openwrt.org> wrote:
> > > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> > > <computersforpeace@gmail.com> wrote:
> > 
> > >> +
> > >> +Examples:
> > >> +
> > >> +flash@0 {
> > >> +       partitions {
> > >> +               compatible = "google,fmap";
> > >> +       };
> > >> +};
> > >
> > > I wonder if this wouldn't be better served in a separate binding doc
> > > with its compatible name as the filename, like we do with
> > > driver^Whardware blocks, especially if we want to add more parsers.
> > 
> > 
> > I find that *very* counter productive for bindings that go to the same
> > node. You have a description of a node, and then suddenly there you
> > have another file with another description of the same node. Totally
> > awesome.
> 
> I can't actually work out from that if you're agreeing with the
> original post or the first reply.

Perhaps I'm biased, but I think he was agreeing with the first reply.
(Particularly, "I find that *very* counter productive" uses the word
"that" to refer to "separate binding doc[s]".)

> > Also how do you plan to write partitioning schemes with parameters
> > like with non-zero offset of the partition table.

If you are directing this question at me: I don't have a specific plan
for it. MTD parsers don't currently take external input for this; many
scan the whole device, but some might also have conventions built into
the parser itself too, so this just gets hooked based on "compatible".
But if the need arose, I would hope we could work out a common binding.

> Presumably with properties in the patitions node.  Not seeing the
> problem here.

I believe Michal is bringing up the (important, IMO) point that if
distinct partition types are being described in the same node, then any
use of additional properties *must* be closely coordinated. We can't
have two parsers "foo" and "bar" defining conflicting uses of the same
property in the same node, like this:

	partitions {
		compatible = "foo", "bar";
		property-baz = ...; // e.g., reg = <...>;
	};

where if "foo" is not found, we fall back to "bar". But what if "foo"
and "bar" use "property-baz" differently?

Having everything in one doc would help ensure that the entire
"partitions" binding is considered as a whole when extending it, in my
(and an in my interpretation of Michal's) opinion.

Brian
