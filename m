Received: from host10.216.41.24.conversent.net ([216.41.24.10]
	helo=acmepacket.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CYnG5-0000SI-4Z
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2004 10:16:10 -0500
From: "Andrew Carlisle" <ACarlisle@acmepacket.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 29 Nov 2004 10:15:53 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200411291024906.SM01112@ACarlisle>
Subject: Multiple banks of flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have two banks of flash that are physically located at different
locations.  I have successfully mapped one bank.  I can also map the other
bank, but the problem is that I can't map both the banks simultaneously.

I went into physmap.c and modified init_physmap() so that it basically does
the same thing twice, two probes, two partition searches, but it doesn't
seem to work mapping two banks which are located at different address mapped
in at the same time.

I am using the Monta Vista 2.6 version of the kernel.

 
Thanks,

Andy
