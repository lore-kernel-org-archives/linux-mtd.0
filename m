Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwZPx-0005hB-3m
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 18:47:18 +0000
Received: by mail-pf0-x243.google.com with SMTP id 128so178166pfz.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2016 11:46:56 -0700 (PDT)
Date: Tue, 18 Oct 2016 11:46:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
Message-ID: <20161018184651.GA71760@google.com>
References: <0a3eaa21fb0f38743308c9cc9fc5d2373f4877de.1476802288.git.cyrille.pitchen@atmel.com>
 <d4e954c1-0bbb-fc16-4e9a-46c25ec4fb9e@denx.de>
 <CAFLxGvy9okx1cHnRhq2U-u574PzAk=Tampw1Fmvp4KzY8vnDnw@mail.gmail.com>
 <3d45f698-08e9-e672-d405-1ab9bfec1222@atmel.com>
 <cf010a6c-b642-0994-bbfd-c86d5ab24e6e@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf010a6c-b642-0994-bbfd-c86d5ab24e6e@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ others

On Tue, Oct 18, 2016 at 06:15:23PM +0200, Richard Weinberger wrote:
> On 18.10.2016 17:55, Cyrille Pitchen wrote:
> > Le 18/10/2016 à 17:30, Richard Weinberger a écrit :
> >> On Tue, Oct 18, 2016 at 5:17 PM, Marek Vasut <marex@denx.de> wrote:
> >>> On 10/18/2016 04:58 PM, Cyrille Pitchen wrote:
> >>>> I would like to volunteer as a maintainer for the SPI NOR part of the MTD
> >>>> subsystem.

Awesome!

> >>>> Over the last months, a significant number of SPI NOR related patches have
> >>>> been submitted, some of them have been reviewed, but very few have finally
> >>>> been merged. Hence, the number of pending SPI NOR related patches continues
> >>>> to increase over the time.

Agreed, and sorry. But I guess the delays had the side effect of forcing
peoples hands, instead of delaying the inevitable.

> >>>> Through my work on SPI NOR memories from many manufacturers over the last
> >>>> two years, I've gained a solid understanding of this technology.
> >>>> I've already helped by reviewing patches from other contributors on the
> >>>> mailing list, and would like to help getting those patches integrated by
> >>>> volunteering as a maintainer for this specific area.

Agreed.

> >>>> Boris Brezillon has already stepped up as a maintainer for the NAND
> >>>> sub-subsystem in MTD, and the SPI NOR sub-subsystem could be handled in
> >>>> the same way: I would be reviewing patches touching this area, collecting
> >>>> them and sending pull requests to Brian Norris.
> >>
> >> I'd suggest you send pull requests directly to Linus.
> >> Same for NAND.

I could go with either method I suppose, but I don't personally like the
idea of splitting out the various bits of MTD into *completely*
independent lines of development. As long as someone (not necessarily
me) can manage pulling the sub-subsystems together, I think it would
make sense to have 1 PR for Linus for non-UBI/FS MTD changes.

> >>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> >>>
> >>> Let me know if you need co-maintainer.
> >>
> >> +1

+1, I think I've not-so-subtly suggested this to Marek previously.

> >> While we are here, what about forming a MTD maintainer team?
> >> This concept works very well for other subsystems.
> >>
> > 
> > I totally agree with you so if Marek and you volunteer as well, your help
> > will be precious!
> 
> Well, my SPI-NOR fu is not strong. And UBI/UBIFS keeps me busy.
> But if Brian likes the idea of having a MTD maintainer team I'll offer my help.

I think a MTD maintainer team would be good to try, and I think it might
help to resolve my above complaint; a maintainer team could help to make
sure that everything can be coordinated in one tree + pull request,
without adding too many extra points of failure (e.g., so we don't have
awesome SPI NOR and NAND trees get bogged down by a slow MTD pull).

Random thoughts:

 Does it make sense to still use infradead.org? We'd need to add a few
 users there.

 Trust? I have met most of you in person, but not all, and I don't have
 signed keys from all of you. I don't know what the best way to get a
 group-writeable repo with credentials for all of you that we can trust.
 (FWIW, neither Artem nor David met me, but they saw it fit to grant me
 infradead.org access ;) )

 Coordination: how do we avoid stepping on each other's toes? We'd have
 to definitely 100% kill 'git push -f' and 'git rebase'. Also, would
 patchwork help or hurt us here? I think Boris and I have been sort of
 using it, but it's still got a pretty good backlog (partly real --
 i.e., the cause for this thread; and partly artificial, due to
 accounting).

 What to do about mtd-utils.git? That's been languishing a bit, and it
 has no release schedule. Maybe we want a plan for that too.

BTW, will anybody be at Linux Plumbers? I plan to be there in a few
weeks. And something tells me dwmw2 will be there.

Brian
