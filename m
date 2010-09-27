Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P082P-0001pB-Mz
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 07:22:14 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9E00CAP9SZAKC0@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:11 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9E00ISR9SZ9V@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:11 +0900 (KST)
Date: Mon, 27 Sep 2010 16:24:31 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 0/4] MTD: OneNAND: Fix samsung SoCs various bugs
To: linux-mtd@lists.infradead.org
Message-id: <20100927072431.GA32076@july>
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

The following changes since commit 32163f4b2cef28a5aab8b226ffecfc6379a53786:
  Al Viro (1):
        alpha: fix usp value in multithreaded coredumps

Kyungmin Park (4):
      MTD: OneNAND: Remove unused cmd_map at s5pc110
      MTD: OneNAND: S5PC100: Only S5PC110 use the command map method
      MTD: OneNAND: S5PC110: Fix wrong DMA hanlding when HIGHMEM
      MTD: OneNAND: S5PC110: Add timeout to prevent the endless loop

 drivers/mtd/onenand/samsung.c |   45 +++++++++++++++++++++++++++-------------
 1 files changed, 30 insertions(+), 15 deletions(-)
