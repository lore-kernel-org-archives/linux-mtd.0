Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1Kcp-0000Pe-EN
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 03:33:36 -0500
Received: from custom-daemon.mailout1.samsung.com by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	id <0IBZ00L08X3VTQ@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 17:33:31 +0900 (KST)
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IBZ00K5PX3U5T@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 17:33:30 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPSA id <0IBZ00031X3UXW@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 17:33:30 +0900 (KST)
Date: Wed, 16 Feb 2005 17:33:30 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: tglx@linutronix.de
Message-id: <!~!UENERkVCMDkAAQACACsBAAAAAAAAOKG7EAXlEBqhuwgAKypWwgAARU1TTURCLkRMTAAAAAAAAAAAG1X6IKpmEc2byACqAC/EWgwAAABTV0NFTQAvbz1zd2NlbnRlci9vdT1GaXJzdCBBZG1pbmlzdHJhdGl2ZSBHcm91cC9jbj1SZWNpcGllbnRzL2NuPWttcGFyawDYNSHzpwAAAAEAAAAUAAAAYwAAAC9vPXN3Y2VudGVyL291PUZpc>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] Remove duplicated Samsung NAND 512MiB 3,3V 8-bit device ID
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Remove duplicated Samsung NAND 512MiB 3,3V 8-bit device ID.
	Correct device ID is defined following.
	{"NAND 512MiB 3,3V 8-bit",      0xDC, 0, 512, 0,
NAND_SAMSUNG_LP_OPTIONS | NAND_NO_AUTOINCR},

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

diff -u -r1.1.1.1 nand_ids.c
--- drivers/mtd/nand/nand_ids.c 13 Jan 2005 06:51:14 -0000      1.1.1.1
+++ drivers/mtd/nand/nand_ids.c 16 Feb 2005 08:19:48 -0000
@@ -62,8 +62,6 @@

        {"NAND 256MiB 3,3V 8-bit",      0x71, 512, 256, 0x4000, 0},

-       {"NAND 512MiB 3,3V 8-bit",      0xDC, 512, 512, 0x4000, 0},
-
        /* These are the new chips with large page size. The pagesize
        * and the erasesize is determined from the extended id bytes
        */
