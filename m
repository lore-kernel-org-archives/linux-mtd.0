Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhtNk-0000oa-71
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:05:24 -0400
Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhnNG-00087r-6J
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 11:40:30 +0100
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1BhnMt-0007WU-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Jul 2004 12:40:09 +0200
Received: from calvin.codito.com ([203.199.140.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Jul 2004 12:40:07 +0200
Received: from amitshah by calvin.codito.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Jul 2004 12:40:07 +0200
To: linux-mtd@lists.infradead.org
From: Amit Shah <amitshah@gmx.net>
Date: Tue, 06 Jul 2004 15:56:45 +0530
Message-ID: <ccdut4$do6$2@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Sender: news <news@sea.gmane.org>
Subject: Accessing flash on a PCI card
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have a PCI card that has Intel Flash. I've cooked up a small driver (the
host kernel is 2.6.6) that iomaps the base address exported by the PCI BARs
and can verify that it's an intel flash by doing some config- write and
read sequences.

I now want to export the flash to userspace for reading / writing to the
flash. I guess it would be better to let MTD handle the stuff than me doing
things all over again. So, how can I access that flash memory over the PCI
with MTD?

Thanks for any hints,
Amit.
-- 
Amit Shah
http://amitshah.nav.to/
