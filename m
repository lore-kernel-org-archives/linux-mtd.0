Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FHAu-00008p-00
	for mtd-list@infradead.org; Thu, 20 Jul 2000 15:19:44 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13FHAt-00008i-00
	for mtd@infradead.org; Thu, 20 Jul 2000 15:19:43 +0100
Date: Thu, 20 Jul 2000 15:19:30 +0100 (BST)
From: David Woodhouse <dwmw2@passion.cygnus.co.uk>
To: Simon Munton <Simon.Munton@m4data.co.uk>
cc: mtd@infradead.org
Subject: Re: Problem in physmap.c
In-Reply-To: <00B4D286538DD311BC6E005004E9EFC7213E9B@M4EXCH>
Message-ID: <Pine.LNX.4.21.0007201518110.23213-100000@passion.cygnus.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 19 Jul 2000, Simon Munton wrote:

> The call to ioremap() in init_physmap() has its arguments swapped:
> 
> currently it is
> 	physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_SIZE,
> WINDOW_ADDR);
> 
> and it should be:
> 	physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR,
> WINDOW_SIZE);

Doh! Fixed. Thanks.

Please don't send mail to the 'mtd-cvs' list - that's just for the CVS
commit logs which people wanted me to remove from the real list.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
