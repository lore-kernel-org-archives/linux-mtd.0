Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B74C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 22:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0fVCq21R+jCgFFaXmIHHsTeNgVHZbeFL1XXYscmWcCk=; b=zCH5aQ8xMYxLgD
	rGHTxoezD7nPcHuKRYdcSUwXwrGgREVDNt6s1c+0k5mLhemGoQBSeZjMggCtYGOjaxWTt/npihhVi
	mUtn7CjUR9YPtXfIYcub9XuQ2RQEqZEPXTWMECfisOn7iNbbBBgYQ6p4uVTROY4OI3R1YpqpGGdhI
	ZXvBr1ECbOtFtNMoVPJSsBfWjEdxjVEbq7iJuWnccmk6oTnElURFbBC5vuQcnuXbNwFqAsQXexYcl
	g5N9hxsbshcEb5nS+iVHxLDK4VVKsgW+MGSNNaXVSULh717FR6xfQGnZfjjcKH6EOhagUj1XybAmP
	gsKMuDcFEr9IK+6432vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrX-00Ff4v-Mu; Wed, 10 Aug 2022 22:07:39 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrE-00Fegm-As
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 22:07:23 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id D46B5221D4;
	Thu, 11 Aug 2022 00:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660169228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NqeFnD6tHk0Apg0ipYoUap63hcDSdx+M2oLGDxmnAGA=;
	b=Pc2ISALxIS69FN6jyWJoKawAM4PcbVH3rWPFMJtBb0++4GYUI9MMpXLFN+Js3Hsc/QXfyR
	pzTabIbJYDZLnk8RjAv7BwbNSMM2fJnSb9dDuBCIInW5JqaD9F4M8TSrJlHPiOcQzdsSwO
	7hSx1OXY0RtfqmH47QF5/JyOudwoOXY=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 0/7] mtd: spi-nor: generic flash driver
Date: Thu, 11 Aug 2022 00:06:47 +0200
Message-Id: <20220810220654.1297699-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150720_769101_61C12CA0 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add a generic flash driver, which is used when we don't find a matching
flash in our database. All the basic features of a flash can be discovered
by SFDP and most (if not all) newer flashes support it.

changes since v1:
 - fix doc prototype mistake reported by the kernel test robot
 - preset page_size to 256 to support flashes which just have
   SFDP data corresponding to JESD216A
 - add new patch
   mtd: spi-nor: fix select_uniform_erase to skip 0 erase size
 - add function doc to explain wanted_size=0 in
   spi_nor_select_uniform_erase()

Michael Walle (7):
  mtd: spi-nor: hide jedec_id sysfs attribute if not present
  mtd: spi-nor: sysfs: hide manufacturer if it is not set
  mtd: spi-nor: remember full JEDEC flash ID
  mtd: spi-nor: move function declaration out of sfdp.h
  mtd: spi-nor: fix select_uniform_erase to skip 0 erase size
  mtd: spi-nor: add generic flash driver
  mtd: spi-nor: sysfs: print JEDEC ID for generic flash driver

 .../ABI/testing/sysfs-bus-spi-devices-spi-nor |  6 ++++
 drivers/mtd/spi-nor/core.c                    | 35 +++++++++++++++++--
 drivers/mtd/spi-nor/core.h                    |  3 ++
 drivers/mtd/spi-nor/debugfs.c                 |  2 +-
 drivers/mtd/spi-nor/sfdp.c                    | 27 ++++++++++++++
 drivers/mtd/spi-nor/sfdp.h                    |  2 --
 drivers/mtd/spi-nor/sysfs.c                   | 20 ++++++++++-
 include/linux/mtd/spi-nor.h                   |  3 ++
 8 files changed, 92 insertions(+), 6 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
