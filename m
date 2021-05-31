Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6932C47083
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 947F46124C
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 947F46124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DwaJa/zz3fyzXWbKgM5Lf18NoIoDX8ebVz0LpkPVNE8=; b=rp33TWWxBuOyhE
	JWhnXAesSO/kXgmRR9i8F0duP9UPou6Jz/32QyPFF/t4fuE3azCQdggtvV9h5xFQsMGe3WxsJRTnu
	4jDHEgLIlRNXGPNt0SQsWUAX8c1V1TnQoPCBfYzvj0Yrbiv7ZXF3Xmc4gyuAKfTo357oPAEHzkltZ
	GnvyS7PxF8FiEPBQhG1d+s97uGkCPpfvhxlZC81b4WOOOxj7yBoeIKtvqt9/J/FqKHXEqltJ8ji2g
	2OzpJ65VF2I8H6mEsOQjSoeRq8FmiMM6ULckuf7GmYFq8jcmzDRF88k7c8Fcj4ZBfv5ArzpsQwHx/
	WYFApcfxXXpz91YqCwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnmUc-00D5eZ-5i; Mon, 31 May 2021 18:18:26 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnmUK-00D5G9-HS
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 18:18:10 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14VII2qb078793;
 Mon, 31 May 2021 13:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622485082;
 bh=HsbRxHmzurwf7J0PNrAE7LrJRA57/L7yoP2/CM+aImU=;
 h=From:To:Subject:Date;
 b=dzscoPH5ucskoi9X8RByttDJfSEw27wj15tKxGlVyBv2jaJnBAPs+647MwhDj0fln
 bNh03cQ2X3ZTq3qxcdgE3/d0rmCLWcqz3kf0CuVESravHFlsDads3JmVKrwQuOUAOv
 nFRTvcMbBuaa/8AX2zj1SVOuIA5IgdkDbC0nQRoo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14VII2qG026763
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 May 2021 13:18:02 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 13:18:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 31 May 2021 13:18:02 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14VIHwdF118543;
 Mon, 31 May 2021 13:17:59 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH v2 0/6] Avoid odd length/address read/writes in 8D-8D-8D mode.
Date: Mon, 31 May 2021 23:47:51 +0530
Message-ID: <20210531181757.19458-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_111808_748555_C399692F 
X-CRM114-Status: GOOD (  12.95  )
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

Hi,

On Octal DTR flashes like Micron Xcella or Cypress S28 family, reads or
writes cannot start at an odd address in 8D-8D-8D mode. Neither can they
be odd bytes long. Upper layers like filesystems don't know what mode
the flash is in, and hence don't know the read/write address or length
limitations. They might issue reads or writes that leave the flash in an
error state. In fact, using UBIFS on top of the flash was how I first
noticed this problem.

This series fixes that problem by padding the read/write with extra
bytes to make sure the final operation has an even address and length.
More info in patches 5 and 6.

Patches 1-3 fix some existing odd-byte long reads. Patch 4 adds checks
to disallow odd length command/address/dummy/data phases in 8D-8D-8D
mode. Note that this does not restrict the _value_ of the address from
being odd since this is a restriction on the flash, not the protocol
itself.

Patch 4 should go through the SPI tree but I have included it in this
series because if it goes in before patches 1-3, Micron MT35XU and
Cypress S28HS flashes will stop working correctly.

Tested on TI J721E for Micron MT35 and on TI J7200 for Cypress S28.

Changes in v2:
Collect R-bys and cosmetic fixes. No functional changes. See the patches
for detailed changelog.

Pratyush Yadav (6):
  mtd: spi-nor: core: use 2 data bytes for template ops
  mtd: spi-nor: spansion: write 2 bytes when disabling Octal DTR mode
  mtd: spi-nor: micron-st: write 2 bytes when disabling Octal DTR mode
  spi: spi-mem: reject partial cycle transfers in 8D-8D-8D mode
  mtd: spi-nor: core: avoid odd length/address reads on 8D-8D-8D mode
  mtd: spi-nor: core: avoid odd length/address writes in 8D-8D-8D mode

 drivers/mtd/spi-nor/core.c      | 159 +++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/micron-st.c |  22 ++++-
 drivers/mtd/spi-nor/spansion.c  |  18 +++-
 drivers/spi/spi-mem.c           |  12 ++-
 4 files changed, 196 insertions(+), 15 deletions(-)

-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
