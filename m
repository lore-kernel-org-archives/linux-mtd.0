Received: from mail145.messagelabs.com ([216.82.245.115])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1INOia-0005NF-PB
	for linux-mtd@lists.infradead.org; Tue, 21 Aug 2007 04:04:06 -0400
Received: from [192.168.65.61] (unknown [192.168.65.61])
	by mail.magtech.com.au (Postfix) with ESMTP id 89CEA8947CE
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Aug 2007 18:03:59 +1000 (EST)
Message-ID: <46CA9C6F.3080604@magtech.com.au>
Date: Tue, 21 Aug 2007 18:03:59 +1000
From: Aras Vaichas <arasv@magtech.com.au>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: best IO Scheduler for MTD based embedded systems
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

What is the recommended kernel "IO Scheduler" for a system with, say, JFFS2 on 
NAND Flash that is basically running a single application for most of its life?

In our current system we've been using the NOOP (i.e. nothing) scheduler. I'm 
currently reviewing and upgrading the kernel so I was wondering if this was the 
best choice?


Aras

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
