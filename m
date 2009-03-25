Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmQ25-0001oE-Ao
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 10:08:44 +0000
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org,
	linuxppc-dev@ozlabs.org
Subject: [PATCH v3 0/4] NAND: Multi-chip support for FSL-UPM for TQM8548
	modules
Date: Wed, 25 Mar 2009 11:08:17 +0100
Message-Id: <1237975701-23201-1-git-send-email-wg@grandegger.com>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is my third version of the patch series adding generic support
for multi-chip NAND devices to the FSL-UPM driver and support for
the Micron MT29F8G08FAB NAND flash memory on the TQM8548 modules.
It addresses the issues reported on the mailing list, e.g. the new
bindings are now documented as well.

[PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
[PATCH v3 2/4] NAND: FSL-UPM: Add wait flags to support board/chip specific delays
[PATCH v3 3/4] powerpc: NAND: FSL UPM: document new bindings
[PATCH v3 4/4] powerpc/85xx: TQM8548: Update DTS file for multi-chip support

Please consider these patches for inclusion into kernel version 2.6.30. 
Patch 3 and 4 should go through the powerpc maintainer(s).

Thanks.

Wolfgang.
