Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T47Ea-0004Vz-BA
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 09:28:21 +0000
Received: by weyr3 with SMTP id r3so481244wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 02:28:17 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH MTD-UTILS 0/5] sync with 3.6-rc1 and introduce max_beb_per1024
 in UBI_IOCATT
Date: Wed, 22 Aug 2012 11:27:55 +0200
Message-Id: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
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

Hi Artem,
Here are the patches for the introduction of max_beb_per1024 in ubiattach.
The first patch is just a sync of ubi-user.h with the vanilla 3.6-rc1
(So after this patch, the mtd-utils won't build any more)
The second one supresses dtype parameter, as it is obsolete now.
The third syncs with somes defines and struct renames in the ubi-user.h
(Now it compiles again)
The fourth syncs ubi-user.h with the one in linux-ubi/master
And finally the last one instroduce max_beb_per1024.

Best Regards,
Richard.

Richard Genoud (5):
  sync include/mtd/ubi-user.h with kernel v3.6-rc1
  dtype parameter is obsolete
  re-name set volume properties ioctl
  sync include/mtd/ubi-user.h: add max_beb_per1024 parameter
  ubiattach: introduce max_beb_per1024 in UBI_IOCATT

 include/mtd/ubi-user.h             |  152 +++++++++++++++++++-----------------
 mkfs.ubifs/lpt.c                   |   10 +-
 mkfs.ubifs/mkfs.ubifs.c            |   37 ++++-----
 mkfs.ubifs/mkfs.ubifs.h            |    2 +-
 tests/fs-tests/integrity/integck.c |    1 +
 tests/ubi-tests/io_paral.c         |    2 +-
 ubi-utils/include/libubi.h         |    7 +-
 ubi-utils/libubi.c                 |   11 ++-
 ubi-utils/ubiattach.c              |   38 +++++++--
 9 files changed, 145 insertions(+), 115 deletions(-)

-- 
1.7.2.5
