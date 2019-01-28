Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E19C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 05:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6183820870
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 05:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwGB0Ah3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dA75PMuZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6183820870
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=feWXerls0LhVErMJLuf9gYgBnC1FqIWil6guOxz2m3w=; b=IwGB0Ah3YHuusC
	W1Z9xRl9ITUJwkL8RLk3QI3oMV+UuaxI/3nJ6aiC74LGlOhqKwVwcv6adSN2MMTbA3dccQCvSUQHo
	gzfC5G6+FTtMxVhCjmkpIz+0Hj+qlMpjDerv7XtAl2RStPyOvar1twN5/5ZOVRkHCk0R7eaBZQ4o/
	C3A7fvAo4MNXL04+gg1etc7Ag5oGNUyb3xSLLcC4CCAaoAO9J1icHyde1nthHUfzXAnU9HzVRJVUf
	R3X3mm+4TxsCYIfR2CbYE04UGo8bXBiB/RM0MK2bhpMO+BMxg5P8FFnroCUK+5pCm0tlD4FYFkmTE
	fKNZ3pKkAWp4TsL+SS5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnznA-0003sA-9j; Mon, 28 Jan 2019 05:49:08 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnzmm-0003Sx-Jy
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 05:48:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0S5maHE005684;
 Sun, 27 Jan 2019 23:48:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1548654516;
 bh=mX3yJ3Julq4LUhAGw3aZhrD+3gRTkWL9WMSrHiLwmQ0=;
 h=From:To:CC:Subject:Date;
 b=dA75PMuZRzCrKeLZRDOVUDScOywrdUuT0cZ1sfobz3kT/6VrZ0fOijb8aZ1BAJWiI
 B2Nxukw3Y9gexTALrFIcRHkvzlWpZoUGDKdHPg7ru7xTDDrShRC0Xd8iSp4gHBNtUq
 CFK256BUH4W6DB55yYVaVHFtR1VFvK4f9gDuRXO0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0S5mZ3c025737
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 27 Jan 2019 23:48:36 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Sun, 27
 Jan 2019 23:48:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Sun, 27 Jan 2019 23:48:35 -0600
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0S5mW5O020800;
 Sun, 27 Jan 2019 23:48:33 -0600
From: Vignesh R <vigneshr@ti.com>
To: Boris Brezillon <bbrezillon@kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH v5 0/2] cadence-quadspi: Add Octal mode support
Date: Mon, 28 Jan 2019 11:19:33 +0530
Message-ID: <20190128054935.4972-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190127_214844_722188_7249A20E 
X-CRM114-Status: GOOD (  11.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh R <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series adds support for OSPI version of Cadence QSPI controller IP.
Tested with AM654 EVM with MT35x512 Octal flash

Changes:
v5:
Fix comments from by on v4.

v4:
Fix comments on v3 by Tudor.
Rebase on top latest linux-next(all dependencies are now part of -next)

v3:
Rebase on top of v7 of Yogesh's series[1]

v2:
spi-nor core patches dropped, are now part of Yogesh's series [1]
Declare Octal mode capability based on compatible.

Vignesh R (2):
  dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
  mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

 .../bindings/mtd/cadence-quadspi.txt          |  1 +
 drivers/mtd/spi-nor/cadence-quadspi.c         | 58 +++++++++++++++----
 2 files changed, 47 insertions(+), 12 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
