Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwZf3-0003Bv-6C
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 19:02:57 +0000
Subject: Re: [PATCH 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
To: Brian Norris <computersforpeace@gmail.com>
References: <0a3eaa21fb0f38743308c9cc9fc5d2373f4877de.1476802288.git.cyrille.pitchen@atmel.com>
 <d4e954c1-0bbb-fc16-4e9a-46c25ec4fb9e@denx.de>
 <CAFLxGvy9okx1cHnRhq2U-u574PzAk=Tampw1Fmvp4KzY8vnDnw@mail.gmail.com>
 <3d45f698-08e9-e672-d405-1ab9bfec1222@atmel.com>
 <cf010a6c-b642-0994-bbfd-c86d5ab24e6e@nod.at>
 <20161018184651.GA71760@google.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com, Boris Brezillon
 <boris.brezillon@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy
 <dedekind1@gmail.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <09ac9f8a-d6a0-97a8-c73a-ffb53bc1a4c8@nod.at>
Date: Tue, 18 Oct 2016 21:02:27 +0200
MIME-Version: 1.0
In-Reply-To: <20161018184651.GA71760@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On 18.10.2016 20:46, Brian Norris wrote:
>>> I totally agree with you so if Marek and you volunteer as well, your help
>>> will be precious!
>>
>> Well, my SPI-NOR fu is not strong. And UBI/UBIFS keeps me busy.
>> But if Brian likes the idea of having a MTD maintainer team I'll offer my help.
> 
> I think a MTD maintainer team would be good to try, and I think it might
> help to resolve my above complaint; a maintainer team could help to make
> sure that everything can be coordinated in one tree + pull request,
> without adding too many extra points of failure (e.g., so we don't have
> awesome SPI NOR and NAND trees get bogged down by a slow MTD pull).
> 
> Random thoughts:
> 
>  Does it make sense to still use infradead.org? We'd need to add a few
>  users there.

What else do you have in mind? kernel.org?
As long all users with commit access are member of the kernel.org web of
trust any host should be fine.

>  Trust? I have met most of you in person, but not all, and I don't have
>  signed keys from all of you. I don't know what the best way to get a
>  group-writeable repo with credentials for all of you that we can trust.
>  (FWIW, neither Artem nor David met me, but they saw it fit to grant me
>  infradead.org access ;) )

I'd go with the kernel.org web of trust.

>  Coordination: how do we avoid stepping on each other's toes? We'd have
>  to definitely 100% kill 'git push -f' and 'git rebase'. Also, would
>  patchwork help or hurt us here? I think Boris and I have been sort of
>  using it, but it's still got a pretty good backlog (partly real --
>  i.e., the cause for this thread; and partly artificial, due to
>  accounting).

patchwork should be a good start. We could also try the tip scripts used
by the x86 maintainer team.
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/tree/.tip?h=tip

>  What to do about mtd-utils.git? That's been languishing a bit, and it
>  has no release schedule. Maybe we want a plan for that too.

I'd volunteer to nurse it together with David Oberhollenzer.
In fact, David is currently preparing a v2 pre-release of mtd-utils.
https://github.com/sigma-star/mtd-utils/commits/wip_v2-rc1

We reworked a lot of code and added new tools.

Thanks,
//richard
