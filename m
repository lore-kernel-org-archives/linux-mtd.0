Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7130D2AB1B
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qU9ujneYwwZbPBABftHFXapbpau5Yrk0HfRTfzvHo20=; b=40V7wYGVK+URTj
	PuRhe43LgnlS407/mq/G2WJOaPHoNEvWUSP84GDxMDOcavYybxXqQ3jzCXMWjqP/1KBwaf4zxXwpm
	AUjVLBRGlqWXTAyNbdi7cZPbxCrHss5LHLZ/ZG5GHeLAoBy1+GZCQyGyFwD92UYzPWDj4puVYbrSc
	/+rQl2GDnPPUe31wAdNV5r2QWz5lGuQs5dDlD8SEy5elYozRXjXQ8SUf3bzlFhi8RorLTip9uiEqg
	Uq+gwJtzyPOImDWh6n+WsHsNy85R31GT7Tc9M1VGpjwtioUXn2T2rDJOMYithR4JIVPCWLmnP6pA8
	/6yetaioaypC8ixFGIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jac-0000000E3bT-1u97;
	Tue, 29 Oct 2024 10:36:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jN5-0000000E119-3BYZ
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 10:22:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d47eff9acso3840730f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730197362; x=1730802162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iku2aazVoaifn2qwZ8do62mCbu6cZo7YQepKnixIbc4=;
        b=mK2QsuJd1oMgViBNvhGnYwEjbD6WESnkZFvQ2vXgItWYJGkIepipRuoYEhY45epAZJ
         VoomZu8bsdZOKh6Lk3auHykLML7KBCKRHOzAx5t7gzVOkcQNY5u41R52lBmvnJ2tEOcG
         pM6nW3Mr6/8K0lFyX1WxRhi8OF8uTs/3ppwJBs7ZGSmGGxpbVFu4/f+5TpWyFVInR6jE
         qNqCVxLYeZwRIe5SzVV8dbQ7bT10XbCqs3zMm3FLGsVD8SjeFqvd3XlJwYYvRyX9BZXt
         T3mnMw7pM6mRhGlHPnvbnffuJP9iqvQHKm5k/0NO5TEj3eGnC20JFNjKb54bnAZyEjfq
         B34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197362; x=1730802162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iku2aazVoaifn2qwZ8do62mCbu6cZo7YQepKnixIbc4=;
        b=QSlrElQs35ZdFB+zlVHt3VPf/Aa6GIx1q1CQkmnsbt9bBjFR3gFRQyNzCKSDVpo+9I
         EpWoKoEL6WJQ1bPGmII+NeFvipXMZ/2f3z5V9uNJPFywoYP5nS6AFtLHHBEoy9V6YM1q
         1vJBrP3ao+ut6rRXMPsezLP7PuFPpZ1XjSYz+PDLII3eZk7kPFOGpZW139YTjF5Yqb8H
         RB/zAIqQ+scvpTBp0sfReGzm9MUVDvzViL4arNbL1u5sYn2McwaP/D7DqNRbA8VgCLup
         b1o1xsxKvTFXmWIr03kbOPmjCnspRIEU8PRvcXQayBI06RO61OGc/Rl534vDfhOCZg7t
         frQA==
X-Forwarded-Encrypted: i=1; AJvYcCU6l2F+4vVzy0NkUJB3MJA8qYSTnWxnO9vG5LJdbcBv1yoyVlg8Aym38hm1ec1GnGugDp8aISM4eKg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyhLZ3+k15/pz9KZayXjkDBPeh9BF9UEr+HhTDvLVqz+ucXd5O
	gfObK6chMU3EfNuYL8WxHPU/mTQBFPMvHMgxHA2RglLsG8/7w8vcwjfS0vP1iDQ=
X-Google-Smtp-Source: AGHT+IFJA0rf9yL1/4hL0/WSC0JKP3mxHD/OdeY53wfOUkq+NYJEyeFtfI5Od5uPy5TfvM1U2qN/+g==
X-Received: by 2002:adf:e38c:0:b0:37d:47e2:5e30 with SMTP id ffacd0b85a97d-380611e715dmr8476087f8f.42.1730197362162;
        Tue, 29 Oct 2024 03:22:42 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47a86sm12084498f8f.53.2024.10.29.03.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:22:41 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [RESEND PATCH v4 1/2] dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply
Date: Tue, 29 Oct 2024 10:22:37 +0000
Message-ID: <20241029102238.44673-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_032243_843159_6FF41561 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

From: Peng Fan <peng.fan@nxp.com>

Introduce optional vcc-supply property, SPI NOR flashes needs power supply
to work properly. The power supply maybe software controlable per board
design.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v4: no changes

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..335f8204aa1e 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -96,6 +96,10 @@ properties:
       If "broken-flash-reset" is present then having this property does not
       make any difference.
 
+  vcc-supply:
+    description:
+      Supply for the SPI NOR power.
+
   spi-cpol: true
   spi-cpha: true
 
-- 
2.47.0.163.g1226f6d8fa-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
