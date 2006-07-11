Received: from mail.linux-boards.com ([62.90.235.247])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G0FXu-0000mZ-Eg
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 06:32:55 -0400
Message-ID: <44B38C58.7030707@compulab.co.il>
Date: Tue, 11 Jul 2006 13:32:40 +0200
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Wolfgang_M=FCes?= <wolfgang.mues@auerswald.de>
Subject: Re: [PATCH] CM-x2xx NAND flash support
References: <44B36563.9050103@compulab.co.il>
	<200607111010.50355.wolfgang.mues@auerswald.de>
In-Reply-To: <200607111010.50355.wolfgang.mues@auerswald.de>
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

Wolfgang Mües wrote:

>Am Dienstag, 11. Juli 2006 09:48 schrieb Mike Rapoport:
>  
>
>>Thomas Gleixner wrote:
>>    
>>
>>>On Thu, 2006-07-06 at 14:48 +0200, Mike Rapoport wrote:
>>>      
>>>
>>>>This patch provides MTD support for NAND flash devices on CM-x2xx
>>>>modules.
>>>>+#define DRAIN_WB() \
>>>>+       do { \
>>>>+               unsigned char dummy; \
>>>>+               asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
>>>>+               dummy=*((unsigned char*)UNCACHED_ADDR); \
>>>>+       } while(0);
>>>>        
>>>>
>>>stray semicolon ----^
>>>
>>>I bet xscale has this functionality somewhere as a macro / inline already
>>>      
>>>
>>I found none. Even md() on xscale will not drain write buffer.
>>    
>>
>
>dmac_clean_range() from asm/cacheflush.h is what you want.
>  
>
But I don't need cache cleanup. I need to drain WB to make sure GPIO 
level has changed.
Besides, I cannot use dmac_clean_range() if I want the driver as module

>regards
>
>  
>


-- 
Sincerely yours,
Mike Rapoport
