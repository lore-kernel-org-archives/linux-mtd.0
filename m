Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBcfH-0004hH-Bh
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 17:46:07 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])i38Fvsj9021312
	for <linux-mtd@lists.infradead.org>; Thu, 8 Apr 2004 17:57:54 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id SAA02105
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Apr 2004 18:45:56 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <407581AC.9090607@imc-berlin.de>
Date: Thu, 08 Apr 2004 18:45:32 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: MTD <linux-mtd@lists.infradead.org>
References: <407547DF.1020404@imc-berlin.de>
	<200404081458.56018.tglx@linutronix.de> <40754F47.9060404@imc-berlin.de>
	<200404081519.57712.tglx@linutronix.de>
In-Reply-To: <200404081519.57712.tglx@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
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

> On Thursday 08 April 2004 15:10, Steven Scholz wrote:
> 
>>We need some place to store a few configuration files (ca. 50KB compressed
>>each) for our application. These 320KB are unused so I thought we could use
>>it for this dedicated purpose instead of wasting space (and poluting) on
>>our root fs...
>>
> 
> Is this data which changes a lot ? Do you really need a r/w filesystem ?

I assumed we'll store up to 5 files. And change them at maximum once 
everyday. But this might be worst case. Maybe we (our costumers) change them 
once a week...

I think I need a r/w filesystem because we need easy random access. CRAMFS 
or ramdisk is no option.

-- 
Steven Scholz

imc Measurement & Control               imc Meﬂsysteme GmbH
Voltastr. 5                             Voltastr. 5
13355 Berlin                            13355 Berlin
Germany                                 Deutschland
