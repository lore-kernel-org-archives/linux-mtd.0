Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kx0LQ-0000Yi-Ut
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 14:23:53 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kx0LN-00044J-Ux
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 14:23:49 +0000
Received: from 194.95.133.35 ([194.95.133.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2008 14:23:49 +0000
Received: from andre.puschmann by 194.95.133.35 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2008 14:23:49 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Date: Mon, 03 Nov 2008 15:23:41 +0100
Message-ID: <490F096D.5060208@imms.de>
References: <ge6old$oo3$1@ger.gmane.org>	<20081029114256.GA2239@yoda.jdub.homelinux.org>	<gea0sh$j97$1@ger.gmane.org>	<49097176.5010506@thomson.net>	<gec051$efd$1@ger.gmane.org>
	<49098716.1010404@thomson.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <49098716.1010404@thomson.net>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I spent some more time on this issue and investigated some mtd-maps
drivers.
The kernel I am using is a 2.6.21 that comes out of the gumstix 
svn-repo. Unfortunately, it uses a legacy driver which only does a
ioremap() but no ioremap_nocache(). Patching the driver with this
additional call boosts up transfers up to around 5.5MB/s, which
is a fairly improvement.
I will send a patch to the gumstix list. Users of newer kernel might
not need this, as they use a newer driver (pxa2xx-flash.c) anyway.

But I am wondering if things still can go faster?!
Jamie, do you some information about the speed I can expect 
theoretically? Or do I have to switch over to another operation
mode (i.e. async) for higher speeds?

Thanks in advance.

Best regards,
Andre



Arnaud Mouiche schrieb:
> I was using redboot, configured to use the optimized memcpy (yes, it 
> gives the choice at configuration time)
> on kernel side, I just hack memcpy_fromio to add a "weak" attribute, and 
> rewrite it to directly use the linux optimized memcpy (shame on me for 
> this "not suggested" methode, but speed was my goal)
> 
> after that, performances are equal between bootloader and linux, and 
> really near the one reached by a DMA access, which is also the 
> performances we can calculate from FLASH time access configuration.
> 
> arnaud
> 
> Andre Puschmann a écrit :
>> Hi,
>>
>>   
>>> I was faced with the same wondering in the past : bootloader NOR access 
>>> was really much faster that Linux one.
>>>     
>> About how much faster? It really depends on the access method. I am
>> using u-boot and if I use the basic cp.b routine its about the same
>> _slow_ speed. I tried to use the asm-optimised memcpy routine that the 
>> kernel has. This is much faster, around 5MB/s.
>>
>>   
>>> Yes, no DMA was used (but the same on bootloader, and anyway that 
>>> doesn't impact the data rate, only the CPU load), but even worse, Linux 
>>> code was using memcpy_fromio which a basic byte by byte loop copy in the 
>>> default ARM implementation.
>>>     
>> Yes, memcpy_fromio is quite slow. But using normal memcpy is not 
>> suggested, only use writel()/readl() and memcpy_[from|to]io().
>>
>> I am not sure about the right _fast_ way to to such copies.
>>
>>
>> Regards,
>> Andre
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>   
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
