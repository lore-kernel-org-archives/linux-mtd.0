Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLfe0-00088E-GT
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 10:58:20 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i46A3Nc02997
	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2004 13:03:23 +0300 (EEST)
Message-ID: <409A092D.1060505@intracom.gr>
Date: Thu, 06 May 2004 12:45:17 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <AEB09EDA2548094C81ED6AA93269F63D01D09323@siebe001.apac.nokia.com>
	<200405061148.24573.tglx@linutronix.de>
In-Reply-To: <200405061148.24573.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: Srinivasu.Vaduguri@nokia.com
cc: dwmw2@infradead.org
cc: linux-mtd@lists.infradead.org
cc: ddaney@avtrex.com
Subject: Re: [patch] Allow any filesystem on MTD Nand when Read Only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Thursday 06 May 2004 11:30, Srinivasu.Vaduguri@nokia.com wrote:
>
>>>How many times have you written the block in order for something like
>>>this to occur?
>>>
>>I haven't counted the number of times. But I remember reading some
>>information, that even on multiple reads we do get bit errors and it is a
>>symptom that the block slowly becoming bad after some time.
>>
>
>Hmm. Never seen this. I have some read only paritions which are accessed in 
>stress testing and I never have seen, that a block gets bad due to reading.
>
>
>>But what I feel is, a read-only filesystem like cramfs is not that reliable
>>on NAND flash. We have to detect a bad block early.
>>
>
>Yep, but you can only detect it while writing / erasing.
>
>
Actually when using ECC you *CAN* detect a single bit error.
You could use this information as a trigger to migrate the block
and then mark it bad immediately.

However it better be only one bit that flipped because if more
bits are gone you're screwed.

Regards

Pantelis
