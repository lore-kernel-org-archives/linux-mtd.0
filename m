Received: from [207.209.118.131] (helo=MSI-EX6.msu.m-sys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18T9pA-0004wh-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Dec 2002 00:00:00 +0000
Message-ID: <87F9EFDE786B68428C807B4F74CC348105573C@msi-ex6.msu.m-sys.com>
From: Vadim Khmelnitsky <vadim.khmelnitsky@m-sys.com>
To: 'lhl' <lhl@phy.ccnu.edu.cn>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Is DiskOnChip IDE pro a MTD Device?
Date: Mon, 30 Dec 2002 16:27:42 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
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

Diskonchip IDE Pro is an IDE device ( like a regular harddisk ) .
It does not require MTD driver . You should treat it as a regular harddisk .

Vadim.

-----Original Message-----
From: lhl [mailto:lhl@phy.ccnu.edu.cn]
Sent: Mon, December 30, 2002 3:54 AM
To: linux-mtd@lists.infradead.org
Subject: Is DiskOnChip IDE pro a MTD Device?


linux-mtd

         I wanna make a JFFS/JFFS2 on My DiskOnChip Ide Pro,while the JFFS2
is used only for the MTD
Device,how can my kernel read it to a MTD device?


regards
            lhl
            lhl@phy.ccnu.edu.cn


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
