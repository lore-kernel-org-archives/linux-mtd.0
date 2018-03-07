Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ethNZ-0000KG-3p
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 22:17:46 +0000
Date: Wed, 7 Mar 2018 23:17:33 +0100
From: Pavel Machek <pavel@ucw.cz>
To: David Woodhouse <dwmw2@infradead.org>, Greg KH <greg@kroah.com>
Cc: Steve deRosier <derosier@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 dedekind1@gmail.com, tharvey@gateworks.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com
Subject: Re: [PATCH] ubi: Reject MLC NAND
Message-ID: <20180307221733.GE10438@amd>
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
 <6772577.AmT7QaWTNU@blindfold> <20180307214342.GA9852@amd>
 <CALLGbRK4w9Yhznt6+aqr8jptQjsp7FmbjQMPtvhh2h354n2G0A@mail.gmail.com>
 <1520460673.31298.136.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520460673.31298.136.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed 2018-03-07 22:11:13, David Woodhouse wrote:
> 
> 
> On Wed, 2018-03-07 at 14:08 -0800, Steve deRosier wrote:
> > 
> > To clarify one thing: the reason for this is MLC has actually never
> > been supported, nor worked properly. The fact that it kinda worked was
> > incidental and the cause of major problems for people due to that not
> > being clear. This patch only makes it explicit and avoids people
> > mistakenly trying to use UBIFS on MLC flash and risking their data and
> > products. To me, that's what's important.
> > 
> > This is an important patch, even if all it does is keep people from
> > loosing data. It also changes the conversation from "I have a
> > corrupted UBIFS device, BTW it's on MLC..." to "What can we do to get
> > UBIFS to work on MLC".

Well, for -stable I'd suggest printk(KERN_ALERT ...) but keep the
system running.

> This is a bug fix.
> 
> UBI on MLC never worked. It was a bug that we ever permitted it. This
> is now fixed.

Yeah, well, so lets say I have a working hardware (maybe using
read-only UBI on MLC), update to next stable kernel, and now kernel
refuses to see the partition.

I'll certainly not consider this patch a bug fix.

Removing support for hardware that "only works by mistake" may be good
idea, but maybe it is slightly too surprising for a -stable.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
