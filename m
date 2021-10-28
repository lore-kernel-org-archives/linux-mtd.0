Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09A5C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 12:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7119961037
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 12:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7119961037
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H+9mq8W+VkENjugO+7xdRQB7HKlu8vm3RdLnJlnh4F4=; b=SDvAX3tynBULkt
	rNEn7jcZDES6O7vh52CCltaeNWHGjCI0wNxqzbAJhJUgXTWlDXDI5HEQkrsE3OSjoHTDw1tBVdj9j
	SZc/qWoNdMRLkWbdPBt1GXhuv68X0coylYeBHyaSli+ebc05IJ8KExfIEM4Z3p3RqP0NeqBDmEADW
	vBjFLm7B0M1Td/Vy0cxbotIYUPyhOpt8ghcd6uF3mpm2kIHKPZaB6FVkVyi7P3yfNRZHdmIS7D9FG
	vkCozJuJqifvW087LFYy43rkLubiMBvfF3gAGkqGIzxOJGFzKLstF8id9VQVH41IeISwvxAoegTt3
	I9iPMp34OxXhDkF4iTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4mk-007oKI-Lt; Thu, 28 Oct 2021 12:45:34 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4mf-007oIt-Mg
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 12:45:31 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19SCjOuE046426;
 Thu, 28 Oct 2021 07:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1635425124;
 bh=NtVjaK3NVDc5/FgFPK++Bri10Kvkgs6XU03tEJ+YQ0c=;
 h=From:To:CC:Subject:Date;
 b=Vo0L4UGhARwXYeRKxOVVyJnLvlxMBykznrkdrPhOG8WrLDC9rDRpTiPQYo4/BtUCi
 VCX3Ma71P7Lfyl52NlD4SWrXCP+DohVdO4jihOzPjWA7TFFYVtQHPEEHpKT7LzHXxu
 wI1QczV5rlyWgjGB/ufySkewPQnlTYZcPsbZKr4s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19SCjOD2119937
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Oct 2021 07:45:24 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Oct 2021 07:45:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Oct 2021 07:45:23 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19SCjJbA115317;
 Thu, 28 Oct 2021 07:45:20 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: [PATCH v2 0/3] Add bindings for slave-specific SPI controller
 properties
Date: Thu, 28 Oct 2021 18:15:15 +0530
Message-ID: <20211028124518.17370-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.1.835.ge9e5ba39a7
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_054529_874171_FEE245E3 
X-CRM114-Status: GOOD (  11.14  )
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

This series adds bindings for slave-specific SPI controller properties.
See patch 1 for more info on the motivations behind this.

This is the best approach that I came up with with my limited knowledge
of JSON schema. It has some limitations that are mentioned in patch 1. I
don't know of any better ways to model this. Suggestions are welcome!

Changes in v2:
- Move other subnode properties listed in spi-controller.yaml to
  spi-slave-props.yaml
- Move the Cadence controller-specific properties out of
  spi-slave-props.yaml. They will be added in a separate file.
- Add a reference to spi-slave-props.yaml in spi-controller.yaml.
- Update description.

Pratyush Yadav (3):
  spi: dt-bindings: add schema listing slave-specific properties
  spi: dt-bindings: cdns,qspi-nor: Move slave-specific properties out
  dt-bindings: mtd: spi-nor: Add a reference to spi-slave-props.yaml

 .../bindings/mtd/jedec,spi-nor.yaml           |  3 +-
 .../spi/cdns,qspi-nor-slave-props.yaml        | 42 +++++++++
 .../bindings/spi/cdns,qspi-nor.yaml           | 33 -------
 .../bindings/spi/spi-controller.yaml          | 69 +-------------
 .../bindings/spi/spi-slave-props.yaml         | 93 +++++++++++++++++++
 5 files changed, 139 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/spi-slave-props.yaml

-- 
2.33.1.835.ge9e5ba39a7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
