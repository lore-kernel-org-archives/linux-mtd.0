Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OpTx-0004Zv-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 23:19:09 +0000
Message-ID: <000b01c08d6e$814eadb0$5211f2c3@drakanworkst>
From: "Andrey Glazunov" <lhfrjgtn@peterlink.ru>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <000b01c08cad$4ee427e0$4f11f2c3@drakanworkst>  <001701c08be1$0c1be0f0$8412f2c3@drakanworkst> <1464.981027321@redhat.com>  <18230.981110002@redhat.com>
Subject: Re: lrp booting from M-Systems ISA flash card 
Date: Sat, 3 Feb 2001 02:18:50 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>
> lhfrjgtn@peterlink.ru said:
> > i told about my experiment - i  boot from 1.44floppy with this ISA
> > card inserted to check if any conflicts with BIOS extensions and any
> > linux code - system boots OK ... is it good experiment ?
>
> Er... yes, that's a good experiment. Sorry, I'd missed that. The
low-memory
> explanation doesn't really hold then. Can you boot from a floppy and load
> the kernel from the flash card?
>

hm... how can i do it ?  something like boot=/dev/hda1 in syslinux.cfg at
floppy ? as i see linux software do not understand this 'device' as /hda1
  ...
and as for booting from flash - system loads root.lrp well and hangs at time
of 'loading linux..'  so it seems like some critical errors in kernel (if i
understand it right) when it try to acsess boot device during its
initialising (loading)... it seems only kernel patches can help...
>
> lhfrjgtn@peterlink.ru said:
> >  what is 'bitrot' ?
>
> The process whereby old code which hasn't been touched for a long time
just
> seems to stop working.

hmm... i will try to understand it but i am too poor in linux yet :(

>
> > and where can i found doc1000.c ?
>
> In the Linux 2.4 kernel: linux/drivers/mtd/doc1000.c. Or from my CVS tree
> if you want to patch it into 2.2.
>

i better try to work with 2.2 kernels as stable releases (IMHO)... all i
want to do is to build small PPTP server with 1 network card to 'mirror'
game traffic in the internet (now it work on WinNT4 but i want it to be
linux without 500Mb HDD and 64Mb RAM) ... so i will better look into
patches... unfortunately i want to boot all system from flash card without
floppy or hdd... in other case there is no advantages of flash...

Andrey.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
