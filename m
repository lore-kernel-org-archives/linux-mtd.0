Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pfTW-0008Bz-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 01:05:38 +0100
Message-ID: <3ADCDA29.5E167060@echostar.com>
Date: Tue, 17 Apr 2001 18:04:57 -0600
From: "Ian S. Nelson" <ian.nelson@echostar.com>
Reply-To: ian.nelson@echostar.com
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
        "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: A pair of stupid questions, I hope
References: <3ADC7273.DB541A9C@echostar.com> <10503.987545517@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> ian.nelson@echostar.com said:
> > My manufacturing people want a test that responds yes or no to the
> > question "is this sector locked?"
>
> > This seems like it should be pretty easy, but where and how do I
> > determine that? Is it something that is stored in the mem_region?
> > There are lock and unlock ioctls but it's not obvious to me how to
> > query if a sector is locked? What is the proper way to do this?
>
> Yeah, we should support that, but we currently don't have an API for it, and
> obviously that means there's no code to do it for any of the currently
> supported chipsets. Fairly trivial to do though. I'm not feeling inventive
> tonight. Propose an API extension and if it offends my sensibilities I'll
> have to think of something myself.

I'll ask the guys who need it.  I suspect the proposal would be an ISLOCKED
ioctl that takes a region as an argument and returns a 0 or 1.   I'm a flash
novice though, is this something that should go in to one of those region
structures?


> ian.nelson@echostar.com said:
> >  It's looking more and more like we're going to move from 2MB to a 4MB
> > flash.  Supposedly the 4MB is banked and it's some Toshiba part that
> > isn't listed in the code as supported yet.  Do we already support
> > anything like that?  It looks easy enough to add support for a new
> > part and I'm eager to give it a try but I don't know about this
> > convoluted banking thing.  Any advice?
>
> If it's a NOR part it ought to be fairly trivial. If it's NAND, supporting
> the part itself shouldn't be too hard, but JFFS2 doesn't work safely on it
> yet. JFFS should, although I haven't tried it myself. And obviously you
> can't boot from NAND flash unless you have an external ROM or NOR flash
> somewhere for the CPU power-up vector.

That simplifies it because we will be booting off this flash.  Thanks for the
feedback though, I'll ping our hardware guys and make sure we're heading down
the right path.

Ian




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
