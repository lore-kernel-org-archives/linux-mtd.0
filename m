Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aDED-0007OZ-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 08:53:57 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aDEB-0007OQ-00
	for mtd@infradead.org; Tue, 06 Mar 2001 08:53:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <15E6537E180CC545848148F30F6688D81945CF@navajo.astanetworks.com> 
References: <15E6537E180CC545848148F30F6688D81945CF@navajo.astanetworks.com> 
To: Pete Skelly <pete.skelly@astanetworks.com>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: DOC2000 - 96MB on a 650Mhz PIII - cannot doc_read_ecc 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Mar 2001 08:53:21 +0000
Message-ID: <3970.983868801@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


pete.skelly@astanetworks.com said:
>  A number of people have indicated they have been having problems with
> larger DoC devices, and I suspect this may in fact be the problem.
> Either the page swap delay is longer on larger devices, or they are
> running on faster machines.  

Hmmm. It doesn't seem to fix my 72MiB DiskOnChip, even when I move the 
delay to between the data read and the ecc read.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
