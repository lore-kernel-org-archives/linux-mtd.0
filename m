Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13C9ya-00063m-00
	for mtd-list@infradead.org; Wed, 12 Jul 2000 01:02:08 +0100
Received: from txn2-19.evoserve.com
	([210.16.11.19] helo=hut.evoserve.com ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13C9yX-000633-00
	for mtd@infradead.org; Wed, 12 Jul 2000 01:02:06 +0100
Received: from evoserve.com (rogelio@[210.16.15.22])
	by hut.evoserve.com (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA01126
	for <mtd@infradead.org>; Tue, 11 Jul 2000 02:34:09 +0800
Message-ID: <396A1716.DD54E9C4@evoserve.com>
Date: Tue, 11 Jul 2000 02:33:58 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: inode alignment in flash
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

How should the inodes magic number be aligned in flash? On page
boundaries? I have been using mkfs.jffs to create a jffs images. But
after mounting it successfully after thrashing some chunks, it wont
mount the second time i try. I notice that some chunks are discarded as
having invalid checksums and that results in severely reduced file
sizes. When I went over the sources, I keep on seeing blocks being
referred to in the switch construct inside jffs_scan_flash. Magic
numbers are then aligned on block boundaries?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
