Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2NzU-00087p-F3
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 14:57:37 +0000
Received: by wibhq4 with SMTP id hq4so1325900wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 07:57:34 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/4] mtd-utils/ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
Date: Fri, 17 Aug 2012 16:57:18 +0200
Message-Id: <1345215442-19082-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,
Here are the patches splitted for the UBI_IOCATT ioctl.
I separated the ubi-user.h in 3 patches:
one sync before my kernel change, another before dropping
CONFIG_MTD_UBI_BEB_LIMIT, and another after.
(If you decide not to drop CONFIG_MTD_UBI_BEB_LIMIT in the kernel, it will be
easier, and you can always squash the first 2 or 3 patches into 1).

Best Regards,
Richard.

Richard Genoud (4):
  sync include/mtd/ubi-user.h with kernel v3.6-rc1
  sync include/mtd/ubi-user.h: add max_beb_per1024 parameter
  sync include/mtd/ubi-user.h: DROP CONFIG_MTD_UBI_BEB_LIMIT
  ubiattach: introduce max_beb_per1024 in UBI_IOCATT

 include/mtd/ubi-user.h             |  155 +++++++++++++++++++----------------
 tests/fs-tests/integrity/integck.c |    1 +
 ubi-utils/include/libubi.h         |    2 +
 ubi-utils/libubi.c                 |    2 +
 ubi-utils/ubiattach.c              |   41 ++++++++--
 5 files changed, 122 insertions(+), 79 deletions(-)

-- 
1.7.2.5
