Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNJvI-0001Ng-Qw
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2004 19:43:18 -0400
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 4B5F18940F8
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Oct 2004 09:43:10 +1000 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])by
	mail.magtech.com.au (Postfix) with ESMTP id 325558940ECfor
	<linux-mtd@lists.infradead.org>; Fri, 29 Oct 2004 09:43:10 +1000 (EST)
Message-ID: <4181840D.2020605@magellan-technology.com>
Date: Fri, 29 Oct 2004 09:43:09 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
References: <20041028230640.GB13105@home.fluff.org>
In-Reply-To: <20041028230640.GB13105@home.fluff.org>
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

Ben Dooks wrote:
> Does anyone here have any comments over the pros/cons of using
> an interrupt which goes off to wait for a NAND flash ready/not-busy
> signal?
> 

pros of using interrupt:
* faster MTD access (maybe, depends on polling rate) but as a percentage of 
total access time it probably doesn't make much difference.
* less cpu overhead

cons of using interrupt:
* more pins used up on CPU
* more code to write and debug!
* more interrupts going off in system
* more pins needed on MTD -> more expensive boards and chips, longer board 
design times

I'll give you an example from a hardware point of view by way of the Atmel 
Dataflash AT45DB081B.

http://rocky.digikey.com/WebLib/Atmel/Web%20Data/AT45DB081B.pdf
http://www.atmel.com/dyn/products/product_card.asp?family_id=616&family_name=DataFlash%26reg%3B&part_id=2470

The Atmel Dataflash is bootable by the AT91RM9200, and is actually a NOR part 
made to look like a serial NAND.

If you take a look at the 8-CASON part, you'll notice that in order to reduce 
pin count, they leave out the ready/nbusy signal because this information can 
be obtained by polling. This is really a matter of board space as you can fit 
1Megabyte of bootable FLASH into a surface mount 8pin package by leaving out 
this pin.

If you wanted to improve performance, you would simply find out how long the 
MTD usually stays busy for and only resume polling after that time.

If you can spare the board space, why not use interrupts? Make it a kernel 
option. MTD_EADYNBUSY_INTERRUPT ?


Aras Vaichas
