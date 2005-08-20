Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E6GsA-0006Q5-Vw
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2005 20:06:13 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILH00A01UY3F1@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 20 Aug 2005 09:06:03 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILH00A5QUY3DW@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 20 Aug 2005 09:06:03 +0900 (KST)
Date: Sat, 20 Aug 2005 09:06:04 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0ILH00A5RUY3DW@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Subject: LTP fs test results on OneNAND
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

This is LTP 'fs' test results with OneNAND MTD.

Regards

Kyungmin Park

--

Test environments
	Target: OMAP5912 OSK
	RAM: 32MB
	Flash: OneNAND 1Gb
	Partitions:
		dev:    size   erasesize  name
		mtd0: 00020000 00020000 "X-Loader + U-Boot"
		mtd1: 00020000 00020000 "U-Boot Environment"
		mtd2: 00200000 00020000 "kernel"
		mtd3: 01000000 00020000 "filesystem0"
		mtd4: 06dc0000 00020000 "filesystem1"

Test Start Time: Thu Aug 18 20:38:20 2005
-----------------------------------------
Testcase                       Result     Exit Value
--------                       ------     ----------
gf01                           PASS       0
gf02                           PASS       0
gf03                           PASS       0
gf04                           PASS       0
gf05                           PASS       0
gf06                           PASS       0
gf07                           PASS       0
gf08                           PASS       0
gf09                           PASS       0
gf10                           PASS       0
gf11                           PASS       0
gf12                           PASS       0
gf13                           PASS       0
gf14                           PASS       0
gf15                           PASS       0
gf16                           PASS       0
gf17                           PASS       0
gf18                           PASS       0
gf19                           PASS       0
gf20                           PASS       0
gf21                           PASS       0
gf22                           PASS       0
gf23                           PASS       0
gf24                           PASS       0
gf25                           PASS       0
gf26                           PASS       0
gf27                           PASS       0
gf28                           PASS       0
gf29                           PASS       0
gf30                           PASS       0
rwtest01                       FAIL       2
rwtest02                       FAIL       2
rwtest03                       FAIL       2
rwtest04                       FAIL       2
rwtest05                       FAIL       2
iogen01                        PASS       0
fs_inod01                      PASS       0
openfile01                     PASS       0
inode01                        PASS       0
inode02                        PASS       0
stream01                       PASS       0
stream02                       PASS       0
stream03                       PASS       0
stream04                       PASS       0
stream05                       PASS       0
ftest01                        PASS       0
ftest02                        PASS       0
ftest03                        PASS       0
ftest04                        PASS       0
ftest05                        PASS       0
ftest06                        PASS       0
ftest07                        PASS       0
ftest08                        PASS       0

-----------------------------------------------
Total Tests: 54
Total Failures: 5
Kernel Version: 2.6.13-rc6-omap1
Machine Architecture: armv5tejl
Hostname: 192.168.116.119
