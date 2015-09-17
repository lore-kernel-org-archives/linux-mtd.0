Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcbP1-00054D-NL
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 15:47:16 +0000
Date: Thu, 17 Sep 2015 17:46:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: dedekind1@gmail.com
Cc: Richard Weinberger  <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>, "Qi Wang
 =?UTF-8?B?546L6LW3?= \"(qiwang)\"" <qiwang@micron.com>, Iwo Mergler
 <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20150917174642.0c983136@bbrezillon>
In-Reply-To: <1442503239.19983.18.camel@gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
 <1442503239.19983.18.camel@gmail.com>
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

Hi Artem,

On Thu, 17 Sep 2015 18:20:39 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2015-09-17 at 15:22 +0200, Boris Brezillon wrote:
> > Hello,
> > 
> > I'm currently working on the paired pages problem we have on MLC
> > chips.
> > I remember discussing it with Artem earlier this year when I was
> > preparing my talk for ELC.
> 
> Hi Boris,
> 
> excellent summary, very structured. I won't generate any new idea now,
> just an implementation tactics suggestion.

I'm taking that too :-).

> 
> For an implementation, I'd started with a power cut emulator which
> emulates paired pages. I'd probably do it in UBI, may be lower.

I actually these kind of emulation in nandsim, though I currently
generate a kernel Oops when the emulated power-cut occurs, which is not
really easy to use (still both paired pages are corrupted on the file
used by nandsim to store NAND data).
I'm considering changing the behavior to return -EROFS instead of
BUG(), but I'm still not sure upper layers are expecting this error...

I know that using an emulation layer is the only way to go if we want
to test the implementation, but I managed to generate those paired
pages problem manually by launching a reset in the middle of a page
program operation. Even this 'page program interruption' code is still
hacky, I think we'll be able to 'easily' validate the solution in real
world use cases when it's ready.

> I'd
> also write a good UBI power-cut test application.

Not sure what you mean by a UBI power-cut application?

> And then I'd start
> playing with various implementation approaches.

Yep, that was the plan, I was hoping you could help me exclude some of
them, but I guess testing all of them is the only way to find the
best one :-/.

> I'd use the test-driven
> approach.

Hm, yep I guess that's the only way to test as much cases as possible,
but even with that I doubt I'll be able to think of all the cases that
could happen in real world.

Thanks for the feedback.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
