Received: from [2002:cde9:d907::1] (helo=canuck.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0cmo-0006zL-C0
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 08:40:26 +0000
Received: from [195.149.178.206] (helo=mail.runaware.com)
	by canuck.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0cml-0002Jg-Oh
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 03:40:23 -0500
Received: from magpc (do-not-reply.com [172.20.1.122])
	(authenticated bits=0)
	by mail.runaware.com (8.12.1/8.12.1) with ESMTP id i298Y3rl026934
	for <linux-mtd@lists.infradead.org>; Tue, 9 Mar 2004 08:34:03 GMT
Message-Id: <200403090834.i298Y3rl026934@mail.runaware.com>
From: "Christian Magnusson" <christian.magnusson@runaware.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 9 Mar 2004 09:36:20 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: patch for writeable mtd-partitions.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi again...

(I sent this to uclinux-dev mailing list before, but I guess this list
should have a copy of it too.)

I added support for write-able mtd-partitions at minor boundary. The diff
could be found at this link:

http://home.mag.cx/uclinux/patches/linux-2.6.x/mtdpart.diff

(I've been working with the linux-2.6.2-uc0 kernel in
uClinux-dist-20040218.tar.gz)

Could somebody review the patch and add it to the CVS?  It works for me, but
I guess somebody have comments on optimisation and coding style etc.


The patch will fix the problem when you have a flash with different erase
block sizes. In my case I have two AM79LV004T roms with This layout:

"Image"  0x000000-0x0F8000
"Config" 0x0F8000-0x100000

The erase size for the flash is:
0x000000-0x0E0000  (7 blocks a 0x20000)
0x0E0000-0x0F0000  (1 block  a 0x10000)
0x0F0000-0x0F8000  (2 blocks a 0x04000)
0x0F8000-0x100000  (1 block  a 0x08000)

Before it was impossible to get a writeable partition for "Image" since it
detected the erase size to 0x20000, and 0x0F8000%0x20000 is NOT zero.
With the patch a partition could start/end at 0x0F4000 too which wasn't
possible before.

/Christian
