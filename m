Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BC1C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FgHQDWstlvetnUBfW6hOjRBZTvK3OGI65nwb497Yf4=; b=rHrunCyXUDbiTw
	+PvkVyA6AAjd3UPAZFvH3X1gao/qiQRDcKhOrpjL/Lg5FLfwNQU3XAUcg8DzjyHknfvfmxCfgXovw
	1SWf5OutqKqH9SkCVwNnTaPCBCTks2mLkD4VjxzdhhtEwW6e98FEP1IOlbJ2UT7cGlwwUx8BfW3FW
	g0vBlUCXNL0kuvGSmjxuiupA38eg0Rq26h9dZJYo1sU+PoiVY2+DIHs4IBAweUjR53AB3rRzkB4/6
	uWIQQ9Cb1VTu3XhKxdGZLPa42KDDz1Mz72URTxGauzP4b/Ko/G8A2B/l+fPz3X/xhdb3OXH6KOyiT
	6YidQZZi/n6+nz13Qxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVQq-00H4Om-2e; Mon, 14 Nov 2022 09:07:09 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNi-00H267-Eq
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ED1F9FF802;
	Mon, 14 Nov 2022 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZXshiOPjCKaC4DLT1nvR8gkGxfPYRfPdpLRj3Pz4+g=;
	b=UDSNPAslbjlapBM2Hm0s6QeHvls1ReRpUBGOmWfcNV/oylSVgoLi73PT/bpVvmqg0lTGaj
	UJV1JpfXA5sVSoNT5Tg7m3VXh9884AG0AVdQhKtKbWnI7fnj1LnAordS6vOtUPw5fyHOOf
	UrgNmD+uEoiyjDUQqDczAQJrzVsskijWHtdPH1OhDI7bNKXBYI10Q2D6nA9sWbu8d/E7ZF
	PV6Z2HxUdv0r7Dh3HHwklr58jb71nt3/qBTVpJATtueCYG5TfwBsiGtC2kLKb5lPJ2vyW1
	uP99kh/SUBARWq1xENSI9iNltL5TUEod9jL5schJCQxY3hpKd3wbxPkPnoVJpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 13/17] dt-bindings: mtd: nvmem-cells: Drop range property from example
Date: Mon, 14 Nov 2022 10:03:11 +0100
Message-Id: <20221114090315.848208-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010354_684711_B3B69A39 
X-CRM114-Status: GOOD (  10.18  )
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

Memory mapped devices such as parallel NOR flash could make use of the
'ranges' property to translate a nvmem 'reg' cell address to a CPU
address but in practice there is no upstream user nor any declaration of
this property being valid in this case yet, leading to a warning when
constraining a bit more the schema:

	.../mtd/partitions/nvmem-cells.example.dtb: calibration@f00000:
	Unevaluated properties are not allowed ('ranges' was unexpected)

So let's drop the property from the example, knowing that someone might
actually properly define it some day.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/partitions/nvmem-cells.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
index 5cdd2efa9132..ca18892eacc7 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -84,7 +84,6 @@ examples:
             compatible = "nvmem-cells";
             label = "calibration";
             reg = <0xf00000 0x100000>;
-            ranges = <0 0xf00000 0x100000>;
             #address-cells = <1>;
             #size-cells = <1>;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
