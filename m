Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aCoA-0007HD-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 08:27:02 +0000
Received: from pc3.msys.co.il ([199.203.219.3] helo=msl-exchange.msys.co.il)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aCo8-0007H7-00
	for mtd@infradead.org; Tue, 06 Mar 2001 08:27:01 +0000
Message-ID: <44A73E446E0BD511860700508BEEF707188635@pc3.msys.co.il>
From: Vadim Khamlinsky <Vadimk@m-sys.com>
To: 'Ralph Jennings' <ralph@oro.net>
Cc: mtd@infradead.org
Subject: RE: Instructions for booting from DOC-2000 chip?
Date: Tue, 6 Mar 2001 10:28:54 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


You cannot boot with doc2.fff file . Doc2.fff is not a real firmware .
Sometimes people use it before they switch to a patched lilo. ( the original
Lilo sometimes
gets stuck when diskonchip firmware is on ). If you want to boot from the
DiskOnChip you'll
have to use a real firmware like doc42.exb or doc42p.exb .

Regards,
Vadim   
-----Original Message-----
From: Ralph Jennings [mailto:ralph@oro.net]
Sent: Tue, March 06, 2001 4:47 AM
To: mtd@infradead.org
Subject: Instructions for booting from DOC-2000 chip?


I've looked all over, and from what I can gather, you need to update
your chip from DOS with "dformat.exe /win:d000 /s:doc2.fff /y" (or the
linux equivalent).

I've done that, but I still can't get it to boot, in fact now I don't
even get the "dLI" that I used to.  Though I can mount it and read
and write it from Linux 2.4.2 (using your drivers I'm guessing).

The lilo I got from M-Sys but changed the patch to work with your
major number instead of the M-Sys one.

Do I just need an updated doc2.fff file?  If so, where do I get it?
I got mine from www.m-sys.com dos utilities version 4.2 and Linux
drivers version 4.2.1 (they would let me read and write too, but no
luck booting with these drivers either).

Any help?  If I need to use grub, fine. (I'd prefer LiLo though)  I
just need it to boot Linux (with only 1 full size ext2 partition).

I have 2 machines:
    Advantech PCM-4823
    Advantech PCM-4823L

I have 2 chips:
    DOC-2000 16MB
    What looks like a DOC-2000 8MB, but your drivers say Milenium.

I haven't yet tried anything with the 16MB chip, because I've
gotten nowhere on the 8MB (the first one I picked up, and tried
getting to work).

Thanks, Ralph.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
