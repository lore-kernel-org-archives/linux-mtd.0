Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dRol-0003il-00
	for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2002 09:41:51 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0M00G99DGWZE@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 10 Aug 2002 10:41:20 +0200 (MEST)
Date: Sat, 10 Aug 2002 10:41:14 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: NAND Configuration
In-reply-to: <000a01c24043$3a331d10$80d1a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028968874.9586.69.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <000a01c24043$3a331d10$80d1a8c0@synso.com.tw>
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

On Sat, 2002-08-10 at 09:54, Steve Tsai wrote:
> That's the fault of our board. We can not adujst a proper chip_delay, so
> we add a circuit to check the ready bit and it does not have these
> errors so far. Do you think chip_delay can be used with NAND flash? I
> don't think it is good idea to use chip_delay.
> 
I'm pretty sure, that chip_delay is working. 

Cite from data sheet:
'..Page Read... by writing 00h to the command register along with three
address cycles. ...
The 528 bytes of data within the selected page are transferred to the
data registers in _LESS_ than 10us(tR). The system controller _CAN_
detect the completion of this data transfer(tR) by analyzing the output
of R/B pin. Once the data in a page is loaded into the registers, they
may be read out by sequential RE pulse of 70ns/50n(K9F2808Q0B:70ns,
K9F2808U0B:50ns) period cycle. High to low transitions of the RE clock
take out the data from the selected column address up to the last column
address. '

As tR is defined as a max value of x ms, it's safe to use it. I tested
this, when we started the work on JFFS2/NAND. I could verify with the
scope, that R/B high transition was always within the specified time. 

For program and erase we use a different scheme. If we have no access to
the R/B pin, we read back the Status Register. Bit 6 is a mirror of R/B
pin.


If increasing of chip_delay has no effect on your device, could you
verify all the other timing constraints ? AS you use chipselects for WE
and RE, are you sure that data hold time (tdh) is guaranteed ? Usually
tdh on a CPU is specified from the rising egde of WE, which is earlier
than the rising egde of a CS.

Have you ever tried to set chip_delay to 1 ? Then you should get a bunch
of errors.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
