Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148OAb-0001bP-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 14:55:13 +0000
Received: from [195.224.55.237] (helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148OAa-0001b3-00
	for mtd@infradead.org; Tue, 19 Dec 2000 14:55:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0012181049550.997-100000@xanadu.gn.com> 
References: <Pine.LNX.4.30.0012181049550.997-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: Erwin Authried <eauth@softsys.co.at>, mtd@infradead.org
Subject: Re: module registration changes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 19 Dec 2000 14:52:21 +0000
Message-ID: <4742.977237541@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  Well...  I would suggest you add it where it belongs i.e. include/
> linux/list.h. 

I agree. We need to patch 2.0 anyway to make the initcalls &c work. We 
might as well add list.h in the right place in the same patch.

At this stage, I'd like to keep the main code as clean as possible for 2.4. 
I want it to _work_ on 2.0, but I want it to be _pretty_ in 2.4, because I 
have to justify it to Linus for 2.4, and I don't for 2.0 :)

Feel free to add an 'infrastructure' patch for 2.0 which does everything 
you need and lets you just drop the contents of the drivers/mtd and 
include/linux/mtd directories in place from CVS.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
