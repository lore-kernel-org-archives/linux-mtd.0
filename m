Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1380kh-0004Kv-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 14:22:39 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 1380kg-0004Kp-00
	for mtd@infradead.org; Fri, 30 Jun 2000 14:22:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <395C9BEC.98AC005A@matrox.com> 
References: <395C9BEC.98AC005A@matrox.com>  <Pine.LNX.4.21.0006292149210.991-100000@imladris.demon.co.uk> 
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
Cc: mtd@infradead.org
Subject: Re: Status of MTD for CFI 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Jun 2000 14:25:50 +0100
Message-ID: <7996.962371550@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


scote1@Matrox.COM said:
> : what is nora.c for (from the name, I guess it's a NOR flash and from
> the code I guess it's CFI but that's all I know)?  

nora.c is misnamed. It's just a 'map' driver for memory chips which are 
mapped directly into the CPU's VM, which is what happens on a lot of ARM 
boards. It's not really CFI-specific at all, except that it happens to call 
the cfi_probe function and none other at the moment.

By changing a couple of defines for the address and size, you can make it
handle memory chips mapped anywhere in VM rather than just where my
particular board happens to have them.


> and what does SBC stand for ? 

Single Board Computer.


scote1@Matrox.COM said:
> I've got an Intel StrataFlash so it's both 16 bits and CFI compliant.
> I quickly checked the files you mentioned and this all seems very
> simple. 

It just got less simple. We now make an attempt to do proper async handling 
of flash chips, and I'm just about to test it. If it works, I'll try to 
build up the courage to shift the erase stuff into a timer, and enable 
suspension of in-progress erases.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
