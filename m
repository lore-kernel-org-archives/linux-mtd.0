Received: from lotus.glocalnet.net ([213.163.128.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLSq0-0004z0-8d
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 17:26:58 -0500
Date: Mon, 20 Mar 2006 23:04:44 +0100
To: Nicolas Pitre <nico@cam.org>
References: <1142865089.c65a3380tomas2003@home.se>
	<Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
From: Tomas <Tomas2003@home.se>
Content-Type: text/plain; format=flowed; charset=iso-8859-15
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <ops6qfl6emoeqxpi@privat.utfors.se>
In-Reply-To: <Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
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

Nicolas Pitre <nico@cam.org> skrev den Mon, 20 Mar 2006 11:08:19 -0500 
(EST):
Hi,

> On Mon, 20 Mar 2006, Tomas E wrote:
>
>> Hi,
>>
>> I have a problem with writing to a Intel Strata flash
>> and then doing a warm reset.
>
> How do you "warm reset" ?

I use the at91rm9200 built in watchdog on a custom board, which is very
convient but there is no external pin from the watchdog to make the
a reset of the flash.

The flash has several partitions starting with the bootloader and
an other partition in the same flash is the jffs2 area.

>
>> When I do a simple write echo "xxxx" > /MyFlash/test.text the flash
>> writes but remain in the state that only 0080 can be read when I
>> ioremap some address in the flash.
>>
>> My problem is that the bootcode also exist in the flash so if the
>> watchdog resets the everything just hang.
>
> How does the watchdog perform its reset?

As described above no reset on external hw (but on periphial on the chip)
then ??? puts pc=0 where the flash is supposed to be located.

>
>> Is this a expected behavior or shouldn't a write put the flash in a
>> readable state (on a hardware level)?
>
> Normally, the flash is put back into read mode with cfi_intelext_reset()
> through a reboot notifier handler, assuming of course that you're
> using a standard kernel interface to reboot your system.

A normal reset power on/off works well but the problem is this watchdog.
Since there is no reset from the watchdog to the flash. I dont think I
cannot do anything useful before this warm reset.

I was hoping to minimize the time when the flash was in a non readable
state but with jffs2/mtdblock/cfi and caching/buffering is there anything
that can be done?

>
>> What should I do to debug this?
>
> First you should tell us a bit more about your board reset.
>
>
> Nicolas
>

Tomas
