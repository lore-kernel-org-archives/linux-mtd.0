Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AD6C41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 07:55:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD7020760
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 07:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kKg59+bb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oes1kxMC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD7020760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XT17WC2Jmph6GBKUlwwR3WF7IY4Q/QE5PCTnWJJ3zc0=; b=kKg59+bbI4IbCr0d9lFn7y+LP
	31njSFJ9cEJilAUPpypOUmD7t97ZFFHkKCSEDb+rKmVnPeYcb+tI/t9ric/1RcItJPhRaPVF7vFvB
	uaBLuTchFN1OAfER/q3Lp6YlfUeT88H4RDRvZjVvpkZi8zxvzLCj1eIKJGktzwutkokZClSfbCnU4
	U2MTlWKV8fQgEgnA2p89Ts1e+fQsqxcAB5AEMd74hX3gNAA3eQo38oKpL3RwWuVS6KpRZ3hVQkGyU
	Gf/Xal/+gHiNVgrqUc5X/oetB6FmzE7dYSVuRrf585NkPbfBELAvbXrwlDysdR8M0wGKKnAUmNGBq
	EFDhHCmVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhnr-0002Qt-4d; Tue, 06 Oct 2020 07:54:31 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhne-0002Jl-Ae
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 07:54:19 +0000
Received: by mail-pf1-x443.google.com with SMTP id w21so8537176pfc.7
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2020 00:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Q13U487Cjn/+nOLZsCBKdKKLu22/BXGrY05ryfIEBw=;
 b=oes1kxMCC8je1dieaMVGyJ+c2mM7MFn93B+vWCiUBkL/EvgtDX8MTmTCzeGycxtF0R
 RCTefIVFrP/q8E+f9HXTtp8l3vv30vuiPgccF5IL+8QfE+MxJR8uvvzhcDIkBuTxFail
 EtjmgXQ43yS5Uy0NX6L84iN9LHa14KzE6aI2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Q13U487Cjn/+nOLZsCBKdKKLu22/BXGrY05ryfIEBw=;
 b=E7lCIGXzFrJIoD7RL7KH+0RpzYjZh7xZZ/a/w3j9/E+QTfX0k06q2cBMrJeafcXKow
 9Y90YjtggssKQODNN8crb0Awj6ZOhuHG+TkPOlZGrQhZC6ZKYGC3sKyQK686s0h5gY80
 E33RmSpRmjPLFTI5lu5Jvv3EmwDFijArl3jDivpEFqlMaeGes4ijgEQVmyzb6gV/iUFr
 GnM8LzCnwg+9FI2bGqIsSRdZLuchhHfpLpKto4GoKRCmTEuBqmvbrqco9uWZrU7f5BoA
 wFuEK73zh0HJR9Nuh3IpNtFTNZDQVmj8auycPD77VclMwpsG01Um/QFPXjpf3/wF3Jix
 95hw==
X-Gm-Message-State: AOAM532T1s0m2wbm0bGJaINeF0RHnUXrcsDjthuKvblZ7/6+Z8IqOYkL
 ++gmSn3yk+yomnbNThotsjWObQ==
X-Google-Smtp-Source: ABdhPJwlzXHvhSPQRbddkUP3BLbK8GixVJDMkV84qDw7iNlY99VclXQGU9+CQZVYIPvyq9d9G0DRSQ==
X-Received: by 2002:a62:7894:0:b029:152:279f:5dad with SMTP id
 t142-20020a6278940000b0290152279f5dadmr3541300pfc.67.1601970856096; 
 Tue, 06 Oct 2020 00:54:16 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id r6sm2545147pfq.11.2020.10.06.00.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 00:54:15 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v5 1/4] dt-bindings: spi: add mt8192-nor compatible string
Date: Tue,  6 Oct 2020 15:54:02 +0800
Message-Id: <20201006155010.v5.1.I4cd089ef1fe576535c6b6e4f1778eaab1c4441cf@changeid>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
In-Reply-To: <20201006075405.11658-1-ikjn@chromium.org>
References: <20201006075405.11658-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_035418_421573_9A9E445F 
X-CRM114-Status: GOOD (  11.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add MT8192 spi-nor controller support.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>

---
 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 42c9205ac991..55c239446a5b 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt7622-nor
               - mediatek,mt7623-nor
               - mediatek,mt7629-nor
+              - mediatek,mt8192-nor
           - enum:
               - mediatek,mt8173-nor
       - items:
-- 
2.28.0.806.g8561365e88-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
