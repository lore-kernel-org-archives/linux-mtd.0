Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14l9Gg-0004Gz-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 13:53:42 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14l9Ge-0004Gt-00
	for mtd@infradead.org; Thu, 05 Apr 2001 13:53:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3ACBA4C2.DDED5432@echostar.com> 
References: <3ACBA4C2.DDED5432@echostar.com> 
To: ian.nelson@echostar.com
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Proc stuff 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Apr 2001 13:47:16 +0100
Message-ID: <27773.986474836@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ian.nelson@echostar.com said:
> I need some extra bits added to the proc/mtd.  For the product I'm
> building we want to have things from the flash registers like the
> Device ID and "AMD flash"

Those aren't particularly generic bits of information - why do you think
they should be present at that level? That kind of detail is reported in the
boot messages, not in /proc/mtd. Does your eth0 device provide a way to find
out which chipset it is?

Perhaps we could make the CFI drivers put slightly more informative 
information in the 'name' field, but that doesn't work nicely if you have 
partitions which override the original name. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
