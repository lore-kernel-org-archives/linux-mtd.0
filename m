Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB59BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8B16109E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF8B16109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ko4KWlDfjGDKekULLuhGy/AHk2lf1/RJfja061ONng=; b=xUR50BSdhvFw/s
	XHeXaAvIJj4bQoYQBaNroYo+Qco5K8ozRzsPOpvh4CFLfXSodq9Kez519qJ63xTM6+EBc+PmJsqWB
	uJWurq3HnVts/Yvl0VXWbEQMyt0FJPsVHkfufx4GaqsnkDWKZF30Ym/WcEs/k3TRETE5kp5TuUw17
	c4xoUmiEzRFEKt0CxP0VlsYoFTRWMMnRsqnWj/Ni2B4DYvHDfESDEhNCq6qXZL1Vyy+Nk0qcLEOY0
	qSfxUffarztKXf9cCWHXd0mU+TM/GHBQIPfbBdMmUqePjDel67IvV1TUJdaWG4rAoFTDuxNOWmq8I
	zci8Os3STEkn4vIJEPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJLu-001m1H-Gy; Mon, 20 Sep 2021 13:28:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJLa-001lsc-H4
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 13:28:40 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5E78240264
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 13:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632144517;
 bh=2AzFw7QWiJnpc3+D+qC2D6oogvLnCMo5bvL1ARpYSXo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=anzmh3cSRjCudH90A+kGAbH1vmtyCsjtCpBL2ZHEwiFVN/Cl1DlpauVE4vdKXqoVX
 jGAXxT0ENP2d+q93N/J1j+H6IPfWmK0e2ZVd2a1dwkmENsrS4QFvkqUF+Io7BYnkeE
 Rz4IMjV0mW3EXkYTpWeY0VTOcVAffgnXFIeRVEW/nhQmn3SttFzV0U2ZDZy+Tnip7y
 oRt4z9p5Axomr9ycQWb6Fvg6TuiIuZLrT0c75WMApT4egIScTd15+JnhzX2U1q5Wgy
 tNifM9INTymniWf1L8IxXlWByBW8vVbi09zZepQF5W6OscgvEb9xAKojKGIMCNvOxu
 GKipzhSRGEIMA==
Received: by mail-wr1-f72.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1036769wrg.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 06:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AzFw7QWiJnpc3+D+qC2D6oogvLnCMo5bvL1ARpYSXo=;
 b=YpOjRgxzjazsrmhx9b0aPql8/E7VUwQDXksVOe3qjOaL8u79bfCnuTb6+UkhmisLa5
 Zu8Zjz1PGJ0y51XB78eZYpFokak9pW4XhhcSsXwsWCYlUHxjB8/Ck9De3i5aTjlhKJi0
 gj8kcdP+nuhIBro2wUVOvWG9tm+/J9OKpVDkhlrvyg6XYOdZI+P2n48G6BSNyrstabEG
 XmNWQWoZpQ58Mt8Y7P1qMVjcN9BKDfLMLCnuVYn5xqgQt5V+Zqe7M4nhBsq0EPNPoDwk
 ojJrOwGU7hfX+B2R0eK4Vw4ZzCA23AXgmGivbVf63Slw9L7ACkfP2Yhs7X4dhImkithX
 B25g==
X-Gm-Message-State: AOAM532MiqenfPzjsV772YoiKVK1aFcC6sgFZ79Yaq9JvP5Yd+PtIzfK
 Y2VKuDxx2ZfVVxpG8lCV65sUqTLMWREHtJpACJ7O/oZxkJz5tNqRoQEJeHNkPkTZG7MINpts3Zm
 iK95gA70xBwe+vrFSQBq2nfBNyu2Akh+fIM+yGQTdORg=
X-Received: by 2002:a5d:5981:: with SMTP id n1mr28699579wri.82.1632144517092; 
 Mon, 20 Sep 2021 06:28:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSiSdjOviE8uDI2M7ioL6Ah/Ji7EmmwwgOyGTiKDoQWzfexMbXalZc9SNAB0GLcwen2n3+kg==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr28699554wri.82.1632144516917; 
 Mon, 20 Sep 2021 06:28:36 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g1sm45429wmk.2.2021.09.20.06.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:28:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/5] riscv: dts: microchip: fix board compatible
Date: Mon, 20 Sep 2021 15:28:27 +0200
Message-Id: <20210920132830.152802-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
References: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_062838_755240_EB6CF976 
X-CRM114-Status: GOOD (  13.35  )
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

According to bindings, the compatible must include microchip,mpfs.  This
fixes dtbs_check warning:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Use microchip,mpfs for microchip-mpfs.dtsi, suggested by Geert.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 3b04ef17e8da..07f1f3cab686 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	aliases {
 		ethernet0 = &emac1;
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 93730afe6c58..5084b93188f0 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -7,7 +7,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	model = "Microchip MPFS Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	compatible = "microchip,mpfs";
 
 	chosen {
 	};
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
