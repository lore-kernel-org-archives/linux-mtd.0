Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t3L7-0008Nc-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 09:10:57 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t3L6-0008NV-00
	for mtd@infradead.org; Fri, 27 Apr 2001 09:10:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AE9CCCB.10BC1502@sri.receiptcity.com> 
References: <3AE9CCCB.10BC1502@sri.receiptcity.com>  <Pine.LNX.4.33.0104251247350.4186-100000@xanadu.home> 
To: dhammika <dpathirana@sri.receiptcity.com>
Cc: Nicolas Pitre <nico@cam.org>, mtd@infradead.org
Subject: Re: jffs for amd Am29LV160BB 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 27 Apr 2001 09:10:28 +0100
Message-ID: <11834.988359028@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dpathirana@sri.receiptcity.com said:
> $Last[2] is 19851985, datum is 20031985

Looks like the command set driver isn't dealing properly with having 2 
16-bit chips in parallel on a 32-bit bus. I thought other people were using 
that arrangement, though.

Take a closer look at do_write_oneword() in cfi_cmdset_0002.c and at the 
32-bit read function of the map driver.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
