Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t9KV-0001ps-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 15:34:43 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t9KU-0001pm-00
	for mtd@infradead.org; Fri, 27 Apr 2001 15:34:42 +0100
Message-ID: <3AE983D7.E377707D@daniel.com>
Date: Fri, 27 Apr 2001 09:36:07 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: "chris.read@activesilicon.co.uk" <chris.read@activesilicon.co.uk>
CC: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: Brownouts
References: <01C0CF15.C21A24D0.chris.read@activesilicon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Chris Read wrote:

> As a follow up to my earlier message:
>
> I am currently working with Intel B3 parts. The datasheet makes no specific
> mention of any built in brownout detection. However, there are a set of
> timings for the reset line. Specifically, it states that it may take up to
> 22us to reset the internal state machine during an erase or write cycle
> after the reset pin is asserted. My interpretation of this, in the absence
> of any explicit information, is that whilst erasing or programming, the
> reset line must be asserted a minimum of 22us before the power supply falls
> below the chip's minVcc specification, otherwise the results are
> undefined.....and we all know what that can mean.
>
> Any thoughts/experiences?

IMHO, you'r reading too much into the spec.

If this was my design, based on this spec that you posted, I would be happy
with this 22 us of power *up* reset. There is usually nothing to worry about
power down reset *for the flash chip*. Of course, you may want your processor
to be in reset when VCC falls out of spec to prevent it from misbehaving.

All IMHO.

Vipin


>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
