Return-path: <David.Woodhouse@mvhi.com>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xKKF-0001b1-00
	for mtd-list@infradead.org; Mon, 13 Dec 1999 01:30:55 +0000
Received: from [216.211.97.50] (helo=gizmo.adis.on.ca ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xKKD-0001av-00
	for mtd@infradead.org; Mon, 13 Dec 1999 01:30:53 +0000
Received: from localhost.localdomain (IDENT:adi@[192.168.100.2])
	by gizmo.adis.on.ca (8.9.3/8.9.3) with ESMTP id TAA03545
	for <mtd@infradead.org>; Sun, 12 Dec 1999 19:24:19 -0600
Date: Sun, 12 Dec 1999 19:38:47 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: mtd@infradead.org
Subject: DOC2000 and 2.2.12 kernel
Message-ID: <Pine.LNX.4.10.9912121928210.1131-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I am new to using the DOC2000 devices. I successfully patched the 2.2.12
kernel with the M-Systems provided binary driver. But I can't get plilo to
compile. I understand distributing the kernel patched with a binary driver
will violate the GPL license.

Now I am looking at mtd. I am lost in its documentation. Now I have a
bunch of questions:

1. Is mtd a kernel patch? if so, how to I apply it to the kernel?
2. Which devices do I have to create to access the doc2000? 
3. Does mtd require the doc2000 firmaware which conflicts with lilo?

Regards,
Adi



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
