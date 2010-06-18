Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OPYV1-0008AQ-E9
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 10:08:36 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5IA5lIr021843
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2010 13:08:32 +0300
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] mtd: add mtd repartition ioctl
Date: Fri, 18 Jun 2010 13:08:27 +0300
Message-Id: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding mtd master device after all partitions should provide
minimum effect on the created partition enumeration.

The master mtd device can be repartitioned in runtime through
the mtd ioctl MTDREPARTITION. The ioctl passed argument is
the set of the new partitions defined by the structures:
struct mtd_partitions and struct mtd_partition_user.

All at once partition configuration is used and caused by
the all at once partition removing. Only unused partitions are deleted.
If any of the partitions for given mtd device is used then user gets error.
The care should be taken to close all applications which access
the partitions.

Roman Tereshonkov (4):
  mtd: add new ioctl structures to be used for repartitioning
  mtd: add the possibility to modify partitions in runtime
  mtd: add MTDREPARTITION ioctl
  mtd: create the mtd master device for given set of partitions

 drivers/mtd/mtdchar.c          |  110 +++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/mtdpart.c          |   45 ++++++++++++++--
 drivers/mtd/onenand/omap2.c    |    8 ++-
 include/linux/mtd/partitions.h |    2 +
 include/mtd/mtd-abi.h          |   15 ++++++
 5 files changed, 170 insertions(+), 10 deletions(-)
