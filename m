Return-path: <David.Woodhouse@mvhi.com>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10kaGE-0002hE-00
	for mtd@imladris.mvhi.com; Thu, 20 May 1999 22:21:50 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@imladris.mvhi.com
	id 10kaGE-0003oZ-00; Thu, 20 May 1999 22:21:50 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@imladris.mvhi.com
	id 10kaGD-0004A7-00; Thu, 20 May 1999 22:21:49 +0100
To: mtd@imladris.mvhi.com
Subject: Disk-On-Chip progress.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 May 1999 22:21:49 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10kaGD-0004A7-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

I seem to be able to read the flash. I can also detect the presence of a 
Disk-On-Chip. I can't yet work out the size of the DOC automatically, or 
decode the filesystem on it.

There are some files in ftp://imladris.mvhi.com/pub/mtd/DOCdocs/ which may be 
useful.

BIOS-startupcode.asm: Disassembly of the BIOS ROM which loads the main code 
		from flash. It's this on which I based the C code.

linuxdriver.asm: A disassembly of the binary-only Linux driver, with as many 
		symbols put back in for readability as possible. 

doc-kernel.c: My preliminary kernel driver for the beast. It appears to be 
		able to read lots of interesting stuff off the DoC. Strangely,
		I can't see anything on there that looks even vaguely like FTL,
		so perhaps I'm missing something.



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
