Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13yF42-0002CE-00
	for mtd-list@infradead.org; Tue, 21 Nov 2000 15:10:30 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13yF41-0002C7-00
	for mtd@infradead.org; Tue, 21 Nov 2000 15:10:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.30.0011210948200.12336-100000@xanadu.gn.com> 
References: <Pine.LNX.4.30.0011210948200.12336-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: 2.4 stuff. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Nov 2000 15:10:04 +0000
Message-ID: <22559.974819404@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
>  IMHO this is a must.  Since I'm probably the one who made it break
> for your board please don't hesitate to bother me with that so we
> could fix it. 

OK, I've tested v1.46 on the same board with non-interleaved 16-bit flash
where it previously failed. It now appears to work.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
