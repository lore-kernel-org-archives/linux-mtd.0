Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11w4yM-0005rL-00
	for mtd-list@infradead.org; Thu, 09 Dec 1999 14:55:10 +0000
Received: from [209.184.180.169] (helo=bob.faxtel.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11w4yL-0005rF-00
	for mtd@imladris.mvhi.com; Thu, 09 Dec 1999 14:55:09 +0000
Message-ID: <384FC311.1E57CBD6@go2fax.com>
Date: Thu, 09 Dec 1999 08:56:17 -0600
From: Bob Canup <rcanup@go2fax.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: Re: [Fwd: Power Down]
References: <384ECF77.C1F5D6FC@danielind.com> <384EE388.C92A374E@go2fax.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote:

> Vipin Malik wrote:
>
> > Bob Canup wrote:
> > >
> >
> I can't see any difference between erasing a bad sector after the next power
> up and the case of a slightly earlier power failure where the data was never
> written in the first place; you wind up with an identical file system in both
> cases.  If you can survive the case of the earlier power failure failing to
> record the sector then you can survive the case of the bad sector being
> erased.
>
> The only difference that I see is that in the case of the bad sector  you
> know something happened, in the case of the data never being recorded you
> don't.
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

On the way home last night it occurred to me that if you are doing a
read-modify-write cycle that it does make a difference where the error occurs.
In this case if the sector is never written the old data is still valid.

It seems to me the wear leveling necessary in a flash can be a benefit here; if
I understand correctly we don't overwrite the physical pages - only when a page
is 'committed' does the chip change its mapping so that it appears that the
sector was overwritten.





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
