Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QASRS-0000va-0h
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 19:43:03 +0000
Received: by wyb28 with SMTP id 28so2170647wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 12:42:59 -0700 (PDT)
Message-ID: <4DA74E3F.1000008@gmail.com>
Date: Thu, 14 Apr 2011 21:42:55 +0200
From: Leo <leo.costa77@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Numonyx NOR bug
References: <4DA4C1AA.3030907@gmail.com> <4DA54221.6010407@tqsc.de>
In-Reply-To: <4DA54221.6010407@tqsc.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It happens only sometimes when there is an erase suspend. I read the 
AppNote from Numonyx and i seems to be the "Delay after resume" bug of 
M29EW devices, because the chip_good() fails as described there. Their 
patch works, but also mine works, so i think it's the same bug, but it 
happens only when a suspend is done before the time-out. Their patch 
adds a udelay of 100 usecs (i tried with 50 but the problem is still 
there) after each resume, when there are a lot of suspend-resume 
sequences this could decrease the performance.

Leo

On 13/04/2011 08:26, Markus Niebel wrote:
> Hello Leo,
>
> can you isolate the problem? I mean, can it happen all time when you 
> erase or only if there is an erase suspend? As far as I know these 
> chips have a timout after erase / erase resume before erase suspend is 
> accepted. If this timeout is not noticed, the erase may fail.
>
> It would be better for file system performance to use this timeout 
> before waiting using the INVALIDATE_CACHE_UDELAY macro.
>
> just another question: Does the error happen on SLC or on MLC or on 
> both kind of devices? (The smaller ones are SLC the larger MLC).
>
> There is an AppNote from Numonyx ("Patching the Linux Kernel for 
> Micron Axcell™ M29 Flash Memory").
>
> Markus
>
> Am 12.04.2011 23:18, schrieb Leo:
>> I found a little problem with mtd drivers running on a LTIB linux
>> distribution on a custom board equipped with a Freescale Coldfire and a
>> Numonyx NOR Axcell M29EW flash memory. The do_erase_oneblock() function
>> sometimes fails because the chip_good() functions returns zero reading a
>> data word different from 0xffff. I spent some time debugging and finally
>> I solved the problem adding a new chip state "FL_ERASE_STARTING" and
>> setting it after the erase block command sequence as follows :
>>
>> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
>> cfi->device_type, NULL);
>> map_write(map, CMD(0x30), adr);
>>
>> chip->state = FL_ERASE_STARTING;
>>
>> INVALIDATE_CACHE_UDELAY(map, chip,
>> adr, len,
>> chip->erase_time);
>>
>> chip->state = FL_ERASING;
>> chip->erase_suspended = 0;
>> chip->in_progress_block_addr = adr;
>>
>> timeo = jiffies + (HZ*20);
>>
>> for (;;) {
>>
>> This works because the Numonyx chip probably does not accept the erase
>> suspend command during the erase block time-out (the 50 us after the
>> command sequence has been sent and before the erase starts). In fact the
>> INVALIDATE_CACHE_UDELAY() macro unlocks the mutex and lets
>> reading/writing functions to suspend the erasing too soon calling the
>> get_chip(). With the FL_ERASE_STARTING state get_chip() does not give
>> the access to reading/writing functions during the
>> INVALIDATE_CACHE_UDELAY() sleeping period (chip->erase_time).
>> Anyone into the same problem?
>>
>> Thanks for reading!
>> Leonardo
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
