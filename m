Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131lNI-0001bh-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 08:44:40 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 131lNF-0001bb-00
	for mtd@infradead.org; Tue, 13 Jun 2000 08:44:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006130132400.11360-100000@big.adis.on.ca> 
References: <Pine.LNX.4.10.10006130132400.11360-100000@big.adis.on.ca> 
To: Adi Linden <adi@adis.on.ca>
Cc: mtd@infradead.org
Subject: Re: M-Systems Disk-On-Chip driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Jun 2000 08:44:24 +0100
Message-ID: <29645.960882264@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


adi@adis.on.ca said:
> Is the kernel driver for the doc devices working? I haven't tried mtd
> in a while but I'd really like to replace the IGEL driver with
> something open source.

It works fine in read-only mode. Some problems have been reported in write 
mode, but I haven't been able to reproduce them.

It's not yet very efficient in write mode, but it ought to work.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
