Received: from stone.tmok.com ([204.17.163.2] ident=pla)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WT6V-0001i1-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 02:34:47 +0100
Received: (from pla@localhost)
	by stone.tmok.com (8.9.3/8.9.3) id VAA21387
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2001 21:40:35 -0400 (EDT)
Date: Mon, 13 Aug 2001 21:40:35 -0400 (EDT)
From: pla <pla@tmok.com>
Message-Id: <200108140140.VAA21387@stone.tmok.com>
To: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 erase size of 16k? 
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> What failure mode are you seeing with it now?

Well, under Linux, the MTD driver sees it, but the NFTL layer reports
it as unrecognized and doesn't see any partitions on it (and as a
result, I have no /dev/nftl, since I use devfs).  Under DOS, the
"official" DOC utils report a couple of curious errors, but in no
case will they cooperate and fix it as worked in the past.  Incidentally,
I have had email correspondence with tech support at MSystems, and
they suggested that I have it replaced (as in, for free, so not just
trying to get me to buy another one) after I described the output
of the DOS utils and tried a few things.  Perhaps I should actually
consider the possibility that I simply had a bad chip.
 
If it helps, I will describe exactly what I did, and you can see if
I did anything blatantly stupid (though for the most part I followed
the MTD-JFFS HowTo):
 
    1) Built a totally-minimal 2.4.5 kernel with the 20010807 MTD
       drivers included (most likely, as I mentioned, I may have
       accidentally broken the MTD part).
    2) Threw together a 1-disk boot/root combo with busybox, tinylogin,
       and the MTD utils.
    3) tried running "nftl_format /dev/mtd/0", it complained about the
       erase size.
    4) "fixed" nftl_format to tell me what it saw as the erase size,
       then again to do the format anyway.  (1st major DOC failure)
    5) used the DOS DOC utils to reinstall the stock 4.2 firmware and
       freshly format it.
    6) Upgraded to the 2.4.8 kernel, which saw everything just fine,
       then to the 20010812 MTD snapshot, everything still fine.
    7) built the grub DOC firmware image and invoked the command
       "doc_loadbios /dev/mtd0 grub_firmware" as instructed by the
       HowTo. (2nd major DOC failure, never recovered)
    8) Contacted MSystems tech support to see if they knew of an
       easy fix for what I'd done.
    9) After a few rounds with tech support (very friendly, incidentally),
       simply replaced the seemingly-dead DOC with another I had.  The
       new one works just fine, though I've not yet tried to use GRUB
       as its boot-image.
 
I apologize for the length of this, and if you've grown tired of
reading about my careless mistakes, I really don't mind writing
this one off.  I've installed a new DOC, and moved on.  (I still
need to get GRUB working, so I doubt you've heard the last from
me, but... <G>)
 
 
  
                                        - Ben
