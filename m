Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctuwX-0006If-5N
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 11:42:25 +0000
Date: Fri, 31 Mar 2017 13:41:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] mtd: move code reading DT specified part probes
 to the core
Message-ID: <20170331134151.1f08376f@bbrezillon>
In-Reply-To: <99d4944c-3eb9-5bbd-efd0-2ac6862ab1fb@gmail.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170331093013.29123-1-zajec5@gmail.com>
 <20170331115654.41592eba@bbrezillon>
 <40a0f980-c849-30de-c906-a708e4d90be5@gmail.com>
 <20170331123153.038e3ada@bbrezillon>
 <99d4944c-3eb9-5bbd-efd0-2ac6862ab1fb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rafal,

On Fri, 31 Mar 2017 12:46:38 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> >>> BTW, not sure the intermediate "mtd: physmap_of: use OF helpers
> >>> for reading strings" patch is really useful, since you move to the
> >>> common infrastructure here.
> >>> By following my suggestion you get rid of the dependency you have
> >>> between this series and patch "mtd: physmap_of: use OF helpers for
> >>> reading strings". =20
> >>
> >> I learned (the very hard way) MTD people can be really nitpicking so I=
'm
> >> sending as simple patches as I can. I see it as the only way for someo=
ne from
> >> OpenWrt/LEDE project to get patch through your review. =20
> >
> > And I learned the hard way that OpenWRT/LEDE developers tend to not
> > listen to our advices and keep arguing on things that have been proven
> > to be existing because of bad decision they made at some point in the
> > project life. So I think we're even :-P. =20
>=20
> I wish you could sometimes forget what you've learned and review/discuss =
things
> without all that negative approach I keep seeing.

I try to stay objective, and if you look back at my review, you'll see
that I actually agree with most of your changes. So if one person is
taking it personally it's you, not me.

Now, regarding other contributions, like support for the TRX format, I
keep thinking that it's badly designed and should not be supported in
mainline. I clearly expressed my opinion, and I also said I wouldn't
block the patches if other MTD maintainers were okay to take them (which
is already a good thing, don't you think?). But don't expect me to say
"Youhou, let's merge this awesome feature!".

More generally, if you look back at all the contributions OpenWRT/LEDE
devs made, all uncontroversial features were merged rather quickly. For
the other ones, each time we tried to come up with alternative
solutions, but if you don't want to follow these suggestions (or at
least try them before saying it's impossible), then I think there's
nothing we can do on our side.

>=20
>=20
> >> It's like with this patch: even a simple code move can be questioned. =
Please
> >> drop this patchset, I'll resend it after/if I manage to get
> >> [PATCH] mtd: physmap_of: use OF helpers for reading strings
> >> accepted. =20
> >
> > But really, what's the point of this patch? It's just a cleanup. You're
> > not fixing a bug or changing the behavior, and your real objective is
> > to get support for the linux,part-probe in the core, which will then
> > allow us to drop the open-coded version you have in physmap_of.c.
> >
> > I don't think it deserves an intermediate patch, unless your real
> > objective is patchcount. =20
>=20
> OK, I'm going to trust that and see how easily I get can patch your way. =
I'll
> resend combined version soon.

Let's wait for a DT review, since this is probably the main blocking
aspect.

Regards,

Boris
