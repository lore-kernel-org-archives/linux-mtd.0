Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12G4uo-000643-00
	for mtd-list@infradead.org; Wed, 02 Feb 2000 18:54:10 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12G4un-00063x-00
	for mtd@infradead.org; Wed, 02 Feb 2000 18:54:09 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12G4uj-0006vJ-00
	for mtd@infradead.org; Wed, 02 Feb 2000 18:54:05 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12G4ui-0005Lz-00; Wed, 2 Feb 2000 18:54:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: A change I forgot to mention...
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 Feb 2000 18:54:04 +0000
Message-Id: <E12G4ui-0005Lz-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I also removed the cli() from the NFTL block driver in Monday's release - it 
no longer runs with interrupts disabled.

There's more work to be done on threading it properly - it stills busy-waits 
for the ERASE operation, for example, but it's a good start.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
