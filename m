Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12VWOU-0001pp-00
	for mtd-list@infradead.org; Thu, 16 Mar 2000 09:16:38 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12VWOT-0001pj-00
	for mtd@infradead.org; Thu, 16 Mar 2000 09:16:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001101bf8f24$63dbb140$0500a8c0@cores.ro> 
References: <001101bf8f24$63dbb140$0500a8c0@cores.ro> 
To: "Marius Bogoevici" <marius_bogoevici@electronic.cores.ro>
Cc: "MTD mailing list" <mtd@infradead.org>
Subject: Re: IDE-like SanDisk 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 Mar 2000 09:16:09 +0000
Message-ID: <8384.953198169@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


marius_bogoevici@electronic.cores.ro said:
> Is there any way to use MTD (maybe just an idea) on an IDE-like
> SanDisk PC-Card ? Or, at least, the FFS2 ?

As far as I'm aware, no. CompactFlash presents itself as an IDE drive, and 
has its own flash filing system internally (probably FTL). You can't access 
the flash directly.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
