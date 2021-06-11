Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BD1C4743D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 05:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA536008E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 05:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BA536008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zhGA64Z1IasNbeJKVadJ1laLbubeVKkxcFw2N59ttqU=; b=TEDmEl1BrgN44i
	vrr8CIv5VpfSgpRt7FyExfEXzZuOH2CxILSSPusm9UDHQ3N41QnEQ4dnJ9C7TyPk7uePErExm7VlZ
	ZdmNMegM/ZsjHfd2wadI+f9FTz6SJSS5k7Gfiu/EzZ/n28mL/tu51LQFJWXxVculdzqTynLAGay2p
	97E8Dg3WSVsDPfPULwXMay02PVfWpjojkRdGNG9kEDjmek6ge0mJrxqE+GgfMjmcr8rQxIRPqPhq2
	gppCFbJRP2vBCxH6jY+hztIm2CdVsDxrupZqQRgxvUGSlKyHgi1R8FsbDUzqQxB2CMQMqpEuy5Sas
	Qx1Ru50vSc/7WYFQIARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrZpp-003efC-Cq; Fri, 11 Jun 2021 05:36:01 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrZpa-003ech-31; Fri, 11 Jun 2021 05:35:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15B5ZfGB052845;
 Fri, 11 Jun 2021 00:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623389741;
 bh=DbDCv+8NMzl0I0UoaABgajwTXe8lWjZIzi2WXrI+iAs=;
 h=From:To:CC:Subject:Date;
 b=qQYT5RhBIamx+/2YiS5dlpdXuXgvqD3OA8uw0KdYmNmcnaXgqcDLhYpLB9kBr+T0V
 fnMy++rCNC3kSSiV91SEEoSO3JgzQSuMRP1AiVi6rAr9uoiGkUBLMh9IFhsAng6ryd
 OBjZnddU8z+mqskvH7m7AgkX1kx6Yg95QucnItUg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15B5ZfWl033061
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Jun 2021 00:35:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 00:35:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 00:35:41 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15B5ZbTK088083;
 Fri, 11 Jun 2021 00:35:38 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, Linux ARM
 Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/2] mtd: Convert hyperflash/hyperbus bindings to YAML schema
Date: Fri, 11 Jun 2021 11:05:31 +0530
Message-ID: <20210611053533.16701-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_223546_256291_64EC4FDD 
X-CRM114-Status: UNSURE (   8.16  )
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

This series converts Cypress hyperflash and TI AM654 HyperBus Controller
bindings to YAML schema.

Vignesh Raghavendra (2):
  dt-bindings: mtd: Convert cypress,hyperflash to YAML schema
  dt-bindings: mtd: Convert ti,am654-hbmc.txt to YAML schema

 .../bindings/mtd/cypress,hyperflash.yaml      | 51 ++++++++++++++
 .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 51 --------------
 .../bindings/mtd/ti,am654-hbmc.yaml           | 69 +++++++++++++++++++
 3 files changed, 120 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
