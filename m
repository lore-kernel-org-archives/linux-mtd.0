Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14L5yU-0004tP-00
	for mtd-list@infradead.org; Tue, 23 Jan 2001 16:07:14 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14L5yT-0004tJ-00
	for mtd@infradead.org; Tue, 23 Jan 2001 16:07:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <52AF3CB987C7D41183CD0090271F67C301C7CE@m4eng.m4data.co.uk> 
References: <52AF3CB987C7D41183CD0090271F67C301C7CE@m4eng.m4data.co.uk> 
To: Simon Munton <Simon.Munton@m4data.co.uk>
Cc: "JFFS (E-mail)" <jffs-dev@axis.com>,
    "MTD (E-mail)" <mtd@infradead.org>
Subject: Re: Endless garbage collection 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Jan 2001 16:06:24 +0000
Message-ID: <5100.980265984@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Simon.Munton@m4data.co.uk said:
> Perhaps the test for too much RAM being used in thread_should_wake()
> ought to take the number of files into account? ie should it be:

Probably something along the lines of what you suggested. I think we should
probably put it _after_ the check for dirty_size < sector_size too, 
until/unless we can be 100% sure that it'll never cause endless GC.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
