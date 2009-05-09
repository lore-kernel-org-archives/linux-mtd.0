Received: from smtp23.services.sfr.fr ([93.17.128.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2jCJ-0006ih-5j
	for linux-mtd@lists.infradead.org; Sat, 09 May 2009 09:50:35 +0000
Received: from smtp23.services.sfr.fr (msfrf2324 [10.18.27.38])
	by msfrf2305.sfr.fr (SMTP Server) with ESMTP id 24372700038A
	for <linux-mtd@lists.infradead.org>;
	Sat,  9 May 2009 11:43:04 +0200 (CEST)
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] libubi / mkfs.ubifs #2
Date: Sat,  9 May 2009 11:41:05 +0200
Message-Id: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
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
on an UBI volume. This time libubi is used. I couldn't manage to
make the Makefile works correctly, even with Mike trick for dependencies.
Mike, could you help me on that ?
You can still make it compile with "cd ubi-utils; make; cd ../mkfs.ubifs; make"

Thanks

Corentin Chary (3):
  libubi: add ubi_is_mapped() function
  libubi: fix multiple memory corruptions
  mkfs.ubifs: use libubi to format UBI volume

 mkfs.ubifs/Makefile        |    5 +-
 mkfs.ubifs/lpt.c           |   10 +-
 mkfs.ubifs/mkfs.ubifs.c    |  187 ++++++++++++++++++++++++++++++++++++--------
 mkfs.ubifs/mkfs.ubifs.h    |    4 +-
 mkfs.ubifs/ubifs.h         |    3 +
 ubi-utils/include/libubi.h |   17 ++++
 ubi-utils/src/libubi.c     |   13 +++-
 7 files changed, 196 insertions(+), 43 deletions(-)
