Received: from fmmailgate03.web.de ([217.72.192.234])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JusvA-0007fO-C1
	for linux-mtd@lists.infradead.org; Sat, 10 May 2008 17:31:54 +0000
Message-ID: <05e001c8b2c3$b51fdbf0$6502a8c0@bui.materna.com>
From: "Roland" <devzero@web.de>
To: <kernel-testers@vger.kernel.org>
References: <80448604@web.de>
Subject: Re: [BUG] crash - module l440gx buggy ? interfere
Date: Sat, 10 May 2008 19:31:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 8bit
Sender: devzero@web.de
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

it`s the 3rd time now that i stumbled over this, and i`m 100% sure now that 
there is an issue l440gx module/driver.

cause it`s constantly bugging me when module testing and always need to 
remember to exclude that module, i created bugzilla #10664 for this:
http://bugzilla.kernel.org/show_bug.cgi?id=10664

as you can see that there are bugs in the kernel (important or not) for 
which nobody really cares ;)
ok, not a big deal here, but it`s a bug!

i`d like to encourage everyone to file a bugzilla  - this helps avoiding 
loss of non-serious bugs in lkml deepness (i`m sure there are a LOT!)

regards
roland


----- Original Message ----- 
From: <devzero@web.de>
To: <linux-kernel@vger.kernel.org>
Sent: Tuesday, January 01, 2008 10:46 PM
Subject: Re: [BUG] crash - module l440gx buggy ? interfere


> same/similar behaviour with
>
> l440gx and container
> l440gx and acpiphp
>
> after load of l440gx, container and acpiphp modules do also hang my system 
> on load/unload.
>
> maybe l440gx leaving the system in some weird state after probe ?
>
>
>> -----Ursprüngliche Nachricht-----
>> Von: <devzero@web.de>
>> Gesendet: 01.01.08 20:57:08
>> An: linux-kernel@vger.kernel.org
>> Betreff: [BUG] crash - modules l440gx and parport_pc interfere
>
>
>>
>> there seems some weird interference between l440gx and parport_pc modules
>>
>> i can reproduceable crash my box by either:
>>
>> modprobe parport_pc;modprobe l440gx;rmmod parport_pc
>>
>> or
>>
>> modprobe l440gx; modprobe parport_pc;rmmod parport_pc
>>
>> this happens on 2.6.24rc6 and also older kernel (2.6.22)
>>
>> nothing in dmesg - just
>> >JEDEC: Found no L440GX BIOS device at location zero
>> >JEDEC probe on BIOS chip failed. Using ROM
>>
>> because i haven`t appropriate hardware.
>>
>> don`t know if this is a bug in parport_pc or l440gx but maybe its worth 
>> reporting.
>>
>> regards
>> roland 
