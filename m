Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dbe13-0002iQ-Fe
	for linux-mtd@lists.infradead.org; Fri, 27 May 2005 08:32:42 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Simon Posnjak <simon.posnjak@cetrtapot.si>
In-Reply-To: <200505262205.01979.simon.posnjak@cetrtapot.si>
References: <200505262205.01979.simon.posnjak@cetrtapot.si>
Content-Type: text/plain
Date: Fri, 27 May 2005 14:32:56 +0200
Message-Id: <1117197176.6736.479.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Toshiba NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-05-26 at 22:05 +0200, Simon Posnjak wrote:
> Hi all,
> 
> I am working on board specific driver for our board. While writing hwcontrol 
> function I discoverd that I can set it up to drive CLE, ALE, nCE, WP (not 
> used according to nand.h) signals, but when I checked the timing diagrams in 
> the FLASHes data sheet 
> (http://www.toshiba.com/taec/components/Datasheet/TC58DVM92A1FT_030110.pdf)
> I found that I shoud also drive the RE and WE signals. So am I missing 

Have you considered to read the NAND tech paper and the NAND API
documentation available on http://linux-mtd.infradead.org or even
looking into trhe existing drivers how they deal with those pins before
asking ?

> something or is our FLASH chip (TC58DVM92) not yet supported in NAND MTD?

Not yet ? The chip is so old that it is not longer recommended for new
designs :)

Maybe you consult your hardware engineer and let him explain how RE/WE
signals are driven. 

If the hardware design is not completely bogus, then I expect that those
lines are driven either directly or via some logic by the corresponding
CPU lines. 

If my assumption is wrong, heat up the soldering iron and read the
available documents in meantime!

tglx
