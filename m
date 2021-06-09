Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26451C48BD1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:18:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E919761364
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E919761364
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TpQEupjrmve6XAraue60jW2XB5N8aYof53t7Vgpyhcs=; b=kv+pS1R8y7O+Gi
	qQDAoGCWSFQrzrirOLJrF7Tgho7juWEGZMQw50QoFm4kxpMNoyELEO9UR+ZlKFnBFtqae1eM9dmP6
	D1VxJJpVQNrCpsGZ11BBkufrb98zISZXWjiZDVgdPeYxcAVCdXfOFmv7pszOpTQ5U0GGVGx7GZqdl
	JgKp/LbzC1VE5pBX5huqJV3H+699Izg1bNPSrFgkuz5SDj/hfDYMII1CBm7aCqjMuHcN6GSk6MMRb
	ty93/YoTyGtTIZCtf/wVe25ibGeXoA9iU/+Ahrd6ENpwN9yuikizq3k1v4akRXOdpLDPaxldb3pis
	n/GI3cZQSais/MCILQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwD4-00DGYs-Ua; Wed, 09 Jun 2021 11:17:22 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwD2-00DGY3-64
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 11:17:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 159BHCiP108413;
 Wed, 9 Jun 2021 06:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623237432;
 bh=42fJCg/ThRtNdB6VcGZs5PPX2/UEAquNHV1MLw62RGA=;
 h=From:To:CC:Subject:Date;
 b=XEQ+oGo0ysY18uezmsqxgyaFR+L2jlQYvY0p1TQQ+OP4YfEbxV3x1Bjr3Ze1rda23
 68sL6S8tl4wKyG1iYsm149JPYLA+1YspsabFKRZv4D9yAux6CbTmHXYZ2h5axy/oGp
 eMeLqnEth/SJr/bRaguu/E3dSOme64hbExmKgeRQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 159BHCkC085826
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Jun 2021 06:17:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 9 Jun
 2021 06:17:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 9 Jun 2021 06:17:12 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 159BH7uF073420;
 Wed, 9 Jun 2021 06:17:08 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Michael Walle <michael@walle.cc>, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 0/2] Add bindings for slave-specific SPI controller properties
Date: Wed, 9 Jun 2021 16:47:05 +0530
Message-ID: <20210609111707.9555-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_041720_298363_8810891C 
X-CRM114-Status: GOOD (  10.66  )
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


Pratyush Yadav (2):
  spi: dt-bindings: add schema listing slave-specific properties
  dt-bindings: mtd: spi-nor: Add a reference to spi-slave-props.yaml

 .../bindings/mtd/jedec,spi-nor.yaml           |  3 +-
 .../bindings/spi/cdns,qspi-nor.yaml           | 33 ------------
 .../bindings/spi/spi-slave-props.yaml         | 52 +++++++++++++++++++
 3 files changed, 54 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-slave-props.yaml

-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
