Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLfWv-0007nf-JB
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 10:51:01 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i469uMc28813
	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2004 12:56:22 +0300 (EEST)
Message-ID: <409A07B5.5050004@intracom.gr>
Date: Thu, 06 May 2004 12:39:01 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: Srinivasu.Vaduguri@nokia.com
References: <AEB09EDA2548094C81ED6AA93269F63D01D09323@siebe001.apac.nokia.com>
In-Reply-To: <AEB09EDA2548094C81ED6AA93269F63D01D09323@siebe001.apac.nokia.com>
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

>>But if you have read errors, how can you be sure that you will be able 
>>to read the
>>block and write it somewhere else?
>>
>
>>Maybe you can do something when writting your filesystem image when you 
>>detect
>>a simple bit error you can immediately mark the block bad.
>>
>
>>How many times have you written the block in order for something like 
>>this to occur?
>>
>
>I haven't counted the number of times. But I remember reading some information,
>that even on multiple reads we do get bit errors and it is a symptom that the block
>slowly becoming bad after some time.
>
>
This is most disturbing if true.
Could you please hunt it down and sent me a link?

>>It seems to me that when you have a read only partition the solution is 
>>to be
>>carefull when writting your filesystem image.
>>First you avoid the bad block altogether, and secondly you always bit verify
>>the block. If the verify fails you immediately mark the block as bad and 
>>move on.
>>
>
>>I don't think that nandwrite does it though.
>>
>
>Yes, If verify fails we have to mark it bad. 
>
>But what I feel is, a read-only filesystem like cramfs is not that reliable on NAND flash.
>We have to detect a bad block early.
>
>
If the device slowly degrades when just read it's a major problem IMHO.
We could do borderline block migration before all is lost.

However I don't think that the problem is that bad.

I believe that this behaviour only occurs on heavily written blocks.
When you have a partition that is read-only by definition you're going
to write to it very few times it's very unlikely that you will run into
this problem.

I'm not familiar with JFFS2. What do we do when something like this
happens?

>Please comment if I am not right.
>
I would comment even if you were wrong ;)

>
>regards,
>Srini
>
>
>
>
>
>
>
Regards

Pantelis
