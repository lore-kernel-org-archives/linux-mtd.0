Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777B0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 18:20:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6066113D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 18:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D6066113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gta7fY4Els5ss/v2GD0E25JOBhnV4xijs5Q1VRpz03M=; b=HIgd84nlkXxZg8
	WtC3TEMECldQvlfHJIBjW0acqBLUXPlvJ3hPpdZHdLxPKIc2ftP8mE0/qfqIt0DhQaZrUeWinQIgk
	mrndixPsfU4W9gRfX9SCQeToBF6leMLFEp+IBGZvCDXfJd1YVqKgyBIclPJN3ZxDX4hli4q2WyVFV
	uokofjn0VRGnfqr/YTisCPOtrd9ncoWMq/KVXlG0c7x6m1m+QVc3qoX9w2RvWbUCU//M2Nz3wDjKw
	DN3Ag+3ywlQ2varAiM1y9NfBV8pGFTEvQKlT3c7ucOu+Bd9A7c9MpoOtG+3xnqZZo338RFpeTsSgU
	3yYywJvIoZQ0JNIrVg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkViP-002yME-Ob; Tue, 09 Nov 2021 18:19:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkViM-002yL8-If
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 18:19:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A9IJH40094844;
 Tue, 9 Nov 2021 12:19:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1636481957;
 bh=xsNrZAugT1a4ot1HJ3Nu/+NyUFJPJASfhJWC608znmA=;
 h=From:To:CC:Subject:Date;
 b=PYWfbWMgRF+mRZZTaJy/yImnZxTSDwfXFQPB2ZOgXzZqtd7wL/L5MVQlH0NFo7cMR
 CKc5Y+cWC9QVOEgCS956QhUHhAEGL+i73UMDtypbjKQhI5X+OKWvpwjflGRC0Clh77
 75FdPzZrPiIW4E26k6VDKMuQpkWVq6351swW9Iao=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A9IJH0K080403
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Nov 2021 12:19:17 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 9
 Nov 2021 12:19:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 9 Nov 2021 12:19:16 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A9IJC51017044;
 Tue, 9 Nov 2021 12:19:13 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: [PATCH v3 0/3] Add bindings for peripheral-specific SPI controller
 properties
Date: Tue, 9 Nov 2021 23:49:08 +0530
Message-ID: <20211109181911.2251-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.1.835.ge9e5ba39a7
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_101922_761417_E29F3DFE 
X-CRM114-Status: GOOD (  11.95  )
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

This series adds bindings for peripheral-specific SPI controller properties.
See patch 1 for more info on the motivations behind this.

This is the best approach that I came up with with my limited knowledge
of JSON schema. It has some limitations that are mentioned in patch 1. I
don't know of any better ways to model this. Suggestions are welcome!

Changes in v3:
- s/slave/peripheral/g
- Drop the | on description.
- Drop the compatible property.

Changes in v2:
- Move other subnode properties listed in spi-controller.yaml to
  spi-slave-props.yaml
- Move the Cadence controller-specific properties out of
  spi-slave-props.yaml. They will be added in a separate file.
- Add a reference to spi-slave-props.yaml in spi-controller.yaml.
- Update description.

Pratyush Yadav (3):
  spi: dt-bindings: add schema listing peripheral-specific properties
  spi: dt-bindings: cdns,qspi-nor: Move peripheral-specific properties
    out
  dt-bindings: mtd: spi-nor: Add a reference to
    spi-peripheral-props.yaml

 .../bindings/mtd/jedec,spi-nor.yaml           |  3 +-
 .../spi/cdns,qspi-nor-peripheral-props.yaml   | 42 +++++++++
 .../bindings/spi/cdns,qspi-nor.yaml           | 33 -------
 .../bindings/spi/spi-controller.yaml          | 69 +-------------
 .../bindings/spi/spi-peripheral-props.yaml    | 89 +++++++++++++++++++
 5 files changed, 135 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml

--
2.33.1.835.ge9e5ba39a7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
