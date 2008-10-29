Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KvDLy-0007wq-Re
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 15:53:03 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KvDLu-0006Ft-Ao
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 15:52:58 +0000
Received: from 194.95.133.35 ([194.95.133.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 15:52:58 +0000
Received: from andre.puschmann by 194.95.133.35 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 15:52:58 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Date: Wed, 29 Oct 2008 16:52:48 +0100
Message-ID: <gea0sh$j97$1@ger.gmane.org>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20081029114256.GA2239@yoda.jdub.homelinux.org>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer schrieb:
>> In my opinion the read 
>> performance is very poor, only around 1.2 to 1.4 MB/s depending on the 
>> blocksize. I think it should be possible to get much higher transfer rates.
> 
> Why do you think that?

I guess there is something wrong with the timing parameters and/or the 
way the CPU core speaks to the flash controller, which results in long 
wait-states.
But at least for my understanding, these transfer rates have nothign to 
do with _high speed NOR flashes_ :-)


> Why do you think that?  The chip drivers don't do DMA, so all I/O goes
> through the CPU.

Yes, DMA is not used. However, the CPU should be strong enough to do 
this transfer faster. On the other hand, my understanding is, DMA brings 
no speed improvements in all cases. It boosts memory transfers without 
adding an extra overhead to the CPU. But in this case, copy data is the 
only task.


Regards,
Andre
