Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IBA7-000235-00
	for mtd-list@infradead.org; Mon, 15 Jan 2001 15:03:11 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14IBA6-00022z-00
	for mtd@infradead.org; Mon, 15 Jan 2001 15:03:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0101151757140.31216-100000@godzilla.axis.se> 
References: <Pine.LNX.4.21.0101151757140.31216-100000@godzilla.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: mtd@infradead.org
Subject: Re: mtdpart.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 15 Jan 2001 15:02:26 +0000
Message-ID: <30328.979570946@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjorn.wesen@axis.com said:
>  I did not put any check anywhere. It printed that out of its own free
> will :) I enabled CONFIG_MTD_DEBUG with CONFIG_MTD_DEBUG_LEVEL @ 3,
> but no other lines were printed (which is suspicious).  

Er... yeah, sorry, I did the grep before the cvs update. Now I see it, and 
curiously, I observe my kernel doing the same too. I'll go through the last 
few commitlog entries and look for someone to shout at.

In the meantime, cvs up -D "last friday"

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
