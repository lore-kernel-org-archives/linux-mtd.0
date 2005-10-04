Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMlMn-0007Fj-Ix
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 07:54:19 -0400
Message-ID: <43426D4F.2000400@ru.mvista.com>
Date: Tue, 04 Oct 2005 15:53:51 +0400
From: Vitaly Bordug <vbordug@ru.mvista.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
References: <434130A3.2090908@ru.mvista.com>
	<1128381010.13057.16.camel@tglx.tec.linutronix.de>
In-Reply-To: <1128381010.13057.16.camel@tglx.tec.linutronix.de>
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

Thomas, thanks for reviewing this.
I asked the intern who did this work to clarify some points more preciously.

My comments and understanding of the situation is below.
Thomas Gleixner wrote:
> On Mon, 2005-10-03 at 17:22 +0400, Vitaly Bordug wrote:
> 
>>David,
>>This patch fixes ECC errors by automatic CS assertion in the driver.
>>We still use manual drive of CS only during READ CYCLE and READ OOB
>>CYCLE, while overriding CS right after third address byte latch and
>>finishing override after first data byte read.
>>
>>  From the Nand read page cycle timings (Toshiba Datasheet) 
> 
> 
> Come on. I know those data sheets quite well and there is more than one.
> Which chip type (Manufacturer part Nr) are you using ? 
> 
TC58DVM92A1FT00
> 
>>- we have to
>>keep CS active from third address byte latch to the end of the cycle
> 
> 
> Thats a known issue and the controller has worked with those chips
> before.
> 
Actually, yes, a sort of. The issue was in some bytes lost during read 
cycles (ECC errors reported) when PCMCIA (board AMD Alchemy 1550) is 
active. This does not take place when 4 CS drives  happen - as shown on 
the timing diagram - e.g.
cs: \__/\__/\__/\__/\_<CS low>______ [works fine]
                     ^
	    asserted by SoC controller
unchanged code:
cs:\______________/\_[PCMCIA driver steals bytes ]...
	           ^
	    asserted by SoC controller
> 
>>It seems that static controller drives CS to low after fourth address
>>byte latch - this interrupts the read cycle.
> 
> 
> It seems ? 
> 
> "drives CS to low ?" CS is active low.
> 

> 
>>We must manually keep CS in active state 
> 
> 
> So whats active state: low or high or high-Z ?
> 
The developer of this code will provide detailed description of the 
situation.
> 
>>from third address byte latch
>>to second data byte read, not during all read page cycles. And when we
>>drive CS manualy - we have to disable interrupts to prevent simultaneous
>>CS-s activation (NAND, PCMCIA,NOR CS).
> 
> 
> Oh well. Disable interrupts with cli(). 
> 
> Have your Makefiles a builtin -Wignore ?
>
Heh, how could I miss this crap... Really funny


-- 
Sincerely,
Vitaly
