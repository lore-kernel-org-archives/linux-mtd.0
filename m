Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12flBh-0004MX-00
	for mtd-list@infradead.org; Thu, 13 Apr 2000 16:05:45 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12flBg-0004MR-00
	for mtd@infradead.org; Thu, 13 Apr 2000 16:05:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38F5E06C.CA439A34@tsai.es> 
References: <38F5E06C.CA439A34@tsai.es> 
To: Rodrigo Moya <rmoya@tsai.es>
Cc: MTD List <mtd@infradead.org>
Subject: Re: which device? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 13 Apr 2000 16:05:56 +0100
Message-ID: <18600.955638356@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rmoya@tsai.es said:
>  At last I've successfully compiled the drivers. Now, which device do
> I need to access the DiskOnChip 72 MB hard disk? (the only one in the
> system)

/dev/nftla and probably /dev/nftla1

You may need to use the MAKEDEV script in the util directory.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
