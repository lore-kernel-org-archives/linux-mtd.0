Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14WMAQ-0006HU-00
	for mtd-list@infradead.org; Fri, 23 Feb 2001 17:38:06 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14WMAO-0006HO-00
	for mtd@infradead.org; Fri, 23 Feb 2001 17:38:05 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A96A5CF.82BDE33E@danielind.com> 
References: <3A96A5CF.82BDE33E@danielind.com>  <3A9595A4.D98A5CF@danielind.com> <Pine.LNX.4.30.0102222154410.7303-100000@imladris.demon.co.uk> <20965.982916696@redhat.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does not r egister block device! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Feb 2001 17:37:38 +0000
Message-ID: <26275.982949858@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
>  Do you have any figures as to how well it compresses vs say gzip -9?

Not wonderfully, especially if you're compressing something other than 
MIPS32 executable code. But it's easy enough to plug in new compression 
types. gzip would be welcome.

> Do you know why nobody added bzip2 support for compressed root file
> systems? bzip2 does a better job at compression. Size of the code? 

scratch space required to decompress

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
