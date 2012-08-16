Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T21R3-0003VM-63
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 14:52:33 +0000
Received: by weyr3 with SMTP id r3so1960402wey.36
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 07:52:30 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/2] splitting "UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter"
Date: Thu, 16 Aug 2012 16:52:01 +0200
Message-Id: <1345128723-13582-1-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345042639.3393.150.camel@sauron.fi.intel.com>
References: <1345042639.3393.150.camel@sauron.fi.intel.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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
Here are the 2 patches you requested in place of
"[PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space parameter"


I made some changes to correct some things that Shmulik pointed out:

* max_beb_per1024 is now an unsigned.
* ubi_mtd_param_parse can fail on kstrtouint error.

Richard Genoud (2):
  UBI: replace MTD_UBI_BEB_LIMIT with module parameter
  UBI: add ioctl for max_beb_per1024

 arch/arm/configs/sam9_l9260_defconfig |    1 -
 drivers/mtd/ubi/Kconfig               |   26 ---------
 drivers/mtd/ubi/build.c               |   93 ++++++++++++++++++++++-----------
 drivers/mtd/ubi/cdev.c                |   10 +++-
 drivers/mtd/ubi/ubi.h                 |    6 ++-
 include/mtd/ubi-user.h                |   19 ++++++-
 6 files changed, 95 insertions(+), 60 deletions(-)

-- 
1.7.2.5
