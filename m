Return-Path: <SRS0=A63j=ZT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089BAC432C0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 10:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C815D206BF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Nov 2019 10:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbJ+IN0P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C815D206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emZz3AmX76wa4BiT83DmKVzDuMu4Bw7dzGYnFPi4J0I=; b=nbJ+IN0PWzBt/9
	vaC2hXvUqaYgXl/hbyqoaRLtshrrjtRtfgZZ6VhkzAzfsUcmDrAdG1Id1WZLcTYGXBAyZgllgHDEk
	Ye4rIfZI+A4j20WfCZ9H2OUvH9/zPaGrI0QEUk4X1vufhpthwfMiE7nXNNYbUsOFgvMg18XSByuTw
	A1pORmHfeN2x5OWGYmzFXxf+XoOigwBXCEl9vT9w9oCkvo3XBCAuHdEAUfmE8l2KUAYSV3CyZjsN5
	r33y5yMq3damem36KimcDmgCf7jzPBVrHw/5I1rdiFws4xbYEfC+LzJNdm9cfoIz072BeLefC9SzE
	fJUliLmzpmThFfUtwBFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZuzS-0003pA-Gb; Wed, 27 Nov 2019 10:56:10 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZuys-00039c-VM
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2019 10:55:37 +0000
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B240AFF805;
 Wed, 27 Nov 2019 10:55:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 1/4] dt-bindings: mtd: Describe MTD partitions concatenation
Date: Wed, 27 Nov 2019 11:55:19 +0100
Message-Id: <20191127105522.31445-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127105522.31445-1-miquel.raynal@bootlin.com>
References: <20191127105522.31445-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_025535_143082_BFC7EA3B 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: devicetree@vger.kernel.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The main use case to concatenate MTD devices is probably SPI-NOR
flashes where the number of address bits is limited to 24, which can
access a range of 16MiB. Board manufacturers might want to double the
SPI storage size by adding a second flash asserted thanks to a second
chip selects which enhances the addressing capabilities to 25 bits,
32MiB. Having two devices for twice the size is great but without more
glue, we cannot define partition boundaries spread across the two
devices. This is the gap mtd-concat intends to address.

There are three options to describe concatenated devices:
1/ One flash chip is described in the DT with two CS;
2/ Two flash chips are described in the DT with one CS each, a virtual
   device is also created to describe the concatenation.
3/ Partitions that must be concatenated are described in the
   partitions subnodes in a specific part-concat property.

Solution 1/ presents at least 3 issues:
* The hardware description is abused;
* The concatenation only works for SPI devices (while it could be
  helpful for any MTD);
* It would require a lot of rework in the SPI core as most of the
  logic assumes there is and there always will be only one CS per
  chip.

Solution 2/ also has caveats:
* The virtual device has no hardware reality;
* Possible optimizations at the hardware level will be hard to enable
  efficiently (ie. a common direct mapping abstracted by a SPI
  memories oriented controller).

Solution 3/ is maybe better from the bindings point of view but
introduces a real mess in kernel code and the amount of boilerplate is
insane compared to solution 2. This is the one finally implemented.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/partition.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index afbbd870496d..6e3ac87ff988 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -61,6 +61,7 @@ Optional properties:
   clobbered.
 - lock : Do not unlock the partition at initialization time (not supported on
   all devices)
+- part-concat : List of MTD partitions phandles that should be concatenated.
 
 Examples:
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
