Received: from mail.linux-boards.com ([62.90.235.247])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G0Cwu-00075q-4f
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 03:46:40 -0400
Message-ID: <44B36563.9050103@compulab.co.il>
Date: Tue, 11 Jul 2006 10:46:27 +0200
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] CM-x2xx NAND flash support
References: <44AD06B5.7060708@compulab.co.il>
	<1152437179.24611.376.camel@localhost.localdomain>
In-Reply-To: <1152437179.24611.376.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Thu, 2006-07-06 at 14:48 +0200, Mike Rapoport wrote:
>  
>
>>This patch provides MTD support for NAND flash devices on CM-x2xx modules.
>>
>>Signed-off-by: Mike Rapoport <mike@compulab.co.il>
>>    
>>
>
>  
>
>  
>
>>+#define DRAIN_WB() \
>>+       do { \
>>+               unsigned char dummy; \
>>+               asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
>>+               dummy=*((unsigned char*)UNCACHED_ADDR); \
>>+       } while(0);
>>    
>>
>
>stray semicolon ----^
>
>I bet xscale has this functionality somewhere as a macro / inline already
>  
>
I found none. Even md() on xscale will not drain write buffer.

>  
>
>>+       unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;
>>    
>>
>
>what the hell is this type cast for ?
>
>	void __iomem *nandaddr = 
>  
>
you can't do |= and &= with void __iomem*

>Can you please combine both drivers into one and make it a platform
>device. There is no need to keep lots of duplicate functionality around.
>
>  
>
I'm dropping cm-x255 support (management decision) so there's only one 
platform that can use this driver. What's the point then?

>	tglx
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>  
>

-- 
Sincerely yours,
Mike Rapoport
