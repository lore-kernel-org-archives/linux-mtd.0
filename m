Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11DmLG-0002OE-00
	for mtd@infradead.org; Mon, 9 Aug 1999 11:07:42 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11DmLA-0002md-00; Mon, 9 Aug 1999 11:07:36 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11DmLA-00089S-00; Mon, 9 Aug 1999 11:07:36 +0100
To: mtd@infradead.org
Subject: DiskOnChip driver testing - any results?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Aug 1999 11:07:36 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11DmLA-00089S-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I note a few people have downloaded the driver I released on Friday night, but 
I've had no feedback.

Granted, it's only a quick hack to see if I understood the docs correctly, and 
it's going to get a complete rewrite - but I'd still like to know whether it 
works on anything but the devices I've tried it on.

So - does it work for you? As far as I'm aware, it should work on all sizes of 
DiskOnChip 2000, except the ones with Samsung flash in - those will be added 
as soon as I've downloaded the relevant datasheets.







----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
