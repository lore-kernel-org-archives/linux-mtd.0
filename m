Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHqPI-0007UQ-21
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 18:16:17 -0400
Received: from cmsout01.mbox.net (cmsout01.mbox.net [165.212.64.31])
	by cmsout01.mbox.net (Postfix) with ESMTP id 61D13780A0
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2005 22:16:06 +0000 (GMT)
Message-ID: <012801c5be31$a90e5190$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 20 Sep 2005 17:21:32 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: CRC failed on node  ....
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Running the 2.4.20 kernel, after a power outage 2 of my test units get boot 
message mount errors:

jffs2_scan_dirent_node(): Name CRC failed on node at 0x00b620c8: Read 
0x640c8ca3, calculated 0x795111fe
jffs2_scan_dirent_node(): Name CRC failed on node at 0x00eaf1e0: Read 
0x16f2116a, calculated 0x0622ba51

The units seem to boot fine, but I'm sure there are probably files I can no 
longer access on the file system.

Is this possibly from JFFS2 running garbage collection when the power is 
removed?  Is there an MTD utility to fix this corruption _while_ the ROM is 
mounted?  Is there a work around ( like running "sync" every 5 minutes in 
cron )?

Thanks,

-Brian 
