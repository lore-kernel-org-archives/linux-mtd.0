Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 135PuY-0007B0-00
	for mtd-list@infradead.org; Fri, 23 Jun 2000 10:38:06 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 135PuW-0007Au-00
	for mtd@infradead.org; Fri, 23 Jun 2000 10:38:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3950776D.30AC4B13@auriga.ru> 
References: <3950776D.30AC4B13@auriga.ru>  <Pine.LNX.4.10.10006201614120.7301-100000@impact-pc01.gnk.internal> 
To: Nick Ivanter <nick@auriga.ru>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: garbage collect 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Jun 2000 10:39:48 +0100
Message-ID: <30740.961753188@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nick@auriga.ru said:
> bash# mount /dev/mtd0 /mnt 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000c 

Cvs update and try again. Version 1.16 of mtdblock.c should fix this. I 
haven't tested it yet, but it was 'obviously broken'.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
