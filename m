Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11cXhe-000700-00
	for mtd@infradead.org; Sat, 16 Oct 1999 18:33:10 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 11cXhd-0001wP-00
	for mtd@infradead.org; Sat, 16 Oct 1999 18:33:09 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11cXhd-0005iE-00; Sat, 16 Oct 1999 18:33:09 +0100
To: mtd@infradead.org
Subject: DiskOnChip interoperability.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 16 Oct 1999 18:33:09 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11cXhd-0005iE-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've finally managed to make some time to work on the problems of 
interoperability between the M-Systems drivers and my own.

Unfortunately, I can't seem to reproduce the problems. If I generate the NFTL 
using their DFORMAT program, then mount it and write it lots with my driver, 
then their drivers still recognise the device as a valid NFTL.

Theoretically, this is a good thing, but I'm sure it didn't work before. 

If anyone else can give me a script which will reliably cause the M-Systems 
driver to fail to recognise the NFTL after my driver's been writing to it, 
that would be very useful.

I'll keep playing in the meantime.

----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
