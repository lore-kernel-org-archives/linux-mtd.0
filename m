Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLdNw-0007A5-4X
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 08:33:38 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i467cWc00963
	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2004 10:38:32 +0300 (EEST)
Message-ID: <4099E739.4070803@intracom.gr>
Date: Thu, 06 May 2004 10:20:25 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: Srinivasu.Vaduguri@nokia.com
References: <AEB09EDA2548094C81ED6AA93269F63D01D09322@siebe001.apac.nokia.com>
In-Reply-To: <AEB09EDA2548094C81ED6AA93269F63D01D09322@siebe001.apac.nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: dwmw2@infradead.org
cc: tglx@linutronix.de
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

Srinivasu.Vaduguri@nokia.com wrote:

>>It's pretty reasonable assumption that bad blocks are created only when
>>writting to NAND. So in the read-only case it is possible to skip over 
>>the bad
>>blocks and offer a bad-block free block device to the upper layers.
>>This allows us to utilize any filesystem when  read-only.
>>    
>>
>
>I had seen in the past that there can be bit errors (more than one bit) when we do 
>multiple reads (probably many) on the same block. So we will read corrupted data from NAND flash and we will not be able to decompress the data when using the CRAMFS. If we erase the block and rewrite the data, it works fine. This is my experience with a samsung NAND flash. 
>
>So using this above logic how will we detect if there are more than one bit errors while reading. Can we afford to rewrite the cramfs image again onto the NAND flash ?
>
>Please tell me if I got this problem because of any obvious mistake.
>
>
Hmm, that's the first time I've heard about this problem.

But if you have read errors, how can you be sure that you will be able 
to read the
block and write it somewhere else?

Maybe you can do something when writting your filesystem image when you 
detect
a simple bit error you can immediately mark the block bad.

How many times have you written the block in order for something like 
this to occur?

It seems to me that when you have a read only partition the solution is 
to be
carefull when writting your filesystem image.
First you avoid the bad block altogether, and secondly you always bit verify
the block. If the verify fails you immediately mark the block as bad and 
move
on.

I don't think that nandwrite does it though.

>regards,
>Srini
>
>
>
>
>
>
Regards

Pantelis
