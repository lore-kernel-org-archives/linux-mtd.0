Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghLiw-00021p-GA
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 21:49:20 +0000
Date: Wed, 9 Jan 2019 22:49:08 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Keep CE enabled fix mb() drain
Message-ID: <20190109224908.2daf7420@bbrezillon>
In-Reply-To: <20190109222125.73171ae9@bbrezillon>
References: <20190109205530.5158-1-linus.walleij@linaro.org>
 <20190109222125.73171ae9@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 9 Jan 2019 22:21:25 +0100
Boris Brezillon <bbrezillon@kernel.org> wrote:

> On Wed,  9 Jan 2019 21:55:30 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > Hammering the chip enable on and off between every command
> > crashes the Nomadik NHK15 with this message:
> > 
> > Scanning device for bad blocks
> > Unhandled fault: external abort on non-linefetch (0x008) at 0xcc95e000
> > pgd = (ptrval)
> > [cc95e000] *pgd=0b808811, *pte=40000653, *ppte=40000552
> > Internal error: : 8 [#1] PREEMPT ARM
> > Modules linked in:
> > CPU: 0 PID: 1 Comm: swapper Not tainted 4.20.0-rc2+ #72
> > Hardware name: Nomadik STn8815
> > PC is at fsmc_exec_op+0x194/0x204
> > (...)
> > 
> > This patch keeps the CE (chip enable, the only chip select)
> > signal from the FSMC block enabled from the first command
> > after probe() or resume() until the driver either suspend()
> > or remove(). Create a state variable to track this.  
> 
> I just read the Spear600 reference manual, and I'm not sure the
> BANK_ENABLE bit controls the CE line. My understanding is that it just
> marks the bank as active and CE line is asserted when you actually
> access the AHB mem bank range (probably after making sure the FSMC bus
> is idle).

My bad, I was looking at the CTRL reg, not CTRL_PC.
