Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OTtb-0005Al-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 00:16:11 +0000
Message-ID: <000b01c08cad$4ee427e0$4f11f2c3@drakanworkst>
From: "Andrey Glazunov" <lhfrjgtn@peterlink.ru>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <001701c08be1$0c1be0f0$8412f2c3@drakanworkst>  <1464.981027321@redhat.com>
Subject: Re: lrp booting from M-Systems ISA flash card 
Date: Fri, 2 Feb 2001 03:15:53 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>
> lhfrjgtn@peterlink.ru said:
> > the main question - i need only boot from this flash card but not use
> > it as hardrive (drive),  are there any ideas how to prevent system's
> > hang ?
>
> I think it's probably hanging because the built-in BIOS extension takes up
> too much memory. Can you try a newer version of SYSLINUX or using loadlin
> instead?

i told about my experiment - i  boot from 1.44floppy with this ISA card
inserted to check if any conflicts with BIOS extensions and any linux code -
system boots OK ... is it good experiment ? as about memory - when this card
was 'formatted' with 8192 parameter of firmware (to support up to 32Mb
drives) syslinux says 'You have less than 604kb of memory and can have
problems ...' but it was 1.48 syslinux from original lrp package... 1.50
that reqire only >=512kb says nothing... some time later i have 'reformat'
this drive using 2048 parameter of firmware (to support up to 4Mb drives) -
it help to get 'additional' ~200kb of drivespace (from 1.6Mb up to 1.8Mb)
and decrease amount of taken off conventional memory - today even 1.48
syslinux says nothing warnings at time of booting (from floppy when card is
inserted or from card itself but hanging)

> The kernel patches won't help you get it booting, but you may to be able
to
> use the flash card from within Linux - it was the first device ever
> supported by the MTD code, although I had a 4MiB version. If the bitrot
> hasn't got to it yet, try doc1000.c - you may need to hardcode the size of
> the device and the physical location at which it's found.

what is 'bitrot' ? and where can i found doc1000.c ? can it help to boot
(prevent hanging at 'loading linux..' ) or just help to acess this device
from already started linux (from floppy for example...) ?

> You'll also want to enable FTL (not NFTL).

i will try to found what is it :|

Thanx for quick reply

-Andrey



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
