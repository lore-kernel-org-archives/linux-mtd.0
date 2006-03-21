Received: from smtp3.home.se ([212.78.199.23])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLbOz-0003py-8h
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 02:35:44 -0500
From: "Tomas E" <tomas2003@home.se>
To: nico@cam.org
Date: Tue, 21 Mar 2006 08:35:29 +0100
MIME-Version: 1.0
Message-ID: <1142926529.5443f100tomas2003@home.se>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi,

>> Nicolas Pitre <nico@cam.org> skrev den Mon, 20 Mar 2006 11:08:19 -0500 (=
EST):
>> Hi,
>>=20
>> > On Mon, 20 Mar 2006, Tomas E wrote:
>> >=20
>> > > Hi,
>> > >=20
>> > > I have a problem with writing to a Intel Strata flash
>> > > and then doing a warm reset.
>> >=20
>> > How do you "warm reset" ?
>>=20
>> I use the at91rm9200 built in watchdog on a custom board, which is very
>> convient but there is no external pin from the watchdog to make the
>> a reset of the flash.
>
>You mean from include/asm-arm/arch-at91rm9200/system.h:
>
>static inline void arch_reset(char mode)
>{
>        /*
>         * Perform a hardware reset with the use of the Watchdog timer.
>         */
>        at91_sys_write(AT91_ST_WDMR, AT91_ST_RSTEN | AT91_ST_EXTEN | 1);
>        at91_sys_write(AT91_ST_CR, AT91_ST_WDRST);
>}

Sorry if my explaination was poor but no. I run my test case
which is to kill the watchdog deamon which will cause the watchdog
to expire. I checked that this code will never be executed in my case.

The built in hardware watchdog on the at91rm9200 performs a cold reset=20
on all on chip periphials but does nothing on the external.
The flash is external, so its state will remain in what ever state
it was before the reset, which in my case seems to be operation=20
not complete (0080).

I forgot to say that I using a 28F640 (rev C) flash.

When I ioremap the flash I allways see 0080 patten, I would expect
this to go away after a while or at least show something else sometimes.

I would like to minimize the time when the flash is in this state.



>then it is usually called from machine_restart() in=20
>arch/arm/kernel/process.c...

>which is called from kernel_restart() in kernel/sys.c...

>But kernel_restart() has called kernel_restart_prepare() which calls=20
>notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd)...
=20
>And incidentally one of those reboot notifiers is cfi_intelext_reboot()=20
>in drivers/mtd/chips/cfi_cmdset_0001.c which calls cfi_intelext_reset() 
>... which has this comment:

>=09=09/* force the completion of any ongoing operation
>=09=09   and switch to array mode so any bootloader in
>=09=09   flash is accessible for soft reboot. */
>
>That looks like what you need already.
>
>
>Nicolas

Tomas
