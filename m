Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11EEZN-0003Bx-00
	for mtd@infradead.org; Tue, 10 Aug 1999 17:16:09 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11EEZN-0004Is-00; Tue, 10 Aug 1999 17:16:09 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11EEZN-0007TN-00; Tue, 10 Aug 1999 17:16:09 +0100
To: mtd@infradead.org
Subject: wordsize and endianness issues.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 10 Aug 1999 17:16:09 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11EEZN-0007TN-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've just ported the MTD code to Linux/Alpha. The patches are up for FTP, 
along with an updated tarball. I'll put up an anoncvs server if people are 
interested.

Unfortunately, I've got no big-endian machines here to test on. Does anyone 
want to volunteer to test code on a big-endian machines?


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
