Received: from s87.loopia.se ([194.9.95.115])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NukmO-0005lh-LD
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2010 10:59:16 +0000
Received: from s42.loopia.se (s34.loopia.se [194.9.94.70])
	by s87.loopia.se (Postfix) with ESMTP id 3E287376842
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Mar 2010 11:57:17 +0100 (CET)
Received: from 212-162-171-110.skbbip.com (HELO [172.16.1.206])
	(leo.barnes@algotrim.com@[212.162.171.110])
	(envelope-sender <leo.barnes@algotrim.com>)
	by s42.loopia.se (qmail-ldap-1.03) with AES256-SHA encrypted SMTP
	for <linux-mtd@lists.infradead.org>; 25 Mar 2010 10:57:13 -0000
Message-ID: <4BAB4186.5080805@algotrim.com>
Date: Thu, 25 Mar 2010 11:57:10 +0100
From: Leo Barnes <leo.barnes@algotrim.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Enabling D-cache for OneNAND bufferram
References: <4BAA11DF.3060306@algotrim.com>
	<OF34D80617.67587BAB-ONC12576F0.00554519-C12576F0.005583EF@transmode.se>
In-Reply-To: <OF34D80617.67587BAB-ONC12576F0.00554519-C12576F0.005583EF@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
>> Hello!
>>
>> I am currently writing a piece of software that takes advantage of the
>> fact that OneNAND supports read-while-loading. What I am doing is trying
>> to achieve higher efficiency when decoding data from the OneNAND by
>> decoding data that is available in the OneNAND bufferram directly
>> instead of copying it to normal RAM and decoding there. So far, I have
>> gotten quite poor results due to the fact that the bufferrams are not
>> cached (for good reason since it is Device memory). My software will be
>> used on ARM devices of different types, with my testrigs being a Nokia
>> N810 and a N900.
>>
>> I have exclusive access to the OneNAND chip, and as such know exactly
>> what information is stored in the bufferrams at all times. If I could
>> only enable the D-cache for the bufferrams, I could therefore make sure
>> to invalidate the cache whenever I reprogram the OneNAND chip.
>>
>>  From what I have read so far, it seems that the only way to enable
>> cacheing of the bufferrams would be to somehow change how the memory
>> attributes for the memory region in the MMU. I have however not found
>> any easy way of doing this. Any tips? I dont really have very much
>> experience when it comes to how the MMU works.
>>     
>
> Have a look at ioremap_cached(). Seems to be availabe on ARM
> Basically you need to create a second virtual address mapping of the devices
> RAM which is cached.
>
>     Jocke
>
>   
Thanks for the suggestion, but I am having some trouble getting it to 
work. This is how I tried to use ioremap_cached, along with the problems 
I got:

Given a pointer to the first byte in the bufferram, I did:
unsigned long int phys_addr = virt_to_phys(bufaddr);
void *rmap = ioremap_cached(phys_addr, 2048);
/* Read from rmap */
iounmap(rmap);

This would not compile however since L_PTE_CACHEABLE was not defined. 
After scanning through the kernel source, I found that L_PTE_CACHEABLE 
was usually defined as (1 << 3) for arm. With this defined, 
ioremap_cached returned a new virtual address, but gave a segmentation 
fault along with "Unhandled fault: external abort on non-linefetch 
(0x008) at 0xc8accc00" in /proc/kmsg when trying to do a read. Am I 
using ioremap correctly? Does ioremap change the old mapping, or simply 
add a second one? If it creates a second one without changing the first, 
this is illegal on ARM IIRC since two mappings cannot have differing 
memory attributes...

Any other ideas?

Best regards,
//Leo
