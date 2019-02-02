Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263CEC282D7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2EE2084A
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZQIcoTd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="DJtq5NIj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2EE2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1nSwGBbI/nkqXJL8LR/jBsui9eXoxYKL321JujTNeOw=; b=UZQIcoTdOfHAfLvAC9p+acXfjk
	xljz/4nzdrYJQG3pvZ86yZs1a0UsXjmMQnJUapDF5TTNafQCWGTw8ShuLrBaAZK8gBowDV3lerf5i
	RO3515ZH7QplmADrfxpOo3TwEqDpSg+iFYhjb9KiFG3FPOw3Z+g+pEvwGRslgukzF3VLCvfa8hqr9
	8Lvo37soWZwZdu3dFAeMK2KQ/oQGNDQjXSnWG669/oNbcmRWnvHLfnEvWN8Yr4U6pEhTz/27qKNAw
	AQxqvyKjLFvKTSnmQSQjeGCwFC+mhl9H0yCd2FMQsFT/61uoJHScSBXAUpQQf8f6fn6b5PsEi3ufI
	lwrhaVIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gq4a8-0007ay-1g; Sat, 02 Feb 2019 23:20:16 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gq4Zp-0006J1-Q6
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2019 23:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549149594; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=2DVrF9XfoCPEIcaQJb41Hi/FfGsoayBTTGKWogn+zsI=;
 b=DJtq5NIjQd0RjirweR7i/8cGmKsVihPu0v15JYFj+Id+9Rjh382R+71E4ET5H6oWVVfkq4
 sfSF/VV/NwIv3jTWHQ0RvNRX6MpE+AOtihQxvb4V/Cc7DuMkcumfJ8HzD+dHlknbV0J8mF
 +P431Co2a2b9x+9X/HS1hfWjMY45280=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v2 2/9] dt-bindings: mtd: ingenic: Add compatible strings for
 the JZ4740
Date: Sat,  2 Feb 2019 20:19:19 -0300
Message-Id: <20190202231926.2444-3-paul@crapouillou.net>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_151958_087879_CD38A545 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Mathieu Malaterre <malat@debian.org>, devicetree@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: - Change 'ingenic,jz4725b-nand' compatible string to
      'ingenic,jz4740-nand' to reflect driver change
    - Add 'ingenic,jz4740-bch' compatible string
    - Document 'ingenic,oob-layout' property

 .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index 29ea5853ca91..294b56a2098a 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -6,7 +6,9 @@ memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
 be children of the NEMC node.
 
 Required NAND controller device properties:
-- compatible: Should be set to "ingenic,jz4780-nand".
+- compatible: Should be one of:
+  * ingenic,jz4740-nand
+  * ingenic,jz4780-nand
 - reg: For each bank with a NAND chip attached, should specify a bank number,
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
@@ -15,6 +17,10 @@ Optional NAND controller device properties:
   property must contain a phandle for the BCH controller node. The required
   properties for this node are described below. If this is not specified,
   software BCH will be used instead.
+- ingenic,oob-layout: Specify the OOB layout to replace the default one.
+  Valid values are:
+  * ingenic,jz4725b
+  * qi,lb60
 
 Optional children nodes:
 - Individual NAND chips are children of the NAND controller node.
@@ -72,7 +78,10 @@ NAND devices. The following is a description of the device properties for a
 BCH controller.
 
 Required BCH properties:
-- compatible: Should be set to "ingenic,jz4780-bch".
+- compatible: Should be one of:
+  * ingenic,jz4740-bch
+  * ingenic,jz4725b-bch
+  * ingenic,jz4780-bch
 - reg: Should specify the BCH controller registers location and length.
 - clocks: Clock for the BCH controller.
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
