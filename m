Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198lQ7-0000Mw-BG
	for <linux-mtd@lists.infradead.org>; Thu, 24 Apr 2003 19:26:07 +0100
Received: from pengwin (h209-139-192-234.gtconnect.net [209.139.192.234])
	(authenticated bits=0)
	by smtp.hotbox.ru (8.12.9/8.12.9) with ESMTP id h3OIHFj8085032
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Apr 2003 22:17:16 +0400 (MSD)
	(envelope-from samoutin@hotbox.ru)
Message-ID: <000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: <linux-mtd@lists.infradead.org>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030423204440.258661528E@desire.actrix.co.nz>
Date: Thu, 24 Apr 2003 11:25:43 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I am unaware of this problem. I would like to understand it better. Could
you
> give me more details?
>

> > It's different problem. When you "erase" file it not really erased.
> > This file just marked for erasing and then GC working in background
provide
> > real erasing.
>
> In yaffs this does not really happen. Even though the real deleting is
done
> "in background", it is always done in the same thread. ie.  this is done
by
> parasitic code of the form:
>
> write_data()
> {
>      do_background_gc();
>     do_actual_write();
> }



Honestly speaking  I don't know much about JAFFS, but GC thread should work
similar to JFFS2 GC thread, I think.



And I had problem very similar to originally described on my JFFS2.

It is nothing wrong with JFFS2 itself. It was a low level problem.  For
example we have empty flash with 100 erase blocks. We wrote File1 and
occupied blocks 0-39. Then we deleted this file and start writing File2.
This new file will be written to blocks 40-79. And now we have two processes
working.. Process one (GC) is erasing block 0-39, process 2 is writing new
file to blocks 40-79. Both of them are working at the same time (at least in
case of JFFS2). I sow it. From blocks point of view all Ok. One set of
blocks is erasing and absolutely different set of block is writing. But we
have only one NAND chip. When we want to write something to NAND we have to
send writing command, then provide some command parameters (like address)
and then send data itself. And if locking mechanism doesn't work properly we
can get situation when , for example, one process send command to write and
then second process start sending something to chip which will be
interpreted as address for writing but this address will be incorrect, of
cause. As I mentioned NAND driver (nand.c) has lock mechanism to prevent
this situation. But it doesn't work in my case. I don't know why - the code
look Ok. A added some additional locks and it solved this problem.



Alexander Samoutin
