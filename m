Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sOEY-0000Sd-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 13:17:26 +0100
Message-ID: <3AE6C0DC.CFA18C77@crossnet.co.jp>
Date: Wed, 25 Apr 2001 21:19:40 +0900
From: Masami Komiya <mkomiya@crossnet.co.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: (No Subject)
References: <3AE69E21.CDCF90A1@crossnet.co.jp>  <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> <3311.988123586@redhat.com> <25105.988194419@redhat.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> mkomiya@crossnet.co.jp said:
> >  Our hardware has one flash memory in 16bit mode. CPU is SH4 of
> > Hitachi. That is 32bit type CPU and can connect the device in 16bit
> > mode. In this case, interleave is 1 and bus width is 2.
> 
> > Before using  cfi->device_type instead of CFI_DEVICETYPE_X8 MTD driver
> > cannot calculate the address of the CFI command correctly.
> 
> Which CFI command is being sent to the wrong address? The unlock commands?

Yes, unlock command in do_write_oneword() when the unalined data
is written.
 
> The cfi_cmdset_0002 code passes CFI_DEVICETYPE_X8 to the cfi_send_gen_cmd
> function when doing the unlock cycles, instead of cfi->device_type, because
> the unlock addresses (cfi->addr_unlock[12]) are supposed to have been
> pre-calculated so they don't need shifting.
> 
> I think that cfi_probe.c calculates the correct addresses for 8-bit chips
> and for 16-bit chips in 8-bit mode. I suspect that we may be calculating
> the wrong unlock addresses for 16-bit chips which are actually in 16-bit
> mode.

When the unalined data is written in 16-bit mode,
word mode command is needed with 1bit shift for one interleave.

> Your patch changes 8-bit devices to use (0xaaa,0x555) and changes _all_
> 16-bit devices to use (0x555,0x2aa). I suspect that you should be changing
> only the 16-bit devices _in 16-bit mode_ to use 0x555, 0x2aa, while leaving
> the 16-bit devices in 8-bit mode as they were.

I was misunderstanding about the definitions in cfi_probe_chip().
Attached patch is for cfi_cmdset_0002.c applied simon's patch.


*** cfi_probe.c.org	Wed Apr 18 17:26:35 2001
--- cfi_probe.c	Wed Apr 25 20:52:03 2001
***************
*** 202,209 ****
  		cfi->addr_unlock2=0x2aa; 
  		break;
  	case CFI_DEVICETYPE_X16:
! 		cfi->addr_unlock1=0xaaa; 
! 		cfi->addr_unlock2=0x555; 
  		break;
  	case CFI_DEVICETYPE_X32:
  		cfi->addr_unlock1=0x1555; 
--- 202,215 ----
  		cfi->addr_unlock2=0x2aa; 
  		break;
  	case CFI_DEVICETYPE_X16:
! 		if (map->buswidth == 2) {
! 			cfi->addr_unlock1=0x555; 
! 			cfi->addr_unlock2=0x2aa; 
! 		}
! 		else {
! 			cfi->addr_unlock1=0xaaa; 
! 			cfi->addr_unlock2=0x555; 
! 		}
  		break;
  	case CFI_DEVICETYPE_X32:
  		cfi->addr_unlock1=0x1555;


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
