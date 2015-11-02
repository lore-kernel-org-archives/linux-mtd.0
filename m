Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtOB4-0002RX-GM
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 23:06:15 +0000
Received: by igvi2 with SMTP id i2so58607217igv.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 15:05:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <562FE4C4.3040605@broadcom.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
 <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
 <20151026181430.GA13239@google.com> <562E7667.5050406@broadcom.com>
 <CAOVqfW8g2w=u8fO5GTa=5Hw_OOPS6NcGFg3TiLbCPny14id0VQ@mail.gmail.com>
 <20151027204023.GV13239@google.com> <562FE4C4.3040605@broadcom.com>
Date: Mon, 2 Nov 2015 15:05:52 -0800
Message-ID: <CAOVqfW-e7VVS1H566TrSCsHCLU+Xc79cH0=B0x5EFs0+DQHtqA@mail.gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
From: Clay McClure <clay@daemons.net>
To: Ray Jui <rjui@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 27, 2015 at 1:55 PM, Ray Jui <rjui@broadcom.com> wrote:

> Don't you think this may have something to do with the APB bus endianness
> setting that's not used for all non-iProc SoCs? I suspect not just the ONFI
> paramter page, but all other NAND data read into FLASH_CACHE are in BE
> format on those SoCs (or am I completely out of my mind and missing
> something here?)

It's a good question (whether all flash cache data is big-endian), and
I don't know the answer, but I've verified that the below patch does
fix the problem with PARAMETER_READ on the Helix4 (an iProc-based
switch chip). Whether the other uses of
brcmnand_soc_data_bus_prepare() should also be removed, I can't say; I
don't know why they were originally needed.

Clay

----8<----
>From c0ab411165ceedc5afc5a2c49c4d1bf9ba035dc8 Mon Sep 17 00:00:00 2001
From: Clay McClure <clay@daemons.net>
Date: Mon, 2 Nov 2015 13:07:59 -0800
Subject: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM on iProc

On Broadcom's iProc-based SoCs, nand_flash_detect_onfi() fails at
boot with:

    Could not find valid ONFI parameter page; aborting

The endianness of the in-memory parameter page cache is backwards,
causing the ONFI CRC validation to fail. It seems that the NAND
controllers on these chips handle PARAMETER_READ commands differently
from other commands, filling the flash cache with big endian-like
data. Because of that quirk, we don't need to implicitly swap bytes
on the APB bus while reading the flash cache for parameter pages.

Signed-off-by: Clay McClure <clay@daemons.net>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
b/drivers/mtd/nand/brcmnand/brcmnand.c
index 12c6190..36a676d 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1190,8 +1190,6 @@ static void brcmnand_cmdfunc(struct mtd_info
*mtd, unsigned command,
  native_cmd == CMD_PARAMETER_CHANGE_COL) {
  int i;

- brcmnand_soc_data_bus_prepare(ctrl->soc);
-
  /*
  * Must cache the FLASH_CACHE now, since changes in
  * SECTOR_SIZE_1K may invalidate it
@@ -1199,8 +1197,6 @@ static void brcmnand_cmdfunc(struct mtd_info
*mtd, unsigned command,
  for (i = 0; i < FC_WORDS; i++)
  ctrl->flash_cache[i] = brcmnand_read_fc(ctrl, i);

- brcmnand_soc_data_bus_unprepare(ctrl->soc);
-
  /* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
  if (host->hwcfg.sector_size_1k)
  brcmnand_set_sector_size_1k(host,
-- 
2.1.4
