Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13tsPN-0007hG-00
	for mtd-list@infradead.org; Thu, 09 Nov 2000 14:10:29 +0000
Date: Thu, 9 Nov 2000 09:22:59 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <Pine.LNX.4.21.0011090748110.4484-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.10.10011090920290.927-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 9 Nov 2000, David Woodhouse wrote:

> I agree that plugging is useful for us. So rather than disabling it, how
> about changing the check in mtdblock_thread() to:
> 
> 	if (QUEUE_EMPTY || QUEUE_PLUGGED)

Agreed.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
