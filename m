Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83151C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:33:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E12F20789
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 08:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEDQcCUS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ho/WCQgs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E12F20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JNWypaK2rNnHF3h+chSGZMs0uznRX4Cv27xiq4hqFxc=; b=DEDQcCUSWYGnHxc/70eKIIOkT
	r2Cbe0vKoA954bUa6lJXeFiySf1VxZka4HUZXm1tll3CgngJyAirjXXrpphss3mAfxkuVw4rGw2vE
	DrbUV+4R38jiQu+/hnyAil91SyGAPEjPYYXowZvpXuvQsfMw93yxl4bMzFH3XUwIED/z4ZSMP5pj0
	RW+ObnOCEpJ7DOSxFhtmDMPZ6XIi0GO5nNdamQr9bN9wvRdLjVAGfc1MfBOPbPm+SOPwTXkPYEj1A
	+v6Oc/uCpsPOuUiRY99b4+v7YOLVkfK3fdzmftkAp7APCbg2vHb7m3QKSiK9oCoXCn+2Ll8pyvfNk
	DC2jJc8JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBoa-0008TF-In; Fri, 18 Sep 2020 08:32:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBnr-0008Bo-QT
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 08:31:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id j7so2605259plk.11
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2020 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvN8pxwgE7chvCn8eA4GpYEwznUZIJ/VvKJ2b3Qxwd4=;
 b=ho/WCQgsyP2T8AA27LL0ARkfh0DQbo2WgLWH5gjFVNaznwRwo+t+ptG595Pu6YLKGw
 qhehK+iBJs4G/tcDQjcXcOnFdqIanY7E/JPg24pUtibT4vfys6d71/FmGjVFn0E0Mzgh
 hpmCCmwd6/MU0P3i5PsfOmM00Dv5mJszaEVeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvN8pxwgE7chvCn8eA4GpYEwznUZIJ/VvKJ2b3Qxwd4=;
 b=M43C/x7GuEO1QEuAq42DR2Cnb9DMVLgzGgWFkixTSj7EovQIdbKAhS6vSlLMqBp+PW
 iStwWzB5/tEpJvilzifVJx2tviq96kknFCwj1RJi1Vjp0F+/qQ6P/wPMIY5g9rP03lM1
 Q8B5l6+3u1hvDeEb7K8YkW3u/EpPg/VBY6koNVecGTS3smoSmav/7yvqPgwhoc9sccup
 SgZuWDJW1NXEDopxx4DBrdak0dhTa5Vz2tjOonbFYHVnzwTJJsVX18ezg6U+R5IUJu5R
 lAJh3gw7EeGEgMcyefunGQlPtOyBdumy7waf19yTgjbJCU7v0PRcAOa7X4OH/5p+mi6/
 THFA==
X-Gm-Message-State: AOAM532JtuGrw/9wh6t0nxBYZjJqP/CBqXilq/+faoQK8O+NbYYGiEz8
 Wt8qFY5NcKWhT0Doip/8czOM/Q==
X-Google-Smtp-Source: ABdhPJyawkWvCG6/EAZZzyOFtimPgIC4x1PEVJj+jcavaFIrRX3LyKeVJ3w44lldJhWt/SyimTAQ2w==
X-Received: by 2002:a17:90a:764d:: with SMTP id
 s13mr12124753pjl.58.1600417893754; 
 Fri, 18 Sep 2020 01:31:33 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:33 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: spi: add mt8192-nor compatible string
Date: Fri, 18 Sep 2020 16:31:19 +0800
Message-Id: <20200918162834.v2.1.I4cd089ef1fe576535c6b6e4f1778eaab1c4441cf@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043135_958731_7B4A91F8 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add compatible string for mt8192 SoC.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

(no changes since v1)

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
2.28.0.681.g6f77f65b4e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
