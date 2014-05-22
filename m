Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnR73-0003ci-7G
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:24:42 +0000
Received: by mail-ie0-f177.google.com with SMTP id y20so3220787ier.8
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:24:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] mtd: st_spi_fsm: Align with ST's internal development
Date: Thu, 22 May 2014 12:23:58 +0100
Message-Id: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, all,

v2:
  These are the last remaining patches in the set, all rebased and
  with the DT documentation requested after the last submission.

v1:
  This patch-set updates ST's FSM SPI-NOR driver with all the internal
  goodness which has happened since the initial (now upstreamed) snapshot
  was taken. It covers just over 6 months worth of internal development
  and bug-fixes. A final whitespace clean-up is also appended to the set
  - to make it look pretty and stuff. :)

 Documentation/devicetree/bindings/mtd/st-fsm.txt |   2 +
 drivers/mtd/devices/st_spi_fsm.c                 | 687 +++++++++++++++--------
 2 files changed, 469 insertions(+), 220 deletions(-)
