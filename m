Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E50EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 22:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lrQVxqv5cWq3uUoTegmXMEPHjmPFSt4MQv7YaMxG8E=; b=HzkuaHjzjTyGNt
	bD67JQDC0sXdsHuvZ2JN1EOxETmasvpbrJVfRuf6pTO5gsc8hgs3HqTNXIS9LKVzB1tWoH9LaZ+vS
	W3JejbBgzO3r3iwybtTpGaLM689DAtuv0U/MtIHPGzTTNwjq+DdjfnOPAlEh+8LHgSkUmkNjQiyiw
	Oihe+LNBymUKFvY5iF4uurSifs6eyVuzAxvo3vJ9Gdc6bQPsnr+bWBBeprsripjPKDPPGWjBOmkYL
	dDZCs63YP18xd9cJnv8E1xzEbO8MPjWTV9SYZ7RUzd7BM8gF73dGAJfMVUdhT/59byQh1HqzS61HJ
	C4ncSRQ/gpqGoaUv05dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJi8k-001Niz-24;
	Wed, 12 Jul 2023 22:16:54 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJi8d-001Nev-2x
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 22:16:49 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b700e85950so118163781fa.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 15:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689200204; x=1691792204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=T2altrG6dNzTVxPdyClkJw6UuED6zHa7UCunHa6cLY+LwlFbTD3B2BwAfohvJe8gh6
         pTpmZnkjw+1X0M/uNMTIcatfVlQVrJ4hHuYZX66VPchGp47Fy2Et2R1uSsNPhAcObUzM
         EX6ErPJGyHFHkPASUn6xIGmsxQ21uw7hTq222rCrwEvDOv55J5sjJDARy+7g45MGtgnf
         mGkCAuMQfUCz7W6wMxDGQiuexXt6/oA9yM7TgjqL0o2NsX+abR7jEhqQHSEZ5cIR6ib/
         wwOkb+EpaQ4b2toTE7CfeK1QltRTAJrFqE37roVWqf7tJH/Is6ameSiB+FJo1mcz/e5f
         S8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689200204; x=1691792204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qtQZvewa01bd3WNJlBR7VuLAaPubF3IprbkAp3R6jI=;
        b=OW4lUsRviEwxEdFuiFXr9PeV1FyYJKLjRIOSOYfd9c6EUO8Gt3RTA4lNSGC2/UX3KF
         ZTc425Driug+QvdassdcWyjrUYABRfNWRmY6QRzD5ZcNk9z0LberRdOvJ2ezTcR+TmP9
         PNEib6OS5fRkqC3GIdLda/kv8Y6WKUUhqKvPlS2hNHWIb7Stmu69Zq/GDGr26SKe0ikI
         a8t5xdGeONh+bPuIYyAVJrI2Z70mSAyyE49P1B/YoiExR7eQ60+oF2fRrGlnkHbW9sLW
         xtfcjAu7e9t2hIfEXO0L0WUhCFUYjFJRky3VTHTgZ3NP8sXqy8Y4hbPtbetf40MMBkId
         kOig==
X-Gm-Message-State: ABy/qLbBHwsPakBWdbBSgKiN9ZpNjzpjQeE0ypAkMqt1j7d+BbK3wYJ0
	u+EW1GY3VFj+LBdjFg3d7s3itmZCWD9FG/093B8=
X-Google-Smtp-Source: APBJJlFlg0wg+oLTe0osO+qC/fBLQfjtsicmaKbj2TfVUiwnMm2ZtNyVk0imiu82DR14aN/jJPhZLw==
X-Received: by 2002:a2e:9d04:0:b0:2b6:e8a0:a7f8 with SMTP id t4-20020a2e9d04000000b002b6e8a0a7f8mr16540965lji.31.1689200204409;
        Wed, 12 Jul 2023 15:16:44 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b19-20020a2e8953000000b002b6e00a3e19sm1177774ljk.132.2023.07.12.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:16:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jul 2023 00:16:42 +0200
Subject: [PATCH v4 2/2] ARM: dts: bcm5301x: Add SEAMA compatibles
MIME-Version: 1.0
Message-Id: <20230713-seama-partitions-v4-2-69e577453d40@linaro.org>
References: <20230713-seama-partitions-v4-0-69e577453d40@linaro.org>
In-Reply-To: <20230713-seama-partitions-v4-0-69e577453d40@linaro.org>
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
X-CRM114-CacheID: sfid-20230712_151647_955719_20C76FB9 
X-CRM114-Status: GOOD (  11.75  )
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
