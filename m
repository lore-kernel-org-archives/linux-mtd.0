Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dzJy-0007P5-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 21:00:34 +0000
To: <linux-mtd@lists.infradead.org> 
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Q: Pushing code to 2.4.x 
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 29 Jan 2003 14:32:23 -0700
Message-ID: <m3wuknzlp4.fsf@lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

What is the plan for keeping the kernel and the CVS tree more or less in sync?

There are currently some large divergences, to the point there are some
chips that I can use the cfi_cmdset_0002.c from the stable 2.4.x kernel mtd tree
but not from the recent CVS tree.

In addition on the boards I support LinuxBIOS on I ensure there are kernel
mtd drivers that allow people to flash their BIOS rom.  And my customers would
like to see those drivers in the stock kernel.

For the short term I can release and maintain patch where everything works,
the question is what should my long term strategy be.

A) Push to the MTD cvs repository and let David Woodhouse push to Marcelo.
B) Push to the MTD cvs repository and push directly to Marcelo.
C) Some more involved coordination of the MTD drivers.

With LinuxBIOS becoming a fully supported product I expect to continually
have more board and more little rom chips that I am making certain work.

Eric
