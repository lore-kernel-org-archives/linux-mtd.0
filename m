Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Zs60-0005NM-00
	for mtd-list@infradead.org; Fri, 15 Sep 2000 10:47:48 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Zs5z-0005NG-00
	for mtd@infradead.org; Fri, 15 Sep 2000 10:47:47 +0100
Message-ID: <39C1F131.92B13671@arcom.co.uk>
Date: Fri, 15 Sep 2000 10:51:45 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Putting small JFFS images in big devices
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

While attempting to track down a problem I copied a JFFS image from a
8Mibyte device and put it in a 14Mibyte device.  Writing files to the
device results in

Free size accounting screwed
free_chunk_size1 == 0x68208, free_chunk_size2 == 0x0, fmc->free_size ==
0x668208

Looks like something thinks the extra 6Mibyte is free and the somewhere
else thinks it isn't.

Also, can you have MTD devices in RAM? If so how?

David Vrabel.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
