Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D9EC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:00:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E4660FE6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E4660FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjKL2ihHXAH7uhso29LRH+yPu4gU4dYpcszMHCG6HJ8=; b=Eitodt/bKr0rvq
	DP1QSH32Keti4LnqCeTE8WD6J+mgjvlLS90NrHBtNx6kUmOO3KzDADmUKkMNReQF5GnPy/Un6Bodo
	cWY00+wn8WDA8Jty3gdIO9HUOJ5WsHrns8/nHelzeZYbUpkhVBnCkMIV3FJaG2FrxCVFayp0YZeUK
	dT9HOGQisuomXE1RjCO1wgXQbHqv5/tD/MlfumHy6DmDhMjEo0nVZ1p59aWLwa61iLELGMu+RE00U
	rIiamApCmWT7gs2Y7pR+4E14NlaUR+BSJhSKt6K5Jv9CSH5UzahnGXXe1Ymehdu/ytdGIF5ndm3Ww
	OW0Eh5c1lqi5fAtM9qLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlOQ-0091M2-SY; Thu, 19 Aug 2021 16:59:50 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO0-0091Aq-Ct
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 16:59:32 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id DA2F03F365
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392362;
 bh=NMKQ8HC+F1mFEutTPt5SprtiqsXf0Joxpmn/FGyaQRA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dzAcGMQcH+kUPJRhrjoPLzjYwdJ4llREaR2qmtNDeMuzWwo91s6oTUVLS0v6w9XZW
 gNmDTAzkDkd7/c71sVFmYe6abQ1FtM1EOru3t3YKkp1+qSFkxewtCGetX9u6oPTJL+
 OO4wmXunnVJenVdsHBWcM10guFvNDIbC2fZU5xemWsIHndrEF3C8lRa0Cd+KfplrJ5
 OniHva99lxkCVo4ckVxEF6d2KtY4MevImm4tCyt2ziTvQ6m09raThMLm5BEXkE8b2t
 XXdoMqd0/zWhVjNlPZ7K/zjziTH1K0QiRDpdoiDFbxn0KHg4uPih0emSk/Y0Vwf9LZ
 lJANTLQ3B7Zdg==
Received: by mail-ej1-f72.google.com with SMTP id
 k12-20020a170906680cb02905aeccdbd1efso2495821ejr.9
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NMKQ8HC+F1mFEutTPt5SprtiqsXf0Joxpmn/FGyaQRA=;
 b=NcwdFEeFAODfdtNIx4puyqwnsGZrsyFtRefZQHKrEDd5Oc5C2Ipr3JufWuzU7AVWH+
 lr7RV7ZHKVEnimDY61W7JuHKQHkKe2lgKNbD0sqwORr0L9zK20r5u86r2LehxMZ9e6G+
 38L2qKxzJvUmQLU8LSIic0it1AD25UQKTBs1KwVlQjtLcgm9Bloabnt7HctFtMOjjJ/5
 mtNOzexCTQewCcUwBq4CjY1iW1fTe1LD+ba3l5OtjDBbrWXyHCysPJ1d5X4+CaaQC91q
 jbYNpHuqRxDlS6PzVjg2eIgZ1CADJaqStdZu+pWsVPLQjkBomG5YHYtBQOIt4jiVc79I
 8laA==
X-Gm-Message-State: AOAM533o97uGpx9vOTJnKbtc+ULixuWnvC7+Z4+K1b6Hoo1n+w7ie8cB
 GlWRwaJT+LG1AY7I1ckSXzEtPYt/EASOloE9nMFKjS6SDpR3h11QzSNrTAecIzvF+W1Wcy2zMu6
 gnvfk5nHbn/U4UHLu/UnlwiCyLnrflDOw5X2qOHk5guc=
X-Received: by 2002:a17:906:6ad4:: with SMTP id
 q20mr17321652ejs.433.1629392362663; 
 Thu, 19 Aug 2021 09:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTiHUoNITAHW6eENhh9K7MzzNuKTjMUdplkoqS0IOpq6oP+UAyQaSufFwMawL/9lYJf9kFuA==
X-Received: by 2002:a17:906:6ad4:: with SMTP id
 q20mr17321630ejs.433.1629392362524; 
 Thu, 19 Aug 2021 09:59:22 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 4/5] riscv: dts: microchip: add missing compatibles for clint
 and plic
Date: Thu, 19 Aug 2021 18:59:07 +0200
Message-Id: <20210819165908.135591-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095924_670527_4A654900 
X-CRM114-Status: GOOD (  14.44  )
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

The Microchip Icicle kit uses SiFive E51 and U54 cores, so it looks that
also Core Local Interruptor and Platform-Level Interrupt Controller are
coming from SiFive.  Add proper compatibles to silence dtbs_check
warnings:

  clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'canaan,k210-clint']
  interrupt-controller@c000000: compatible:0: 'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'canaan,k210-plic']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index d9f7ee747d0d..6f843afacfad 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -161,7 +161,7 @@ cache-controller@2010000 {
 		};
 
 		clint@2000000 {
-			compatible = "sifive,clint0";
+			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
 			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
 						&cpu1_intc 3 &cpu1_intc 7
@@ -172,7 +172,7 @@ &cpu3_intc 3 &cpu3_intc 7
 
 		plic: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-			compatible = "sifive,plic-1.0.0";
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <186>;
 			interrupt-controller;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
