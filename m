Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12slR8-0001Yn-00
	for mtd-list@infradead.org; Fri, 19 May 2000 12:59:26 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12slR7-0001Yh-00
	for mtd@infradead.org; Fri, 19 May 2000 12:59:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: Erwin Authried <eauth@softsys.co.at>
Subject: Compatibility issues.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 19 May 2000 12:59:23 +0100
Message-ID: <21995.958737563@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I would like to have as few occurrences of #if LINUX_VERSION_CODE ... in 
the actual source code of the MTD stuff as possible.

The 2.2.15 kernel contains a new file linux/compatmac.h which provides a 
handful of useful macros which allow you to write portable code.

This is what I've been using for ensuring compatibility between 2.2 and 2.3 
code, and I'd like to provide a similar linux/compatmac.h file to allow us 
to compile for 2.0 as well.

I've added linux/mtd/compatmac.h which currently contains the definitions 
which are missing from Linus' version - but I'd like my file to become 
obsolete as all the required definitions are accepted into the 'official' 
version of compatmac.h in both the 2.0 and 2.2 kernels.

So I've removed all references to the sysdep-2.[12].h files, and moved some 
of the extra definitions into our own mtd/compatmac.h.

If more are required for fixing the 2.0 build, I'd prefer that they be 
added to mtd/compatmac.h, and we can soon delete the sysdep-2.[12].h files 
from the repository.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
