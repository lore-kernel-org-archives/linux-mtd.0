Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H14d-0007d0-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 10:32:27 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H14Z-0007ct-00
	for mtd@infradead.org; Tue, 25 Jul 2000 10:32:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <8likhn$d2h$1@whiskey.fireplug.net> 
References: <8likhn$d2h$1@whiskey.fireplug.net>  <005001bff32c$b59a92a0$8e00a8c0@gpc> 
To: sl@fireplug.net
Cc: mtd@infradead.org
Subject: Re: ELANSC400 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 10:31:54 +0100
Message-ID: <31986.964517514@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


sl@whiskey.fireplug.net said:
>  The flash parts on the SC400 are mapped through the SC400 MMU. There
> are  several models, but the easiest is to map them 8kb at a time into
> a memory window in low memory (0xc8000 if I remember correctly).

> Once there you can access them as normal flash memory. 

Any more details on how to set up and modify the mapping?

Preferably in the form of source code based on octagon-5066.c :)



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
