Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C721C47080
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:12:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 576E461005
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 576E461005
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1NpRtqR/uCT2DYLbYJiJjX1EMxaZkXXyNgnu+6tMIo=; b=pDPyqmQNwQmcV4
	cwFcI1FTrMwjBR3vs86COl7hUYC6k+M26OkDDuvd3h8bYdFGnFVe6FhPqGc5Iiwgn62imgr+CSfHo
	TsvKRPN6OiAyH5mAwJXAAbtiuqUFBEptgnX2Ms8IaAHJs253dRxmhfNV7XR++5QfptkrWAxtoC141
	GO8n8cuyAlJMsz4Ka1T2oXeKXuysoCWYx1xYn5o6uBUlFlWLtu99H2hd7mEwd7rmq6NMA3/FLPUDt
	Bkb+FY5y14Oi68zQgxF77xWlQmv6Clt/cydBdAu0cLXlwzXVmSMs5fGp2F4Ac3yFy5KBE+Zoq8BFc
	wJgzeUgR2TIMfRmUFAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loAjc-000i3v-3w; Tue, 01 Jun 2021 20:11:32 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loAig-000hew-Si; Tue, 01 Jun 2021 20:10:36 +0000
Received: by mail-oi1-x22f.google.com with SMTP id w127so533467oig.12;
 Tue, 01 Jun 2021 13:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1IlgvnVJwHgpqMHaCMFQfQ+LU3PHCxwl3hNw4XjuSw=;
 b=EeNU8PFN5nikWcHPD/AwUBoiScDgl3EWWa8zrjb9U/cIEJaY/YIDjVHe2I+r9DlqRz
 keTAwHu+jIwm+1KlgwWXVTU6efE2liPqXwTj2+SqgtNecF85PawwDOJ+CD2PnjSEJpRM
 Hho76fCx8UppcH6i+Y2LYtrUGMIZjP6pbStqRwo/EEdDqyYlu03GH4zXLTNpxUu7LpW3
 cMCwetoqLRXuJ3YcBIbMVwMtyek4TGjTprNx8g4DQP4ZLQuip7yEDnnBZ+B9rRavhwOu
 5/OsJ2FecXsBtzrQOa94o9MZDjM+jP+O8QLEcDmgLkduywyVbnLhZPmKjpIWuypuioHy
 ZlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S1IlgvnVJwHgpqMHaCMFQfQ+LU3PHCxwl3hNw4XjuSw=;
 b=KrG5xiR8V2rRVrUyYU4WsDOOmsiCxw68iYKVEcI8gyKgGFi/IOiQDa4SNsbFbSY8Gm
 NgqLa7dVLhVSa2ItfLYLMpV8V3S/+TU5fgD7SntU+lX9WuK5kbijjjRwgpZ7ZL1zXp5L
 zYRk4sOyaL2iYzmFnLK14REejspvGyikgqrIHS1Gd4bcO54rBoXVPruYK6WgvZVvyy7A
 PVTzM5zHKZbklUYWeyjuz33pdkF9tfk2kA4lw93tDyFBB3zs7raGe4FOrWayru5hAlc9
 ZGk0IR7oiU3MCf3n3BVWUMXXLKxaNe574jyJX76fYa6auUnPxREqcf967LU81nDsjNeH
 VI2g==
X-Gm-Message-State: AOAM531rJUxnrirQKyWuQoCA8je1fXsq4DotLc3SiNvNlFDuHHJbzpul
 6RWbwBr2pdfG8Qpn6iBRAW0=
X-Google-Smtp-Source: ABdhPJz9bgTRA0/4PRS/IEFOuAyN5MObDSPJSbOquTl1lnc/ePqcF0ozUNWfTLHywvolDHjhWICuXg==
X-Received: by 2002:aca:1c18:: with SMTP id c24mr7158644oic.139.1622578234094; 
 Tue, 01 Jun 2021 13:10:34 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id p25sm468118ood.4.2021.06.01.13.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:10:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de, jbx6244@gmail.com,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v4 4/4] arm64: dts: rockchip: Enable SFC for Odroid Go Advance
Date: Tue,  1 Jun 2021 15:10:21 -0500
Message-Id: <20210601201021.4406-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601201021.4406-1-macroalpha82@gmail.com>
References: <20210601201021.4406-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_131034_979142_FA0D99A4 
X-CRM114-Status: GOOD (  10.56  )
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

From: Chris Morgan <macromorgan@hotmail.com>

This enables the Rockchip Serial Flash Controller for the Odroid Go
Advance. Note that while the attached SPI NOR flash and the controller
both support quad read mode, only 2 of the required 4 pins are present.
The rx and tx bus width is set to 2 for this reason.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/rockchip/rk3326-odroid-go2.dts      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index 49c97f76df77..46f1d2f356cc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -484,6 +484,22 @@ &sdmmc {
 	status = "okay";
 };
 
+&sfc {
+	pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <108000000>;
+		reg = <0>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+	};
+};
+
 &tsadc {
 	status = "okay";
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
