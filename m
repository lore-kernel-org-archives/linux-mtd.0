Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlOM4-0000vW-D2
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2005 10:50:41 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 23 Jun 2005 11:51:23 +0200
Message-Id: <1119520283.304.104.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alice Hennessy <ahennessy@mvista.com>
Subject: Scheduled driver removal
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Following drivers are scheduled for removal on 
June 30th without further notice:

drivers/mtd/nand/txtx4925ndfmc.c
drivers/mtd/nand/tx4938ndfmc.c 

Reason:

The drivers are _not_ compilable as the necessary include files are
missing in the MTD CVS and in the mainline kernel.

I requested an update / status information from the original developer
in March 2005. I was told, that the current maintainer will contact me
about this issue.

I have not heard back yet, so I deduce that there is no interest to keep
the code in the repository.

tglx
