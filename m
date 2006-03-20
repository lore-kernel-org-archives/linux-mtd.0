Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLSyp-0005Go-VA
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 17:36:10 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTPA id <0IWG00IBP6RJ9930@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 17:36:03 -0500 (EST)
Date: Mon, 20 Mar 2006 17:35:43 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <ops6qfl6emoeqxpi@privat.utfors.se>
To: Tomas <Tomas2003@home.se>
Message-id: <Pine.LNX.4.64.0603201735160.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <1142865089.c65a3380tomas2003@home.se>
	<Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
	<ops6qfl6emoeqxpi@privat.utfors.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 20 Mar 2006, Tomas wrote:

> Nicolas Pitre <nico@cam.org> skrev den Mon, 20 Mar 2006 11:08:19 -0500 (EST):
> Hi,
> 
> > On Mon, 20 Mar 2006, Tomas E wrote:
> > 
> > > Hi,
> > > 
> > > I have a problem with writing to a Intel Strata flash
> > > and then doing a warm reset.
> > 
> > How do you "warm reset" ?
> 
> I use the at91rm9200 built in watchdog on a custom board, which is very
> convient but there is no external pin from the watchdog to make the
> a reset of the flash.

You mean from include/asm-arm/arch-at91rm9200/system.h:

static inline void arch_reset(char mode)
{
        /*
         * Perform a hardware reset with the use of the Watchdog timer.
         */
        at91_sys_write(AT91_ST_WDMR, AT91_ST_RSTEN | AT91_ST_EXTEN | 1);
        at91_sys_write(AT91_ST_CR, AT91_ST_WDRST);
}

then it is usually called from machine_restart() in 
arch/arm/kernel/process.c...

which is called from kernel_restart() in kernel/sys.c...

But kernel_restart() has called kernel_restart_prepare() which calls 
notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd)...
 
And incidentally one of those reboot notifiers is cfi_intelext_reboot() 
in drivers/mtd/chips/cfi_cmdset_0001.c which calls cfi_intelext_reset() 
... which has this comment:

		/* force the completion of any ongoing operation
		   and switch to array mode so any bootloader in
		   flash is accessible for soft reboot. */

That looks like what you need already.


Nicolas
