Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51757C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 18:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C20610A3
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 18:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16C20610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PBFDgboV8FBZYyDjb5a7G86ZOlykRPb1A3qV5WEDfBk=; b=4s5qkwVmlfM4e+
	stmicARRDa2nkJ0y0aIkXdmc49ZFiLn1agNAXAIqwU8C8YzNnUd9tcr1jHx04IFgpssdGITP0GCWC
	iG69ygI1gITzINr44zKi3I4WT42bkHOK2HZAsEeOlYtouj4igBgMF5giUSpJqa/gDtndb5Ts4l7Si
	6+x/Zf4wfoCbOvZm6bONtTrBKznFcUTPXTZ/kCAciOmtIjsGqP3/FOgJgsMRULOrKgd1N5k0wn2mN
	Tj1jMUQeyo+ZE8h2dBLCjkNyXQlelCQnuYL4wGTL+03vpFPxWK7b5PRijjn+GC1avJLZifN7bXOAw
	bW530MADi3cquhHMZCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGmiP-009EPi-Rm; Thu, 19 Aug 2021 18:24:33 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGmiM-009EOP-UU
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 18:24:32 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso9783630ott.13
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 11:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7GBCrlPlIAYPwIdLvhGbvnnMA1dA6OvJWkR1OBYxuOU=;
 b=DnfAVV/cDa0765fLOu8KNKMx5tIoTC///Wm01gwxg+LEA23wZETY3BTL9jDXZf1iEv
 FYinlYN0lcK3T3g6aLMran5ZQ9KrG6QAFg4HAWh/kiLPoUrL1pARK2qFHdyU+uAqpUwK
 BP8CeDFa4Qb4RdlLtzn4xeK2JZaTiiFH7vdLeqqIMwMDbxIcl8KF4cGqMAHdsOZmoU0z
 WrTKbTh6PhADvN0wdY/zD2s+tW5d7nArUxlPrQ+2Oea9juAdMiHk8CRhtADYkV9y1kXc
 QtHD3NMKUxcSaEfzrvERCkC6pSA4EfcF5tOFIW/d7BN6kjMoDt4uh3oGAsPFL+pMGeQC
 mUJw==
X-Gm-Message-State: AOAM532IXrXFT7Xek+tA5hCbtkvF0ZGbwV2sESMQux0OL8/9m9iE2luD
 KwJdUoDJgOQ3lrVyVqGGJQ==
X-Google-Smtp-Source: ABdhPJx8zX7MSvGJdiiQY8ESE/dX0vB5LTQHwN8XfJfBqFUreSSEhSDxtstCwt/cvM1ZNsLtAW3Ibg==
X-Received: by 2002:a05:6830:2709:: with SMTP id
 j9mr13012959otu.147.1629397468887; 
 Thu, 19 Aug 2021 11:24:28 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id v126sm629856oig.2.2021.08.19.11.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 11:24:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] dt-bindings: mtd-physmap: Add 'arm, vexpress-flash' compatible
Date: Thu, 19 Aug 2021 13:24:27 -0500
Message-Id: <20210819182427.1175753-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_112431_005136_143F72CA 
X-CRM114-Status: UNSURE (   9.41  )
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

The 'arm,vexpress-flash' compatible is in use, but has never been documented,
so add it now.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 13c29cc91b59..f827984936f6 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -23,6 +23,7 @@ properties:
               - amd,s29gl256n
               - amd,s29gl512n
               - arm,versatile-flash
+              - arm,vexpress-flash
               - cortina,gemini-flash
               - cypress,hyperflash
               - ge,imp3a-firmware-mirror
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
