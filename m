Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12neBu-0003bF-00
	for mtd-list@infradead.org; Fri, 05 May 2000 10:14:34 +0100
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12neBt-0003b9-00
	for mtd@infradead.org; Fri, 05 May 2000 10:14:33 +0100
Received: from localhost (alex@localhost)
	by tammy.signum.se (8.9.3/8.9.3) with ESMTP id KAA01091
	for <mtd@infradead.org>; Fri, 5 May 2000 10:07:29 +0200
Date: Fri, 5 May 2000 10:07:29 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org
Subject: try_inc_mod_count not exported to modules in 2.3
Message-ID: <Pine.LNX.4.10.10005051006260.1087-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I have some problems using the latest mtd cvs as modules:

insmod mtdblock.o 
mtdblock.o: unresolved symbol try_inc_mod_count

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
