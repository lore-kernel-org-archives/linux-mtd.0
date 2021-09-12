Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C6CC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:56:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232E161051
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 232E161051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrIa1uz379D7xGtPyTVk/5JZgjHvd/xajzwA4i2NWLo=; b=tm+iKY4j3lLyn4
	gLuobKfj6AchJqGMDrK/PZOKiaVddnxVouGDSTF2MHTsr0oT4MVcwL7qEW7hRof2Laby2GibMoPJy
	Uees29P34ykwjtjEnp9dU/+kPUM/Vtc4NcOxAReg0atTSZuZD636o8QArtK/i/E56CISfyFlfXgmk
	dh0fsdXGO5VngaoMAiPM3vdEwc77NJNYwNohbMffY8rFZW0IkJY4hDYrRcUKrBsM8SUymT7H44UPt
	fojmJBTeRE9OUI23dI0YH3LyT5tsIc1pToI0Ux856Me+VuLbWuJT+AAOHajqgC15ilhrfMCx9xdEX
	DdVCl3+8bEtdnmfufgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPWVf-00HEYx-7U; Sun, 12 Sep 2021 20:55:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVo7-00H6vb-0f
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id g128so691459wma.5
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4VIKmbdMAsFKCV4yDWvgLSko+6dlgzXMHJz6Zc9RO8=;
 b=WYlYCIHhy2AwhmX7L/AlwoRTFLRNk1Tw8KZ1cNf4Z2BgAk5gJUFFsDyiI8pBahl6s5
 CWTx8U8kQqpUC9d1Kf8UW3oIe3rg5dwKzaXaPmyg7lVuMXIceWpolx5f3LJKPUU87Bod
 3O7Lw+5Tjw2jpvqVMGOGBC9qMPlfztC63JbLV1QRppX1gNBIwTkmSK7wVXdpf2xO/RIR
 mKmyCaWGc1Dt2qQD3YL0XF5a3RJ5eAHEezXtRX5g508Tq82JkTJOiVmuZd4spjcZH8JY
 vwFG+NAvPyDBBTFXNnfKkQuETEecgQZy7+Tuc19oJuaNa11vCKL8YU+lmpseq99X/jCn
 Udiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4VIKmbdMAsFKCV4yDWvgLSko+6dlgzXMHJz6Zc9RO8=;
 b=7n+Cm6SS45B3KoqIpNGiNi3csX4XVamejM6rflO3naaBhnnUufw8pCryAYDZKd0Zis
 6wSm84ZeJqoQXEYumuoHHwPqA2OpCzPgzixWzPbaMAhWQM8e7c2NruXVHMVBXga3EEwR
 7nP2ElCZ1NoQovAJ6ZTf92Nyg7vEdFs5FcSqPNOz1nPDXRNMdONHYseFXKg3pFx5aT3T
 FR1NJ8Ozs1agF6U3kEe4xkDyXVTvJjYNi4Gppig/iSjhfGZh8OmvjDDyCDUk7vVBlGvH
 rooZux6kLky2sdmMvkg3BymLxassWto2sEEPfwgX78XvUTIiRB/1GAQf4518yp8njVrE
 L/cg==
X-Gm-Message-State: AOAM533jqeVFaqqwGMNSdfe3KTocmfGWvpY8Lt5xSTRILLns7805BsxI
 eT3gZbGeU8aQmr4+7vkC9qA=
X-Google-Smtp-Source: ABdhPJwilD7uMmHHQ3Z72aCq5cGCPEr6BZMewoEYkEkrhgvxyF+teVEQagLVBgnOWAIx7IIGBJO7+w==
X-Received: by 2002:a05:600c:4e8b:: with SMTP id
 f11mr7626369wmq.165.1631477429807; 
 Sun, 12 Sep 2021 13:10:29 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:29 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 23/34] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Sun, 12 Sep 2021 23:08:21 +0300
Message-Id: <20210912200832.12312-24-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_131031_193233_189F75E2 
X-CRM114-Status: GOOD (  11.54  )
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

Document new OPP table and power domain properties of the video decoder
hardware.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
index 3b6c1f031e04..0b7d4d815707 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
@@ -68,6 +68,16 @@ properties:
     description:
       Phandle of the SRAM MMIO node.
 
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property,
+      which is a bitfield indicating SoC speedo or process ID mask.
+
+  power-domains:
+    maxItems: 1
+    description:
+      Phandle to the SoC core power domain.
+
 required:
   - compatible
   - reg
@@ -104,4 +114,6 @@ examples:
       reset-names = "vde", "mc";
       resets = <&rst 61>, <&mem 13>;
       iommus = <&mem 15>;
+      operating-points-v2 = <&dvfs_opp_table>;
+      power-domains = <&domain>;
     };
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
