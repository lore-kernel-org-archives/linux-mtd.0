Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14YnOT-0000Rt-00
	for mtd-list@infradead.org; Fri, 02 Mar 2001 11:06:41 +0000
Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14YnOR-0000R8-00
	for mtd@infradead.org; Fri, 02 Mar 2001 11:06:40 +0000
Message-ID: <3A9F7EBA.4A6C0ED1@sis.com.tw>
Date: Fri, 02 Mar 2001 19:06:34 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Pete Skelly <pete.skelly@astanetworks.com>
CC: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: DOC2000 - 96MB on a 650Mhz PIII - cannot doc_read_ecc
References: <15E6537E180CC545848148F30F6688D81945BF@navajo.astanetworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Pete Skelly wrote:
> 
> Looks like timing is in fact the problem.  I multiplied the delay
> in the routine DoC_Delay by 3, making this call last as long
> as if my machine were a 200Mhz machine (which is probably closer to
> what the Doc2000 drivers we're developed on), and was able to
> successfully use nflt on the drive.
> 
> Although it looks like M-Systems doesn't publish the actual delays required,
> they did indicate that there were in fact delays that had to be taken into
> account.
> 
> Any idea on the real numbers for the delays.  If one knew that, one could
> write
> proc-speed independent delay code (err, not sure whether I'm volunteering or
> not)
> 
> Also, could this be related to some of the problems people are seeing with
> larger
> modules?  Do the larger modules have greater delays for sending commands to
> the chip,
> or are they simply found in faster systems?
> 

M-System does "publish" the timming requirement in their documents. But they
does not made it very clearly, and it seems that the timming varies with
the age of the flash and/or different lot.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
