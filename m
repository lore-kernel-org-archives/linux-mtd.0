Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29EB606A8B5
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OD5aulue;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=MRJ4P4rn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QfWbhtg02ZZ6eZMrtJC6Ut1kg8OHGrAbakNtDQwJH0k=; b=OD5aulue4oUzPf1fKgRVqDAMqQ
	sVfPyR31ubd3Eq2rfYCVnUeJbvN3X/s00wLB81d1e06y6x/a6vF17KRs9PZDN2LyNWI3KOvn7e9rl
	lU87AT18GX2cTAVAiftjbh6yv7499vHjWZvsTzZNdZV0nFoQhhykDP6PiJeFwEyxxmBa6LuUQO0RA
	QIxU8501CJAyzytanollj9RnaStBeZ08b9sQglp0SVxEmKyV/cnC028Z0GNba681bZ4uLCOmllEs+
	ceWSmONqIrmToIPjOJtn7kANXSn8BXBOdUMQyRenTEyyVlLW+CBmEvHZbD8aassOqfGCKdJi4p2/M
	Lyug7hBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR71N-00000006at2-29VJ;
	Wed, 11 Nov 2026 12:01:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR71K-00000006asQ-4Bg9
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 12:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398504; x=1825934504;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BgXJlhRxC+Hv4DPLB3wg8Xh8XMZb+jo7t7rlEKPdX4I=;
  b=MRJ4P4rnsgIFda1/1XSv8XByrCJGEZtOudx8TanMDbcDw2rdCW3KGn5j
   POMxJ4hOOP9sBA5rakACFUTgwS6zTRF430oM8N+FieZB/OPdB0swl5qb9
   UL63tAJ5+pQ8CQhBj2i6QNsVWvWOd1YsnPnXVH/uijSbVQZDFMyRk/1D1
   D5rDiWK39keM7EH3NiHed3Uy54NFRG5vBI1bIzdsr5mB83qRbNn0OsbqU
   M6NtercFox9FQbZXZCuaZi5x+Rg2v1f/yjPp8oa9LiNUv/QrBgDlhcCwH
   DmkC1wIMzk5BS53+KimlvuwAhfhmsSeoJn1QCWMvaipYmywumM8byTKSe
   A==;
X-CSE-ConnectionGUID: u70z195URju4bTRXoeI/AQ==
X-CSE-MsgGUID: UrpMuQ2/QZq5Oon+eWC9sw==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="297769589"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Nov 2026 05:01:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Nov 2026 05:01:41 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 05:01:38 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <srini@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 0/2] mtd/nvmem: don't defer forever on absent NVMEM suppliers
Date: Wed, 11 Nov 2026 17:31:30 +0530
Message-ID: <cover.1794391847.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040143_040705_B379F14D 
X-CRM114-Status: GOOD (  10.84  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A consumer that gets its MAC address from an NVMEM cell can be deferred
forever when the cell will never appear, instead of falling back to
another address source. These came up while testing the SFDP EUI-48
series [1], where macb reads its MAC address from a cell exposed by the
QSPI flash, but both are generic:

 - 1/2: when the SPI NOR flash is not populated or not reachable, nothing
   below its node is ever registered, yet fw_devlink keeps waiting on it
   and the NVMEM lookup keeps returning -EPROBE_DEFER. Drop the fw_devlink
   links below a flash that failed to probe, and return -ENOENT for a cell
   on a node fw_devlink has marked as never becoming a device.

 - 2/2: a layout adds its cells from its probe and may add none, e.g. when
   the data the cell describes is not programmed on the device. Only defer
   while the layout is not bound yet, and return -ENOENT once it is.

In both cases the consumer then falls back, e.g. macb uses the address
left by the bootloader or a random one.

This series depends on the SFDP EUI-48 series [1] and applies on top of it.

[1] https://lore.kernel.org/all/cover.1794391660.git.manikandan.m@microchip.com/

Manikandan Muralidharan (2):
  mtd: spi-nor: drop fw_devlink suppliers below a flash that failed to
    probe
  nvmem: core: don't defer for a missing cell once the layout is bound

 drivers/mtd/spi-nor/core.c | 26 ++++++++++++++++++++++++-
 drivers/nvmem/core.c       | 40 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 3 deletions(-)


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
prerequisite-patch-id: 76d8b1168f88c3e7912ac2ce01a705f7e69d8a3b
prerequisite-patch-id: b360d0d00ac1a6feb76d4b3f9412b6f1741f6161
prerequisite-patch-id: 659801d6f415ba79ce51f21b3a4f5e132348c150
prerequisite-patch-id: bd1a5a10983aa3cfd99c93ee58fdeb04cdd87b76
prerequisite-patch-id: 94ede38b6c2480cb1e0e102e9bbeb6ffd5b276ef
prerequisite-patch-id: ae3977b6c56c5bd4f352d77bd8a7883a69d390af
prerequisite-patch-id: 58d0ad25e81f16f60864d624eed7ff481607e960
prerequisite-patch-id: ba140b71fdbfc992861ae4c34b6acc737d4e4528
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
