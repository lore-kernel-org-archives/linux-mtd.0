Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vicn-0004ap-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 15:03:25 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vicm-0004aj-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 15:03:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <384E7150.F31E542C@go2fax.com> 
References: <384E7150.F31E542C@go2fax.com> 
To: Bob Canup <rcanup@go2fax.com>
Cc: MTD <mtd@imladris.mvhi.com>
Subject: Re: Power Down 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 Dec 1999 15:04:41 +0000
Message-Id: <E11vie2-000344-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rcanup@go2fax.com said:
>  Vipin's original post said that he saw bad sectors about once in
> every 250 power down cycles. Oran is telling us that can't occur.

At the block device level, that definitely shouldn't occur. The ext2 may of 
course get confused, but that's why you should be using ext3 on it if you ever 
expect it to lose power.

> Of course if my analysis is correct then you are safe to erase the bad
> sector - it was the last one being written; the file system would then
> be left in a state in which e2fsck could hopefully repair it. 

With NFTL, that's definitely the way it's designed. You write the data, write
the ECC checksum, and then mark it valid. The old version of that block remains
on the media until it's later reclaimed.

If you are interrupted during a write, it's obvious and can be fixed.





--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
