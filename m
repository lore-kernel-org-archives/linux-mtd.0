Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMZQe-0006GP-Dg
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 19:09:23 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Bordug <vbordug@ru.mvista.com>
In-Reply-To: <434130A3.2090908@ru.mvista.com>
References: <434130A3.2090908@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 04 Oct 2005 01:10:10 +0200
Message-Id: <1128381010.13057.16.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
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

On Mon, 2005-10-03 at 17:22 +0400, Vitaly Bordug wrote:
> David,
> This patch fixes ECC errors by automatic CS assertion in the driver.
> We still use manual drive of CS only during READ CYCLE and READ OOB
> CYCLE, while overriding CS right after third address byte latch and
> finishing override after first data byte read.
> 
>   From the Nand read page cycle timings (Toshiba Datasheet) 

Come on. I know those data sheets quite well and there is more than one.
Which chip type (Manufacturer part Nr) are you using ? 

> - we have to
> keep CS active from third address byte latch to the end of the cycle

Thats a known issue and the controller has worked with those chips
before.

> It seems that static controller drives CS to low after fourth address
> byte latch - this interrupts the read cycle.

It seems ? 

"drives CS to low ?" CS is active low.

> We must manually keep CS in active state 

So whats active state: low or high or high-Z ?

> from third address byte latch
> to second data byte read, not during all read page cycles. And when we
> drive CS manualy - we have to disable interrupts to prevent simultaneous
> CS-s activation (NAND, PCMCIA,NOR CS).

Oh well. Disable interrupts with cli(). 

Have your Makefiles a builtin -Wignore ?

tglx
