Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Mu6E-0008QU-00
	for mtd-list@infradead.org; Sun, 28 Jan 2001 15:50:42 +0000
From: "Brian Michalk" <michalk@awpi.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: fdisk problems 
Date: Sun, 28 Jan 2001 09:52:52 -0600
Message-ID: <IPEEJPOJMHGJGMHAGANAOEIFCHAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1401.980687984@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

You are right.  I dug through the documentation at M-systems and tried the
various firmware files.  None of them work.

After a week of poking around I have come to the conclusion that I am not
insane and that the 72Mb DOCs are different in some fashion.

Let me know if there is anything I can do to help.

 Brian Michalk  <http://www.awpi.com/michalk>
Life is what you make of it ... never wish you had done something.
Aviator, experimental aircraft builder, motorcyclist, SCUBA diver
musician, home-brewer, entrepreneur and SINGLE!


> -----Original Message-----
> From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
> Of David Woodhouse
> Sent: Sunday, January 28, 2001 7:20 AM
> To: Brian Michalk
> Cc: mtd@infradead.org
> Subject: Re: fdisk problems
>
>
>
> michalk@awpi.com said:
> >  I recall that at some time in the past, we need needed to write
> > either zeroes, or FFs to the flash before using it.  Is this still
> > required? Is there a different .exb file I should be using?
>
> Nope. It looks like there's something 'different' about the ECC on the
> larger units. I'll have to poke at it and find out what.
>
> --
> dwmw2
>
>
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
