Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11rGzV-0008L6-00
	for mtd@imladris.mvhi.com; Fri, 26 Nov 1999 08:44:29 +0000
In-Reply-To: <3839651A.4D22A6F3@danielind.com> 
References: <3839651A.4D22A6F3@danielind.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: MTD <mtd@imladris.mvhi.com>
Subject: Re: Reliability of FLASH data storage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Nov 1999 08:44:29 +0000
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11rGzV-0005hk-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
> Hi all, going through the list archive at the web site I did not find
> any discussion on the reliability of data storage during writes to
> FLASH.

You haven't thought about bit errors in read/write.

NFTL stores 6 bytes of error correction data for each 256-byte block stored on 
the flash. This can be used to correct bit errors upon reading it back.

> By reliability I mean, when data is being stored onto a flash sector,
> what happens when power is suddenly and without warning removed? 

That flash sector is invalid - it contains unknown data. The same problem 
exists with data storage on magnetic media. That's what journalling 
filesystems were invented for.

Actually, NFTL handles this situation OK - it always keeps a consistent state 
on the flash media, and only after the new block is written will it be marked 
as valid, then the old one overwritten.

But that's not enough - if you have a bog standard ext2 filesystem on your 
NFTL, then you have just reduced the problem to the same level as you'd have 
on a real disk.

You also need a filesystem which does the same - like ext3.

What I really want to do is a filesystem directly on the flash - none of this 
'pretend it's a block device' stuff.

Jason, how's FFS2 coming along? Is it possible to make it POSIX-compliant 
without a hack as evil as UMSDOS?




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
