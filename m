Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14R2Hj-0005jP-00
	for mtd-list@infradead.org; Fri, 09 Feb 2001 01:23:39 +0000
Message-ID: <004401c09236$e1862c90$a713f2c3@drakanworkst>
From: "Andrey Glazunov" <lhfrjgtn@peterlink.ru>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <000b01c08cad$4ee427e0$4f11f2c3@drakanworkst>  <001701c08be1$0c1be0f0$8412f2c3@drakanworkst> <1464.981027321@redhat.com>  <18230.981110002@redhat.com>
Subject: Re: lrp booting from M-Systems ISA flash card 
Date: Fri, 9 Feb 2001 04:23:16 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>




> lhfrjgtn@peterlink.ru said:
> > i told about my experiment - i  boot from 1.44floppy with this ISA
> > card inserted to check if any conflicts with BIOS extensions and any
> > linux code - system boots OK ... is it good experiment ?
>
> Er... yes, that's a good experiment. Sorry, I'd missed that. The
low-memory
> explanation doesn't really hold then. Can you boot from a floppy and load
> the kernel from the flash card?

well ... it seems i suddenly find horrible bug in thats system (mainboard
BIOS as i think) - it _can_not_ boot kernel from IDE HDD, non-standart
floppy (1680kb) and my ISA flash card too :|  just hangs at 'Loading
kernel..' ...
well ... i just solve that problem with booting LRP from 1.44 'standart'
floppy and small HDD for modules...
i try to boot from my flash card at another PII motherboard - it loads
kernel ok ! but really can not load any modules after it :| (not hangs ...
just wrote errors loading modules and wait for run-level input)
so i need to patch kernel is not it ?
>
> In the Linux 2.4 kernel: linux/drivers/mtd/doc1000.c. Or from my CVS tree
> if you want to patch it into 2.2.
>

is it mtd-20000704.diff files from http://www.linux-mtd.infradead.org  the
only patch i need or some else ? does it adds support for my old enough ISA
flash card to 2.2.16 kernel or i have no chances to load modules from it
after succesful loading kernel ?

-Andrey




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
