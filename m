Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZuNG-0003Hk-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 12:41:30 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12ZuND-0003He-00
	for mtd@infradead.org; Tue, 28 Mar 2000 12:41:29 +0100
Message-ID: <38E09B11.99A7A4B1@lucidvon.com>
Date: Tue, 28 Mar 2000 11:44:17 +0000
From: Dvir Oren <dviro@lucidvon.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, MTD <mtd@infradead.org>
Subject: Re: Bad Block Table
References: <38E076C2.534F661E@lucidvon.com> <17860.954236260@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> Stored in the same erase block as the NFTL Media 
> Header(s).  Look for BadUnitTable in util/nftl_format.c

I now have some more questions:

If I understand correctly, 512 zones (== bytes?) are 1 block.  And then
you try to erase each block, and see if
it was written correctly, and if not, you save it in the
table.

However - it seems to me like the position you write the
table depends on where the nftl_format got started.  That is, if I write
nftl_format /dev/mtd0 49152, it'll write it at a different place than if
I wrote nftl_format /dev/mtd0.
Isn't the table supposed to be at the same place all the time?  I just
called M-Systems, and they claim it's at the same position all the
time.  They have a command to save it: dformat /win:xxxx /log:<file>,
which appears like it will be at the same position each time.

And also - Oron from M-Systems said something about saving the table,
and never writing to it.  That's not quite what you do.  You check for
the bad blocks, and then re-write the table.  Am I correct?

I didn't understand why there is MediaUnit1 and MediaUnit2.

Thanks for the help!

--
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
