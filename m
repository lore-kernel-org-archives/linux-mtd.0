Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0XP2-00085b-Ag
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 10:27:16 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9G004K6D13WI50@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 19:27:03 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9G002Y0D13ZC@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 19:27:03 +0900 (KST)
Date: Tue, 28 Sep 2010 19:26:54 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH v2 0/3] mtd: OneNAND: S5PC100/S5PC110 Updates
To: linux-mtd@lists.infradead.org
Message-id: <20100928102654.GA30178@july>
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

The following changes since commit 5e999254f1894da542e7200b968fcfeec162478e:
  Rohit Hassan Sathyanarayan (1):
        mtd: MLC device check in OneNAND driver

Kyungmin Park (3):
      MTD: OneNAND: S5PC100: Only S5PC110 use the command map method
      MTD: OneNAND: S5PC110: Fix wrong DMA hanlding when HIGHMEM
      MTD: OneNAND: S5PC110: Implement DMA interrupt method

 drivers/mtd/onenand/samsung.c |  118 ++++++++++++++++++++++++++++++++++++-----
 1 files changed, 104 insertions(+), 14 deletions(-)
