Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lB96-000587-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 15:54:00 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14lB95-000580-00
	for mtd@infradead.org; Thu, 05 Apr 2001 15:54:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <175f01c0bdde$8cb38ae0$0a070d0a@axis.se> 
References: <175f01c0bdde$8cb38ae0$0a070d0a@axis.se>  <3ACBA4C2.DDED5432@echostar.com> <27773.986474836@redhat.com> 
To: "Johan Adolfsson" <johan.adolfsson@axis.com>
Cc: ian.nelson@echostar.com, mtd@infradead.org
Subject: Re: Proc stuff 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Apr 2001 15:50:42 +0100
Message-ID: <9498.986482242@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


johan.adolfsson@axis.com said:
>  We (Axis) have an ioctl() to get that info with our own flash driver
> and JFFS available on developer.axis.com (not using mtd). It is
> typically used to verify that a certain type of chip is mounted during
> production test where boot messages are not even enabled and not a
> nice way to get the information for that purpose anyway.

> Since mtd is not flash specific, perhaps a generic info string about
> the device media could be added? 

That's what the 'name' field was intended for. The CFI and other probe 
functions already return the MTD device to the map driver so that 
partitioning and other stuff can be done. Setting an appropriate name which 
provides any board-specific information is entirely feasible.

Isn't that enough?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
