Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131rgR-00039n-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 15:28:51 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 131rgQ-00039h-00
	for mtd@infradead.org; Tue, 13 Jun 2000 15:28:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006130846590.4290-100000@develop.knet.on.ca> 
References: <Pine.LNX.4.10.10006130846590.4290-100000@develop.knet.on.ca> 
To: Adi Linden <adi@adis.on.ca>
Cc: mtd@infradead.org
Subject: Re: M-Systems Disk-On-Chip driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Jun 2000 15:28:47 +0100
Message-ID: <3305.960906527@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


adi@adis.on.ca said:
>  Hmmm... So are there some really easy instructions on how to build
> the driver? Then I will give it a try!

Try the 2 cvs instructions given on the web page.
follow with...

 cd mtd
 ./utils/MAKEDEV
 make
 cd kernel
 insmod ./mtdcore.o
 insmod ./doc2000.o
 insmod ./docprobe.o
 insmod ./nftl.o



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
