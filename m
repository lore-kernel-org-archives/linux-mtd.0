Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12RuNe-0004ch-00
	for mtd-list@infradead.org; Mon, 06 Mar 2000 10:04:50 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12RuNd-0004cb-00
	for mtd@infradead.org; Mon, 06 Mar 2000 10:04:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38C2E9BE.D9F9369D@vrcomm.com> 
References: <38C2E9BE.D9F9369D@vrcomm.com> 
To: Whai Lim <wlim@vrcomm.com>
Cc: mtd@infradead.org
Subject: Re: We are ready and need additional ptr 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 Mar 2000 10:04:46 +0000
Message-ID: <27359.952337086@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


(Copied to the list to prevent duplication - hope you don't mind)

wlim@vrcomm.com said:
> 1.  Is this DOC driver modelled after the one provided by M-System's
> flobj.obj which you have a disassembly version on mtd/pub web site?

Not really. Only the detection of the DiskOnChip is taken from there (that's 
why it used to have variables like 'long dx' etc ;)

> 2.  In the "README" file v 1.3 2000/01/28 for "HOW TO GET GRUB BOOTING
> FROM DiskOnChip", there is a reference of "Copy the 'stage2/
> pre_stage2' file to this directoray, where is this file located, in
> GRUB 0.5?

If you are using Grub from the FSF CVS tree then yes, it's located in the Grub 
build tree after you've built Grub.

In Grub 0.5 (the older version from Erich Boleyn) there is no pre_stage2; only
stage2. If you're using that version of Grub, you have to change mtd/grub/
Makefile accordingly - see the first few lines of the Makefile.

Grub only works on Intel machines, though.

> 3.  In the "README" file v 1.3 2000/01/28 for "HOW TO GET GRUB BOOTING
> FROM DiskOnChip", there is a reference of DiskOnChip has a built-in
> ROM.  Is this built-in ROM modifiable?

It has a tiny built-in ROM, which on Intel machines just loads the first 8Kb of
the flash itself, then passes control to it. You can't change the ROM itself,
but obviously you can change what's in the beginning of the flash, and that's
how I've got Grub loading from it.

The ROM is designed to look like a PC BIOS extension - I don't know how you'd 
persuade a PPC BIOS to use it, even if you could modify it.

> 4.  There is a sub-folder "boot" in the mtd-20000131 folder, can we
> model that structure to replace the built-in ROM mentioned in 2.
> above?

You can't replace the ROM, but you can place your code in the beginning of the
flash before the NFTL starts, just like I do. I don't know much about the boot
code in that directory; it was contributed by someone else and I haven't had
much time to investigate it.

It should be feasible, though - obviously the flash access routines are 
different because it's a DiskOnChip not normal NOR flash - but you can model 
your DiskOnChip access code on my Grub loader or doc2000.c

What you need to do is provide some way for the system to load your code from 
the DiskOnChip in the first place.  With Grub, the bootstrap procedure is 
this....


 The tiny IPL ROM is found by PC BIOS and executed.
 IPL ROM loads the first 8Kb of the DiskOnChip flash into memory and does a
	checksum. This code is (I believe) called the SPL.
 If the checksum succeeds, it passes control to the SPL code it's just loaded.

At this point, my setup differs from M-Systems' setup. Normally, the M-Systems 
DiskOnChip firmware steals a large chunk of system RAM and installs a new 
handler for INT 13h; the Disk BIOS interrupt - then this INT 13h handler makes 
the DiskOnChip look like a normal disk drive from then on.

In my Grub setup, however, I don't do this - instead I steal a tiny chunk of 
system RAM (just one page) and install in it a handler for INT 19h - the 
bootstrap interrupt. When the system BIOS has finished initialising, it calls 
my bootstrap interrupt, which loads the actual Grub code off the DiskOnChip 
and passes control to it.

At this point, we have a fully functional Grub running - the next stage, as 
I've said before, is to add DiskOnChip support to Grub itself, so that Grub 
can load a kernel off the NFTL filesystem on the DiskOnChip.



If you want to do this on a different architecture, you obviously can't rely on
the PC BIOS to find and execute the IPL ROM. You need to provide some other way
for it to start, and how you do that depends a lot on your particular board/
machine/firmware. If you can modify the onboard firmware, that's probably the
best way to go. You don't need a lot of code to grab the first few Kb off the
DiskOnChip flash; it's under 256 bytes of i386 code in my Grub loader.

For the code you actually put in the beginning of the DiskOnChip - I'd not 
bother with making it capable of reading kernels off the filesystem on NFTL, - 
instead make it read a kernel directly from the beginning of the flash, like 
the code in the boot directory does. 

If you have enough space/control in the system firmware, you could even put the
whole of the kernel booter into it, and just dd a kernel right at the start of
the DiskOnChip rather than having a second-stage bootstrap.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
