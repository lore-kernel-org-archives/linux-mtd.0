Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lB0Z-00051n-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 15:45:11 +0100
Message-ID: <175f01c0bdde$8cb38ae0$0a070d0a@axis.se>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>, <ian.nelson@echostar.com>
Cc: <mtd@infradead.org>
References: <3ACBA4C2.DDED5432@echostar.com>  <27773.986474836@redhat.com>
Subject: Re: Proc stuff 
Date: Thu, 5 Apr 2001 16:41:50 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I guess we would like that kind of information available somewhere
as well. Either through /proc or through an ioctl().

We (Axis) have an ioctl() to get that info with our own flash driver
and JFFS available on developer.axis.com (not using mtd).
It is typically used to verify that a certain type of chip is mounted
during production test where boot messages are not even enabled
and not a nice way to get the information for that purpose anyway.

Since mtd is not flash specific, perhaps a generic info string
about the device media could be added?

/Johan


----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
To: <ian.nelson@echostar.com>
Cc: <mtd@infradead.org>
Sent: Thursday, April 05, 2001 14:47
Subject: Re: Proc stuff


>
> ian.nelson@echostar.com said:
> > I need some extra bits added to the proc/mtd.  For the product I'm
> > building we want to have things from the flash registers like the
> > Device ID and "AMD flash"
>
> Those aren't particularly generic bits of information - why do you think
> they should be present at that level? That kind of detail is reported in
the
> boot messages, not in /proc/mtd. Does your eth0 device provide a way to
find
> out which chipset it is?
>
> Perhaps we could make the CFI drivers put slightly more informative
> information in the 'name' field, but that doesn't work nicely if you have
> partitions which override the original name.
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
