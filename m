Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vokM-0004zm-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 21:35:38 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vokL-0004zg-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 21:35:37 +0000
Message-ID: <384ECF77.C1F5D6FC@danielind.com>
Date: Wed, 08 Dec 1999 15:36:55 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Power Down]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote:
> 
> It is obvious that a physical medium such as a disk is vulnerable to
> having a bad sector created by the process that I described. The proof
> is simple: pop out a diskette while you are writing to it and you stand
> a good chance of creating a sector in which the CRC and data are out of
> sync. When you attempt to read the sector you will get a bad CRC.
> 
> This occurs in a diskette because the writing process is a serial event;
> it is spread over time. So there is a window in which an interruption
> can create a bad sector.
> 
> Let us assume the the DOC writes all of the bytes in a page including
> the ECC code in parallel, let us also assume that you have an internal
> bit which marks a sector as good when that process has completed. There
> nevertheless is a time during the 'burn' of the bits where we are in an
> analog state of changing the bits. If power is lost at that time - some
> of the bits will not have changed to their proper state. Even if the
> page is not marked as good an attempt to read the page will result in an
> ECC and data which do not match and the result is a bad sector. The
> sector may be easily recovered by erasing it and starting over - but as
> long as there is an analog aspect to changing the states - the bits will
> not all change at the same instant and a window for corruption exists.

Ah! buy having a CRC on the *ENTIRE* sector gets around this problem.
Unless ALL the bits are burned in, the CRC will not match on a read.
As to what happens the next time power comes back on, I guess that one
does not erase the "good" sector till the new one is completely written.
This way, at least you have the last (old) data still available.


> 
> Vipin's original post said that he saw bad sectors about once in every
> 250 power down cycles. Oran is telling us that can't occur.

I mailed a detailed post about this one a few mails ago. Plese refer
that.

> 
> Of course if my analysis is correct then you are safe to erase the bad
> sector - it was the last one being written; the file system would then
> be left in a state in which e2fsck could hopefully repair it.

Unfortunately, if the lower layer driver does not know WHAT goes in that
sector (inodes, data, etc), it could end up erasing a sector with inodes
in it. This is something that e2fsck will not be able to recover from
(at least without potentially killing a bunch of files on the system).

> 
> Or am I off in left field with this?
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
