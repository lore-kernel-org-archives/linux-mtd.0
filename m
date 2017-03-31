Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cttqr-0007vb-FZ
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 10:32:19 +0000
Date: Fri, 31 Mar 2017 12:31:53 +0200
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
Message-ID: <20170331123153.038e3ada@bbrezillon>
In-Reply-To: <40a0f980-c849-30de-c906-a708e4d90be5@gmail.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170331093013.29123-1-zajec5@gmail.com>
 <20170331115654.41592eba@bbrezillon>
 <40a0f980-c849-30de-c906-a708e4d90be5@gmail.com>
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

On Fri, 31 Mar 2017 12:12:56 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> On 03/31/2017 11:56 AM, Boris Brezillon wrote:
> > On Fri, 31 Mar 2017 11:30:12 +0200
> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> > =20
> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>
> >> Handling (creating) partitions for flash devices requires using a prop=
er
> >> driver that will read partition table (out of somewhere). We can't
> >> simply try all existing drivers one by one, so MTD subsystem allows
> >> drivers to specify a list of applicable part probes.
> >>
> >> So far physmap_of was the only driver with support for linux,part-probe
> >> DT property. Other ones had list or probes hardcoded which wasn't maki=
ng
> >> them really flexible. It prevented using common flash drivers on
> >> platforms that required some specific partition table access.
> >>
> >> This commit moves support for mentioned DT property to the MTD core
> >> file. Thanks to calling it on device parse registration (as suggested =
by
> >> Boris) all drivers gain support for it for free.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >> ---
> >>  drivers/mtd/maps/physmap_of.c | 36 +---------------------------------=
--
> >>  drivers/mtd/mtdcore.c         | 34 ++++++++++++++++++++++++++++++++++=
 =20
> >
> > Maybe you should split the patch:
> > 1/ add core infrastructure
> > 2/ remove open-coded version in drivers/mtd/maps/physmap_of.c =20
>=20
> What's the gain of that? Is this patch too complex to review properly? Wi=
ll that
> be useful for anyone to have it split? For me it only adds an intermediat=
e code
> duplication.

The gain is that we get rid of the dependency we have on patch "mtd:
physmap_of: use OF helpers for reading strings" which is not even
mentioned in your mails.

>=20
>=20
> > BTW, not sure the intermediate "mtd: physmap_of: use OF helpers
> > for reading strings" patch is really useful, since you move to the
> > common infrastructure here.
> > By following my suggestion you get rid of the dependency you have
> > between this series and patch "mtd: physmap_of: use OF helpers for
> > reading strings". =20
>=20
> I learned (the very hard way) MTD people can be really nitpicking so I'm
> sending as simple patches as I can. I see it as the only way for someone =
from
> OpenWrt/LEDE project to get patch through your review.

And I learned the hard way that OpenWRT/LEDE developers tend to not
listen to our advices and keep arguing on things that have been proven
to be existing because of bad decision they made at some point in the
project life. So I think we're even :-P.

>=20
> It's like with this patch: even a simple code move can be questioned. Ple=
ase
> drop this patchset, I'll resend it after/if I manage to get
> [PATCH] mtd: physmap_of: use OF helpers for reading strings
> accepted.

But really, what's the point of this patch? It's just a cleanup. You're
not fixing a bug or changing the behavior, and your real objective is
to get support for the linux,part-probe in the core, which will then
allow us to drop the open-coded version you have in physmap_of.c.

I don't think it deserves an intermediate patch, unless your real
objective is patchcount.
