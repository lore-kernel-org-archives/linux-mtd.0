Received: from [64.169.151.140] (helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fLHb-0004HP-00
	for <linux-mtd@lists.infradead.org>; Sun, 02 Feb 2003 14:39:43 +0000
Message-Id: <5.1.0.14.0.20030202082532.02427e68@64.170.22.132>
Date: Sun, 02 Feb 2003 08:39:30 -0600
To: MTD for Linux <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Mime-Version: 1.0
Subject: mtd partition1 corruption during writes to JFFS2 on partition2.
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

I've got multiple mtd partitions on one NOR flash device (CFI/AMD).

I've got JFFS2 fs mounted on the last partition. The other partitions hold 
compressed firmware, that I intent upgrade while JFFS2 is being written to.

However, I find that if I write to the mtd device(s) (erase, followed by 
dd) and then reboot, the firmware is corrupt.
If I stop writes to the JFFS2 partition before upgrading the firmware on 
the mtd partitions, everything is ok every time.

Is this a known "feature"?
Ideas?

TIA

Vipin
