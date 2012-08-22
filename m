Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4DR5-0002Ax-Q2
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 16:05:44 +0000
Received: by weyr3 with SMTP id r3so743313wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 09:05:18 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH MTD-UTILS v2 0/4] introduce max_beb_per1024 in UBI_IOCATT
Date: Wed, 22 Aug 2012 18:04:33 +0200
Message-Id: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is the v2 of the user-space part for max_beb_per1024 parameter.

Changes since v1:
* code factorization between ubi_attach and ubi_attach_mtd 
* ubiattach now fails if -b option is given and the kernel doesn't supports it.

Richard Genoud (4):
  libubi: factorize ubi_attach and ubi_attach_mtd code
  sync include/mtd/ubi-user.h: add max_beb_per1024 parameter
  ubiattach: introduce max_beb_per1024 in UBI_IOCATT
  ubiattach: fail if kernel ignores max_beb_per1024

 include/mtd/ubi-user.h             |   16 ++++++++-
 tests/fs-tests/integrity/integck.c |    1 +
 ubi-utils/include/libubi.h         |   12 +++++--
 ubi-utils/libubi.c                 |   69 +++++++++++++++++++++++------------
 ubi-utils/ubiattach.c              |   47 ++++++++++++++++++++-----
 5 files changed, 108 insertions(+), 37 deletions(-)

-- 
1.7.2.5
