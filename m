Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12YU6k-0007hr-00
	for mtd-list@infradead.org; Fri, 24 Mar 2000 13:26:34 +0000
Received: from [202.112.136.2] (helo=dns.pubnic.buaa.edu.cn)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12YU6h-0007hT-00
	for mtd@infradead.org; Fri, 24 Mar 2000 13:26:31 +0000
Message-ID: <004701bf958c$4bedd0e0$5800a8c0@pita>
From: "jyllyj" <jyllyj@buaa.edu.cn>
To: <mtd@infradead.org>
Cc: <trevw@zentropix.com>
Subject: can't open /dev/nftla1 (kernel 2.2.14)
Date: Fri, 24 Mar 2000 20:26:16 +0800
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

hello friend,
    I compile MTD into kernel 2.2.14.at begin .i can deal with /dev/nftla
(fdisk mount...).
but when i copy some file into it
like it
mount -t ext2 /dev/nftla1 /mnt
cp somefile /mnt
umount /mnt
reboot
now i can't fdisk /dev/nftla1 .it show me that can't open /dev/nftla1
why?


regards.
    jiang yue long






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
