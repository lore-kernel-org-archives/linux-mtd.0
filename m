Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H4ce-0008TG-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 14:19:48 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H4cc-0008TA-00
	for mtd@infradead.org; Tue, 25 Jul 2000 14:19:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000725145702.8086O-100000@fafner.axis.se> 
References: <Pine.LNX.3.96.1000725145702.8086O-100000@fafner.axis.se> 
To: Bjorn Wesen <bjornw@axis.com>
Cc: Finn Hakansson <finn@axis.com>, "mtd@infradead.org" <mtd@infradead.org>,
  jffs-dev@axis.com
Subject: Re: jffs_file_write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 14:19:44 +0100
Message-ID: <26128.964531184@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjornw@axis.com said:
>  It usually takes about 1-2 seconds to erase a sector, so if you
> really need to erase the entire 16 mb flash during GC, that's 250
> sectors times 2 seconds, about 8 minutes. Mileage may vary depending
> on flash manufacturer - I've never used 16 mbyte flashes in anything..
> 

On these chips, erases only take a second. At the time, it was also 128
microseconds per _word_ write. So although a complete erase only takes 128
seconds, writing the whole device was more like 20 minutes.

Even so, it should be far less than the 90 minutes that I observed. Is it
possible that the GC was compacting the data on the flash repeatedly, before
it had completed removing all the files? The command I was running was:
 rm -r /mnt/usr

If it removed a couple of MB, then garbage collected, then removed another 
couple of MB, then would it have ended up moving the same data twice?



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
