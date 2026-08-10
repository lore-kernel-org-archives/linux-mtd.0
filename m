Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A63C5AD55
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTQg9XdOE8Sj39eLK1fTGB30sQYL6BVbMlLYXQ0Rbc4=; b=omdhW4OvGd6IHD
	f1o6eV3wfiGSZXyclke+1hfmjh5bo270QaX05uXmNztGH+xlj/vXIVu2LqcKK5f+1qMz+/jy/FBrM
	+A+N7bPnjtqkZOTBlRBAAndKfG5QmqDQgAqolxhi9tPjTwBIZNQAHF1vePn8EeSNFDknQiGEObU6V
	vffgdkIoy4JyQ+Rxbeqr8UNhJ/6mBd07c4dJXpof6IiORFjmnN3KyLpQ5/figDSc1Hr1xFB3Jxwvs
	Uip9H0Ro+2i8kukH5UO8HwYl77cmm10TUim7iVgfMntxgSsJ4zo0qDapgOnKN5VQPSFBLlYgJmkn2
	yW5272d4AQb/f281zh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3N-0000000D0Kd-1YG6;
	Mon, 10 Aug 2026 23:05:09 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3I-0000000D0GP-16N8
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 23:05:07 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7ec1e9d3359so187706a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403103; x=1787007903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=U33dNvLqUopn/SKEsYRRhfSYInHXKw3OoIGDgd+9Ubvnq0YrAkNXkirj77v++9ao20
         rC5tkW4v9ePzKwjXLBSvNhmNgAI6SQbJMoAPnQaXcMGVMrOEZi9ifmPb+FSdDYR0JwLy
         3wKlNZfFc0uCWbbFxhLdpoaU7wRD4glr9m2jQ5rnyVlyhy8riANLq7PNRzvCXQW7/ErK
         4KbMuaNMXuH9EIETW3TKrbp72Y0K1OIRdsN8BbWFn124LTMmSV1fUow+Fbzx9WFaMaIe
         rXyzu6q+Q3UcJTSCxovboqh+ziuek3saMv06JwOtkoxn6pEpDk8uKlZFM/kt8eqK3KgA
         auSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403103; x=1787007903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=Q9DBdwPSW2NojASB7vGw3jq2pfctXw+0Ly57U2hYuZQL0Jtzt+x8SNpmVizpl13LzM
         +oYWDtq8i3ikFhNDeSmT4fnSmV0yfOX9q52BaA2yCKxcqLVGFNDz1scyeWZSLhJGOwyH
         jCAFPi/wLOLS6PwBmMD6M75jt6hu4W8MAbLVFCOqhxp+eJWEaAfGN7YVCvsoIboKEWEz
         B0Jql9ZMqg4fkqSpoSepKZ6ciatU6xGBImrtJyxGjVwEQrZgC8UAtQGxcpmJM+aDJKQZ
         FR1PnvmXRIe9fBRI0Xj5Z0K+qmR710QjkwRc1UHEJbTc6me4JyVDLiWAJ2ZNpDET19El
         YHhg==
X-Gm-Message-State: AOJu0YyAsOxTosBxRggRbBrNl09uRfUCQmKuyFymCalncwZQrIK1NiBM
	PDF3vZT905Pv7haWnqdoan6Xqf/VTrWEkkKq+YeHr0I1cbYmHshDTX5f
X-Gm-Gg: AR+sD11HibvENzKnJixj+8px5kKvYkqB2oF1tKZn+MLlG7kjd1TVq4eCjTnNUygqJIh
	hj8h+yvjUkT2SYE+N5p7/KWdLegfG032W4JKTd+yus8a8WJErli1lKcSma1iZUqfypBJp7o8ovQ
	wuHIowi4R1U4CGqvIodthowqsGtzEBqQbqyAhKUkhTlrZet/IgbC1sMq+t5tyzBHz7+P+a+C3nA
	Kb7aQCsWKLlQCD1lK7qkxvClCgDfMAxzeEUPWIWwcRRhXDSMFKj+HjeFsYO3m08csvXDLhKZYaP
	WfE0hj2mqBtwCIJoNuElvfMEhBoAERiw5/likl6Dwhr6cK7ewI2Bv26jHd/0+Ut2pLKoPPpVcdB
	CwVjm71CWtGl7ki790nuzBqcLB3NzsF8RWPTAeh9rJXIx+A1z5BzJkizUxlgXhVIYTYAJdCx8+3
	nqHQVFy8eSIfBzWqEfXgwlGwJlLJUeOAQv6PVy1qVzh9vHCdKpc4F5rqiDmeIujaNyIDJ6k2alb
	Xwqve8UA6u+RJKivXjXx9Vm3Q3V11Wm/AidxJbj5/iKFlFbRBSbGKf9xSg1Ha2zfaVqcpS1/77l
	qOLg49WdqCUaU+mYkR2yBO4+de3taf7DsLMTB6N5pdKXqWETIpcG+5q8d8V4jvfNTqJnmHgAxxV
	h/CuvVRca1yk39Xzw
X-Received: by 2002:a05:6830:4414:b0:7dc:d967:63de with SMTP id 46e09a7af769-7f1e5c98e5cmr32808491a34.3.1786403102967;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:49 -0600
Subject: [PATCH 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-1-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_160504_330342_17DE0D0B 
X-CRM114-Status: GOOD (  11.76  )
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

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property for NAND using the randomized normal-page OOB format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..7eda1275135d 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,15 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Use the Allwinner randomized normal-page OOB format. This enables
+          the controller page randomizer, stores the bad block marker through
+          it instead of compensating the marker so that it remains plain on
+          flash, and selects the controller-specific protected user-data
+          placement used by Allwinner NAND firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
