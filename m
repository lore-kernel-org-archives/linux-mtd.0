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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961BEC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:36:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57BB660E90
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57BB660E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00cXlQxEeO1Umvj+xK84FLsdE+uh7eUNiL9Q7qkRdkg=; b=sluieF7fM/i2ch
	qtKkYDmAZ6fKZ3S1jWrw3K4d6hl7nyly4ktBRftuUPwVGRvRSO4gSMacugGa1WpHOu4MCFyN/P0G2
	cU8+rQkiZft1elqNyPqrrY1xkUsDfZDu3WLiL+ZY0tKQWulZ62qRe961B7I2KaMgyLwaHX31CmVG9
	sCfLQ4vzVQp7xiB4o/ysTHVeFXzCLgPeMrQwnFgkdxgvF1CjDWvrWqJHCs7hvaQoKkUkQzvTtG+Ii
	M5gxbXgOS/qKwwSB2ayLrmSLzSJfryIsJYbwOAKYWQBLUD57lRmloTwegohTNrZY04sKHHHjmdExe
	2UcTVUe7I1qmlhh/7+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFo1M-000ikd-Qx; Tue, 17 Aug 2021 01:36:05 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvh-000gig-L5
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id h9so30219152ljq.8
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l81mhnshT1jOAdUmVwFRhCr1kUhvtG3KJjdpKuzou0A=;
 b=O20xXbpstS1K4NNNeIVcVXjBhGfcu2e5nNEJ5pDBYki1kIj4o5ZYIjru23tbYEGsyz
 r52Hf/+40WfMUNMEhvN72pmXl0XoPmEVNOOv8yUg6XmPcR6PW6ztKlm3dNhyGBEbaa7Y
 r09HKxsCu7pdY4G8ZxhjFl3L8Ms3XExvbjVxLlZReoy9dlFs4piRUc4FJoCVKmVfN6W+
 DvcxU+uSjJq+dyj9XuEHRIqCDane++wPVshyPW0s4dKK/D0v5UTDlCWSDUB7FBD6VcAn
 DSh/YDly+w0E3m8BW/O1X+usNpnRL02EHD/izGWDARukpTDuSfyZm9EWXzEP8jfQItxy
 Nwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l81mhnshT1jOAdUmVwFRhCr1kUhvtG3KJjdpKuzou0A=;
 b=NDbwxcAjzCPrtuRAIUCsBdu+Px6Qigve+cxvLPgvsWlpenQ6W/nS5rT3oNUPf62oDb
 K0C4erRUwsBl0ZXNwr2lUNnIfJ5GuJXK4BF9jDiWfR6ZmGMxMvVwekXcqJU/2z0HxIpy
 egJpNnuegIDfO/wSl6fcUcLUhxcHf/VxmLHhl+B8Rl+X6ZlpmMfsJwtVuqAaBlBT9Ncg
 w//CE7osaw6WKofrFoprUT15qzfaCo3oX0ervC6InS+AAJqDzNTe/4bpa3DdxHGIDH56
 5lwPq4PV58Bu9t0Uyhq3e44j0bHqq3thr3jVXo5X2odXtKpRcM+f2z/s8l/DajLDnwr0
 o8Sw==
X-Gm-Message-State: AOAM53022RTRd5Q0htpp9FicwbaczVgrmZGk9HJXj3hQaady4Mh3WsGo
 asiUMkam5BuuavQj1CRP+O4=
X-Google-Smtp-Source: ABdhPJxhuZkUDfR36UaYb9aumi6B1iVfEXbSXNsdxNHhblZQHD87dEi21/QGQqgVOj5+f/BnA4ZsHw==
X-Received: by 2002:a2e:8147:: with SMTP id t7mr859862ljg.126.1629163812262;
 Mon, 16 Aug 2021 18:30:12 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:11 -0700 (PDT)
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
Subject: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Tue, 17 Aug 2021 04:27:29 +0300
Message-Id: <20210817012754.8710-10-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183013_802128_FC1E4D42 
X-CRM114-Status: GOOD (  12.81  )
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

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..07a08653798b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -18,6 +18,7 @@ Required properties:
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
+  - mc
   - host1x
 
 Optional properties:
@@ -197,6 +198,7 @@ of the following host1x client modules:
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
+    - mc
     - 2d
 
   Optional properties:
@@ -222,6 +224,8 @@ of the following host1x client modules:
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
