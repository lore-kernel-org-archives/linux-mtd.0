Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148NiI-0001U7-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 14:25:58 +0000
Received: from [195.224.55.237] (helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148NiH-0001U1-00
	for mtd@infradead.org; Tue, 19 Dec 2000 14:25:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00121914201204.01244@frumious.unidec.co.uk> 
References: <00121914201204.01244@frumious.unidec.co.uk>  <Pine.LNX.4.30.0012171158140.14423-100000@imladris.demon.co.uk> 
To: dr john halewood <john@frumious.unidec.co.uk>
Cc: mtd@infradead.org
Subject: Re: MTD module compilation (was: [PATCH] link time error in drivers/mtd (240t13p2)) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 19 Dec 2000 14:25:02 +0000
Message-ID: <2006.977235902@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


john@frumious.unidec.co.uk said:
> Tell Dave he fucked up. LastFreeEUN = 1023, FirstEUN=10765 
> No Virtual Unit Chains available for folding. Failing request. 

That probably wasn't an init order problem. That was just broken code. It
should now be fixed, and the printk has been sanitised too - it wasn't
really supposed to get past the proof of concept stage with that precise
wording in it.

Regardless of the wording used, that error shouldn't ever happen in the new 
code, if your NFTL has been reformatted since you broke it. If it does, we 
need to know about it.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
