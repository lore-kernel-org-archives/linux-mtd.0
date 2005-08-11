Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3Fs2-0000Xh-1W
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 12:25:32 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <42FB6DCE.7050307@ru.mvista.com>
References: <42FB5E72.2010402@ru.mvista.com>
	<1123772959.23647.24.camel@tglx.tec.linutronix.de>
	<42FB6DCE.7050307@ru.mvista.com>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 16:25:18 +0000
Message-Id: <1123777518.23647.42.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 19:25 +0400, Vitaly Wool wrote:
> >I have no idea whats the state of those PM functions and why ARM is not
> >using them.
> Well, they are not at all widely used, only one MIPS board and x86 APM 
> code use them.

Well, those functions are marked deprecated. The device model is the
right way to do it. the SA1100 driver got it right apparently.

> >It's discussable, whether suspend is supposed to fail, when a flash
> >operation is in progress or just waits until the operation is finished,
> >which is usually only a matter of a couple of ms.
> >
> What if introduce an additional parameter ('nowait')?

If its necessary and worth the work :)

> I'd prefer probably to use platform_device and device_driver structures 
> and put suspend/resume functions into device_driver. Those functions 
> will first call mtd->suspend/mtd->resume and then shut down/re-enable 
> the clocks.
> (that's more or less how it's done in drivers/mtd/maps/sa1100-flash.c)
> mtd->suspend and mtd->resume need to be implemented in nand_base then.
> Does that sound reasonable?

Sounds like a plan.

tglx
