Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13veoV-0004bw-00
	for mtd-list@infradead.org; Tue, 14 Nov 2000 12:03:47 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13veoI-0004bB-00
	for mtd@infradead.org; Tue, 14 Nov 2000 12:03:44 +0000
Message-ID: <01C04E3A.C0282520@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: JEDEC support broken?
Date: Tue, 14 Nov 2000 12:59:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

With several patches, I'm able to compile most of the MTD devices and chip drivers 
for uClinux now. There are problems with jedec.c, the compiler complains about 
the missing "bank_size" in the "map_info" structure. What's wrong with jedec.c?

Is there a driver that is able to use a physically mapped flash that doesn't support
CFI? I think it would be best to probe for CFI, and then for JEDEC in physmap.c.

-Erwin





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
