Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13sou8-0007TX-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 16:13:52 +0000
Date: Mon, 6 Nov 2000 16:24:57 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <22703.973524695@redhat.com>
Message-ID: <Pine.LNX.4.10.10011061618420.530-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 6 Nov 2000, David Woodhouse wrote:

> 
> OK. Upon prodding, it seems that I'd misunderstood beforehand. You _CAN_ 
> sleep in a standard request function; you don't need to have a kernel 
> thread. 

Are you certain of that?

One place where the request function is called is within
generic_unplug_device() which is called through a task queue (see
blk_init_queue()).


Nicolas




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
