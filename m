Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14a7UH-0006IP-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 02:46:09 +0000
Received: from sn.oro.net ([204.212.106.69])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14a7UG-0006II-00
	for mtd@infradead.org; Tue, 06 Mar 2001 02:46:08 +0000
Received: from progeny (D3.front.oro.net [204.212.104.71])
	by Sn.oro.net (8.9.3+3.2W/8.9.3/Debian 8.9.3-21) with SMTP id SAA27229
	for <mtd@infradead.org>; Mon, 5 Mar 2001 18:45:27 -0800
Date: Mon, 5 Mar 2001 18:46:39 -0800
From: Ralph Jennings <ralph@oro.net>
To: mtd@infradead.org
Subject: Instructions for booting from DOC-2000 chip?
Message-ID: <20010305184639.A3532@oro.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

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
