Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 138yTD-0002eg-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 06:08:35 +0100
Received: from txn2-7.evoserve.com
	([210.16.11.7] helo=hut.evoserve.com ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 138yTA-0002ea-00
	for mtd@infradead.org; Mon, 03 Jul 2000 06:08:33 +0100
Received: from evoserve.com (rogelio@[210.16.15.22])
	by hut.evoserve.com (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA00741
	for <mtd@infradead.org>; Sat, 1 Jul 2000 22:25:43 +0800
Message-ID: <395DFF5D.7E94107@evoserve.com>
Date: Sat, 01 Jul 2000 22:25:33 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: problems using mtd and doc2000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have successfully compiled the mtd drivers as modules but it wont load
with modprobe only insmod. I used the latest CVS snapshot and linux
2.2.16.

What device major no should i use for /dev/mtd0?

I cant do anything because my /dev/mtd0 is not workin. How should I get
it to work? Is loading mtdcore enough?

When I try to use DOC_loadbios it only says "Open flash device : No such
device".





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
