Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLjPK-0004a5-Oz
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 11:08:34 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWH004R7JHU53B0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 11:08:19 -0500 (EST)
Date: Tue, 21 Mar 2006 11:08:18 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1142926529.5443f100tomas2003@home.se>
To: Tomas E <tomas2003@home.se>
Message-id: <Pine.LNX.4.64.0603211056190.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1142926529.5443f100tomas2003@home.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 Mar 2006, Tomas E wrote:

> Hi,
> 
> >> Nicolas Pitre <nico@cam.org> skrev den Mon, 20 Mar 2006 11:08:19 -0500 (EST):
> >> Hi,
> >> 
> >> > On Mon, 20 Mar 2006, Tomas E wrote:
> >> > 
> >> > > Hi,
> >> > > 
> >> > > I have a problem with writing to a Intel Strata flash
> >> > > and then doing a warm reset.
> >> > 
> >> > How do you "warm reset" ?
> >> 
> >> I use the at91rm9200 built in watchdog on a custom board, which is very
> >> convient but there is no external pin from the watchdog to make the
> >> a reset of the flash.
> >
> >You mean from include/asm-arm/arch-at91rm9200/system.h:
> >
> >static inline void arch_reset(char mode)
> >{
> >        /*
> >         * Perform a hardware reset with the use of the Watchdog timer.
> >         */
> >        at91_sys_write(AT91_ST_WDMR, AT91_ST_RSTEN | AT91_ST_EXTEN | 1);
> >        at91_sys_write(AT91_ST_CR, AT91_ST_WDRST);
> >}
> 
> Sorry if my explaination was poor but no. I run my test case
> which is to kill the watchdog deamon which will cause the watchdog
> to expire. I checked that this code will never be executed in my case.

The only answer I have for you then is to not rely on the watchdog at 
all since it cannot guarantee a reliable system recovery anyway.  Use it 
only if you have read-only flash.

Or, if you don't have to write to flash for the normal operation of your 
system except for some unfrequent occasions, then a simple workaround is 
simply to perform a small read of the MTD device right after the write 
has completed which will return the flash to data mode.

> The built in hardware watchdog on the at91rm9200 performs a cold reset 
> on all on chip periphials but does nothing on the external.

Otherwise, if the watchdog doesn't assert a reset line to which the 
flash is connected then it is not fulfilling its purpose and you shoud 
simply not use it at all.  The only exception is for the system reboot 
case where it is expected to fire only after things have been prepared 
for a clean reboot.


Nicolas
