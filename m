Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142g4Q-0001L6-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 20:49:14 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142g4P-0001L0-00
	for mtd@infradead.org; Sun, 03 Dec 2000 20:49:13 +0000
Received: from dwmw2 (helo=localhost)
	by imladris.demon.co.uk with local-esmtp (Exim 3.03 #1)
	id 142g4O-0007A2-00
	for mtd@infradead.org; Sun, 03 Dec 2000 20:49:12 +0000
Date: Sun, 3 Dec 2000 20:49:11 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: <mtd@infradead.org>
Subject: DiskOnChip support in Grub.
Message-ID: <Pine.LNX.4.30.0012032045160.13316-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I've regenerated the patch to Grub which adds DiskOnChip 2000 support
(Millennium isn't yet included).

If anyone could dump the image from
ftp.infradead.org:/pub/mtd/grub/grub-image onto a floppy (dd of=/dev/fd0)
and boot it, then type

 root=(dc0,0)
 kernel=/<tab>

 root=(dc0,1)
 kernel=/<tab>

and let me know what happens (and if the tab-completion looks something
like the files you expect to be on nftla1 and nftla2 respectively), that'd
be much appreciated.

The pre_stage2 file is also there, in case you want to flash it into the
DiskOnChip in place of the existing firmware, using the grub loader from
CVS.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
