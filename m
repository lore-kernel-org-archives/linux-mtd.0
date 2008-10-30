Received: from ns2.thmulti.com ([141.11.234.72]
	helo=dmzraw4.extranet.thmulti.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvUQ0-0001Vc-DC
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 10:06:20 +0000
Message-ID: <49098716.1010404@thomson.net>
Date: Thu, 30 Oct 2008 11:06:14 +0100
From: Arnaud Mouiche <arnaud.mouiche@thomson.net>
MIME-Version: 1.0
To: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
References: <ge6old$oo3$1@ger.gmane.org>	<20081029114256.GA2239@yoda.jdub.homelinux.org>	<gea0sh$j97$1@ger.gmane.org>	<49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org>
In-Reply-To: <gec051$efd$1@ger.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was using redboot, configured to use the optimized memcpy (yes, it 
gives the choice at configuration time)
on kernel side, I just hack memcpy_fromio to add a "weak" attribute, and 
rewrite it to directly use the linux optimized memcpy (shame on me for 
this "not suggested" methode, but speed was my goal)

after that, performances are equal between bootloader and linux, and 
really near the one reached by a DMA access, which is also the 
performances we can calculate from FLASH time access configuration.

arnaud

Andre Puschmann a écrit :
> Hi,
>
>   
>> I was faced with the same wondering in the past : bootloader NOR access 
>> was really much faster that Linux one.
>>     
>
> About how much faster? It really depends on the access method. I am
> using u-boot and if I use the basic cp.b routine its about the same
> _slow_ speed. I tried to use the asm-optimised memcpy routine that the 
> kernel has. This is much faster, around 5MB/s.
>
>   
>> Yes, no DMA was used (but the same on bootloader, and anyway that 
>> doesn't impact the data rate, only the CPU load), but even worse, Linux 
>> code was using memcpy_fromio which a basic byte by byte loop copy in the 
>> default ARM implementation.
>>     
>
> Yes, memcpy_fromio is quite slow. But using normal memcpy is not 
> suggested, only use writel()/readl() and memcpy_[from|to]io().
>
> I am not sure about the right _fast_ way to to such copies.
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
