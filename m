Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6D3EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lrQVxqv5cWq3uUoTegmXMEPHjmPFSt4MQv7YaMxG8E=; b=DEjt7Uzoq61b73
	pikndQmlWYThjrVwEfdvKvsgkRby0SdcTxVlbvTRj/Tqw/DuZoQ6MiIjXmglcJEUXv+CKa4+ga9wx
	aya4g+Xc8Q/zUzSoTFDKke5rReRf9D5qlu57PsEQ0Jf2xIBvE620POJOXIc/3C+Icasj8ZJw67Kh+
	J7j5YpZBl0wodNjXsprF4AZYvhwk3cVNqswtza709Poq4HcoizGkiwL0koYKXyn/5kgwjGQ0EzZ1v
	+3XNNx2eciWEuDbNKwwx6I0IA2qUZCTq/IKMPraz3XT0QlGO90RgasCIrQ1VAVBumLI8wnU4cfn2s
	x5AvyL7koJMdrD3CCsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzaF-00FTJB-0t;
	Wed, 05 Jul 2023 10:18:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzaC-00FTH4-35
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Jul 2023 10:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=; b=qUy/oLp8AdZrFJX6/W4xy/xs0A
	MfMSVHGclbECAXAlBpL1M/eCtuJoJOQXFO//rmSETkw+mcQbYedDux0q663z1MZG4PvQ8e3Rq5ORx
	TWqj5L/4/vcGi0bEBg6N99yd20P7yD3PlfZ5eCHMSjtNRfUTwIpHeXOJD58E0W+M6MW250vyrSDVa
	LH4pzXCWE9+x0F8DlimdwSN63ASWbK5C150j3liUKZQ0xeVEB/mZFwrikZRQY2a+iIfFvD+vpz8//
	Nal7SXHa7Du+gj9rw307R6/FGn3ZdhtRKfBL6SNC7rRmWGizyOheD9SZiktIJZ9jJcYWvyORqTRXF
	V3qXlFFQ==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGza6-00C5ao-0g
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 10:17:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so10129479e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2023 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688552272; x=1691144272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=stWmPgSuOqCIUaBUu4h5wa5BRifUyWh8dDQQnrs9IiT/dO56Vpe+Q+QJiEXbWOrVFx
         mBEXwEkBs8ksWsmAhZHfSyvjlOpliXhLuYf/d2o9P2VthamAe8z9CrWBzXHw/q6kSRLK
         Dc8ZOxu2CIvyh52/WL1wNWhMkfHs6jHdH+ke9h3s8/auZt/SVn/A9fvAaYMurXNFtUwi
         y296J6An+ov8798503IcQ6R7R+pa4jkOAod0c1k8+AezVcUu16Rif4vsN3EByWEDz3s/
         z1R92nXMjiSfTRd79BRSyVUP9+9RIuztf1ZcipbvGdwvqr3VSYh82fRy+1sABykEkaV1
         sXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688552272; x=1691144272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=GZWYz2Xy5ryS4YKpc4mhHDuCjB3MnfBk5Tf1RRQVcgjmjfoHVCQzaV5eVC9dKrIoIX
         wFOTRHLZPbjGkkyMDMcXYJnUblcqN6pMeu9d+2VYRqtr9pky+PDTm67yOds0TZxp4dUk
         CYZk1s5JBDEgyl6R+oe1FpNUGQ4/wAH0vhkBN/45l9dw7uEMp5xBN7iowFxBCGEe1bpe
         u2G/7Yp0uQl48IRtwCpHpGZu1N+9JjSmKUBlKplMa1OeVbA0nXYzVC/R94Y0S0aq9m1i
         QHK5beOn8pZF/fF0A1Z1YdGiZCzo70jRj/CIkL5iC82LF+2RiVNPksiWELtd4SBOHjZc
         57jg==
X-Gm-Message-State: ABy/qLY5qB/x+/nodWKJS4+ZcbFSJZi8+W/RU3Vq2gjpEMsWmwy4ulOa
	09vyU17rYBE36aSzFL74e2DLpQ==
X-Google-Smtp-Source: APBJJlEVb/vpbPfo93k0QjY4gCXf3tUE1lHuE6ScDAxCqz+Yml4ozxk8QWe9GXj2kqc1im9ENVsYDA==
X-Received: by 2002:a05:6512:3448:b0:4fb:780d:2a49 with SMTP id j8-20020a056512344800b004fb780d2a49mr9654749lfr.5.1688552272262;
        Wed, 05 Jul 2023 03:17:52 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l27-20020ac2555b000000b004fb75943ab3sm4774418lfk.258.2023.07.05.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 03:17:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Jul 2023 12:17:47 +0200
Subject: [PATCH v2 2/2] ARM: dts: bcm5301x: Add SEAMA compatibles
MIME-Version: 1.0
Message-Id: <20230705-seama-partitions-v2-2-9d349f0d5ab7@linaro.org>
References: <20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org>
In-Reply-To: <20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_111754_653317_DDCF86CE 
X-CRM114-Status: GOOD (  11.32  )
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

This adds SEAMA compatibles to the firmware partition of these
two D-Link devices.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts | 1 +
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
index 555fbe41dd8f..cf3000b07eea 100644
--- a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
@@ -33,6 +33,7 @@ partitions {
 				#size-cells = <1>;
 
 				partition@0 {
+					compatible = "seama";
 					label = "firmware";
 					reg = <0x00000000 0x08000000>;
 				};
diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts
index d945a20b06e0..3551f855ff20 100644
--- a/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts
@@ -149,6 +149,7 @@ partitions {
 		 * partitions: this device uses SEAMA.
 		 */
 		firmware@0 {
+			compatible = "seama";
 			label = "firmware";
 			reg = <0x00000000 0x08000000>;
 		};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
