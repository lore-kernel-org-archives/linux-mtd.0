Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11cYc7-00073e-00
	for mtd@infradead.org; Sat, 16 Oct 1999 19:31:31 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 11cYc7-00029X-00
	for mtd@infradead.org; Sat, 16 Oct 1999 19:31:31 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11cYc7-0006IO-00; Sat, 16 Oct 1999 19:31:31 +0100
To: mtd@infradead.org
Subject: Intended submission to Linus.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 16 Oct 1999 19:31:31 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11cYc7-0006IO-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've fixed up the MTD system to compile with the 2.3.22 kernel, and have it 
happily booting and interoperating with the builtin BIOS.

I'm intending to submit it to Linus fairly shortly, so if anyone else has 
updates which they'd like to be included, please let me have them ASAP.

Hopefully I haven't missed the feature freeze - after all, it's 'only' a new 
set of drivers, not a fundamental change.

----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
