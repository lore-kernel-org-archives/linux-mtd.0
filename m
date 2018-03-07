Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ethah-0006pd-So
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 22:31:22 +0000
Date: Wed, 7 Mar 2018 23:30:57 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: David Woodhouse <dwmw2@infradead.org>, Greg KH <greg@kroah.com>, Steve
 deRosier <derosier@gmail.com>, Richard Weinberger <richard@nod.at>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, dedekind1@gmail.com,
 tharvey@gateworks.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com
Subject: Re: [PATCH] ubi: Reject MLC NAND
Message-ID: <20180307233057.54bd35c3@bbrezillon>
In-Reply-To: <20180307221733.GE10438@amd>
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
 <6772577.AmT7QaWTNU@blindfold> <20180307214342.GA9852@amd>
 <CALLGbRK4w9Yhznt6+aqr8jptQjsp7FmbjQMPtvhh2h354n2G0A@mail.gmail.com>
 <1520460673.31298.136.camel@infradead.org>
 <20180307221733.GE10438@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pavel,

On Wed, 7 Mar 2018 23:17:33 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> On Wed 2018-03-07 22:11:13, David Woodhouse wrote:
> > 
> > 
> > On Wed, 2018-03-07 at 14:08 -0800, Steve deRosier wrote:  
> > > 
> > > To clarify one thing: the reason for this is MLC has actually never
> > > been supported, nor worked properly. The fact that it kinda worked was
> > > incidental and the cause of major problems for people due to that not
> > > being clear. This patch only makes it explicit and avoids people
> > > mistakenly trying to use UBIFS on MLC flash and risking their data and
> > > products. To me, that's what's important.
> > > 
> > > This is an important patch, even if all it does is keep people from
> > > loosing data. It also changes the conversation from "I have a
> > > corrupted UBIFS device, BTW it's on MLC..." to "What can we do to get
> > > UBIFS to work on MLC".  
> 
> Well, for -stable I'd suggest printk(KERN_ALERT ...) but keep the
> system running.
> 
> > This is a bug fix.
> > 
> > UBI on MLC never worked. It was a bug that we ever permitted it. This
> > is now fixed.  
> 
> Yeah, well, so lets say I have a working hardware (maybe using
> read-only UBI on MLC), update to next stable kernel, and now kernel
> refuses to see the partition.

Read-only does not save you from the read-disturb issue, and you even
have to take care of programming the full erase-block on some MLC
NANDs, which AFAIR is not done when updating a static volume.

I have one simple question: did you ever play with MLC NANDs or are you
just trolling? If you had, like Richard and I did when working on MLC
support, I'm pretty sure you wouldn't play this "don't backport to
stable" card.

Now, if you volunteer to add reliable MLC support, I can send you a
few boards to play with. I even have a "working but not so tested PoC"
here [1] if you want to finish the job, but please don't do the mistake
of thinking the fix is that simple.

> 
> I'll certainly not consider this patch a bug fix.

And apparently a lot of people disagree with you on this point, and I
guess all of them had problems with MLC NANDs.

> 
> Removing support for hardware that "only works by mistake" may be good
> idea, but maybe it is slightly too surprising for a -stable.

I wouldn't say "work by mistake" but "seems to work at first but in the
end breaks", so definitely a candidate for -stable IMO.

Regards,

Boris

[1]https://github.com/bbrezillon/linux/tree/nand/mlc
-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
