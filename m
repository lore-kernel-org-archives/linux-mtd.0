Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02976C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A4F601FD
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3A4F601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=739rU/mG34sNqoisz9ofhHZMs1vtsAMtsYtRfw6RdgM=; b=LYovbEqQ7SqSJm
	8F1IZsbjb6t7G48UZ1BQmR1O0t7gR0Da57nWZbXEAOdUJWxv7CFxb2Q03wINDJl/X4aaLRA0CQGkU
	5G3q8lXiSzzXnTGagu45Jz17CgFWvqE4ymk51Op7os3AQ10T6/RM9KeNjsMg/lsE1/hj7aXOu5+6G
	0uRWbuIuadDh7Hf7txfBvcxQGQkOrfcHAlkEvkme+TqkX0X3iaBADxp9EsceZSP4CWwMVWdHIBHLf
	H5U2NYpmh6ukoQtWC8tuRy7BFTE5gNfOiyVlka0NdrhiqxXsd1ioLNfB6D7CcnmZPO1o7n9H2EONK
	eXRNqlf2yyg2DUr1Jn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlO5-0091F7-HW; Thu, 19 Aug 2021 16:59:29 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO0-0091Ag-Cr
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 16:59:28 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id AAC02411ED
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392357;
 bh=odiP8qNzCjQyM5ut6+4pfn5opT3C8BN5X2IXeYZ+uMg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=qUxHeUdfUp1mJk1cY4Q5crjWDI4pI8nrCrlS3qw3oTeJkyKKwUd127M1HStyo4n3F
 GHmKK+HOm1d7wgqSpCyTCvroLyyr7jL7oyTBSAPk6VHye0tjO8x+LZ4DsG5Mh6/p5t
 9ANMCucPAPk5svp9GxU0FenmoYDkGtXTf4cnLxuPuACopclM7BAKDwhvx+JFdkIwr+
 70V+q6lHxWJJXNm45muB1SyLbX+GF+senolPJcaCswbMNPFE6bQlA2f2H39JkbTRrk
 Td+2z77MUYYVXzsnOT/ANl23RVPB0bJ090VdEo4ezQWEEosauUl9n1wOAFxQ+rtFlQ
 Go3UfKf2iqeKg==
Received: by mail-ej1-f69.google.com with SMTP id
 u23-20020a1709064ad700b005bb12df6cb9so2478517ejt.20
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=odiP8qNzCjQyM5ut6+4pfn5opT3C8BN5X2IXeYZ+uMg=;
 b=dBK57SVWGVkOCtd56imefB2OV8kpYwe0Ot+7lhsbeRrpM0RkqwcPm2lhJwxKtnkUBM
 JOYsAy3AVrsCBWBQ8RQykCtYeDobPwAcNeAu3bM+EW+5ytZVHaA+Fk6aAnMAP2PPVvZc
 bbCx48m2JRBhGebqontMw9vcK6jbpk4Ck1Ik1Qy0k8n3g3SYhPo//CM3OjYzSY8su27z
 pHumPA8zGPbAE9BANBKjctyG+b9YOsAumV00NuqNxFgCooa2ap1yU4jo22Fp56R5UCgG
 VYEBMbicizjlequpZoYObvNzzKUXE7uNSgY1vNBVRGa17S2b48dS+FoUowiQcHXFnJOY
 +fOA==
X-Gm-Message-State: AOAM531/URYckWLz3fCLaN+enYvYbaPK3zpQHnrE0GGNRNtuLPSzIiLr
 /OpLqcjAqrBem7SfrSep3hFjNbVx9qJ3EDWZJgbC45l99UZZNkyun3a2rWcd3B+4oUulhk5ZCpT
 30RyysNHVKQC8TGZoB00Ggo5K3wionWirLHydMF0E3FU=
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr17338217eds.304.1629392357462; 
 Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9NLI19XYdziHhF/9RoSTCqYZEy4vkbe0t27FhZYRkfyGlpzr7xF3AO+fMykRg6cWcoCzMyA==
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr17338204eds.304.1629392357351; 
 Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:17 -0700 (PDT)
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
Subject: [PATCH 1/5] dt-bindings: mtd: jedec,spi-nor: document issi,is25wp256
Date: Thu, 19 Aug 2021 18:59:04 +0200
Message-Id: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095924_637284_6EE728D1 
X-CRM114-Status: GOOD (  10.91  )
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

Document bindings for the issi,is25wp256 SPI NOR flash.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..0db64ac7dc33 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -33,6 +33,7 @@ properties:
       - items:
           - enum:
               - issi,is25lp016d
+              - issi,is25wp256
               - micron,mt25qu02g
               - mxicy,mx25r1635f
               - mxicy,mx25u6435f
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
