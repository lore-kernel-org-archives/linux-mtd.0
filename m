Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142Q2d-0007uB-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 03:42:19 +0000
Received: from po3.glue.umd.edu ([128.8.10.123])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142Q2c-0007u5-00
	for mtd@infradead.org; Sun, 03 Dec 2000 03:42:18 +0000
Received: from y.glue.umd.edu (IDENT:root@y.glue.umd.edu [128.8.10.68])
	by po3.glue.umd.edu (8.10.1/8.10.1) with ESMTP id eB33gFw18124
	for <mtd@infradead.org>; Sat, 2 Dec 2000 22:42:15 -0500 (EST)
Received: from y.glue.umd.edu (IDENT:sendmail@localhost [127.0.0.1])
	by y.glue.umd.edu (8.9.3/8.9.3) with SMTP id WAA14163
	for <mtd@infradead.org>; Sat, 2 Dec 2000 22:42:15 -0500 (EST)
Received: from localhost (agnew@localhost)
	by y.glue.umd.edu (8.9.3/8.9.3) with ESMTP id WAA14159
	for <mtd@infradead.org>; Sat, 2 Dec 2000 22:42:14 -0500 (EST)
Date: Sat, 2 Dec 2000 22:42:14 -0500 (EST)
From: Adam Agnew <agnew@glue.umd.edu>
To: mtd@infradead.org
Subject: including doc2001 and docprobe into the kernel
In-Reply-To: <20001202085419.I4457@www.easysolutions.net>
Message-ID: <Pine.GSO.4.21.0012022229390.14865-100000@z.glue.umd.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

when I try to include the millenium code right into the kernel along with
the ntfl layer, etc i get errors 
drivers/mtd/mtdlink.o: In function `DoC_Probe':
drivers/mtd/mtdlink.o(.text+0x26da): undefined reference to
`inter_module_get_request'
drivers/mtd/mtdlink.o(.text+0x26f9): undefined reference to
`inter_module_put'
drivers/mtd/mtdlink.o: In function `init_doc2001':
drivers/mtd/mtdlink.o(.text.init+0x75): undefined reference to
`inter_module_register'
make: *** [vmlinux] Error 1

I included all the module support etc... any ideas? The error goes away
when i compile the millenium driver as a module of course.
- adam agnew



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
