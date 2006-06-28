Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvUG7-0003M2-Li
	for linux-mtd@lists.infradead.org; Wed, 28 Jun 2006 08:14:48 +0100
Subject: Re: [2.6 patch] drivers/mtd/devices/: remove dead _ecc code
From: Thomas Gleixner <tglx@linutronix.de>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060627131116.GL23314@stusta.de>
References: <20060621215840.GP9111@stusta.de>
	<1150928664.25491.34.camel@localhost.localdomain>
	<20060627131116.GL23314@stusta.de>
Content-Type: text/plain
Date: Wed, 28 Jun 2006 09:16:25 +0200
Message-Id: <1151478985.25491.489.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-27 at 15:11 +0200, Adrian Bunk wrote:
> nand_ecc isn't dead code.
> 
> But if I do understand correctly, you have pending patches to let the 
> code your patch made dead code and my patch would have removed be used 
> again?

Ooops, sorry for shooting too fast. You're right I rendered that stuff
dead unintentionally. But removing is not an option. I fix it proper

Thanks

	tglx
