Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNTUd-0003IE-OW
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 05:56:26 -0400
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 10A938940EC
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Oct 2004 19:56:20 +1000 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])by
	mail.magtech.com.au (Postfix) with ESMTP id DF4FF8940CEfor
	<linux-mtd@lists.infradead.org>; Fri, 29 Oct 2004 19:56:19 +1000 (EST)
Message-ID: <418213C3.3050706@magellan-technology.com>
Date: Fri, 29 Oct 2004 19:56:19 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
References: <20041028230640.GB13105@home.fluff.org>
	<4181840D.2020605@magellan-technology.com>
	<1099035223.22387.529.camel@thomas>
In-Reply-To: <1099035223.22387.529.camel@thomas>
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Read/nBusy via interrupt
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Fri, 2004-10-29 at 09:43 +1000, Aras Vaichas wrote:
> 
>>Ben Dooks wrote:
>>
 >>>Does anyone here have any comments over the pros/cons of using
 >>>an interrupt which goes off to wait for a NAND flash ready/not-busy
 >>>signal?
 >>>
 >>
 >>pros of using interrupt:
 >>* faster MTD access (maybe, depends on polling rate) but as a percentage of
 >>total access time it probably doesn't make much difference.
 >
 > For program and erase it makes a lot of difference. The waiting process
 > releases the CPU and gets woken when the job is done. Arguing with
 > percentage of total access time is utter crap here. The poll/yield loop
 > involves unneccecary context switches, which can significantly influence
 > the overall system performance on smaller systems.

"utter crap", is that ISO standard terminology?

I said "faster MTD access". I wasn't talking about efficiency. I was talking 
about the latency between the polling period and the interrupt ... and the 
latency divided by the total access time probably isn't that much as a 
percentage of time "wasted".


>>cons of using interrupt:
>>* more pins used up on CPU
>
> No. Usually R/B is connected anyway.

usually? If the software doesn't need it, then why would you connect it?


>>* more code to write and debug!
> 
> About 20 lines. I'm scared.

No need to be scared. Software engineers don't come for free. development time 
== money.


>>* more interrupts going off in system
> 
> They go only off, when a long lasting operation is in progress

But still more interrupts, I was simply stating the obvious in order to list 
all pros and cons as a complete list.


>>* more pins needed on MTD -> more expensive boards and chips, longer board 
>>design times
> 
> He ? NAND FLASH has a ready/busy pin, which does not produce extra
> costs. What's the longer design time per pin on complex boards ?
> A typical 32bit embedded system CPU board uses alone about 500 pins for
> connecting CPU, SDRAM, power and the on chip peripherals. Do you really
> want to tell me, that 1 more pin will increase board costs and design
> time significantly ?

I never said it would affect it significantly (or did I?). I was simply stating 
the fact that the time does increase. Every pin on a chip costs extra and when 
you are planning on making 10,000+ per year of a product, that price difference 
makes a affects your company's bottom line. If you don't believe me, then take 
a look at the Digikey page for the AT45DB081 and take a long hard look at unit 
price versus pin count.

And yes, routing extra pins does cost more because it takes more time to place 
them. (remember that time == money equation?) Especially if you are trying to 
fit a whole Linux capable system into a small area for a portable, handheld 
product.


>>If you take a look at the 8-CASON part, you'll notice that in order to reduce 
>>pin count, they leave out the ready/nbusy signal because this information can 
>>be obtained by polling. This is really a matter of board space as you can fit 
>>1Megabyte of bootable FLASH into a surface mount 8pin package by leaving out 
>>this pin.
> 
> This is a 1 MByte boot FLASH designed for space constraint devices. You
> need a CPU which can boot from those. 

Doesn't it count as an MTD device? Where did this kernel option come from -> 
"CONFIG_MTD_AT91_DATAFLASH" ??


> We are talking about NAND >= 32MB, which is often used for filesystems.

Ben didn't mention "NAND >= 32MB, which is often used for filesystems", or 
perhaps I read the initial email incorrectly ... hmmm, my bad. The Dataflash 
has a ready/nbusy signal as well. I keep a filesystem on the Dataflash! Am I 
doing something wrong?!? Oh no ... !


>>If you can spare the board space, why not use interrupts? Make it a kernel 
>>option. MTD_EADYNBUSY_INTERRUPT ?
> 
> There's no option neccecary at all. This is board related and has to be
> solved by the board driver anyway. The functionality to do so is already
> there.

Good. That's great!

Thomas, your reply to my email was so ridiculously over the top and harsh. I 
was simply offering an opinion and some information on a useful MTD device from 
the position of someone with hardware experience. Perhaps next time you should 
re-think the tone of your replies and consider the signal-to-noise ratio of 
what you write. I'm sure this forum will be a better place for it.

:)

regards,

Aras
