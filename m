Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12YE8t-0005vW-00
	for mtd-list@infradead.org; Thu, 23 Mar 2000 20:23:43 +0000
Received: from out2.prserv.net ([32.97.166.32] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12YE8q-0005vQ-00
	for mtd@infradead.org; Thu, 23 Mar 2000 20:23:40 +0000
From: "Dvir Oren" <dviro@lucidvon.com>
To: Trevor Woolven <trevw@zentropix.com>
Date: Thu, 23 Mar 2000 22:23:53 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: MTD with 2.2.14 kernel
CC: MTD <mtd@infradead.org>
In-reply-to: <38D60614.21F1E8C6@zentropix.com>
Message-Id: <E12YE8q-0005vQ-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> I don't need to use nftl_format in order to be able to write to the
> flash using the MTD drivers. I have managed to write successfully to a
> DOC having formated it using the M-Systems utilities, dformat and

I tried your patches for the kernel and they worked!  Thank you.  I 
don't understand, though, why didn't my patches work.  They are 
very similar.  Perhaps I initialized MTD too late, or something like 
that.  Maybe I'll look into it.

However, whenever I try to write to the flash without nftl_formating it 
first, I get errors.  And I still wasn't able to boot from the flash.  
LILO starts loading, but gets stuck either at LI or LIL-.  Oh well.  I 
don't understand why it works for you, but doesn't for me.  I also 
keep getting file system corruption.

Thanks for the help.

---------
Dvir Oren <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
