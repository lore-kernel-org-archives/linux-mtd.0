Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OPXl7-0006YP-4d
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 09:21:09 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OPXl1-0006wl-AV
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 11:21:03 +0200
Received: from amg-holding.md ([89.28.62.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2010 11:21:03 +0200
Received: from egorkat by amg-holding.md with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2010 11:21:03 +0200
To: linux-mtd@lists.infradead.org
From: Egorkat <egorkat@gmail.com>
Subject: prepare DiskOnChip
Date: Fri, 18 Jun 2010 09:20:55 +0000 (UTC)
Message-ID: <loom.20100618T111420-702@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good day, All!

Could you please advise me a correct way to prepare DoC MD2201-D72 for use under
Linux?

I can format it under DOS with dformat utility in different ways, even like a
floppy. But when I try modprobe nftl after successfully modprobe diskonchip, it
fails or hungs with different errors. 
I've read and old how-to's, based on 2.4 kernel and old doc2000 driver, and new
ones. Kernel is compiled to support new MTD modules.
What do I do wrong...

Please enlighten me, I'm now out of ideas. Any logs, tests, configs and dumps
will be provided immediately.

Regards!
