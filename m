Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E9DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyjdwVFZyHtbHscoU38dkbmDs5wZ5S+ibC/4SFbI0Y8=; b=m534drqU3/geFu
	9Na9G6Mz+AJelrrMELNG5TSBL+Cdi07xfklf56l6O5ICBImiHVDTow4bbZsVM6dWApmJujAWrHf0U
	C5CuyjVDDnXi1SsYEEh9uYvV0b2+N692bqZ34YJ/ZilYMaR5sPTH/dU4L4zUxcHFP3Ag1VqB+1SLR
	xTTIJpCoC4byoxBcO5JlXYe7DSsrfZRopu2AIMl77kxsCeBbzJZVqT5mn/Y4CuDyS+GGBzzwDBJ2g
	wuUjTjvPJvQtPBoxSJbbOpK+GQrxkssev0RlUtGWRWXPxxHQIshwPCqotbCjVATrzGKr3WYkRYHx0
	J/DzhDQh+My8P8/h3ZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqcSk-008arm-Ud; Mon, 16 May 2022 15:16:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqcSh-008aqc-6L
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 15:16:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id f2so13978746wrc.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2022 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVTQV5qHFuS0fcvSzFn/v1hK/N8SUy19AKXaGffwBSA=;
 b=KPemaBxWuVQ1rIAYWCVKXov/MCUd6HPBKz48HsgUTARmkggURV/6FOUEN70Xrh5Cov
 x9V3oZZU90H8pIedbzSyfsdvlBgDzVVGgmnyOrkDaBq7/xRjfxy4V0ic/6qKuZYO3bVP
 n+kTTCzDe5p+EaYxj8rgrefMu2D3B73l0zreudUuikf/Fgc5sPKsNSD/wg1kfnJTSUlo
 jwiIZudrpm37w3pJhw21p9c9Ir9i4Ht7oGAdw7nTBxhBvxt/3aKkdx8R/ExtFonQ7LLd
 kJVwBFdwPRFNP6d/gwi3r3vO68PcENpQW+cUZoi+6GiuVnU0JZ471me5KwyV4Ir4/pKN
 ai+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVTQV5qHFuS0fcvSzFn/v1hK/N8SUy19AKXaGffwBSA=;
 b=yVMfiaaEcAOfL9xuUEpibslfkZ8lkqtrW7hy//0LbHwRI73N762vHay5IQkByQc25e
 ZlKjUREiucc08c/uTCU8kN4hh+d1Mlfl8JgYZULEVXuYAaEcz9j+CE4zM5CiyIJLaH6a
 B+kk2iWSU6xnYE//asp3ZyTZpIzWdbIm3CvVGh3aimHwUtWFPSFgRuq7lOMzxyr3SjgB
 QD+WdBwvtVuqsoAhq83rs4qL9bB8RuFwYCfObaHUcLbJ3RRHR4uf2edZLyUBSMODLjRj
 en71NgYqsnz1+6y1Rv5IA3nxoCtNZgbyOlJlVMYQ4FpjEGSFEijdkxYMJxi5ruxFULkA
 Y5zw==
X-Gm-Message-State: AOAM5335u5iH7Qo41Aan0J6TDGmBxynWKTbJ0OH/0/8Gn2C/0WKhwI7l
 U4isskDn5I+nfnkb6WAg1QM=
X-Google-Smtp-Source: ABdhPJxE9JtdUShgYIcnY1MFsx4Ht/U1EUsaWSRetqNMiwbSzplE/vRPXAOT20I3A8TbSfY1ue4ZAw==
X-Received: by 2002:a5d:4c4e:0:b0:20a:d006:79f8 with SMTP id
 n14-20020a5d4c4e000000b0020ad00679f8mr14099904wrt.600.1652714201691; 
 Mon, 16 May 2022 08:16:41 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a003:501a:a7ce::887])
 by smtp.googlemail.com with ESMTPSA id
 r5-20020adfbb05000000b0020d00174eabsm6418438wrg.94.2022.05.16.08.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:16:41 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: Add Sercomm (Suzhou) Corporation vendor
 prefix
Date: Mon, 16 May 2022 15:16:37 +0000
Message-Id: <20220516151637.885324-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516151228.885222-1-csharper2005@gmail.com>
References: <20220516151228.885222-1-csharper2005@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_081643_274710_54D1878E 
X-CRM114-Status: UNSURE (   8.41  )
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

Add "sercomm" vendor prefix for "Sercomm (Suzhou) Corporation".

Company website:
Link: https://www.sercomm.com/

Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..65ff22364fb3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1082,6 +1082,8 @@ patternProperties:
     description: Sensirion AG
   "^sensortek,.*":
     description: Sensortek Technology Corporation
+  "^sercomm,.*":
+    description: Sercomm (Suzhou) Corporation
   "^sff,.*":
     description: Small Form Factor Committee
   "^sgd,.*":
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
