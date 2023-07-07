Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07780C0015E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rcOI/9lZFPmUxKcE3ii+7r0FlfKwVfCVF3NiiDMOX4k=; b=o1As/N3Ev5QyIE
	JLsQTLYEZb5/pfKD0Yw95Aqjiamr9S+zFxMQ0/ZY6BNR0kcBvX4c/auPmJpo0aLqLjfM0AKkO2e0t
	rv/2N57sdcTg2lourPbiXoD8YEdKQNlctc6T8BoqWQ6140o0/upYma9pNJ7M+mwgiaGoeQlU3ar71
	I/FNNxkZbVLac5qODePfRICd0hWX1DRTxb2IcjiwI4VlWKdM17bX0jGH5Yqjh98bEU7yuMZEpXFG3
	tHg65MlhVzBiXqVbtwDmxferNqrQZu12HTwvA1V17YQmdUSylgkvoopQu6m4xbYi/PyslOMLkrbqv
	BAbFSC8a6uFksksKg5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpTs-005KsQ-37;
	Fri, 07 Jul 2023 17:42:56 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpTp-005KpL-1m
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 17:42:54 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so33269991fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2023 10:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688751764; x=1691343764;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4fZInERUKONwLi7zatknNO9EBrKc4pjofSBjBTHI78=;
        b=LKK3/g4N2YDcUoL/gcfmYOOFibmW32lGjMDwtZfUpkQb4d5QkumrPEDDdcWDxAXyff
         GSYkofjekTcVmQJqsWeXPnf31sFR+yvx2WA4QoRm4JcI1eiyuk7TDHyhpKN8bmNZUAfU
         dyqvMemhrEbqFC0uVI0ji526W+z4zO0YhgpZ0AtRSqZlt9L4Iu6mjUzt0m/2n5ayVwAM
         xuG1l6aGc96v1IKvAYkpzDyUQcZ45urQJ/JMC6iNFZBGTti0q3eBIqxGPwTeV3UpS2lZ
         bedzee52f8hRYxuEpK8RThS7+r5UaBU9wzISW222mnzAzyPLz5is3Ko2vTwx3y8cIExz
         rzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688751764; x=1691343764;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4fZInERUKONwLi7zatknNO9EBrKc4pjofSBjBTHI78=;
        b=HtbzTCWzXmGgGvMvlh7ChnU6ntfu7CAftpiVzSZfns56ksDJwtvaYGIEVuYxbeyCUc
         c98y7LUEyi9O67sceMJ9atN/sfzQHR63wbP+40Ym3M88GLvqeLGNIDxk4rS9eTzhY6bk
         ABcwU4n6vjzvnOAUVgMdMLy2+F6G9N9yNkgikTA76phMOG58bUlCRZzUig8GhR51kv7J
         TjHyN4ky4mBsuPcolJ6ig0mRQxe/xKOUoWd8LGN5lT9oFPnSFGWTTAu0ZZ+4KC5IauZS
         0rhH0hHI8ItlN1rj9J+OkLpDJUvQYAeyRduXq4bJuyXC5F/wWKZxu1S1HUhX6KFq25jU
         pD6w==
X-Gm-Message-State: ABy/qLaJ16UX48gNsC5x7VioN96H/7djqZIgv/dlmTSQt/Es1M/QnIwP
	lKz27Z6cscz2INS/o5WK/U2jbQ==
X-Google-Smtp-Source: APBJJlEVWutgSf46RQehJdflVv4IEPBh7sz0Sbpk7yxaz30bxgEKIBPMlVyTVpSLJ1R6/S8rCCEoYg==
X-Received: by 2002:a2e:9959:0:b0:2b6:d495:9467 with SMTP id r25-20020a2e9959000000b002b6d4959467mr4095870ljj.6.1688751764652;
        Fri, 07 Jul 2023 10:42:44 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 7-20020a05651c008700b002b6ece2456csm859163ljq.121.2023.07.07.10.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 10:42:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] (no cover subject)
Date: Fri, 07 Jul 2023 19:42:39 +0200
Message-Id: <20230707-seama-partitions-v3-0-6aa9391b46bb@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI9OqGQC/32NQQ6DIBBFr2JYl2ZAUemq92i6GBSVpAUDhrQx3
 r3gxjRpuvwz/7+3kqC90YFcipV4HU0wzqZQngrSTWhHTU2fMuHASxBQ06DxiXRGv5gldQNVNQf
 GGiVlK0iaKQyaKo+2m/Lw6Ofn7PVgXrvvdk95MmFx/r3rI8vXP6bIKFDRQo0D0xV2zfVhLHp3d
 n4kmRb5QWhA/CDwRJB9WckBeoHqm7Bt2wcx6HmeEAEAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_104253_610961_FDE3D95B 
X-CRM114-Status: GOOD (  10.21  )
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

This type of firmware partition appear in some devices in
NAND flash, so we need to be able to tag the partitions
with the appropriate type.

The origin of the "SEAttle iMAge" is unknown.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Drop reference from partitions.yaml again
- Drop select: false
- Use unevaluatedProperties
- Link to v2: https://lore.kernel.org/r/20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org

Changes in v2:
- Make the binding clearly childless
- Link to v1: https://lore.kernel.org/r/20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org

---
Linus Walleij (2):
      dt-bindings: mtd: Add SEAMA partition bindings
      ARM: dts: bcm5301x: Add SEAMA compatibles

 .../devicetree/bindings/mtd/partitions/seama.yaml  | 48 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  1 +
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts      |  1 +
 3 files changed, 50 insertions(+)
---
base-commit: 035cd1416934ef7ae5374272d3c9e378c3d7049c
change-id: 20230506-seama-partitions-b620117b9985

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
