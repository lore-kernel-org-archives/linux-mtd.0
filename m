Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JecV-0006tu-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 17:10:19 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JecS-0006tm-00
	for mtd@infradead.org; Tue, 01 Aug 2000 17:10:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3986F665.C3957540@arcom.co.uk> 
References: <3986F665.C3957540@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: Partitioning flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 Aug 2000 17:10:05 +0100
Message-ID: <6251.965146205@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  Is there a way of partitioning a single flash device into seperate
> partitions? Each of which can hold a JFFS filesystem? 

Yes. See pnc2000.c

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
