Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sOcv-0000dw-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 13:42:37 +0100
Received: from 61-218-105-170.hinet-ip.hinet.net ([61.218.105.170] helo=maillog.sis.com.tw)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sOct-0000dl-00
	for mtd@infradead.org; Wed, 25 Apr 2001 13:42:36 +0100
Message-ID: <3AE68DD6.382351AC@sis.com.tw>
Date: Wed, 25 Apr 2001 16:41:58 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: "Carson, Jon A." <JACarson@addcoinc.com>
CC: "'mtd@infradead.org'" <mtd@infradead.org>,
        "Meyers, Jerry M." <JMMeyers@addcoinc.com>
Subject: Re: Still having problems with nftl_format
References: <5B08DC7C9AA6D411930E00105A19794B3E2405@EXCHANGE>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

"Carson, Jon A." wrote:
> 
> Hi,
> 
> A while back ( April 9, 2001 ) , I reported a problem with nftl_format. I
> know you are busy, but I wanted to state the problem again and also add some
> new information.
> 
> The problem is that everything is nice until it gets to Phase 3 which deals
> with writing some data into the chip.
> 
> I plugged in some printf's that show the state of the variables of interest,
> before we drop into the "for" loop.  I also added a printf to the for loop
> in case something was sucessful.  Please note that the first time through
> the loop, the call to the "ioctl" was apparently sucessful.  Every call to
> the same ioctl after that failed with errno == 14  (Bad address) .  I have
> included an excerpt from the nftl_format.c showing the revesion level of the
> code that I am using.
> 

Did you CVS update and recompile BOTH the driver and nftl_format ?? The
problem is in a change in *Kernel Header* file. So you must update and
recompile everything.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
