Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OcoG-0003oH-00
	for mtd-list@infradead.org; Tue, 15 Aug 2000 10:15:00 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13OcoE-0003oB-00
	for mtd@infradead.org; Tue, 15 Aug 2000 10:14:59 +0100
Received: from cygnus.co.uk (IDENT:dwmw2@localhost [127.0.0.1])
	by passion.cygnus.co.uk (8.9.3/8.9.3) with ESMTP id KAA16829
	for <mtd@infradead.org>; Tue, 15 Aug 2000 10:14:56 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: mtd@infradead.org
Subject: Suspension of disbel^H^H^H^H^H^H erases.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Aug 2000 10:14:56 +0100
Message-ID: <16826.966330896@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I just committed the code to suspend in-progress erases on Intel CFI chips. 

I haven't actually tested this version - I am working with an older 
snapshot of the MTD code, and this is a forward-port. It compiles, though - 
what more do you want? 

:)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
