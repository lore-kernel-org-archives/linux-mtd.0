Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14VvdK-0003SD-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 13:18:10 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14VvdJ-0003S7-00
	for mtd@infradead.org; Thu, 22 Feb 2001 13:18:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <30724FF712DFD2119E6200104B2448920119744C@mail1> 
References: <30724FF712DFD2119E6200104B2448920119744C@mail1> 
To: Vipin Malik <Vipin.Malik@daniel.com>
Cc: mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n ot r egister block device! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Feb 2001 13:18:09 +0000
Message-ID: <29886.982847889@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Vipin.Malik@daniel.com said:
> But isn't the same init calls method used to init the stuff in the
> 2.4.x series of kernels. So it's not just a 2.2.18/19 issue.

Yes, but it works in 2.4, and it doesn't in 2.2.18. So we might as well just
use the 2.2.17 method in 2.2.18 instead of a hacked-up version of the 2.4
method.

> Vipin P.S. Did you look at the 2nd patch to inode-v23.c that I sent
> yesterday (to fix the partial page write stuff)?

Yeah - looks good, thanks. Can you commit it?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
