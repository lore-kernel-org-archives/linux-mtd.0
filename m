Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c3Sl-0006CW-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 13:29:23 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0F009289C4XO@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 06 Aug 2002 14:28:53 +0200 (MEST)
Date: Tue, 06 Aug 2002 14:28:55 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: NAND Configuration
In-reply-to: <001b01c23d33$a254d450$5501a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028636935.19435.73.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <001b01c23d33$a254d450$5501a8c0@synso.com.tw>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 2002-08-06 at 12:25, Steve Tsai wrote:
> I use GPIO to control NCE, ALE and CLE. RE and WE are connected to CS of
> ROM bank 1 and ROM bank 2.
> The test program are work fine to do read/write and it seems work fine
> also when I did not use CONFIG_JFFS2_FS_NAND. Thanks.
> 
> ================================================================
> Change in nand.c for our board.
> =================================================================
> 
> #undef readb
> #undef writeb
> 
> #define readb(a)  (*(volatile unsigned char *)(a))
It's really innovative to reinvent the wheel.
 
> /* Use function call for more delay in write cycle */
> void writeb(unsigned char v, unsigned int a)
> {
> 	*(volatile unsigned char *)(a) = v;
> }
For what do you need more delay ??? NAND is fast enough.
> 
> 
> 	/* Set address of NAND IO lines */
> 	/* 0x2000000 for ROM bank 1, 0x2200000 form ROM bank 2 */
> 	/* Above 0x4000000 is noncachable area
> */
> 	this->IO_ADDR_W = (dnp_fio_base | 0x4000000);
> 	this->IO_ADDR_R = ((dnp_fio_base+0x200000) | 0x4000000);
Is your read address really different to your write address ???
If yes, get a baseball bat and trim the hardware guy. :)
If no, you read and write from/to different address ranges.

> 	/* Set address of hardware control function */
> 	this->hwcontrol = dnp_hwcontrol;
> 	this->dev_ready = NULL;
> 	/* 15 us command delay time */
> 	this->chip_delay = 15;		
Could you try to set chipdelay to a longer value ? 	
-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
