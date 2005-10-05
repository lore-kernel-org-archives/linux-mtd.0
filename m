Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENByf-0003gL-8A
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 12:18:59 -0400
Message-ID: <4343FCE3.8090307@ru.mvista.com>
Date: Wed, 05 Oct 2005 20:18:43 +0400
From: Vitaly Bordug <vbordug@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <434130A3.2090908@ru.mvista.com>	
	<1128381010.13057.16.camel@tglx.tec.linutronix.de>	
	<43426D4F.2000400@ru.mvista.com>
	<1128444102.13057.46.camel@tglx.tec.linutronix.de>
In-Reply-To: <1128444102.13057.46.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD NAND: Fix ECC errors in au1550nd.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Tue, 2005-10-04 at 15:53 +0400, Vitaly Bordug wrote:
> 
>>Actually, yes, a sort of. The issue was in some bytes lost during read 
>>cycles (ECC errors reported) when PCMCIA (board AMD Alchemy 1550) is 
>>active. This does not take place when 4 CS drives  happen - as shown on 
>>the timing diagram - e.g.
>>cs: \__/\__/\__/\__/\_<CS low>______ [works fine]
>>                     ^
>>	    asserted by SoC controller
>>unchanged code:
>>cs:\______________/\_[PCMCIA driver steals bytes ]...
>>	           ^
>>	    asserted by SoC controller
> 
> 
> Right. Thats a known problem with those FLASH types. You have to hold CS
> low until the busy pin goes high.
> 
> Hmm, you have to protect against interrupts during this time I guess ?
> If not you can use the existing controller lock implementation to
> protect against concurrent access.
> 
Yes. That's because making a global locking mechanism across 3 different 
divers looks more ugly than just local_irq_save() for a short period in 
one callback.

Is this acceptable or we need to do it other way?
> tglx
> 
> 
> 
> 
> 
> 


-- 
Sincerely,
Vitaly
