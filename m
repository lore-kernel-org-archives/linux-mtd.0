Received: from terra.microlab.uccb.ca ([142.12.27.106] helo=localhost.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Q9c4-0006vO-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Jul 2002 17:37:48 +0100
Received: from localhost.localdomain ([142.12.27.251])
	by localhost.localdomain (8.11.6/8.11.6) with ESMTP id g64Fjp201561
	for <linux-mtd@lists.infradead.org>; Thu, 4 Jul 2002 12:45:51 -0300
Subject: MTD support for the ep405 board?
From: Daniel Merritt <dmerritt@microlab.uccb.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Jul 2002 13:37:47 -0300
Message-Id: <1025800667.7218.3.camel@debian>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

	I've compiled 2.4.18 for the PPC EP405 board, and have included AMD
flash support in the MTD options, but I'm not seeing any indication that
the kernel is picking them up, even with the mtd verbosity set to 3.
Should the kernel be echoing something if it finds the flash? Is the
EP405 supported?

Thank you for your time,
Daniel Merritt
