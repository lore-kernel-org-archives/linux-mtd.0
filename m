Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pdni-0007Au-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 23:18:22 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pdng-0007Am-00
	for mtd@infradead.org; Tue, 17 Apr 2001 23:18:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3ADC7273.DB541A9C@echostar.com> 
References: <3ADC7273.DB541A9C@echostar.com> 
To: ian.nelson@echostar.com
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: A pair of stupid questions, I hope 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 23:11:57 +0100
Message-ID: <10503.987545517@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ian.nelson@echostar.com said:
> My manufacturing people want a test that responds yes or no to the
> question "is this sector locked?"

> This seems like it should be pretty easy, but where and how do I
> determine that? Is it something that is stored in the mem_region?
> There are lock and unlock ioctls but it's not obvious to me how to
> query if a sector is locked? What is the proper way to do this? 

Yeah, we should support that, but we currently don't have an API for it, and
obviously that means there's no code to do it for any of the currently
supported chipsets. Fairly trivial to do though. I'm not feeling inventive 
tonight. Propose an API extension and if it offends my sensibilities I'll 
have to think of something myself.


ian.nelson@echostar.com said:
>  It's looking more and more like we're going to move from 2MB to a 4MB
> flash.  Supposedly the 4MB is banked and it's some Toshiba part that
> isn't listed in the code as supported yet.  Do we already support
> anything like that?  It looks easy enough to add support for a new
> part and I'm eager to give it a try but I don't know about this
> convoluted banking thing.  Any advice?

If it's a NOR part it ought to be fairly trivial. If it's NAND, supporting
the part itself shouldn't be too hard, but JFFS2 doesn't work safely on it
yet. JFFS should, although I haven't tried it myself. And obviously you 
can't boot from NAND flash unless you have an external ROM or NOR flash 
somewhere for the CPU power-up vector.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
