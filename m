Received: from dmzraw4.extranet.thmulti.com ([141.11.234.72])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvSyh-00019N-UD
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 08:34:04 +0000
Received: from [10.11.123.228] (unknown [10.11.123.228])
	by dmzraw4.extranet.thmulti.com (Postfix) with ESMTP id 53D054B42
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Oct 2008 08:34:02 +0000 (GMT)
Message-ID: <49097176.5010506@thomson.net>
Date: Thu, 30 Oct 2008 09:33:58 +0100
From: Arnaud Mouiche <arnaud.mouiche@thomson.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: flash read performance
References: <ge6old$oo3$1@ger.gmane.org>	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org>
In-Reply-To: <gea0sh$j97$1@ger.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was faced with the same wondering in the past : bootloader NOR access 
was really much faster that Linux one.
Yes, no DMA was used (but the same on bootloader, and anyway that 
doesn't impact the data rate, only the CPU load), but even worse, Linux 
code was using memcpy_fromio which a basic byte by byte loop copy in the 
default ARM implementation.

May be your issues are the same...

Regards,
arnaud

Andre Puschmann a écrit :
> Josh Boyer schrieb:
>   
>>> In my opinion the read 
>>> performance is very poor, only around 1.2 to 1.4 MB/s depending on the 
>>> blocksize. I think it should be possible to get much higher transfer rates.
>>>       
>> Why do you think that?
>>     
>
> I guess there is something wrong with the timing parameters and/or the 
> way the CPU core speaks to the flash controller, which results in long 
> wait-states.
> But at least for my understanding, these transfer rates have nothign to 
> do with _high speed NOR flashes_ :-)
>
>
>   
>> Why do you think that?  The chip drivers don't do DMA, so all I/O goes
>> through the CPU.
>>     
>
> Yes, DMA is not used. However, the CPU should be strong enough to do 
> this transfer faster. On the other hand, my understanding is, DMA brings 
> no speed improvements in all cases. It boosts memory transfers without 
> adding an extra overhead to the CPU. But in this case, copy data is the 
> only task.
>
>
> Regards,
> Andre
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>   
