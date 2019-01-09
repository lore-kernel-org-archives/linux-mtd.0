Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghM60-0003ND-Lv
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 22:13:10 +0000
Date: Wed, 9 Jan 2019 23:12:59 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Keep bank enable bit set
Message-ID: <20190109231259.1ef5d31a@bbrezillon>
In-Reply-To: <20190109215144.15749-1-linus.walleij@linaro.org>
References: <20190109215144.15749-1-linus.walleij@linaro.org>
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

On Wed,  9 Jan 2019 22:51:44 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> Hammering the "bank enable" (PBKEN) bit on and off between
> every command crashes the Nomadik NHK15 with this message:
> 
> Scanning device for bad blocks
> Unhandled fault: external abort on non-linefetch (0x008) at 0xcc95e000
> pgd = (ptrval)
> [cc95e000] *pgd=0b808811, *pte=40000653, *ppte=40000552
> Internal error: : 8 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.20.0-rc2+ #72
> Hardware name: Nomadik STn8815
> PC is at fsmc_exec_op+0x194/0x204
> (...)
> 
> After a discussion we (me and Boris Brezillion) start to suspect

				      ^ Brezillon :-)

> that this bit does not immediately control the chip select line
> at all, it rather enables access to the bank and the hardware
> will drive the CS autonomously. If there is a NAND chip connected,
> we should keep this enabled.
> 
> As fsmc_nand_setup() sets this bit, we can simply remove the
> offending code.
> 
> Fixes: 550b9fc4e3af ("mtd: rawnand: fsmc: Stop implementing ->select_chip()")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

Would be great if someone could validate our assumption with a scope.
This being said, given the description of the FSMC logic, I have little
doubt that this bit does not directly controls the CE line, otherwise
concurrent accesses to different memories on the same bus wouldn't work
or would require a lot more synchronization than we currently have in
Linux.
