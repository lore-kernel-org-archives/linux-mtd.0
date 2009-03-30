Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LoENT-000261-LR
	for linux-mtd@lists.infradead.org; Mon, 30 Mar 2009 10:06:24 +0000
Message-Id: <20090330100241.346785618@denx.de>
Date: Mon, 30 Mar 2009 12:02:41 +0200
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org,
 linuxppc-dev@ozlabs.org
Subject: [PATCH v4 0/4] NAND: Multi-chip support for FSL-UPM for TQM8548
	modules
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>, devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is my forth version of the patch series adding generic support
for multi-chip NAND devices to the FSL-UPM driver and support for
the Micron MT29F8G08FAB NAND flash memory on the TQM8548 modules.
It addresses the issues reported on the mailing list, e.g. the new
bindings are now documented as well:

 NAND: FSL-UPM: add multi chip support
 NAND: FSL-UPM: Add wait flags to support board/chip specific delays
 powerpc: NAND: FSL UPM: document new bindings
 powerpc/85xx: TQM8548: Update DTS file for multi-chip support

Changes since v3:
  - As Grant suggested, the property "fsl,upm-addr-line-cs-offsets"
    is now used to define multi-chip support using dedicated address
    lines for chip selection. This make the properties "num-chips"
    and "chip-offset" obsolte.

  - As Grant suggested, I added the string "tqc,tqm8548-upm-nand" to
    the list of compatible devices for the TQM8548 modules in case it
    turns out in the future that the "fsl,upm-addr-line-cs-offsets"
    method is not generic enough.

  - For multi-chip chip devices, the name "mchip" is now used in the
    code to avoid confusion with the normal NAND "chip".

  - Coding style fixes as pointed out by Anton.

Patch 3 and 4 should go through the powerpc maintainer(s).

Hope this patch series is fine now for inclusion into 2.6.30.

Thanks,

Wolfgang.
