Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjVLe-0002Md-3z
	for linux-mtd@lists.infradead.org; Tue, 17 Mar 2009 09:12:52 +0000
From: Wolfgang Grandegegr <wg@grandegger.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] NAND: Multi-chip support for FSL-UPM for TQM8548 modules
Date: Tue, 17 Mar 2009 10:12:18 +0100
Message-Id: <1237281143-8768-1-git-send-email-wg@grandegger.com>
Cc: linuxppc-dev@ozlabs.org, Anton Vorontsov <avorontsov@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following patch series adds generic support for multi-chip NAND devices
to the FSL-UPM driver and support for the Micron MT29F8G08FAB NAND flash
memory on the TQM8548 modules:

[PATCH 1/4] NAND: FSL-UPM: add multi chip support
[PATCH 2/4] NAND: FSL-UPM: add support for selecting chips via MAR
[PATCH 3/4] NAND: FSL-UPM: Add wait flags to support board/chip specific delays
[PATCH 4/4] powerpc/85xx: TQM8548: Update DTS file for multi-chip support

Wolfgang.
