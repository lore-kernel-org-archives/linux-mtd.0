Received: from smtp6-g21.free.fr ([212.27.42.6])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QYDpR-00029C-KG
	for linux-mtd@lists.infradead.org; Sun, 19 Jun 2011 08:58:02 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	Artem.Bityutskiy@nokia.com
Subject: [PATCH v2 0/1] mtd/docg3: M-Systems DOC G3 support
Date: Sun, 19 Jun 2011 10:57:27 +0200
Message-Id: <1308473848-27065-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem and David,

I posted this 3 weeks ago, and unfortunately nobody commented the
submission.

This is the new version of the same driver, with only my own review
and Artem's comment on new mtd partitions API.
Please either comment or schedule for one of your linux-next tree, but
don't let it sleeping for weeks.

Cheers.

--
Robert

Robert Jarzmik (1):
  mtd: Add DiskOnChip G3 support

 drivers/mtd/devices/Kconfig  |   10 +
 drivers/mtd/devices/Makefile |    1 +
 drivers/mtd/devices/docg3.c  | 1138 ++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/devices/docg3.h  |  224 +++++++++
 4 files changed, 1373 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/devices/docg3.c
 create mode 100644 drivers/mtd/devices/docg3.h

-- 
1.7.4.4
