Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DrsxW-0004N7-Tz
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2005 03:44:12 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0IJF00I3DX8FG2@mmp2.samsung.com>
References: <0IJF00I3DX8FG2@mmp2.samsung.com>
Content-Type: text/plain
Date: Mon, 11 Jul 2005 09:47:21 +0200
Message-Id: <1121068041.26713.309.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND MTD support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-07-11 at 10:53 +0900, Kyungmin Park wrote:
> It's derived from omap-nand-flash.c, But it's not sended to MTD.
> OK. I done

I removed the redundant dependencies in drivers/mtd/nand and
drivers/mtd/maps too.

> > 
> > +EXPORT_SYMBOL(onenand_scan);
> > +EXPORT_SYMBOL(onenand_release);
> > 
> > Would you mind to change those exports to EXPORT_SYMBOL_GPL ?
> 
> In fact I not sure and also don't know license issue. 
> If we develop the some commercial mtd user software then can we use mtd
> device code exported with GPL? Is there no problem?

User space software is not concerned of kernel licences.

If you talk about a proprietary closed source kernel module which needs
those exports, you are stepping into a legal grey area regardless of the
exports style. I don't see a point where it makes sense to have a closed
source board driver, as it just initializes a data structure and calls
generic handling code. 


> > Are device_id and version_id necessary for anything else than 
> > scan ? If
> > no, please remove.
> device_id necessary to control DDP chip. But I'm not yet tested with DDP
> chip.

Ok.

Some nitpicks though

+	/* The 10 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(10);
+	while (time_before(jiffies, timeout)) {

On CPU's which have HZ=100 (1 jiffy == 10ms) this might be critical, as
you might set the timeout immidiately before the timer interrupt
happens. Using a 20ms timeout will keep you on the safe side in any case


Please clean up your includes to avoid redundant includes of header
files.

tglx
