Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0BFC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:08:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30584603E7
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30584603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aH0TW4GP051xovS1+Y4IOlmVYiaoXjxMKkshcNFi58=; b=LSMgqa1E7bsHUu
	Bsz7uVR4D55/dMhAjf/kTPSCbPK5nO9QFFtUWInlQEsBWrPGBL7CjIbgnADPVdrsQwDhYx2hwBIfT
	xyFc/imkLhZC35+VwNnVaBYdRLYam3jf8KscI7zRDEgNHa9yjo3ZyxiiOZR3QFj6d22dHkeIuhBaL
	U9Y+X6bjxlUWoqcwlzNmJhs6vXVflI/b+ZIsBYJ1RdWaHcc+h2ncc3dafYBD25mo8Mqe1ynkvMdow
	SPi72bUYlP52W/a97UVY+sb0q/fwWoPzZqhvmQg6DTZWkxNsiuFFKswtZbfG/W000gx7CyOxhtfGs
	/u5X9S5iFWZmhTUm8heQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFoWI-000n2t-CM; Tue, 17 Aug 2021 02:08:03 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnw0-000gyM-II
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:37 +0000
Received: by mail-lj1-f170.google.com with SMTP id i28so8907896ljm.7
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTCou3UurEHV7YLdOGz19ZZUGkyul1DSrpGiIEhL7OQ=;
 b=oZOWmSQ6Yi/kpa5FA17tchIXai6cZ6FYXfi5VUcDWhbSwAt1HSWn008MgM/aiICsg8
 zHM1PvsZHwO2A3BGEfjuiklVFkD7GHeU6PGa/lQRRBon8BE3ugSrQd82YHE3DZgJEzVf
 AqC7Kas9Ry7PlGhUKUxjswrs2FoHfOCkiB3lgxkPFblOe9m6Ww+4c+RF6E0fHmRtyKtA
 +LkOFOQGIKphhmvQ5rwUGitl/Z8mtfKwiV8NnTSzBUVP6inaNczYN81VEktoGAtsNKH+
 zlBj9IkOQgExUC/AYQtAPz6whT8Hpvd8Mmw6aTrIIGSmnFvVfJJCKiYtfPZZP7aM1e0i
 y5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTCou3UurEHV7YLdOGz19ZZUGkyul1DSrpGiIEhL7OQ=;
 b=czKudDtIpnh4mdCWIv6xGdfQ+e/WSFO16IC0bl10+o/qSCFSrhMdCQjCqSTy4Iqzo/
 7TOgUjBCpKV5+BqTKdv9VNRWWGRzn/AcMcx1PmtCbUCmQ6a1v1WYoqlE9+vDCPPweNO2
 ParxUuyweg3xrBH76OvRf826cvAa58PK/DeHw7jVjv23g02jy3qWZ8LvOAo3GGiZdwN1
 ZhSroPuOTcVTMCXO+eDHqdoGzvlN0IntlIGogs9Jjbcn2xR23Z/d8DZ7A6QaGQxVwU56
 h5Yqyr9PzyXUuzeers5XDagseYhGYJkqvRAU85ycYz+q0cofkVX3ogNpyYNroxfleKlI
 EUAw==
X-Gm-Message-State: AOAM530n8eHGy6LFHUQpQNb8Mh39s8AiUdcoEKbt39Hw3LTNr0M8NYEP
 dGMJwwWEn4eb7evaVGylfbM=
X-Google-Smtp-Source: ABdhPJwmXv43Hy5YpglFUbKUv/JYz+Oo4m0Sl5Pv0TPgaWv+ts8g0lRrsP7oeNzONedoSB1l81a35Q==
X-Received: by 2002:a05:651c:160f:: with SMTP id
 f15mr859411ljq.43.1629163830104; 
 Mon, 16 Aug 2021 18:30:30 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:29 -0700 (PDT)
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
Subject: [PATCH v8 24/34] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Tue, 17 Aug 2021 04:27:44 +0300
Message-Id: <20210817012754.8710-25-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183032_671926_2FAD0DD2 
X-CRM114-Status: GOOD (  12.03  )
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
