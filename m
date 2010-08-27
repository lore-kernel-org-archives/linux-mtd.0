Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oop6z-0006Ks-3Q
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 02:56:15 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L7S006QEISFB7E0@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:27 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L7S00058ISGSY@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:28 +0900 (KST)
Date: Fri, 27 Aug 2010 11:55:23 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 0/3] MTD: OneNAND: Fix OneNAND DMA error handling and 2KiB
	pagesize
To: linux-mtd@lists.infradead.org
Message-id: <20100827025523.GA10688@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park (3):
      MTD: OneNAND: Remove unused cmd_map at s5pc110
      MTD: OneNAND: Fix loop hang when DMA error at Samsung SoCs
      MTD: OneNAND: Fix 2KiB pagesize handling at Samsung SoCs

 drivers/mtd/onenand/samsung.c |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)
