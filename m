Received: from lotus.glocalnet.net ([213.163.128.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FMC9Z-0004Tu-MA
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 17:50:15 -0500
Date: Wed, 22 Mar 2006 23:46:09 +0100
To: Nicolas Pitre <nico@cam.org>
References: <1142926529.5443f100tomas2003@home.se>
	<Pine.LNX.4.64.0603211056190.3631@localhost.localdomain>
From: Tomas <Tomas2003@home.se>
Content-Type: text/plain; format=flowed; charset=iso-8859-15
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <ops6t6u7t8oeqxpi@privat.utfors.se>
In-Reply-To: <Pine.LNX.4.64.0603211056190.3631@localhost.localdomain>
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

I used a web client due to some mail problem, seem to mess up.

Nicolas Pitre <nico@cam.org> skrev den Tue, 21 Mar 2006 11:08:18 -0500 
(EST):

> On Tue, 21 Mar 2006, Tomas E wrote:
>
>> Hi,
>>
>> >> Nicolas Pitre <nico@cam.org> skrev den Mon, 20 Mar 2006 11:08:19 
>> -0500 (EST):
>> >> Hi,
>> >>
>> >> > On Mon, 20 Mar 2006, Tomas E wrote:
>> >> >
>> >> > > Hi,
>> >> > >
>> >> > > I have a problem with writing to a Intel Strata flash
>> >> > > and then doing a warm reset.
>> >> >
>> >> > How do you "warm reset" ?
>> >>
>> >> I use the at91rm9200 built in watchdog on a custom board, which is 
>> very
>> >> convient but there is no external pin from the watchdog to make the
>> >> a reset of the flash.
>> >
>> >You mean from include/asm-arm/arch-at91rm9200/system.h:
>> >
>> >static inline void arch_reset(char mode)
>> >{
>> >        /*
>> >         * Perform a hardware reset with the use of the Watchdog timer.
>> >         */
>> >        at91_sys_write(AT91_ST_WDMR, AT91_ST_RSTEN | AT91_ST_EXTEN | 
>> 1);
>> >        at91_sys_write(AT91_ST_CR, AT91_ST_WDRST);
>> >}

The above works fine with the latest snapshot.

My problem is as you and others pointed out that I got a cold reset
on the chip but not on the flash. I will put a working watchdog
on the wich list.

>>
>> Sorry if my explaination was poor but no. I run my test case
>> which is to kill the watchdog deamon which will cause the watchdog
>> to expire. I checked that this code will never be executed in my case.
>
> The only answer I have for you then is to not rely on the watchdog at
> all since it cannot guarantee a reliable system recovery anyway.  Use it
> only if you have read-only flash.
>
> Or, if you don't have to write to flash for the normal operation of your
> system except for some unfrequent occasions, then a simple workaround is
> simply to perform a small read of the MTD device right after the write
> has completed which will return the flash to data mode.

Yes this is my case and I have now put in this which minimize the time
when the flash is unreadable.

I was thinking that I might put in a watchdog isr that could put the flash
in read mode again and then do same as the arch_reset. But I guess that I
cannot call cfi_intelext_reboot() or similar from a isr because of 
deadlock risk.
And and other problem is that it might not work if the program code for
the isr is corrupt.

>
>> The built in hardware watchdog on the at91rm9200 performs a cold reset
>> on all on chip periphials but does nothing on the external.
>
> Otherwise, if the watchdog doesn't assert a reset line to which the
> flash is connected then it is not fulfilling its purpose and you shoud
> simply not use it at all.  The only exception is for the system reboot
> case where it is expected to fire only after things have been prepared
> for a clean reboot.
>
>
> Nicolas
>
>

Thank for explaining, Tomas
