Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMpq7-0003Sn-Kw
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 12:40:35 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Bordug <vbordug@ru.mvista.com>
In-Reply-To: <43426D4F.2000400@ru.mvista.com>
References: <434130A3.2090908@ru.mvista.com>
	<1128381010.13057.16.camel@tglx.tec.linutronix.de>
	<43426D4F.2000400@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 04 Oct 2005 18:41:42 +0200
Message-Id: <1128444102.13057.46.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD NAND: Fix ECC errors in au1550nd.c
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-10-04 at 15:53 +0400, Vitaly Bordug wrote:
> > 
> Actually, yes, a sort of. The issue was in some bytes lost during read 
> cycles (ECC errors reported) when PCMCIA (board AMD Alchemy 1550) is 
> active. This does not take place when 4 CS drives  happen - as shown on 
> the timing diagram - e.g.
> cs: \__/\__/\__/\__/\_<CS low>______ [works fine]
>                      ^
> 	    asserted by SoC controller
> unchanged code:
> cs:\______________/\_[PCMCIA driver steals bytes ]...
> 	           ^
> 	    asserted by SoC controller

Right. Thats a known problem with those FLASH types. You have to hold CS
low until the busy pin goes high.

Hmm, you have to protect against interrupts during this time I guess ?
If not you can use the existing controller lock implementation to
protect against concurrent access.

tglx
