Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vq5T-000569-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 23:01:31 +0000
Received: from [209.184.180.169] (helo=bob.faxtel.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vq5R-000563-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 23:01:30 +0000
Message-ID: <384EE388.C92A374E@go2fax.com>
Date: Wed, 08 Dec 1999 17:02:32 -0600
From: Bob Canup <rcanup@go2fax.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: Re: [Fwd: Power Down]
References: <384ECF77.C1F5D6FC@danielind.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Vipin Malik wrote:

> Bob Canup wrote:
> >
> > It is obvious that a physical medium such as a disk is vulnerable to
> > having a bad sector created by the process that I described. The proof
> > is simple: pop out a diskette while you are writing to it and you stand
> > a good chance of creating a sector in which the CRC and data are out of
> > sync. When you attempt to read the sector you will get a bad CRC.
> >
> > This occurs in a diskette because the writing process is a serial event;
> > it is spread over time. So there is a window in which an interruption
> > can create a bad sector.
> >
> > Let us assume the the DOC writes all of the bytes in a page including
> > the ECC code in parallel, let us also assume that you have an internal
> > bit which marks a sector as good when that process has completed. There
> > nevertheless is a time during the 'burn' of the bits where we are in an
> > analog state of changing the bits. If power is lost at that time - some
> > of the bits will not have changed to their proper state. Even if the
> > page is not marked as good an attempt to read the page will result in an
> > ECC and data which do not match and the result is a bad sector. The
> > sector may be easily recovered by erasing it and starting over - but as
> > long as there is an analog aspect to changing the states - the bits will
> > not all change at the same instant and a window for corruption exists.
>
> Ah! buy having a CRC on the *ENTIRE* sector gets around this problem.
> Unless ALL the bits are burned in, the CRC will not match on a read.
> As to what happens the next time power comes back on, I guess that one
> does not erase the "good" sector till the new one is completely written.
> This way, at least you have the last (old) data still available.
>
> >

What I was trying to do was outline the cause of the bad sector - CRC error
problem during power loss. Certainly a CRC on the entire sector reports the
problem - that is why one uses CRC's.  You can identify a bad sector - the
question is what do you do about it?

You are worried about losing inodes and directories to bad sectors. Let me
pose a question: suppose that the power failed just before the write to the
inode or directory sector - that there was no bad sector created - that the
data was just never written to the recording media - do you see any way to
recover from that  problem?

I can't see any difference between erasing a bad sector after the next power
up and the case of a slightly earlier power failure where the data was never
written in the first place; you wind up with an identical file system in both
cases.  If you can survive the case of the earlier power failure failing to
record the sector then you can survive the case of the bad sector being
erased.

The only difference that I see is that in the case of the bad sector  you
know something happened, in the case of the data never being recorded you
don't.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
