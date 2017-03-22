Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqdQm-0007AD-J8
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 10:23:55 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Yuanjie.Huang@windriver.com,
	raj.khem@gmail.com
Subject: mtd-utils: various fixes, apply OpenEmbedded patches
Date: Wed, 22 Mar 2017 11:22:52 +0100
Message-Id: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series mostly consists of minor fixes that have piled
up on my end.

The series mainly includes some of the patches applied localy by
the OpenEmbedded project that haven't been submitted upstream so
far.

Two more patches that OpenEmbedded supposedly applies to recent
mtd-utils have not been included:
 - One that fixes logic in flash_erase that doesn't exist anymore.
 - One that adds an excluion flag to mkfs.jffs2. It doesn't apply
   and is sprinkled with debug prints.


Regards,

David

--
 include/common.h             | 25 ++++++-------------------
 include/libmtd.h             |  3 +--
 jffsX-utils/mkfs.jffs2.c     |  1 +
 lib/libmtd.c                 | 12 ++++++------
 lib/libmtd_int.h             |  1 +
 lib/libmtd_legacy.c          | 18 ++++++++++++++++++
 lib/libubi.c                 |  5 ++++-
 ubi-utils/mtdinfo.c          |  5 +----
 ubi-utils/ubiformat.c        |  2 --
 ubifs-utils/mkfs.ubifs/key.h | 16 ++++++++++------
 10 files changed, 48 insertions(+), 40 deletions(-)
