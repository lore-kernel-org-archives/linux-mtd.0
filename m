Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LSIm-0003fa-00
	for mtd-list@infradead.org; Wed, 24 Jan 2001 15:57:40 +0000
Received: from awpi.com
	([204.241.40.2] helo=sisko.awpi.com ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LSIk-0003eU-00
	for mtd@infradead.org; Wed, 24 Jan 2001 15:57:39 +0000
Received: from despav (ip234.austin18.tx.pub-ip.psi.net [38.27.176.234])
	by sisko.awpi.com (8.9.0/8.9.0) with SMTP id JAA23226
	for <mtd@infradead.org>; Wed, 24 Jan 2001 09:57:26 -0600
From: " Brian Michalk" <michalk@awpi.com>
To: <mtd@infradead.org>
Subject: compiling DOC
Date: Wed, 24 Jan 2001 09:42:57 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICMEKNCEAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.30.0101182017080.21027-100000@xanadu.home>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I first dabbled in DOC about a year ago, successfully making the modules,
etc.  I've been monitoring the email, and thought it would be easy to get
the code compiled into the kernel to boot from DOC.

I went back through the archives.

I downloaded several different kernels to match the patches available
through FTP.  Here is what I have tried:

1)  "Just download the big tarball and drop it on top of your kernel tree".
Well, that didn't work.

2) Download 2.2.16 kernel.
untar mtd-20000704
modify patchin.sh because it didn't work out of the box
execute patchin.sh
patch -p0 -d /usr/src/linux <mtd-patch-2.2.16
It all eventually went without errors, but I still can't get a make
menuconfig to come up with the prompt to compile the MTD drivers.

I tried with 2.4 kernels as well.  I know you guys are busy, but I would
like a little cookbook help to be able to compile a kernel, and then boot
off DOC.

Thanks.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
