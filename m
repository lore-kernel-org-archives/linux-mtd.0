Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12H2r6-0005EE-00
	for mtd-list@infradead.org; Sat, 05 Feb 2000 10:54:20 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12H2r5-0005E8-00
	for mtd@infradead.org; Sat, 05 Feb 2000 10:54:19 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12H2r4-0001cv-00
	for mtd@infradead.org; Sat, 05 Feb 2000 10:54:18 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12H2r4-0003lq-00; Sat, 5 Feb 2000 10:54:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Use NFTL with caution.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 05 Feb 2000 10:54:18 +0000
Message-ID: <14497.949748058@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I've had a report of my NFTL code trashing a partition, so be careful with it.

I suspect that the reason it's working fine for me is because I format the 
device and only ever use it with my drivers. It's the interaction with the 
'official' drivers that seems to cause problems.

I'll look into it, but for now, be aware that there might be problems. 



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
