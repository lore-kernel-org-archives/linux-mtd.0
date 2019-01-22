Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB25C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 06:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 496F8205C9
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 06:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttkyoxAQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Tv2Vi34C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 496F8205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHGraiEqrqnE552lji3klS7pBiVw5VBjyU8lj8tGzJY=; b=ttkyoxAQ6XQdmK
	ykisbWSk1rLqXpAk5aNTgluBr1d4qTTbA/MqdU1nbg2iyaYwvgdxXgvFUqL6Z8JvlBABFO3ZPrbDK
	ZgTOw4Lt1OuiIHZbkQjEKgTSWD6FWbMFVG11ByzD8NR5fbq6mlKEluoUSAq7amSfo1ahFtG3eZQl2
	NZXW96yA0NbLeAjcZW8xf4VhMAjgdZ3fJqUVR3Y2rNqPykrZIPc5XV5p2Crb3T6zhh7X5l6JAZs+8
	YL/9SHukmWmbV/8lfawFecTtOptm5DYeGPeoGEXEL/7nGr4/E3cc8OsM9PlbbYu4ebUgQOvG4Hk+p
	FVtRm1dTL76E6LXjaPTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glpkJ-0004V7-Vr; Tue, 22 Jan 2019 06:41:15 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glpk4-0004Jx-Em
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 06:41:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0M6ewwe035223;
 Tue, 22 Jan 2019 00:40:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1548139258;
 bh=JLW5tbsGoAduPas/7H4CyAkUsTyLKHL9qPmIkQhWvDU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Tv2Vi34Cdxtw2spZNksnkrv7lH8MpG7DWVWjwbxak3WjSX6w9dEnVtrtURKUbIaKM
 utRLAwxqpcn3pFv4yquohukHODmxPYtDi8t9uLPZbokXvz39dyeU1Uq9zp6kWBojFU
 EYkSqHb6IENwJF1QZms13nUbjceGGl9FiI0ywBoE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0M6ewIF078834
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Jan 2019 00:40:58 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 22
 Jan 2019 00:40:58 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 22 Jan 2019 00:40:58 -0600
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0M6eqrs019930;
 Tue, 22 Jan 2019 00:40:56 -0600
From: Vignesh R <vigneshr@ti.com>
To: Boris Brezillon <bbrezillon@kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: cadence-quadspi: Add new compatible for
 AM654 SoC
Date: Tue, 22 Jan 2019 12:11:36 +0530
Message-ID: <20190122064137.17114-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122064137.17114-1-vigneshr@ti.com>
References: <20190122064137.17114-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_224100_677006_3CA9B967 
X-CRM114-Status: GOOD (  13.06  )
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

AM654 SoC has Cadence Octal SPI controller, which is similar to Cadence
QSPI controller but supports Octal IO(x8 data lines) and Double Data
Rate(DDR) mode. Add new compatible to support OSPI controller on TI's
AM654 SoCs.

Signed-off-by: Vignesh R <vigneshr@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4: No changes

 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index bb2075df9b38..4345c3a6f530 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible : should be one of the following:
 	Generic default - "cdns,qspi-nor".
 	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
+	For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
 - reg : Contains two entries, each of which is a tuple consisting of a
 	physical address and length. The first entry is the address and
 	length of the controller register set. The second entry is the
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
