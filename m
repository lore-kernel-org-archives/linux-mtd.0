Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14YlNP-000445-00
	for mtd-list@infradead.org; Fri, 02 Mar 2001 08:57:27 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14YlNO-00043z-00
	for mtd@infradead.org; Fri, 02 Mar 2001 08:57:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <15E6537E180CC545848148F30F6688D81945BF@navajo.astanetworks.com> 
References: <15E6537E180CC545848148F30F6688D81945BF@navajo.astanetworks.com> 
To: Pete Skelly <pete.skelly@astanetworks.com>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: DOC2000 - 96MB on a 650Mhz PIII - cannot doc_read_ecc 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Mar 2001 08:57:23 +0000
Message-ID: <10752.983523443@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


pete.skelly@astanetworks.com said:
>  Also, could this be related to some of the problems people are seeing
> with larger modules?  Do the larger modules have greater delays for
> sending commands to the chip, or are they simply found in faster
> systems? 

Or the newer DiskOnChip devices are less tolerant w.r.t timing than the 
older ones? I think this is probably the cause of most of the problems that 
people have been seeing.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
