Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14H73p-0004eJ-00
	for mtd-list@infradead.org; Fri, 12 Jan 2001 16:28:17 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14H73o-0004eC-00
	for mtd@infradead.org; Fri, 12 Jan 2001 16:28:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0101121920380.26282-100000@godzilla.axis.se> 
References: <Pine.LNX.4.21.0101121920380.26282-100000@godzilla.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: mtd@infradead.org
Subject: Re: mtdpart.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 12 Jan 2001 16:27:44 +0000
Message-ID: <23563.979316864@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjorn.wesen@axis.com said:
>  I noticed that pnc2000.c uses add_mtd_partitions, but this is defined
> in mtdpart.c which is not in the Makefile.. is it safe to use this or
> should I conjure up partition code myself in my mapping ? 

Use mtdpart.c

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
