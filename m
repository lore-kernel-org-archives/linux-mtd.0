Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SbRz-0004Qg-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 09:08:43 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SbRy-0004Qa-00
	for mtd@infradead.org; Tue, 13 Feb 2001 09:08:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A886BED.9339AC4F@danielind.com> 
References: <3A886BED.9339AC4F@danielind.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: jffs-dev <jffs-dev@axis.com>, mtd <mtd@infradead.org>
Subject: Re: First cut at MTD/JFFS HOWTO 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 09:08:09 +0000
Message-ID: <9739.982055289@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
>  Leave everything else off, till you reach... *NAND flash device
> drivers. You want this on (or module as the case may be). * Enable ECC
> Correction Algorithm -yes * Verify NAND page writes -off worked for
> me. I need to investigate this further. 

I think you can leave those off for DiskOnChip. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
