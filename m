Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H5xV-0000OU-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 15:45:25 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H5xS-0000OO-00
	for mtd@infradead.org; Tue, 25 Jul 2000 15:45:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <397DA945.60FED4FA@coollogic.com> 
References: <397DA945.60FED4FA@coollogic.com>  <397DA681.1DBEC4DA@coollogic.com> <2943.964535514@cygnus.co.uk> 
To: Ian Thompson <ithompson@coollogic.com>
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: 64M DOC2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 15:45:18 +0100
Message-ID: <4349.964536318@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ithompson@coollogic.com said:
> The part is recognised by the mtd driver with 2.4.0. I can partition
> it with fdisk /dev/nftl and create  ext2 disks.  

Good.

> However, when I try
> to copy data to it I start getting input/output errors after I've got
> a certain amount of data (yet to be determined) on it. 

Urgh. That may be normal though :(

Can you post the whole of the kernel's output while you're doing this, 
including what it says when it probes and finds the device?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
