Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t9Kq-0001q1-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 15:35:04 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t9Kp-0001pu-00
	for mtd@infradead.org; Fri, 27 Apr 2001 15:35:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AE98278.48DA955@daniel.com> 
References: <3AE98278.48DA955@daniel.com>  <002801c0ceed$28aad830$0a01a8c0@Win1> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: joakim.tjernlund@lumentis.se,
    'Chris Read ' <chris.read@activesilicon.co.uk>, mtd@infradead.org
Subject: Re: Power blackouts and brownouts 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 27 Apr 2001 15:34:32 +0100
Message-ID: <22885.988382072@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vipin.malik@daniel.com said:
>  No, but most well designed embedded systems will assert the reset
> line both on power up AND down. Actually, direction does not really
> matter. Reset is asserted when the power rail is out of spec, which
> will happen (due to the laws of physics), both on up and down.

> You wan't the reset line asserted on power down also, else the
> processor may "wander off" into the weeds and overwrite battery backed
> RAM or other such stuff if present.

Note that 'well designed embedded systems' does _not_ include the Intel
Assabet platform. I believe nothing ever asserts the flash reset line, so if
you reset while the flash is in a mode other than read mode, the CPU's reset
vector is pointing at status words :)

The only way to fix it when you've done this is to remove power, remove the 
battery, and wait for the on-board cap to run out of charge.

Fun. :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
