Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBZJC-0003Py-S2
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 14:11:06 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])i38CMrj9019883
	for <linux-mtd@lists.infradead.org>; Thu, 8 Apr 2004 14:22:53 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id PAA29660
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Apr 2004 15:10:56 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <40754F47.9060404@imc-berlin.de>
Date: Thu, 08 Apr 2004 15:10:31 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: MTD <linux-mtd@lists.infradead.org>
References: <407547DF.1020404@imc-berlin.de> <40754B83.3020000@imc-berlin.de>
	<200404081458.56018.tglx@linutronix.de>
In-Reply-To: <200404081458.56018.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Changing the number of JFFS2 erasblocks?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>>>Could I hardcode the number of eraseblocks to 1 in my new (but still old
>>>2.4.20) kernel? Where is it defined?
>>>And what happens to my root fs which is JFFS2 when I change that?
>>
>>Is it enough and ok to just change the
>>
>>/* Number of free blocks there must be before we... */
>>#define JFFS2_RESERVED_BLOCKS_BASE 3
> 
> You can do this, but it will break and it will break your root jffs2 too, as 
> there is no way to have this per partition...
:-(

> 320K is not really useful for a filesystem IMHO. 
> What do you want to do with it ?

We need some place to store a few configuration files (ca. 50KB compressed 
each) for our application. These 320KB are unused so I thought we could use 
it for this dedicated purpose instead of wasting space (and poluting) on our 
root fs...

Steven
