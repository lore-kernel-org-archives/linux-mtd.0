Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMLuf-0005D2-1F
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 14:05:50 +0000
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
	by mailout1.w1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L3R00A5935MU0@mailout1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
	by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul
	14 2004)) with ESMTPA id <0L3R000ZW35LW0@spt1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Date: Wed, 09 Jun 2010 16:05:30 +0200
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Samsung OneNAND updates
To: linux-mtd@lists.infradead.org
Message-id: <1276092335-3245-1-git-send-email-m.szyprowski@samsung.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN
Content-transfer-encoding: 7BIT
Cc: kyungmin.park@samsung.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This short patch series updates OneNAND framework and Samsung SoC
OneNAND driver. The first two makes a little cleanup in the framework
and the driver, while the next two adds support for runtime badblock
check feature.

This patch series includes:

[PATCH 1/4] OneNAND: Introduce chip_probe function
[PATCH 2/4] s5pc110: Implement s5pc110 chip_probe for OneNAND probe
[PATCH 3/4] OneNAND: Add runtime badblock check feature
[PATCH 4/4] s5pc110: OneNAND runtime badblock check

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
