Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E0C30653
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axA3SKXYpu5c0pHMFasdjRIBE4baOsQrNVD/KVtGHhY=; b=w6hd7TBk5CApDx
	qdNoEmT451SI5SiapSlJ1tg1LxqimkGuLCY0WXFadU6ZaYlsCPFCfObS8Z8tjmwUdfzSAUatQV48t
	h2xiPycVPQrsK9+9RwUZYHZyk96EsQ27H7Yhjiuf+PSwvTnPo/GUaG6a8ABOdgw0Wc1tZa/Oc41/E
	FboPcFq0bTOe2R6fYcQ6U+zC+jJxJh+Z8iC3AfVges63Eusi7KE6QJjMKLqeqZ82q4mTaHhv13k8U
	UIuIgMcChaZCuMZicVygn57LRJxBRkxVBO8q24SNNvuu78ELGSECKWlV4TTOP97iEYHP+UwYFiIOd
	/SXs+Go8+VBQKGFDqknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqcs-0000000AkkO-0zqV;
	Thu, 27 Jun 2024 15:01:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqcp-0000000Akie-1kDB
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:01:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a724440f597so695203966b.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500486; x=1720105286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4a6tf/qTdWDt3Tjpej1OobYeqXk77XY7cVTYcp4zK/A=;
        b=n1FPoJyndfhQpnxo0IFhTTswLs/5vlDoDaA4eedVJvYIuAT2YXnLrZliKF9NZno8Ri
         UDHMfe9WDZUbvAX3dNDaI3kFRci49ev0t158Z8TRer40w1wwRDMLLCM/w5hIXAz6NhYA
         6zBEqaYAqI2Oec00hKD5oNyRKhODj/CoTEn+fb3WzVIOjTvN1bdXEroZGQIP01rRO2qj
         2Qh6eNsUYccCCfVQE7MtyPHh+LjNnkdjwnM0z+jW7VGYxD+YUImATfnMi6wWJRiIHrvc
         YE1Ba8ooadEfWkOYUmqvu4udNZtjSKgH/YKDW1Uo3sXRLWdoJXH/yG3NTQUMnUBPQKQN
         EvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500486; x=1720105286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4a6tf/qTdWDt3Tjpej1OobYeqXk77XY7cVTYcp4zK/A=;
        b=W+WagF1D5oEM3kI3lumHkjRJDQrbDQ6SnjARhs9Mmcv41VYOiA8XchW920lQZwRk+5
         vtcpjofOWBTMdey12VEBTeEGvvq0iAP+4GwQTCbkv+6QydQtfCkbeB7trT2kZ5qJ/EOL
         HJUZtyypPfP56ySkJribswBHQiDR7GDydxOZfC0JzVMi322PoGUEu1ceivEDD8geCpck
         w+LJpRi7J43W71gaetASh5zzih1rzfT6M3GFNyXVK3JUZPY+AHAWUZF+F18nKiop957Q
         aNFnSFYyYQ6DJl0OG844QPh9tTJ0qWPzqPoANE0vSkZrfETZE6PlbkrbjV2+AZRBlclr
         R79A==
X-Forwarded-Encrypted: i=1; AJvYcCXr+/QrwPzztAgbOfLpvKJdfD4oobTejGan0YyebJSSywLl0cio2d2N5Akfgd6fBRksuZztObaCutd8yi01b5NlEHgaMsusw+FwlWsdtw==
X-Gm-Message-State: AOJu0YwS9JbX+iwh9NgfWIODpazR/EvPiKNfgz49bpmKFKvhrkrCvxJW
	YSUl6pYxlHlfu80a3XH+4naOvvxqNjhiuVyA8NsB189KDuBFCZy6VWCIw7n+L5E=
X-Google-Smtp-Source: AGHT+IFXCFq1n96sdM+EJa0YoZN/nrFqErXffElfAdyQDTZKHkn50i6FKtEEBJOwTL4yL1Vq+tcklA==
X-Received: by 2002:a17:906:e215:b0:a6f:b78a:b39 with SMTP id a640c23a62f3a-a7245b6dcafmr796279766b.1.1719500484672;
        Thu, 27 Jun 2024 08:01:24 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:01:24 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Patch v5 01/12] dt-bindings: dma: pl08x: Add dma-cells description
Date: Thu, 27 Jun 2024 17:00:19 +0200
Message-Id: <20240627150046.258795-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080127_486787_7361E871 
X-CRM114-Status: GOOD (  12.27  )
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

Recover dma-cells description from the legacy DT binding.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Fixes: 6f64aa5746d2 ("dt-bindings: dma: convert arm-pl08x to yaml")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v4:
- This patch is new in v4

 Documentation/devicetree/bindings/dma/arm-pl08x.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
index ab25ae63d2c3..191215d36c85 100644
--- a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
+++ b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
@@ -52,6 +52,13 @@ properties:
   clock-names:
     maxItems: 1
 
+  "#dma-cells":
+    const: 2
+    description: |
+      First cell should contain the DMA request,
+      second cell should contain either 1 or 2 depending on
+      which AHB master that is used.
+
   lli-bus-interface-ahb1:
     type: boolean
     description: if AHB master 1 is eligible for fetching LLIs
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
