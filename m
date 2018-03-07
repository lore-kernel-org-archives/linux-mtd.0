Received: from wtarreau.pck.nerim.net ([62.212.114.60] helo=1wt.eu)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1etiTh-00054k-Ao
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 23:28:11 +0000
Date: Thu, 8 Mar 2018 00:27:14 +0100
From: Willy Tarreau <w@1wt.eu>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Pavel Machek <pavel@ucw.cz>, David Woodhouse <dwmw2@infradead.org>,
 Greg KH <greg@kroah.com>, Steve deRosier <derosier@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 dedekind1@gmail.com, tharvey@gateworks.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com
Subject: Re: [PATCH] ubi: Reject MLC NAND
Message-ID: <20180307232714.GA10178@1wt.eu>
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
 <6772577.AmT7QaWTNU@blindfold> <20180307214342.GA9852@amd>
 <CALLGbRK4w9Yhznt6+aqr8jptQjsp7FmbjQMPtvhh2h354n2G0A@mail.gmail.com>
 <1520460673.31298.136.camel@infradead.org>
 <20180307221733.GE10438@amd> <20180307233057.54bd35c3@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180307233057.54bd35c3@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed, Mar 07, 2018 at 11:30:57PM +0100, Boris Brezillon wrote:
> I have one simple question: did you ever play with MLC NANDs or are you
> just trolling? If you had, like Richard and I did when working on MLC
> support, I'm pretty sure you wouldn't play this "don't backport to
> stable" card.

Just adding my two cents here, I've always had stability issues with
ubifs on NAND and I never knew what type of NAND I've had in these
devices (eg: Iomega Iconnect with 256 MB NAND IIRC), so maybe this
has never been relevant, maybe it has been, I don't know. However,
as a stable maintainer I also know that we want to encourage people
to always keep their kernels up to date with latest fixes, and that
if there is the slightest risk that a loss of functionality makes
people revert and stick to an older, working version, keeping their
bugs forever, it's twice as worse, because :
  - they still run on the bug you wanted to fix
  - they are now exposed to all bugs fixed later.

And we all do this as users, thinking "I'll bisect and report tomorrow"
and priorities change, let's be honnest. Thus I think that if you are
absolutely certain that it's impossible that people are accidently using
this combination, it's probably fine, but if people are using it, you're
just displacing the burden on the stable team who will have to explain
to each and every user complaining "my system stopped booting after an
upgrade to 4.x.y". A big red alert polluting the logs and console every
minute, and a pause at boot saying "your NAND, your data and all your
kids photos will die soon if you don't switch to another FS" is more
productive as users will be less tempted to blindly revert and will at
least ask what the problem is and what their solutions are.

There's nothing more frustrating than a regression in a stable branch,
even for something that was not supposed to work but did by accident.

> I wouldn't say "work by mistake" but "seems to work at first but in the
> end breaks", so definitely a candidate for -stable IMO.

Well, removing support definitely makes the end closer and possibly even
prevents the user from recovering their data. I know that data loss is
terrible, but data confiscation is similar from the user's point of view.

Users don't know the technical details so they will do all things we
often consider stupid or impossible, but when warned they know that the
risk is on their side and they cannot put the fault at anybody anymore.
It tends to work better.

Just my two cents,
Willy
