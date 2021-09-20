Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE3FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D2660E76
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4D2660E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o0zvRMTvso3ZRnHLJTIn/tRKETb9UtAFPHzCMJGw3Ks=; b=H9pdWG8ZrovzIr
	cXo2wRwejABi2Tpoa/UaZHEjgmAVj+DC+NNtvPFGMUTpR5PX9enHah4PWnmg1//A+Jj81Sn9Rpiht
	feEbZHtlHFSm64eI68PfRAZ45PSLRmVr6nMxnktIxEYWAUs1yuNqpL9bT1s9YO+M+tn2LUEjaztsn
	ftXypFgBrT8m1l59oKILkE9nyRWoULR5u9P393MZR8TSnZTTb+gsez7yg+CEhRTvLrfWZwd3eFCTQ
	wB78+uHBk5oNTpfBztp7j+iPnKZXXKw8AzWOb7ruik3p+ik506NS4wFMe9u0DNSnFK1TYLFSteAjl
	H/jwxLizTk+TTLGIDBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKGq-001uLr-Po; Mon, 20 Sep 2021 14:27:48 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKGb-001uHP-U5
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 14:27:35 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18KERKTl105711;
 Mon, 20 Sep 2021 09:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632148040;
 bh=Y7l7RaNnp7XledpwNXnncmI84XTK+TQrRyIYiiow6jY=;
 h=From:To:CC:Subject:Date;
 b=iVj8t8mzZOzjB+LSPSNKaxSFv43hNK0hKIkYx4eGnA+GMm9cXZUYLhB+HMs29Bzvk
 C4abHK9XR5zIl4HYnH/N4/EwPYuLIipL3SsphEtVw/WchKhqUCwbR3uNwPH8ZS2qPj
 KcgzlyNXel64RMJ1OKIhmQixUUuw/pfyhS3c88Ks=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18KERKjv044860
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Sep 2021 09:27:20 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Sep 2021 09:27:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Sep 2021 09:27:20 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18KERE42100694;
 Mon, 20 Sep 2021 09:27:15 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: <michael@walle.cc>
Subject: [PATCH v2 0/2] dt-bindings: mtd: spi-nand: Convert to DT schema
Date: Mon, 20 Sep 2021 19:57:11 +0530
Message-ID: <20210920142713.129295-1-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_072734_053187_D0089164 
X-CRM114-Status: GOOD (  10.63  )
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

Series to convert spi-nand.txt binding to YAML format and also fix up
snps-dw-apb-ssi for related dt_schema errors.

Changes in v2:
- Fixed dtschema erros in snps-dw-apb-ssi.
- Improved additionalProperties, reg, and compatible fields in
  spi-nand.yaml.

Apurva Nandan (2):
  dt-bindings: mtd: spi-nand: Convert to DT schema format
  dt-bindings: snps,dw-apb-ssi: Use 'flash' node name instead of
    'spi-flash' in example

 .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
 .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
 .../bindings/spi/snps,dw-apb-ssi.yaml         |  2 +-
 3 files changed, 63 insertions(+), 6 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
