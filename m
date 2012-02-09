Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvYW7-0005ES-0y
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 18:14:48 +0000
Received: by pbcun1 with SMTP id un1so605964pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 10:14:45 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/3] mtdinfo fixes (--all, etc.)
Date: Thu,  9 Feb 2012 10:13:28 -0800
Message-Id: <1328811211-13653-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These fixes help `mtdinfo --all' to work on legacy systems where sysfs is
not supported in MTD.

Patch 1: submitted by Artem as a test patch
Patch 2: previously submitted by me and didn't apply directly to
         mtd-utils.git, as it depended on Patch 1
Patch 3: trivial (new) grammar fixup patch

Hopefully this is easy to review and apply :)

Brian

Artem Bityutskiy (1):
  limbtd: implement mtd_dev_present for old kernels

Brian Norris (2):
  libmtd: fix segmentation fault on lib->mtd
  mtdinfo: correct grammar on error message

 lib/libmtd.c        |   27 ++++++++++++++-------------
 lib/libmtd_int.h    |    1 +
 lib/libmtd_legacy.c |   25 +++++++++++++++++++++++++
 ubi-utils/mtdinfo.c |    2 +-
 4 files changed, 41 insertions(+), 14 deletions(-)

-- 
1.7.5.4
