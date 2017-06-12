Received: from goliath.siemens.de ([192.35.17.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwX-0003Jv-PO
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:37 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v5CAp6Gs022812
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:06 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 00/20] mtd-utils: Return error code if command line option
 is unknown
Date: Mon, 12 Jun 2017 12:50:41 +0200
Message-Id: <20170612105101.18223-1-daniel.wagner@siemens.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I run into a small problem when I was setting up my build with Yocto
using mkfs.uibfs. I used an invalid option but Yocto didn't report
this as an option and continued with the build. That resulted in a
empy image and it took a while to figure out what is happening. By
returning an error code at the right spot this would really help. So
here are some patches adding a return code when an command line option
is unknown.

Thanks,
Daniel

Daniel Wagner (20):
  jffs2dump: Return error code if command line option is unknown
  jffs2dump: Use defines for exit code values
  mkfs.jffs2: Return error code if command line option is unknown
  mkfs.jffs2: Use defines for exit code values
  jffsX-utils: Return error code if command line option is unknown
  mtd-utils: lash_unlock: Use defines for exit code values
  mtd-utils: flashcp: Drop exit code defines
  mtd-utils: ftl_format: Use return directly to leave main function
  mtd-utils: nandtest: Use defines for exit code values
  mtd-utils: nftl_format: Use defines for exit code values
  nor-utils: rfddump: Return error code if command line option is
    unknown
  nor-utils: rfdformat: Return error code if command line option is
    unknown
  integrity: Return error code if command line option is unknown
  ubi-utils: ubiblock: Return error code if command line option is
    unknown
  ubi-utils: ubiformat: Return error code if command line option is
    unknown
  ubi-utils: ubimkvol: Return error code if command line option is
    unknown
  ubi-utils: ubirmvol: Return error code if command line option is
    unknown
  ubi-utils: ubirsvol: Return error code if command line option is
    unknown
  ubi-utils: ubiupdatevol: Return error code if command line option is
    unknown
  ubi-utils: mkfs.ubifs: Return error code if command line option is
    unknown

 jffsX-utils/jffs2dump.c             | 14 +++++++-------
 jffsX-utils/mkfs.jffs2.c            |  6 ++++--
 jffsX-utils/sumtool.c               |  4 +++-
 misc-utils/flash_unlock.c           | 10 +++++-----
 misc-utils/flashcp.c                |  3 ---
 misc-utils/ftl_format.c             |  3 +--
 nand-utils/nandtest.c               |  6 +++---
 nand-utils/nftl_format.c            |  6 +++---
 nor-utils/rfddump.c                 |  8 ++++----
 nor-utils/rfdformat.c               |  8 ++++----
 tests/fs-tests/integrity/integck.c  |  5 ++++-
 ubi-utils/ubiblock.c                |  6 +++++-
 ubi-utils/ubiformat.c               |  6 +++++-
 ubi-utils/ubimkvol.c                |  7 ++++++-
 ubi-utils/ubirmvol.c                |  7 ++++++-
 ubi-utils/ubirsvol.c                |  7 ++++++-
 ubi-utils/ubiupdatevol.c            |  7 ++++++-
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  6 ++++--
 18 files changed, 76 insertions(+), 43 deletions(-)

-- 
2.9.4
