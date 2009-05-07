Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M20ro-0004IY-Is
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 10:30:25 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mkfs.ubifs and libubiio
Date: Thu,  7 May 2009 12:21:47 +0200
Message-Id: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patchs will allow mkfs.ubifs to write the image directly
on an UBI volume.
libubiio adds a lot of code, but as it provide the same API the kernel
does we may export it latter as a shared library.
Some code from libubiio_int.h comes from common.h in ubi-utils and we
may refactor that.

Corentin Chary (2):
  mkfs.ubifs: UBI I/O Library
  mkfs.ubifs: format directly ubi volume using libubiio

 include/mtd/ubi-user.h    |   72 ++--
 include/ubi.h             |  192 +++++++++
 mkfs.ubifs/Makefile       |    6 +-
 mkfs.ubifs/libubiio.c     |  936 +++++++++++++++++++++++++++++++++++++++++++++
 mkfs.ubifs/libubiio.h     |   47 +++
 mkfs.ubifs/libubiio_int.h |  187 +++++++++
 mkfs.ubifs/lpt.c          |   10 +-
 mkfs.ubifs/mkfs.ubifs.c   |  223 +++++++++--
 mkfs.ubifs/mkfs.ubifs.h   |    3 +-
 mkfs.ubifs/ubifs.h        |    4 +
 10 files changed, 1602 insertions(+), 78 deletions(-)
 create mode 100644 include/ubi.h
 create mode 100644 mkfs.ubifs/libubiio.c
 create mode 100644 mkfs.ubifs/libubiio.h
 create mode 100644 mkfs.ubifs/libubiio_int.h
