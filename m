Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3UOy-0006xH-Gf
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 16:00:29 +0000
Received: by weyr3 with SMTP id r3so4351481wey.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 09:00:26 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
Date: Mon, 20 Aug 2012 18:00:10 +0200
Message-Id: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
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

This patch serie introduce, step by step the kernel module parameter
max_beb_per1024, then the ioctl and finally drop the kernel config option
CONFIG_MTD_UBI_BEB_LIMIT.

It's based on top of linux-ubi/master (4ebb4b5)

Changelog:
V2..V3:
* Suppress the possibility to have an empty string for vid_hdr_offs and
max_beb_per1024 and change the module info accordingly.
* add the Reviewed-by of Shmulik on the 1st patch.

V1..V2:
* The upper bound of max_beb_per1024 is checked and set to 768
* The vid_hdr_offs parameter can now be an empty string in order to have a
kernel parameter like that: mtd.ubi=2,,25
* The max_beb_per1024 parameter can also be empty (just for consistency with
vid_hdr_offs)
* The comment in ubi-user.h has been adjusted with the new range 0-768 and
the term "default kernel value" is used in place of MTD_UBI_DEFAULT_BEB_LIMIT
or CONFIG_MTD_UBI_BEB_LIMIT
* As max_beb_per1024 can be safely null, the config range of MTD_UBI_BEB_LIMIT
has been updates to 0..768
* For the ioctl, max_beb_per1024 is now an __u16, so that we are not limited
to 255 anymore.
* The comment on the default value of max_beb_per1024 has been adjusted before
and after the ioctl patch.

Best Regards

Richard.


Richard Genoud (6):
  UBI: prepare for max_beb_per1024 module parameter addition
  UBI: change CONFIG_MTD_UBI_BEB_LIMIT range
  UBI: check max_beb_per1024 value in ubi_attach_mtd_dev
  UBI: replace MTD_UBI_BEB_LIMIT with module parameter
  UBI: add ioctl for max_beb_per1024
  UBI: drop CONFIG_MTD_UBI_BEB_LIMIT

 arch/arm/configs/sam9_l9260_defconfig |    1 -
 drivers/mtd/ubi/Kconfig               |   26 --------------
 drivers/mtd/ubi/build.c               |   62 +++++++++++++++++++++++---------
 drivers/mtd/ubi/cdev.c                |    3 +-
 drivers/mtd/ubi/ubi.h                 |    6 +++-
 include/mtd/ubi-user.h                |   19 +++++++++-
 6 files changed, 69 insertions(+), 48 deletions(-)

-- 
1.7.2.5
