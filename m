Received: from a80-127-156-242.adsl.xs4all.nl ([80.127.156.242]
	helo=linserv001.aimsys.nl)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxmNh-0001fL-NP
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 08:51:03 -0400
From: Jaap-Jan Boor <jjboor@aimsys.nl>
To: Stefan =?ISO-8859-1?Q?St=FCrke?= <sst@pandatel.com>
In-Reply-To: <1092919733.23187.34.camel@linpc003.aimsys.nl>
References: <cg23u5$gd0$1@sea.gmane.org>
	<1092919733.23187.34.camel@linpc003.aimsys.nl>
Content-Type: text/plain; charset=ISO-8859-15
Message-Id: <1092919856.23185.36.camel@linpc003.aimsys.nl>
Mime-Version: 1.0
Date: Thu, 19 Aug 2004 14:50:56 +0200
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD and 28F128J3A
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got it from here:

http://lists.linuxppc.org/linuxppc-embedded/200312/msg00164.html

On Thu, 2004-08-19 at 14:48, Jaap-Jan Boor wrote:
> Stefan,
> 
> what I did is force a checkstop the will result in a processor
> reset before executing 'm8260_gorom()' (this should also reset
> your flash devices) by adding the following code to
> m8260_machine_restart():
> 
> static void
> m8260_restart(char *cmd)
> {
>         extern void m8260_gorom(bd_t *bi, uint addr);
>         uint    startaddr;
> 
> #ifdef CONFIG_MYSYSTEM
>         unsigned long hid0;
>         // Need interrupts off to force checkstop
>         cli();
>         // Checkstop reset enable
>         ((immap_t *)IMAP_ADDR)->im_clkrst.car_rmr |= 0x01;
>         // Force a checkstop by turning on parity which is not
>         // implemented
>         hid0 = mfspr(HID0);
>         hid0 |= 0x30000000;
>         mtspr(HID0, hid0);
> #else
>         /* Most boot roms have a warmstart as the second instruction
>          * of the reset vector.  If that doesn't work for you, change
>          * this or the reboot program to send a proper address.
>          */
>         startaddr = 0xff000104;
> 
>         if (cmd != NULL) {
>                 if (!strncmp(cmd, "startaddr=", 10))
>                         startaddr = simple_strtoul(&cmd[10], NULL, 0);
>         }
> 
>         m8260_gorom((unsigned int)__pa(__res), startaddr);
> #endif
> }
> 
> Jaap-Jan
> 
> 
> On Thu, 2004-08-19 at 13:46, Stefan Stürke wrote:
> > Hi,
> > 
> > I have a problem with the 28F128J3A flash during system reboot.
> > 
> > Environment:
> > 
> > - mpc8270
> > - linuxppc_2_4_devel (snapshot from the denx ppc tree based on 2.4.25)
> > - mtd version included in that tree
> > - a jffs2 file system is mounted on the flash
> > 
> > Problem:
> > 
> > When I reboot the system, I get a kernel panic right after the jump to 
> > the reset vector in m8260_gorom().
> > 
> > Using my BDI2000 I was able to find out that the kernel panic occurred
> > because 8260_gorom tries to execute some code in Flash (this is
> > correct because the bootloader is also located in that flash) but the
> > Flash is in query mode at this time. So the correct code could not be
> > read by the processor
> > 
> > So my question: Why is the flash left in query mode?
> > I found that also in normal operation the flash is in query mode after
> > writing to it. Is this ok? (I have no problems during normal operation).
> > What can I do to leave the query mode before reboot?
> > 
> > When I use the same hardware platform with another flash type
> > AMD29LV128M I have no problems during reboot.
> > 
> > One difference I can think of is, that in the case of the
> > 28F128J3A the chips/cfi_cmdset_0001 driver is used, while in the case
> > of the AMD29LV128M the chips/cfi_cmdset_0002 driver is used.
> > Any ideas?
> > 
> > Thanks in advance,
> > Stefan
-- 
J.G.J. Boor                       Anton Philipsweg 1
Software Engineer                 1223 KZ Hilversum
AimSys bv                         tel. +31 35 689 1941
Postbus 2194, 1200 CD Hilversum   mailto:jjboor@aimsys.nl
