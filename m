Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NeRh1-0005UR-SO
	for linux-mtd@lists.infradead.org; Mon, 08 Feb 2010 11:22:20 +0000
Received: by bwz20 with SMTP id 20so944596bwz.20
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Feb 2010 03:22:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791001122246v254bb721p68c58607a292fb8e@mail.gmail.com>
References: <ce9ab5791001122246v254bb721p68c58607a292fb8e@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 8 Feb 2010 16:51:54 +0530
Message-ID: <ce9ab5791002080321k459c159wbe843376a129528e@mail.gmail.com>
Subject: [PATCH v2 0/3] OMAP: NAND: support flashes on sdp boards
To: linux-omap@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Tony Lindgren <tony@atomide.com>, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2010 at 12:16 PM, Vimal Singh <vimal.newwork@gmail.com> wrote:
> From 4fbddd880c7a0da61fb66ae1d2c2553e3fbc82cb Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Tue, 12 Jan 2010 18:14:14 +0530
> Subject: [PATCH] OMAP: NAND: support flashes on sdp boards


Reposting this patch set again after fixes in 1st patch as per
comments from Tony:
- Removing 'nand_base' from functions specified and correcting
prototype in header file too
- calling gpmc_cs_request first

Rest of the patches in the series are untouched and just have been
re-based on LO master branch.

--
Vimal


>From d3e5ee6d8a6449aee01fbc93313201a4674f5577 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Mon, 8 Feb 2010 05:19:20 +0530
Subject: [PATCH] OMAP: NAND: support flashes on sdp boards

1st patch introduces 'gpmc-nand.c' for generic gpmc stuffs. Which may be
used by any omap board.

2nd and 3rd patches are to show up how to use 'gpmc-nand.c' with example
of 3430sdp board.

Vimal Singh (3):
  Introducing 'gpmc-nand.c' for GPMC specific NAND init
  OMAP: SDP: Introducing 'board-sdp-flash.c' for flash init
  OMAP3: Add support for flash on 3430SDP board

 arch/arm/mach-omap2/Makefile                 |    4 +
 arch/arm/mach-omap2/board-3430sdp.c          |  111 ++++++++++
 arch/arm/mach-omap2/board-sdp-flash.c        |  295 ++++++++++++++++++++++++++
 arch/arm/mach-omap2/gpmc-nand.c              |  139 ++++++++++++
 arch/arm/mach-omap2/include/mach/board-sdp.h |   22 ++
 arch/arm/plat-omap/include/plat/gpmc.h       |    2 +
 arch/arm/plat-omap/include/plat/nand.h       |   10 +-
 drivers/mtd/nand/omap2.c                     |   35 +---
 8 files changed, 586 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm/mach-omap2/board-sdp-flash.c
 create mode 100644 arch/arm/mach-omap2/gpmc-nand.c
 create mode 100644 arch/arm/mach-omap2/include/mach/board-sdp.h
