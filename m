Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKCnT-0001uA-8C
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 05:30:20 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: marcus@mikolaiczyk.de
In-Reply-To: <E1CKCCZ-0005xf-00@www.strato-webmail.de>
References: <E1CKCCZ-0005xf-00@www.strato-webmail.de>
Content-Type: text/plain
Message-Id: <1098264118.12223.1468.camel@thomas>
Mime-Version: 1.0
Date: Wed, 20 Oct 2004 11:21:58 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 16Bit Bus with 8 Bit NAND?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-20 at 10:52, marcus@mikolaiczyk.de wrote:
> Hi everybody,
> I'm new to the embedded technologie and have a question concerning a setup
> that uses the Infineon TC1130 (Microcontroller) together with NAND Flash.
> 
> The situation is that the TC1130 has an 16Bit EBU (External Bus Unit) to
> connect to Flash, Disc On Chip, etc. devices. We disscuss the usage of 8
> bit NAND Flash and realy don't have a clue if it's a problem that the bus
> reads 16 Bit from an 8 Bit NAND.
> The question is, what setup should be used to get this with Linux
> working.
> 1. Does the Kernel (theh NAND Driver) automatically detect this and
> 'ignores' the 'empty 8 bit?

It might work, but it's not a big deal to fix it.

> 2. Or is it somehow configruable in the Driver befor comilation?

When it's fixed, it will be a option from the baord driver

> 3. Or should we use 2 8bit NAND so that we've got 16bit - and is this
> supported in  the NAND Driver?

The 2 parallel 8bit NAND is not supported yet. Is a bit of work though.

But why don't you use 16bit NAND ? 

tglx
