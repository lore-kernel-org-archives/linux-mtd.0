Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t9Eb-0001mu-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 15:28:37 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t9EZ-0001mo-00
	for mtd@infradead.org; Fri, 27 Apr 2001 15:28:36 +0100
Message-ID: <3AE98278.48DA955@daniel.com>
Date: Fri, 27 Apr 2001 09:30:16 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: joakim.tjernlund@lumentis.se
CC: 'Chris Read ' <chris.read@activesilicon.co.uk>,
 	mtd@infradead.org
Subject: Re: Power blackouts and brownouts
References: <002801c0ceed$28aad830$0a01a8c0@Win1>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Joakim Tjernlund wrote:

> -----Original Message-----
> From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
>
> Well, I haven't seen any flash chips without a reset line, not to say that
> they aren't out there.
>
> With a flash chip *with* a reset line, and one which is connected to the
> system reset, and assuming that the reset gets asserted in a power down, up,
> and brown condition, then everything is ok.
>
> <snip>
>
> hmm, do you mean that reset has to asserted at power DOWN as well in order
> for JFFS2 FS to manage its FS? How do you manage that when someone pulls
> the power cable?
>
>          Jocke

No, but most well designed embedded systems will assert the reset line both on
power
up AND down. Actually, direction does not really matter. Reset is asserted when
the
power rail is out of spec, which will happen (due to the laws of physics), both
on up and down.

You wan't the reset line asserted on power down also, else the processor may
"wander off"
into the weeds and overwrite battery backed RAM or other such stuff if present.

I don't think that JFFS(2) *require* you to assert the reset line (processor or
flash) on power down.

Vipin




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
