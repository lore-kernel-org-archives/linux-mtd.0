Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1433S6-0005RQ-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 21:47:14 +0000
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1433S4-0005RK-00
	for mtd@infradead.org; Mon, 04 Dec 2000 21:47:12 +0000
Date: Mon, 4 Dec 2000 22:51:10 +0100
Message-Id: <200012042151.WAA13296@localhost.localdomain>
From: Jan Danielsson <jan@cendio.se>
To: LKhatskevitch@cachier.com
CC: rminnich@lanl.gov, mtd@infradead.org, linuxbios@lanl.gov
In-reply-to: <Pine.LNX.4.21.0012041436200.16124-100000@mini.acl.lanl.gov>
	(message from Ronald G Minnich on Mon, 4 Dec 2000 14:36:55 -0700
	(MST))
Subject: Re: nftl/DoC Mill. root fs question
References: <Pine.LNX.4.21.0012041436200.16124-100000@mini.acl.lanl.gov>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

If you use the proc filesystem: try to let "/etc/mtab" be a soft-link
to "/proc/mounts".

  --Jan


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
