Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCpaE-00078a-0e
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 15:17:16 +0000
Date: Fri, 2 Dec 2016 16:16:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: updates for 4.10
Message-ID: <20161202161643.569bb701@bbrezillon>
In-Reply-To: <517f01e7-0e2d-0c5e-6e79-54c7213c774b@denx.de>
References: <2bdf6239-d998-825c-cd22-db6ac09d3391@atmel.com>
 <20161201022238.GA3973@google.com>
 <a16b5d6e-2fcf-be61-f41d-788a08c23177@denx.de>
 <20161201174156.GA66143@google.com>
 <0914d553-20e2-b7e5-f16d-fb562601a4aa@denx.de>
 <20161201185015.GA69517@google.com>
 <ab652681-1f8f-0edd-17c7-93117648e000@atmel.com>
 <517f01e7-0e2d-0c5e-6e79-54c7213c774b@denx.de>
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

On Fri, 2 Dec 2016 14:58:48 +0100
Marek Vasut <marex@denx.de> wrote:

> On 12/02/2016 02:28 PM, Cyrille Pitchen wrote:
> > Hi all,
> >=20
> > Le 01/12/2016 =C3=A0 19:50, Brian Norris a =C3=A9crit : =20
> >> On Thu, Dec 01, 2016 at 07:06:38PM +0100, Marek Vasut wrote: =20
> >>> On 12/01/2016 06:41 PM, Brian Norris wrote: =20
> >>>> On Thu, Dec 01, 2016 at 03:36:35PM +0100, Marek Vasut wrote: =20
> >>>>> On 12/01/2016 03:22 AM, Brian Norris wrote: =20
> >>>>>> BTW, does Marek have access to your repo, or are you planning on d=
oing
> >>>>>> all the merging? =20
> >>>>>
> >>>>> I'm not a big github fan, but I have access, yep. =20
> >>>>
> >>>> Not even as a dumb git server? I can understand not appreciating the
> >>>> web interface. =20
> >>>
> >>> Well, it doesn't really feel right to keep kernel stuff outside of
> >>> kernel.org , or is that OK now ? And I don't really like the EULA
> >>> they have. =20
> >>
> >> There's nothing magical about kernel.org. I see 63 github entries and 7
> >> infradead entries in MAINTAINERS, and 12 github trees and 14 infradead
> >> trees in linux-next.git, to name a few. There's also stuff at
> >> freedesktop.org and probably other places. As with anything
> >> kernel-related, it's a very distributed process, and the key is just to
> >> have some kind of chain of trust, regardless of the storage location.
> >> =20
> >>>> Anyway, nothing (except MAINTAINERS, which can be changed) requires =
we
> >>>> use github. We could probably set up a shared infradead.org repo or
> >>>> maybe even kernel.org if you'd prefer. =20
> >>>
> >>> I have a k.org account, but then, I also don't want to cause too much=
 fuss. =20
> >>
> >> I mean, a shared one between all SPI NOR maintainers. i.e., Cyrille
> >> would need access. I don't really know anything about kernel.org access
> >> permissions, but if he can get on there, then by all means.
> >>
> >> I won't bug much more about this either, but if you would rather pick
> >> something like infradead.org, I'm sure David can help us out.
> >>
> >> Brian
> >> =20
> >=20
> > I'm fine with moving to infradead.org or kernel.org if you think it's m=
ore
> > suited. Boris had advised me to use github just because it is what he u=
ses
> > for the nand subsystem hence I've chosen github so I could be ready qui=
ckly.
> > No other particular reason.
> >=20
> > I don't have a kernel.org account yet, I guess now I have some public
> > contributions to the Linux kernel it should be easy to create one. I've=
 made
> > my GPG public key signed by few kernel.org members.
> > So if needed, we can move to kernel.org. I'm not familiar with it but a=
s long
> > as both Marek and I can share a tree.
> >=20
> > Otherwise we can move to infradead.org or stay with github. =20
>=20
> My impression is that with korg or infradead, we have infrastructure
> which we can trust and which won't go away (that easily). With github,
> I'm not so sure. But that's just my impression and it might be wrong.
>=20
> > About sharing a git tree, Boris'd suggested that for each release Marek=
 and I
> > should decide who will be responsible for merging patches in the spi-no=
r tree
> > and for sending PR to Brian. Only one of us per release just to avoid
> > conflicts if instead we would both merge patches at the same time in the
> > spi-nor tree. However we can still choose this 2nd solution, being caut=
ious. =20
>=20
> Do you want to alternate between releases ? I wonder if that might
> confuse upstream.

Sorry, but it's still unclear to me. Marek, how would you handle the
co-maintainance with Cyrille? Would you both push to the same tree,
with only one of you (always the same guy) sending the PR to Brian
before the merge window, or do you have something else in mind?
