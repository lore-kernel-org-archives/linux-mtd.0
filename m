Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FZBO-0003E5-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 10:33:26 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13FZBM-0003Dz-00
	for mtd@infradead.org; Fri, 21 Jul 2000 10:33:24 +0100
Received: from evoserve.com (gateway.evoserve.com [210.16.10.120])
	by athena.evoserve.com (8.9.3/8.9.3) with ESMTP id RAA09293
	for <mtd@infradead.org>; Fri, 21 Jul 2000 17:35:24 +0800
Message-ID: <39781DE5.F2C71069@evoserve.com>
Date: Fri, 21 Jul 2000 17:54:46 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: multipl page read & write support
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have just completed coding multi page read and write support into mtd.
JFFS now works on DOC and Im doing more tests and looking for more bugs.
Ill post patches after some more brutal tests. I hope my changes doesnt
break NFTL. I also modified JFFS adding the copy_from_user stuff etc.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
