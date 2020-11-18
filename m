Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BDFC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:26:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221C9246AD
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uTAEvgxz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mLDululR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221C9246AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+rpcW2J6XVbM2d/mktSa1SATOMSsYQWbunP6OTdUQMU=; b=uTAEvgxzpNt8IGgiuTiWktmZpJ
	4JJrzLPtvrufLxkjt409dhyIUPemvPSuGpc4zou+W5yDYQoTSloEE1C9AukgXVpYnyK4Qjw6lXNmY
	rbv2o19XX3b35KjnphRLm/7g2teTztlRhsBk85y24Ki2fTlsBjZ9+bK/LS2WqsuTNxpM/+xZtwRtv
	lQm5IQwiSpI+CyK83RFFc9WnhSWYFETXRa6VhHIIHckTuf9dZz45XdrOaR0OfiVkgLBD+Vgxi/GHG
	aIz+tdXC0QJUZpRTKG69XCkuKf3AI5sa5VK6ovKxBEJioCzVf7nuVibcOY2suvO17CSpN/ETYYuNS
	0GaRgZBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfS8o-0000OF-Dh; Wed, 18 Nov 2020 18:25:14 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfS8k-0000M6-0y
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 18:25:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIP3pZ061801;
 Wed, 18 Nov 2020 12:25:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605723903;
 bh=b0W4/IilRswe4N7gZ6kusQuEDxud1SbCTxxWP2WJD9U=;
 h=From:To:CC:Subject:Date;
 b=mLDululR1VayWRN2kQplMAFBUbVFygaWjDCY+Oi/GVZNL9+ehAh34setFbcB7+5U/
 WgTUYZdLtcfd4J+0Q38kzyqnKBG5aFbe6WLYzY4Vy147uVAxlMDEcCboymj0WzmKgS
 CNp3TpLTOWVgFo2EkaaT3ajZn+KXF1aQYCvDCTPA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AIIP39V130876
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 12:25:03 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 12:25:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 12:25:03 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIP0Du022682;
 Wed, 18 Nov 2020 12:25:00 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
Date: Wed, 18 Nov 2020 23:54:56 +0530
Message-ID: <20201118182459.18197-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_132510_239513_A035131C 
X-CRM114-Status: GOOD (  16.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

The Cypress Semper S28 flash family uses 2-bit ECC by default. Under
this ECC scheme, multi-pass page programs result in a program error.
This means that unlike many other SPI NOR flashes, bit-walking cannot be
done. In other words, once a page is programmed, its bits cannot then be
flipped to 0 without an erase in between.

This causes problems with UBIFS because it uses bit-walking to clear EC
and VID magic numbers from a PEB before issuing an erase to preserve the
file system correctness in case of power cuts.

This series fixes that by setting mtd->writesize to the ECC block size
(16) and making sure UBIFS does not try to do a multi-pass write on
flashes with writesize > 1.

It is based on the xSPI/8D series that adds support for Cypress S28
flash [0] (it is in next now). The patches themselves are independent of
that series in the sense that they don't rely on 8D support. But since
S28 flash is not supported without that series, these patches don't make
much sense without it.

Tested on Cypress S28HS512T and MT35XU512ABA on J7200 and J721E
respectively.

[0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/

Pratyush Yadav (3):
  UBI: Do not zero out EC and VID on ECC-ed NOR flashes
  mtd: spi-nor: core: Allow flashes to specify MTD writesize
  mtd: spi-nor: spansion: Set ECC block size

 drivers/mtd/spi-nor/core.c     | 4 +++-
 drivers/mtd/spi-nor/core.h     | 3 +++
 drivers/mtd/spi-nor/spansion.c | 1 +
 drivers/mtd/ubi/build.c        | 4 +---
 drivers/mtd/ubi/io.c           | 9 ++++++++-
 5 files changed, 16 insertions(+), 5 deletions(-)

--
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
