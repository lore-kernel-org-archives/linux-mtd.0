Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12XggE-000240-00
	for mtd-list@infradead.org; Wed, 22 Mar 2000 08:39:54 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12XggD-00023u-00
	for mtd@infradead.org; Wed, 22 Mar 2000 08:39:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38D82A5B.B2E986CC@linux-embedded.com> 
References: <38D82A5B.B2E986CC@linux-embedded.com>  <20000322013836.59548.qmail@hotmail.com> 
To: Sebastien HUET <linuxemb@linux-embedded.com>
Cc: JaeYong Jeong <trusty0@hotmail.com>, mtd@infradead.org
Subject: Re: Have you ever heard about RAID system composed of flash memory? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 22 Mar 2000 08:39:58 +0000
Message-ID: <7689.953714398@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


linuxemb@linux-embedded.com said:
> 1) Use SCSI compatible flash disk ( Sandisk 'offers' some) with Raid
> hardware. 

> 2) Use IDE flash disk with kernel Raid. 

AFAIK the software raid can work on any block devices, not just IDE or SCSI. 
So you could also RAID across multiple PCMCIA flash cards / onboard flash / 
DiskOnChip devices.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
