Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 130Ufs-00085S-00
	for mtd-list@infradead.org; Fri, 09 Jun 2000 20:42:36 +0100
Received: from [212.49.98.2] (helo=gw.gentex.ru)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 130Ufr-00085M-00
	for mtd@infradead.org; Fri, 09 Jun 2000 20:42:35 +0100
Received: from dkhome.gentex.ru (dkhome.gentex.ru [212.49.99.132])
	by gw.gentex.ru (8.9.1a/8.9.3) with ESMTP id BAA11703
	for <mtd@infradead.org>; Sat, 10 Jun 2000 01:42:33 +0600 (ESS)
Date: Sat, 10 Jun 2000 01:42:30 +0600
From: Dmitry Kargapolov <dk@gentex.ru>
Reply-To: Dmitry Kargapolov <dk@gentex.ru>
Message-ID: <271.000610@gentex.ru>
To: mtd@infradead.org
Subject: DOC2000 lilo-boot question
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello.
Some days ago I tested last (from CVS archive)
version of MTD. I used kernel 2.3.99 with
patch mtd-20000131-against-2.3.41.diff.gz + some
manual fixes + update kernel files from the
last CVS archive.
Kernel was successfully compiled, and my DiskOnChip
was detected during the booting.
I can read and write DOS partition on my DOC using /dev/nftla1,
I can create Linux native file system and successfully use it.

BUT! When I create Linux FS (type 83) by fdisk /dev/nftla
command, I LOSE compability with original DOC firmware (doc123.exb),
and system did not boot from flash.

When I use original M-System's driver (/dev/fla)
with 2.2.14 kernel for create linux FS on DOC,
I can boot both: 2.2.14 kernel with /dev/fla support
and 2.3.99 kernel with /dev/nftla support.

Can I create DOC boot disk with lilo-mtd
using /dev/nftla? Or NFTL-MTD is not compatible
with DOC firmware? (I use doc123.exb)

sincerely,
Dmitry Kargapolov        dk@gentex.ru, ICQ 54000305




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
