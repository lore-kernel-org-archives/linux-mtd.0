Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13soFg-0007G4-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 15:32:04 +0000
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13soFc-0007Fx-00
	for mtd@infradead.org; Mon, 06 Nov 2000 15:32:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10011061506410.530-100000@xanadu.gn.com> 
References: <Pine.LNX.4.10.10011061506410.530-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 Nov 2000 15:31:35 +0000
Message-ID: <22703.973524695@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


OK. Upon prodding, it seems that I'd misunderstood beforehand. You _CAN_ 
sleep in a standard request function; you don't need to have a kernel 
thread. The only restriction is that you must not allocate anything with 
GFP_KERNEL, because it could deadlock waiting for you to write.

So we can throw out all my kernel thread crap.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
