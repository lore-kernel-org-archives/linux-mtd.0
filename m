Received: from tweedy.ksc.nasa.gov ([128.217.76.165])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DQvN-0005AX-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 15:29:09 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by tweedy.ksc.nasa.gov (8.11.6/8.11.6) with ESMTP id g4UET3n19191
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 10:29:03 -0400
Subject: Grub Booting Disk On Chip
From: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 30 May 2002 10:29:03 -0400
Message-Id: <1022768943.26053.19.camel@tweedy.ksc.nasa.gov>
Mime-Version: 1.0
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

I'm having a problem configuring grub to boot from a DOC2000.

What's been done so far:

I've patched grub-0.92 with the grub-2002-02-19-doc.patch.  Installed
the grub_firmware on the DOC, formated and partitioned /dev/nftla1 and
have successfully mounted it.  I reserved 100000 bytes for the
grub_firmware.  The /boot/grub directory exists on the DOC with the
following menu.lst (a soft link to grub.conf):

default=1
timeout=5
splashimage=(hd0,0)/grub/splash.xpm.gz
title Red Hat Linux (2.4.7-10)
	root (hd0,0)
	kernel /vmlinuz-2.4.7-10 ro root=/dev/hda2
title Red Hat Linux (2.4.18emb)
        root (hd0,0)
        kernel /vmlinuz-2.4.18emb ro root=/dev/hda2
title Red Hat Linux (2.4.18emb from DOC)
        root (dc0,0)
        kernel /vmlinuz-2.4.18emb ro root=/dev/hda2

What doesn't work:

When I boot the board:

1.  I get "DoC 2000 at D600".  The DOC is really at D000.

2.  I get several messages about GRUB trying to find
/boot/grub/menu.lst.  None of the messages indicate drive 0xE0.

Eventually I get a grub prompt and can enter:

root (dc0,0)
kernel /boot/vmlinuz-2.4.18emb ro root=/dev/hda2

Both commands respond appropriately (I think).  I can then type boot and
all is well.

What am I missing to get grub to automatically boot from the DOC?

Bob...


-- 
Bob Chiodini
Sr. Communications Engineer
Dynacs Engineering Company, Inc.
DNX-18
Kennedy Space Center, Florida 32899
321-867-6313 (voice)
321-867-6300 (fax)
