Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 138yTc-0002en-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 06:09:00 +0100
Received: from txn2-7.evoserve.com
	([210.16.11.7] helo=hut.evoserve.com ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 138yTa-0002ea-00
	for mtd@infradead.org; Mon, 03 Jul 2000 06:08:59 +0100
Received: from evoserve.com (rogelio@[210.16.15.22])
	by hut.evoserve.com (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA07489
	for <mtd@infradead.org>; Sat, 1 Jul 2000 20:39:34 +0800
Message-ID: <395DE67C.3276DD8@evoserve.com>
Date: Sat, 01 Jul 2000 20:39:24 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: problem with modprobe and other questions
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I successfully compiles mtd with the sources but i can not use modprobe
to load the modules. I did not apply the put_module_symbol... patch.
Should I also apply it? I can only use insmod.

I am using linux 2.2.16 and configured all of mtd as modules.

What parameters should I give to mknod to access mtd as a char device
and block device?

Would jffs also require a dev node? an



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
