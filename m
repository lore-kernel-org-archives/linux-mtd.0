Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13PKQx-0008UG-00
	for mtd-list@infradead.org; Thu, 17 Aug 2000 08:49:51 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13PKQw-0008UA-00
	for mtd@infradead.org; Thu, 17 Aug 2000 08:49:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Ollie Lho <ollie@sis.com.tw>
Cc: mtd@infradead.org
Subject: NFTL cleanup
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 17 Aug 2000 08:49:46 +0100
Message-ID: <21418.966498586@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I've realised that we're not permitted to use a semaphore, or call any of 
the MTD access functions, from the nftl_request() function.

The nftl_request() function isn't permitted to sleep.

Therefore, we want a kernel thread. The _request function should do nothing 
but take requests off the kernel's queue and stick them on a private queue, 
to be served by the kernel thread.

Once we do proper concurrent access to individual flash chips within the 
DiskOnChip, that'll become _very_ important.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
