Received: from barry.mail.mindspring.net ([207.69.200.25])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190pCI-00072r-Vp
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 21:51:03 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 2 Apr 2003 15:51:06 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGMEHADCAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: _DoC_WaitReady timed out -- is this the correct way to handle it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During bootup I get the following messages relating to my
DiskOnChip device:

Using configured DiskOnChip probe address 0xf1000000
DiskOnChip Millennium found at address 0xF1000000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
_DoC_WaitReady timed out.
_DoC_WaitReady timed out.
_DoC_WaitReady timed out.
DoC_Command (reset) for 1,0 returned true
_DoC_WaitReady timed out.
_DoC_WaitReady timed out.
_DoC_WaitReady timed out.
DoC_Command (reset) for 2,0 returned true
_DoC_WaitReady timed out.
_DoC_WaitReady timed out.
_DoC_WaitReady timed out.
DoC_Command (reset) for 3,0 returned true
1 flash chips found. Total DiskOnChip size: 8 MiB
mtd: Giving out device 0 to DiskOnChip Millennium
NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip Millennium
.......

The problem is that the timeouts associated with the
"_DoC_WaitReady timed out." messages are greatly increasing the
bootup time (about 2 additional minutes).  It is running DoC_ScanChips(),
which is calling DoC_IdentChip(), which is timing out on a reset command,
very slowly.

One entry in the archives mentioned checking fewer floors, so I 
reduced the number of floors being checked from 4 to 1.  It now runs
fast enough, but I would like to know if this is the correct way to
go about handling this "long timeout" issue, or if there is a cleaner
approach.

Thanks very much,
Chuck
