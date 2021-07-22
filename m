Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9639EC6377D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 10:02:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665D961241
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 10:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 665D961241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ai6fLZYpk61BrCF6+qjjbovhV3E6FsRsQvgNL+Je6RU=; b=dRseFqEp/QuDOM
	y3AnEFYo69rXbYrLzZI5rvJYENUtevqbzQjOZ6UtCkge+bVLzB1QH2JCnRSC9gU1NOIGe0BoFyBpC
	jljacNO9yITwEnliZsJzOYvDSCbSgSdFtnw4vNwUaaReNHsBM/Eo0rm+UmJf74RRCzYbHjNmvrB2i
	XmIxa5bsWK68zRXL9BQZb6taBuLp+C5DZO2/jimJ1qce9JHLVLlQYFoMi5m2W5fnUdWkU1SAlXp1P
	ezXbKsHO+3h7VKVxHl4zmRdfTZeIIy2W1EGDIqp+IwWnVfWIN21UMhpg4yGN4Cgi3xUczEdxPq0Yy
	UB0aqdbk+nQJu2WsIQ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VW5-0015Jz-4G; Thu, 22 Jul 2021 10:01:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VV7-0014nW-1s
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 10:00:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 908B461260;
 Thu, 22 Jul 2021 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626948020;
 bh=rTh9g8+vOJ8HY6y/Q5+gV0OfqKbSG4CGnJLbeNyrTwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QLDr8sdSjrYiBBujC4q7IQ1ro6gWV2dcQvDPJlwdenX+5DX5pHtFHmXFoNINE6Vdt
 S0c47H2AypTC+QGVgIBihI8YN39VSko7Z8tS3sbYq7Q1uXOMep/WpfHdeHAjvKsny5
 yhXXLyQMscoEGz85dCtXfo0CCM8w1rT2mqpYvCVf6DKa+YHhCNveq0GpCYPnkkhobe
 SS3pOjoUgjLTlUIi0U1tilM3utooRuj6bbnd1h4nO3hCK1yIhh+hZPXFQ3FXbyMBom
 B/adiIh2xRov8xyIiEYAfrGAc8cFOEdFCF3VXMal0+wiVs9yMYF0jdnsYAT80Pps5g
 yewVcIhW/aS4g==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1m6VUz-008mHN-FC; Thu, 22 Jul 2021 12:00:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 01/15] dt-bindings: mtd: update mtd-physmap.yaml reference
Date: Thu, 22 Jul 2021 11:59:58 +0200
Message-Id: <ab2ff9ee66110c37691b467ec8b4679e9d426416.1626947923.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626947923.git.mchehab+huawei@kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_030021_151621_73DCD87F 
X-CRM114-Status: GOOD (  12.52  )
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

Changeset 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
renamed: Documentation/devicetree/bindings/mtd/mtd-physmap.txt
to: Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.

Update its cross-reference accordingly.

Fixes: 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
index c8567b40fe13..2133be0d52f2 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
@@ -10,7 +10,7 @@ Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 Required properties:
 - bank-width: 		Width of NOR flash in bytes. GPMC supports 8-bit and
 			16-bit devices and so must be either 1 or 2 bytes.
-- compatible:		Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+- compatible:		Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
 - gpmc,cs-on-ns:		Chip-select assertion time
 - gpmc,cs-rd-off-ns:	Chip-select de-assertion time for reads
 - gpmc,cs-wr-off-ns:	Chip-select de-assertion time for writes
@@ -21,7 +21,7 @@ Required properties:
 - gpmc,access-ns:	Start cycle to first data capture (read access)
 - gpmc,rd-cycle-ns:	Total read cycle time
 - gpmc,wr-cycle-ns:	Total write cycle time
-- linux,mtd-name:	Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+- linux,mtd-name:	Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
 - reg:			Chip-select, base address (relative to chip-select)
 			and size of NOR flash. Note that base address will be
 			typically 0 as this is the start of the chip-select.
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
