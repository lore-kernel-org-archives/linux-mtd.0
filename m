Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF76BC282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 08:37:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BD62184A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 08:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z7BDKtq2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ogr3DHJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97BD62184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tfUyCvC0haZj2arO5Usn0eyTdXg42hU26MbfDdurnVI=; b=Z7BDKtq28chJBg
	Cg4eGzbes9xh7ndPw6dfShOfZJO9yf3cLHCZiwJbUGLgY8nvkSt6lZ4jIpeIKO5+ToalsLfcBvznD
	gG6IQfhXoah0kWP7hvlaaZUMMcAZngzzli5N7gFWNCDbv1SJMOEwAvcg2LeHsVXgaE7x/xy9GpXxD
	9W3wYJhw6cktgFiTPb59ipPkDe0OS1eNoaHFeIAA60xtDGIYPZtSul0+w88rLywVFSVAlOlkEdxgu
	ockvUk1XGeDrpwLyr8BBV99nyBktk1ExK3//tN4dJuDG7Bwq9No4cAoNK6b453a4Z47+wuUqnQXhZ
	N56bGnke1Ec+yIqkT9Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtTZB-00068e-So; Tue, 12 Feb 2019 08:37:21 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtTZ8-00067y-PA
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 08:37:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1C8bFvi008884;
 Tue, 12 Feb 2019 02:37:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1549960635;
 bh=6vYCzI3nrECqihrQx8EFRPXTE8yqC+6YHFuQM4ZMmDs=;
 h=From:To:CC:Subject:Date;
 b=ogr3DHJw/q0+58GQnve6u5Xl/y6voz3ESYig7rJFCQfgcQlO5IxznyR3fp9zAcZY8
 YU7kUAE0wzghOcEzLCBO8BxWgRZkW11D9sRj0usV1vpB3A6brNm9ik5oXR/MQ/pW3X
 4jnXH4THPZqdqFk4TwDVRId8KOUFhzyo2Bd0Uvhg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1C8bFfx121691
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Feb 2019 02:37:15 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 12
 Feb 2019 02:37:14 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 12 Feb 2019 02:37:14 -0600
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1C8bBsR027304;
 Tue, 12 Feb 2019 02:37:12 -0600
From: Vignesh R <vigneshr@ti.com>
To: Boris Brezillon <bbrezillon@kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH v6 0/2] cadence-quadspi: Add Octal mode support
Date: Tue, 12 Feb 2019 14:08:07 +0530
Message-ID: <20190212083809.6534-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_003718_860460_68E69705 
X-CRM114-Status: GOOD (  11.85  )
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
 drivers/mtd/spi-nor/cadence-quadspi.c         | 59 +++++++++++++++----
 2 files changed, 48 insertions(+), 12 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
