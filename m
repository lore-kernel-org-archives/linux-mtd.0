Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D5EC001B0
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hx6vAnM9NFXzaVNxIG2d8cwTNio4esfKrDw8xfKn6nU=; b=P6IQh69cj6KOjm
	dKM5kCdGwOv8CQavMV4nfk/5K7nQKyF+08Z9hRQZb7nM57fzbc8XsJQxOql8QX5EF5bpN9XufBb2R
	aJrpTr4rZrfpz1KiCMYUfDal4vSckHWgF0QEYhyUbqIuFLX/LyR1rWgSyfR5cGLaZOsEjDM641QSl
	E354RNufdwfvumaReOY8Y6xYBRXmFPjiUaIBaHPqvfWtj/YYbA1saZvWjyFBfL1KI0r1wisD1HvMq
	gu4h0b91mG483KmpOKIWcnnG6pemSFtGG2b4FLHLS2jjg+P8qhkpiUvlCkVlqjpjrbmFKqnQBCZ1V
	6Mhkp4UYPag1HtnHgurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwEA-001tFK-02;
	Tue, 15 Aug 2023 15:45:02 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwE2-001tAG-2I
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 15:44:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso4126365a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692114292; x=1692719092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA3Mv4UUYDYTKgE8UCN4QVB+ZNunBcvwuNsqlG0Ry6I=;
        b=h5y6LkHH29JJACtPuQFK+ju2t31IHklluAmYjRYh+fL6/vBj+dpbjjuFRH8RzgIJHv
         3faXyzAfONVk56VELK7VOhWcS75QSQVePJqTrDnoseYSMoP59ZrBg7pQiCt5m+WhUOND
         X4HwAb1pEVkyNSyfcuE/NYTOB8f6VL515hgrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114292; x=1692719092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EA3Mv4UUYDYTKgE8UCN4QVB+ZNunBcvwuNsqlG0Ry6I=;
        b=gHPkup50zL4hNyrDFgsO/AVSmaRB3O9cKHNGQd7mDiqB34nlVCi0WJRdKHDvk6AR4x
         7+PdWakcQKWUMh01FtLyNYuotDZe2MRoTVAj4BhrI8ahAmLTTQYwD3XHVmLLJoX652dk
         wVe3bEqJ4G/bhUAGxz6Ux5RKLq2f7V1IlqiZXI1MRrPFR4gSJ7xbu8rRVotaYlNC9tR3
         mlkOtV7Jlk55gnOVwaev4CqM4cJ9+PZfI16Yej0j/PqPcHcLFpTzOU+VC87KPRNl0CJe
         VBZVX1sKidJ2is9WWNFcAEIqfPjtYDocTCqOklbVo9EXhAeTrpVcgW4BB8pS+iu1Xncz
         EOnA==
X-Gm-Message-State: AOJu0Yxay5j//wb6iUaP0c1jucIHNYDOH/P3nqDfcmLSy/VEWnryhal3
	sDrDcT+GkuIECgTE/+TT+6fraw==
X-Google-Smtp-Source: AGHT+IFHXM2ifH0wB+IAbVqCwTi6GeJTVYyJNT05exRF3SZCQx7y2NkW6qKN3fV/cPF4uLvnwxcLEg==
X-Received: by 2002:a05:6a20:1052:b0:12f:dc31:a71e with SMTP id gt18-20020a056a20105200b0012fdc31a71emr13176557pzc.56.1692114291736;
        Tue, 15 Aug 2023 08:44:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40cf:3807:f8c8:2d76])
        by smtp.gmail.com with ESMTPSA id n13-20020aa78a4d000000b0065e154bac6dsm9431247pfa.133.2023.08.15.08.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:44:51 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	"Miquel Raynal )" <miquel.raynal@bootlin.com>,
	"Richard Weinberger )" <richard@nod.at>,
	"Vignesh Raghavendra )" <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add disable-quad-mode property
Date: Tue, 15 Aug 2023 23:31:52 +0800
Message-ID: <20230815154412.713846-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230815154412.713846-1-hsinyi@chromium.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_084454_755215_F6D194D2 
X-CRM114-Status: GOOD (  11.17  )
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

Some flash devices, eg. gd25lq64c, enable quad mode by default after
spi_nor_parse_bfpt(). However, the systems using these flash devices may
required the quad mode to be turned off for using write protection or to
avoid a potential short issue[1].

Add a disable-quad-mode property in devicetree that system can use it to
override the quad mode status parsed from BFPT.

[1]
https://www.elm-tech.com/ja/products/spi-flash-memory/gd25lq64/gd25lq64.pdf
page 13

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 58f0cea160ef5..4cf1da1108500 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -72,6 +72,13 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
+  disable-quad-mode:
+    type: boolean
+    description:
+      Some flash devices enables QE bit after BFPT is parsed. However, some system
+      may required quad mode to be disabled to use write protection. This boolean
+      flag is to override the quad enable status parsed from BFPT.
+
   no-wp:
     type: boolean
     description:
-- 
2.41.0.694.ge786442a9b-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
