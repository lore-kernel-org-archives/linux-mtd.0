Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBo5W-0003pn-Fm
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 14:38:48 +0000
Received: by wibhq4 with SMTP id hq4so3826921wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 07:38:44 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [MTD-UTILS 0/3] fix off_t use in lseek
Date: Wed, 12 Sep 2012 16:38:32 +0200
Message-Id: <1347460715-3951-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In lseek call, sometimes off_t is used, sometime u_int32_t or
off64_t (with lseek64).
This patchset corrects those inconsistencies in respect with the
WITHOUT_LARGEFILE compilation option.

Richard Genoud (3):
  introduce PRIxoff_t and PRIdoff_t printf helpers
  consistency between u_int32_t / off_t / off64_t
  mkfs.jffs2: correct some warnings using PRIdoff_t

 flash_erase.c                      |   16 +++++++-------
 flash_otp_write.c                  |    5 ++-
 ftl_check.c                        |    6 +++-
 ftl_format.c                       |    2 +-
 include/common.h                   |   11 ++++++++++
 lib/libmtd.c                       |   12 +++++-----
 mkfs.jffs2.c                       |   10 ++++----
 mkfs.ubifs/mkfs.ubifs.c            |   11 ++++-----
 mtd_debug.c                        |   14 ++++++------
 tests/fs-tests/integrity/integck.c |    4 +-
 tests/ubi-tests/integ.c            |   38 ++++++++++++++++++------------------
 11 files changed, 71 insertions(+), 58 deletions(-)

-- 
1.7.2.5
