Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwZrz-0002Fz-KO
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 19:16:17 +0000
Date: Tue, 18 Oct 2016 21:15:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com, LKML <linux-kernel@vger.kernel.org>, David
 Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
Message-ID: <20161018211548.08dded8a@bbrezillon>
In-Reply-To: <20161018184651.GA71760@google.com>
References: <0a3eaa21fb0f38743308c9cc9fc5d2373f4877de.1476802288.git.cyrille.pitchen@atmel.com>
 <d4e954c1-0bbb-fc16-4e9a-46c25ec4fb9e@denx.de>
 <CAFLxGvy9okx1cHnRhq2U-u574PzAk=Tampw1Fmvp4KzY8vnDnw@mail.gmail.com>
 <3d45f698-08e9-e672-d405-1ab9bfec1222@atmel.com>
 <cf010a6c-b642-0994-bbfd-c86d5ab24e6e@nod.at>
 <20161018184651.GA71760@google.com>
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

On Tue, 18 Oct 2016 11:46:51 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> + others
>=20
> On Tue, Oct 18, 2016 at 06:15:23PM +0200, Richard Weinberger wrote:
> > On 18.10.2016 17:55, Cyrille Pitchen wrote: =20
> > > Le 18/10/2016 =C3=A0 17:30, Richard Weinberger a =C3=A9crit : =20
> > >> On Tue, Oct 18, 2016 at 5:17 PM, Marek Vasut <marex@denx.de> wrote: =
=20
> > >>> On 10/18/2016 04:58 PM, Cyrille Pitchen wrote: =20
> > >>>> I would like to volunteer as a maintainer for the SPI NOR part of =
the MTD
> > >>>> subsystem. =20
>=20
> Awesome!
>=20
> > >>>> Over the last months, a significant number of SPI NOR related patc=
hes have
> > >>>> been submitted, some of them have been reviewed, but very few have=
 finally
> > >>>> been merged. Hence, the number of pending SPI NOR related patches =
continues
> > >>>> to increase over the time. =20
>=20
> Agreed, and sorry. But I guess the delays had the side effect of forcing
> peoples hands, instead of delaying the inevitable.
>=20
> > >>>> Through my work on SPI NOR memories from many manufacturers over t=
he last
> > >>>> two years, I've gained a solid understanding of this technology.
> > >>>> I've already helped by reviewing patches from other contributors o=
n the
> > >>>> mailing list, and would like to help getting those patches integra=
ted by
> > >>>> volunteering as a maintainer for this specific area. =20
>=20
> Agreed.
>=20
> > >>>> Boris Brezillon has already stepped up as a maintainer for the NAND
> > >>>> sub-subsystem in MTD, and the SPI NOR sub-subsystem could be handl=
ed in
> > >>>> the same way: I would be reviewing patches touching this area, col=
lecting
> > >>>> them and sending pull requests to Brian Norris. =20
> > >>
> > >> I'd suggest you send pull requests directly to Linus.
> > >> Same for NAND. =20
>=20
> I could go with either method I suppose, but I don't personally like the
> idea of splitting out the various bits of MTD into *completely*
> independent lines of development. As long as someone (not necessarily
> me) can manage pulling the sub-subsystems together, I think it would
> make sense to have 1 PR for Linus for non-UBI/FS MTD changes.
>=20
> > >>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com> =20
> > >>>
> > >>> Let me know if you need co-maintainer. =20
> > >>
> > >> +1 =20
>=20
> +1, I think I've not-so-subtly suggested this to Marek previously.

Okay, that's all great news!
You can add my ack after adding Marek as a co-maintainer.

>=20
> > >> While we are here, what about forming a MTD maintainer team?
> > >> This concept works very well for other subsystems.
> > >> =20
> > >=20
> > > I totally agree with you so if Marek and you volunteer as well, your =
help
> > > will be precious! =20
> >=20
> > Well, my SPI-NOR fu is not strong. And UBI/UBIFS keeps me busy.
> > But if Brian likes the idea of having a MTD maintainer team I'll offer =
my help. =20
>=20
> I think a MTD maintainer team would be good to try, and I think it might
> help to resolve my above complaint; a maintainer team could help to make
> sure that everything can be coordinated in one tree + pull request,
> without adding too many extra points of failure (e.g., so we don't have
> awesome SPI NOR and NAND trees get bogged down by a slow MTD pull).
>=20
> Random thoughts:
>=20
>  Does it make sense to still use infradead.org? We'd need to add a few
>  users there.
>=20
>  Trust? I have met most of you in person, but not all, and I don't have
>  signed keys from all of you. I don't know what the best way to get a
>  group-writeable repo with credentials for all of you that we can trust.
>  (FWIW, neither Artem nor David met me, but they saw it fit to grant me
>  infradead.org access ;) )
>=20
>  Coordination: how do we avoid stepping on each other's toes? We'd have
>  to definitely 100% kill 'git push -f' and 'git rebase'. Also, would
>  patchwork help or hurt us here? I think Boris and I have been sort of
>  using it, but it's still got a pretty good backlog (partly real --
>  i.e., the cause for this thread; and partly artificial, due to
>  accounting).

I really think we should keep separate trees for the spi-nor and nand
sub-subsystems, and then do PRs. The question is, how do we agree that
a PR should be pulled in the MTD tree.

I guess we could have a simple rule like, if it's been reviewed by at
least X person (I guess 2 is acceptable), then we can merge it.

>=20
>  What to do about mtd-utils.git? That's been languishing a bit, and it
>  has no release schedule. Maybe we want a plan for that too.

Richard and David had some plans for the mtd-utils repo, and I think
they already have the permissions to push things to this repo, so the
best solution is probably to officially promote them maintainers of
mtd-utils.

>=20
> BTW, will anybody be at Linux Plumbers? I plan to be there in a few
> weeks. And something tells me dwmw2 will be there.

Unfortunately I won't attend plumbers :-(.
