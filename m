Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZsRN-00032U-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 10:37:37 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZsRM-00032O-00
	for mtd@infradead.org; Tue, 28 Mar 2000 10:37:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38E076C2.534F661E@lucidvon.com> 
References: <38E076C2.534F661E@lucidvon.com> 
To: Dvir Oren <dviro@lucidvon.com>
Cc: mtd@infradead.org
Subject: Re: Bad Block Table 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Mar 2000 10:37:40 +0100
Message-ID: <17860.954236260@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dviro@lucidvon.com said:
>  1.  Where is it located?  Oron from M-Systems said that before erase
> the flash it is important to save it.  So where is it located, and how
> can I save it? (Will dd work?) 

Stored in the same erase block as the NFTL Media Header(s). 
Look for BadUnitTable in util/nftl_format.c


dviro@lucidvon.com said:
>  2.  Also mentioned was that during the lifetime of the flash, if a
> new bad block is found, it is marked as a bad block.  This will be
> effective only before doing a boot.  Question is, who is responsible
> for finding those bad blocks - the M-Systems kernel driver?

This is effective only until you next reboot - i.e. it's not written to the 
BadUnitTable, only stored in memory. Presumably, the M-Systems driver notices 
a failure when it tries to erase or write a block, and marks it bad.


dviro@lucidvon.com said:
>  3.  And if the driver is responsible for this, does the MTD driver do
> the same? 

Not yet.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
