Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZrxH-00030M-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 10:06:31 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12ZrxD-00030G-00
	for mtd@infradead.org; Tue, 28 Mar 2000 10:06:28 +0100
Message-ID: <38E076C2.534F661E@lucidvon.com>
Date: Tue, 28 Mar 2000 09:09:22 +0000
From: Dvir Oren <dviro@lucidvon.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Bad Block Table
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I have several questions about the bad block table:

1.  Where is it located?  Oron from M-Systems said that before erase the
flash it is important to save it.  So where is it located, and how can I
save it? (Will dd work?)

2.  Also mentioned was that during the lifetime of the flash, if a new
bad block is found, it is marked as a bad block.  This will be effective
only before doing a boot.  Question is, who is responsible for finding
those bad blocks - the M-Systems kernel driver?

3.  And if the driver is responsible for this, does the MTD driver do
the same?

Also, on a related issue, I found that after using nftl_format,
M-Systems' dfromat does not recognize the flash correctly, and errors
something about "out of spare units".  I usually fixed this by erasing
the flash (docpmap /e).  Any other way to do it?  dformat /unformat
doesn't seem to do it.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
