Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZvTY-0003RA-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 13:52:04 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZvTW-0003R4-00
	for mtd@infradead.org; Tue, 28 Mar 2000 13:52:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38E09EA9.C60FB1CD@lucidvon.com> 
References: <38E09EA9.C60FB1CD@lucidvon.com>  <38E076C2.534F661E@lucidvon.com> <17860.954236260@devel2.axiom.internal> 
To: Dvir Oren <dviro@lucidvon.com>
Cc: mtd@infradead.org
Subject: Re: Bad Block Table 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Mar 2000 13:52:13 +0100
Message-ID: <18850.954247933@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dviro@lucidvon.com said:
>  But does MTD even care about the BadBlockTable?  That is, does nftl.c
> check that the block that is about to be written to is not in the bad
> block table?

Not yet. That'll come when it handle async erases properly - and keeps a queue 
of preerased blocks which are available for writing, rather than going 
trawling for a new one each time it needs one.


dviro@lucidvon.com said:
>  Could this explain why I'm getting file system trashes?

If you've got bad blocks of flash, yes. It's more likely that I'm just 
violating some of the timing requirements for the DiskOnChip, though. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
