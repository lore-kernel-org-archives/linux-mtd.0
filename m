Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039A8C004D4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jan 2023 02:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/TXYI+wbhNUxfT6Scd6irbjwhRHTVm4wW49gKtSQvVM=; b=iLNp3qYNbfV3oF
	UIRAAHfK2YZ5wWnTl1tH74YqE46JborLJEdTs1suy4gGH8Ab8aeGChlhdln3dUm8I0D1/i7czD+Ph
	U3T/wZ1xao094Ovk4HAuO8aw01/TvQKizCK6XEOSwV15B104jgEnDRC7aR9innULTffF7foIG3RqC
	JgFWaHqx4fTer4uiF9UMDS8lAjWPXiLB3iB3nM/DohJMkEVh9oRCBjPJ+sxfo6tm8Bh7kPz9L3/0N
	Vu2o9MKJdyJcGBSdoVwNZzhsOpWIOm3UVrcxNOh3prv4E9Yiu7T7qLzGiEaBISQg3iVMoQGQwJGi3
	E64HcfcUcgo9kgXjA72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIgm9-008089-Qa; Fri, 20 Jan 2023 02:05:05 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIgm6-00806t-19
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2023 02:05:03 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-15f83e0fc63so4727086fac.11
        for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2023 18:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8k15q3/S51QoDxMMcUo+FnVDcwFKQKTHuY334sTG8sM=;
        b=ckfzZCCxCPKKm+0M5Jb7yJWwsss3LHCIhF7ljPz7J/SWHQopwe+eZjU14A2boP8rbJ
         xnnnX01MZSBF2LJGYSGVle/YQRaF+FB9x5v50kDmuvDRJLCZxyW6mPWWsYEgq1FTnQZJ
         tNxqEgf2xG6eESgSlyWRYlGtEUgRCOgLR81elckCO2Ecoz6Rll47fDFhlqb1sKwJjb67
         00JsLDakosAkNRfDyI+JD+S5kkooKZFKuJPN/w3RFUzLw96fca/3WA3xpNpO2aVN3tky
         W3S0a9qUZT7Cou96SdOyD0MhdGNP0MFOViZROgAg7wyKIFURIB0eUXbQqZIK3dnJQIL7
         3yew==
X-Gm-Message-State: AFqh2kq2VkhfGqf1Lim0rIsrlRtNyjvFtBoqiFHo+oloqfOEZuNaAAhI
	Jjvytn3xEco+lp5p9j4oO7sWFhTnhA==
X-Google-Smtp-Source: AMrXdXtGHdJVQiXKyiVSgVhhdZ22Yn5NONpdwcqmKX8L8BuNS1bgHKbQyfrFnZNVH85hwzmWhrkjrg==
X-Received: by 2002:a05:6870:9a88:b0:15e:db7a:cf6a with SMTP id hp8-20020a0568709a8800b0015edb7acf6amr7647755oab.56.1674180299855;
        Thu, 19 Jan 2023 18:04:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a056870f20900b0015f193c86d2sm9507623oao.6.2023.01.19.18.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:04:59 -0800 (PST)
Received: (nullmailer pid 3226249 invoked by uid 1000);
	Fri, 20 Jan 2023 02:04:58 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: partitions: Fix partition node name pattern
Date: Thu, 19 Jan 2023 20:04:53 -0600
Message-Id: <20230120020454.3225796-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_180502_120082_7EF9E9E2 
X-CRM114-Status: GOOD (  10.65  )
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

The 'partition' node name pattern is missing start and end anchors, so
anything is allowed before or after the regex pattern. There's no in tree
users needing that, so add anchors to the pattern.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/partitions/partitions.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 9aca4e6c6047..2edc65e0e361 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -32,7 +32,7 @@ properties:
     enum: [1, 2]
 
 patternProperties:
-  "partition(-.+|@[0-9a-f]+)":
+  "^partition(-.+|@[0-9a-f]+)$":
     $ref: partition.yaml
 
 required:
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
