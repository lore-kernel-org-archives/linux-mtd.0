Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1COPeB-00008S-7f
	for linux-mtd@lists.infradead.org; Sun, 31 Oct 2004 19:02:11 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 8F4E78940F2
	for <linux-mtd@lists.infradead.org>;
	Mon,  1 Nov 2004 11:02:00 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])by
	mail.magtech.com.au (Postfix) with ESMTP id 7BC2F8940CBfor
	<linux-mtd@lists.infradead.org>; Mon,  1 Nov 2004 11:02:00 +1100 (EST)
Message-ID: <41857CF7.3050402@magellan-technology.com>
Date: Mon, 01 Nov 2004 11:01:59 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
References: <20041028230640.GB13105@home.fluff.org>
	<4181840D.2020605@magellan-technology.com>
	<1099035223.22387.529.camel@thomas>
	<418213C3.3050706@magellan-technology.com>
	<1099044978.22387.557.camel@thomas>
In-Reply-To: <1099044978.22387.557.camel@thomas>
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

> 
>>Thomas, your reply to my email was so ridiculously over the top and harsh. 
> 
> Sorry, It was not my intention to offend you. 

No problem, it's good that we can all get flared up now again. It shows that we 
are passionate about what we do. In the end, it is just a job and it pays the 
bills. So no need to get so serious about it, there's so much more to life than 
being angry geeks! ;)


jasmine@linuxgrrls.org wrote:
 > Because hardware engineers usually design the hardware to be as flexible
 > as possible, in light of the fact that they don't know how the operating
 > system is going to want to use the hardware.

If this is the case, then the system isn't properly specified, and software 
needs to talk to hardware a little more.

On last Friday, the guy responsible for our hardware had to finish routing our 
PCB. We are replacing an ATmega128 (8bit) with the AT91RM9200 (32bit) in the 
*same* space (plus adding SDRAM, FLASH, Dataflash, ethernet and USB!). There 
came a point where he could route no more connections because there just wasn't 
enough room left - plus the law-of-diminishing-returns was beginning to apply. 
Therefore, he needed to know which signals were absolutely necessary for a 
fully functional design (according to the system spec.) So I had tell him that 
he could use the smaller MTD (without READY/nBUSY) and that it would still work 
with the existing software.


jasmine@linuxgrrls.org wrote:
 > So, connect the damned wire and shut up.

ROFL! So, in a word, "no", because there was no pin for the wire to be 
connected to!

It looks like we have thoroughly answered Ben's original question from various 
passionate points of view.

regards,

Aras
