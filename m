Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ECHs-0007B1-00
	for mtd-list@infradead.org; Mon, 17 Jul 2000 15:54:28 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13ECHm-0007Av-00
	for mtd@infradead.org; Mon, 17 Jul 2000 15:54:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39731CC4.65600194@matrox.com> 
References: <39731CC4.65600194@matrox.com> 
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
Cc: mtd@infradead.org
Subject: Re: Compiling MTD in the kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jul 2000 15:54:04 +0100
Message-ID: <18053.963845644@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


scote1@Matrox.COM said:
>  It's the same errors I would get If I had compiled everything as
> modules but didn't load them.

2.2 kernel, I assume. Did you apply the mtd-patch-2.2.16 from the patches/ 
directory? It puts all the calls to the init routines in the right place.

I assume you did enable CONFIG_MTDCHAR and CONFIG_JFFS_FS :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
