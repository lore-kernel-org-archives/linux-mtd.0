Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmKbj-0006i9-UE
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2012 08:06:44 +0000
Received: by wgbds1 with SMTP id ds1so4897124wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2012 01:06:36 -0700 (PDT)
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
Date: Wed,  4 Jul 2012 11:05:59 +0300
Message-Id: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The existing mechanism of reserving PEBs for bad PEB handling has two
flaws:
- It is calculated as a percentage of good PEBs instead of total PEBs.
- There's no limit on the amount of PEBs UBI reserves for future bad
  eraseblock handling.

This patchset changes the mechanism to overcome these flaws.

The caculation of PEBs reserved for bad PEB handling will be based on a
new property, ubi->bad_peb_limit, which specifies an upper limit of PEBs
ubi expects to go bad (currently initialized to a fixed percentage of
total PEBs in the ubi device, configurable via CONFIG_MTD_UBI_BEB_LIMIT,
but can be easily augmented to support a per ubi-attach limit).

The desired level of PEBs reserved for bad PEB handling (beb_rsvd_level)
is set to the maximum expected bad eraseblocks (bad_peb_limit) minus the
existing number of bad eraseblocks (bad_peb_count).

The actual amount of PEBs reserved for bad PEB handling is usually set
to the desired level (but in some circumstances may be lower than the
desired level, e.g. when attaching to a device that has too few
available PEBs to satisfy the desired level).

In the case where the device has too many bad PEBs (above the expected
limit), then the desired level, and the actual amount of PEBs reserved
are set to zero. No PEBs will be set aside for future bad eraseblock
handling - even if some PEBs are made available (e.g. by shrinking a
volume).
If another PEB goes bad, and there are available PEBs, then the
eraseblock will be marked bad (consuming one available PEB). But if
there are no available PEBs, ubi will go into readonly mode.


Shmulik Ladkani (5):
  ubi: introduce ubi->bad_peb_limit
  ubi: Limit amount of reserved eraseblocks for bad PEB handling
  ubi: kill CONFIG_MTD_UBI_BEB_RESERVE
  ubi: trivial: fix comment of ubi_calculate_reserved()
  ubi: harmonize the update of ubi->beb_rsvd_pebs

 arch/arm/configs/sam9_l9260_defconfig |    2 +-
 drivers/mtd/ubi/Kconfig               |   24 ++++++++++-------
 drivers/mtd/ubi/build.c               |   13 +++++++++-
 drivers/mtd/ubi/misc.c                |   44 +++++++++++++++++++++++++++++---
 drivers/mtd/ubi/ubi.h                 |    6 ++--
 drivers/mtd/ubi/vmt.c                 |   20 +-------------
 drivers/mtd/ubi/wl.c                  |   44 +++++++++++++++++++++------------
 7 files changed, 99 insertions(+), 54 deletions(-)

-- 
1.7.9
