Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sMVt-0007je-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 11:27:13 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sMVs-0007jY-00
	for mtd@infradead.org; Wed, 25 Apr 2001 11:27:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AE69E21.CDCF90A1@crossnet.co.jp> 
References: <3AE69E21.CDCF90A1@crossnet.co.jp>  <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> <3311.988123586@redhat.com> 
To: Masami Komiya <mkomiya@crossnet.co.jp>
Cc: mtd@infradead.org
Subject: Re: (No Subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 25 Apr 2001 11:26:59 +0100
Message-ID: <25105.988194419@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mkomiya@crossnet.co.jp said:
>  Our hardware has one flash memory in 16bit mode. CPU is SH4 of
> Hitachi. That is 32bit type CPU and can connect the device in 16bit
> mode. In this case, interleave is 1 and bus width is 2.

> Before using  cfi->device_type instead of CFI_DEVICETYPE_X8 MTD driver
> cannot calculate the address of the CFI command correctly.

Which CFI command is being sent to the wrong address? The unlock commands?

The cfi_cmdset_0002 code passes CFI_DEVICETYPE_X8 to the cfi_send_gen_cmd 
function when doing the unlock cycles, instead of cfi->device_type, because 
the unlock addresses (cfi->addr_unlock[12]) are supposed to have been 
pre-calculated so they don't need shifting.

I think that cfi_probe.c calculates the correct addresses for 8-bit chips 
and for 16-bit chips in 8-bit mode. I suspect that we may be calculating 
the wrong unlock addresses for 16-bit chips which are actually in 16-bit 
mode.

Your patch changes 8-bit devices to use (0xaaa,0x555) and changes _all_ 
16-bit devices to use (0x555,0x2aa). I suspect that you should be changing 
only the 16-bit devices _in 16-bit mode_ to use 0x555, 0x2aa, while leaving 
the 16-bit devices in 8-bit mode as they were.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
