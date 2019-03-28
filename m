Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA9FC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:03:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB69206DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9u4fcnA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Hwaji7y/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB69206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aYl8jtvoLXMbkKayE2CMMQozaLeE8hsCX3UUJZGDKE=; b=L9u4fcnA9zTiTo
	rFGUxuqyKsEy6B5IEFurN8S0rx8epA0ozc57uOTgCp2lPQOW0qoEXBqTlDjMDmHXYloPm3CEj8Rtn
	VR6uT9pknJtJRXYoqIMJePCjb+Jp4ZsOStFlig5+6sAmuZynnftW9WYa4WgXzVmiEMTMOleCSpjec
	C6b9EP8IWvKKjaVQikCK8TND8D5zoydmiwcnfic5EM4IEaho/QYsBbUXEo8NgNXrMzgMK+/yt0nN4
	xe7V5TY77PiNQGY20hMH+gAylO8UZKQrKxBTuLeXS3V41J5Nimgw2DyjQA90M16A7slj8j0d7PvKT
	akVohrqUyulXigGOuR0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9MFm-0008BL-D6; Thu, 28 Mar 2019 04:02:58 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9MFU-0007pO-5k
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 04:02:46 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1D08B891AB;
 Thu, 28 Mar 2019 17:02:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1553745758;
 bh=fRZTQLS3udad2cgQBUGRWrcv/kmxBMd4xpradg1ohsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Hwaji7y/9NpGG85DxyavyHZ5g2jm2UBTFk/72mYKUjYKya2EWwRr89ko1f6PpbYJZ
 GQC9l0pEq9viFZRSO5JsZ5VeXQeazGefDy9xQ8WknHdoQYPLRB3RBhJVQ687EKmvis
 e1FEtR6OrVOcT/CEXRERcet1aKvU77j+LlpIUq/vuxTC7RUhCINYRxzfRzHGdqmeQ0
 LKprxtcPc9H+FNVh6djVpnwHxTq+Dx0soNnZjFWMlKMc17HHXcy0UCbidttR4hhvzS
 LrtmfqlAb8+45F5Zlnl3Tcsq1W0214/7yOMpDl6P8mj45akJCfomCsr1Muq2CTwH4T
 G986kQPebIILw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5c9c47510002>; Thu, 28 Mar 2019 17:02:30 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id D2C0613EF40;
 Thu, 28 Mar 2019 17:02:24 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id AF38F1E1124; Thu, 28 Mar 2019 17:02:24 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [PATCH 2/2] dt-binding: mtd: physmap: Add example using addr-gpios
 property
Date: Thu, 28 Mar 2019 17:02:16 +1300
Message-Id: <20190328040217.1895-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
References: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_210240_403381_4DF9E93A 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add an example showing how to use the addr-gpios property to deal with a
system with limited IO space.

Cc: devicetree@vger.kernel.org
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../devicetree/bindings/mtd/mtd-physmap.txt      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
index 7df0dcaccb7d..c69f4f065d23 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -96,3 +96,19 @@ An example using SRAM:
 		bank-width = <2>;
 	};
 
+An example using gpio-addrs
+
+	flash@20000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "cfi-flash", "jedec-flash";
+		reg = <0x20000000 0x02000000>;
+		ranges = <0 0x00000000 0x02000000
+		          1 0x02000000 0x02000000>;
+		bank-width = <2>;
+		addr-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+		partition@0 {
+			label = "test-part1";
+			reg = <0 0x04000000>;
+		};
+	};
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
