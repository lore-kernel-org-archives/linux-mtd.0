Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lr6n4-0006ev-Do
	for linux-mtd@lists.infradead.org; Tue, 07 Apr 2009 08:36:36 +0000
From: Stefan Roese <sr@denx.de>
To: linuxppc-dev@ozlabs.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 0/4 v2] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Tue, 7 Apr 2009 10:36:10 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904071036.11184.sr@denx.de>
Cc: Grant Likely <grant.likely@secretlab.ca>,
	devicetree-discuss <devicetree-discuss@ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset adds support to handle multiple non-identical chips in one
flash device tree node. It also adds concat support to physmap_of. This
makes it possible to support e.g. the Intel P30 48F4400 chip which
internally consists of 2 non-identical NOR chips on one die. Additionally
partitions now can span over multiple chips:

    mtd: physmap_of: Add multiple regions and concatenation support
    mtd/powerpc: Factor out MTD physmap bindings into mtd-physmap.txt
    mtd/powerpc: Remove unused "device-width" property
    mtd/powerpc: Describe multiple "reg" tuples usage

v2 addresses all comments from Grant Likely, including factoring out the
MTD dts bindings documentation into a separate file.

Thanks,
Stefan
