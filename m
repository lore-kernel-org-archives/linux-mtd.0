Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vomk-00050C-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 21:38:06 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vomj-000506-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 21:38:05 +0000
Message-ID: <384ED00B.F678D296@danielind.com>
Date: Wed, 08 Dec 1999 15:39:23 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Power Down]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> rcanup@go2fax.com said:
> >  Vipin's original post said that he saw bad sectors about once in
> > every 250 power down cycles. Oran is telling us that can't occur.
> 
> At the block device level, that definitely shouldn't occur. The ext2 may of
> course get confused, but that's why you should be using ext3 on it if you ever
> expect it to lose power.

I can gurantee you that it did with at least 3 or 4 IDE2000 disks that I
tested. Also with a couple of compact flash disks that I tested. The
compact flash were so bad (1 in about 4 problems on power downs) that I
just gave up on those as completely unacceptable.

> 
> > Of course if my analysis is correct then you are safe to erase the bad
> > sector - it was the last one being written; the file system would then
> > be left in a state in which e2fsck could hopefully repair it.
> 
> With NFTL, that's definitely the way it's designed. You write the data, write
> the ECC checksum, and then mark it valid. The old version of that block remains
> on the media until it's later reclaimed.
> 
> If you are interrupted during a write, it's obvious and can be fixed.

Is this functionality already there in the drivers on the web site. Has
this been tested during power downs during writes to flash?


> 
> --
> dwmw2
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
