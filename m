Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LkJye-0002d3-Rb
	for linux-mtd@lists.infradead.org; Thu, 19 Mar 2009 15:16:19 +0000
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org,
	linuxppc-dev@ozlabs.org
Subject: [PATCH v2 0/5] NAND: Multi-chip support for FSL-UPM for TQM8548
	modules
Date: Thu, 19 Mar 2009 16:16:03 +0100
Message-Id: <1237475768-11481-1-git-send-email-wg@grandegger.com>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the 2nd version of the patch series adding generic support for
multi-chip NAND devices to the FSL-UPM driver and support for the
Micron MT29F8G08FAB NAND flash memory on the TQM8548 modules. It
addresses the issues reported on the mailing list, e.g. the new
bindings are now documented:

[PATCH v2 1/5] NAND: FSL-UPM: add multi chip support
[PATCH v2 2/5] NAND: FSL-UPM: add support for selecting chips via MAR
[PATCH v2 3/5] NAND: FSL-UPM: Add wait flags to support board/chip specific delays
[PATCH v2 4/5] powerpc: NAND: FSL UPM: document new bindings
[PATCH v2 5/5] powerpc/85xx: TQM8548: Update DTS file for multi-chip support

Please consider these patches for kernel inclusion.

Thanks.

Wolfgang.
