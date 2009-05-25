Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Tf8-0001iU-Es
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 06:28:01 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mkfs.ubifs updates
Date: Mon, 25 May 2009 08:26:25 +0200
Message-Id: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Two patchs this time.
The first one is trivial.
The second is the reworked patch to format UBI volume.
There is no support for erasing the volume if it's not empty,
it'll come later, when the first patch is merged.

Thanks,

Corentin Chary (2):
  mkfs.ubifs: remove duplicated code
  mkfs.ubifs: use libubi to format UBI volume

 Makefile                |    2 +-
 mkfs.ubifs/Makefile     |    5 +-
 mkfs.ubifs/lpt.c        |   10 ++--
 mkfs.ubifs/mkfs.ubifs.c |  181 +++++++++++++++++++++++++++++++++++++----------
 mkfs.ubifs/mkfs.ubifs.h |    4 +-
 mkfs.ubifs/ubifs.h      |    3 +
 6 files changed, 160 insertions(+), 45 deletions(-)
