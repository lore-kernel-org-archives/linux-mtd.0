Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qw9P-0003c1-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 13:06:07 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qw9O-0003bv-00
	for mtd@infradead.org; Sat, 21 Apr 2001 13:06:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AE1F867.20AA5B46@sri.receiptcity.com> 
References: <3AE1F867.20AA5B46@sri.receiptcity.com> 
To: dhammika <dhammika@sri.receiptcity.com>
Cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: jffs for amd Am29LV160BB 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 21 Apr 2001 13:05:19 +0100
Message-ID: <391.987854719@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


(redirected to MTD list)

dhammika@sri.receiptcity.com said:
> i'm working on a StrongArm based device with two 4Mb amd Am29LV160BB
> flash chips. are these chips currently supported ?? 

They should work fine. Isn't the 29LV160 a 16Mib (== 2MiB) chip, though? 
Meaning you have 4MiB of flash in total. 

It's complaining that your assigned partitions extend over the end of the 
device(s) found. What partition sizes had you told it?


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
