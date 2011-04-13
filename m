Received: from smtprelay01.ispgateway.de ([80.67.31.35])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9tXK-00083I-22
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 06:26:47 +0000
Received: from [89.246.71.91] (helo=mail6.tqsc.de)
	by smtprelay01.ispgateway.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1Q9tXH-0004Cz-5k
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 08:26:43 +0200
Received: from sc0810201.tqsc.de ([192.168.80.70] helo=[127.0.0.1])
	by mail6.tqsc.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1Q9tXH-0002Il-5u
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 08:26:43 +0200
Message-ID: <4DA54221.6010407@tqsc.de>
Date: Wed, 13 Apr 2011 08:26:41 +0200
From: Markus Niebel <list-09_linux_mtd@tqsc.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Numonyx NOR bug
References: <4DA4C1AA.3030907@gmail.com>
In-Reply-To: <4DA4C1AA.3030907@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Reply-To: list-09_linux_mtd@tqsc.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Leo,

can you isolate the problem? I mean, can it happen all time when you 
erase or only if there is an erase suspend? As far as I know these chips 
have a timout after erase / erase resume before erase suspend is 
accepted. If this timeout is not noticed, the erase may fail.

It would be better for file system performance to use this timeout 
before waiting using the INVALIDATE_CACHE_UDELAY macro.

just another question: Does the error happen on SLC or on MLC or on both 
kind of devices? (The smaller ones are SLC the larger MLC).

There is an AppNote from Numonyx ("Patching the Linux Kernel for Micron 
Axcell™ M29 Flash Memory").

Markus

Am 12.04.2011 23:18, schrieb Leo:
> I found a little problem with mtd drivers running on a LTIB linux
> distribution on a custom board equipped with a Freescale Coldfire and a
> Numonyx NOR Axcell M29EW flash memory. The do_erase_oneblock() function
> sometimes fails because the chip_good() functions returns zero reading a
> data word different from 0xffff. I spent some time debugging and finally
> I solved the problem adding a new chip state "FL_ERASE_STARTING" and
> setting it after the erase block command sequence as follows :
>
> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi,
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> cfi->device_type, NULL);
> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> cfi->device_type, NULL);
> map_write(map, CMD(0x30), adr);
>
> chip->state = FL_ERASE_STARTING;
>
> INVALIDATE_CACHE_UDELAY(map, chip,
> adr, len,
> chip->erase_time);
>
> chip->state = FL_ERASING;
> chip->erase_suspended = 0;
> chip->in_progress_block_addr = adr;
>
> timeo = jiffies + (HZ*20);
>
> for (;;) {
>
> This works because the Numonyx chip probably does not accept the erase
> suspend command during the erase block time-out (the 50 us after the
> command sequence has been sent and before the erase starts). In fact the
> INVALIDATE_CACHE_UDELAY() macro unlocks the mutex and lets
> reading/writing functions to suspend the erasing too soon calling the
> get_chip(). With the FL_ERASE_STARTING state get_chip() does not give
> the access to reading/writing functions during the
> INVALIDATE_CACHE_UDELAY() sleeping period (chip->erase_time).
> Anyone into the same problem?
>
> Thanks for reading!
> Leonardo
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
