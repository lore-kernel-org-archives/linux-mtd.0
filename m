Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FCCC38142
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+6GPFk+e7oQPhuk9jl4w0wnx5rrfHAnhjw285sONhc=; b=VyYIFAxS4C6unu
	HQ12qNcj0+Hpld6KpWA6gram91GV02FKSVnmyeg87tyRxvOQhtV4cY8HV1beMnYGNmbEzI3lQhyY2
	wZgo8pFXn1sLVijIlH6PC8SJdYgnRBoZmalhBZgQm5B742RwtM1enY0yZgNWE0mfCg0n0XGWkv5f7
	dKoGhGVAEdIuajqy5s0iXoFJ75/gfYBoHwywPNWuNTH773OKn6tREdxINt3nWqhdI+bGSoRM09rLy
	daz9ataUOfuqi8r3oiOYZ0km7JJ3f2vVcD6D4SCUkQCTGmoM3uxQyidrvexKWq2HOOuwnfycaKVpp
	+xJgppMGJroGK2hfWukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLA1-00Dhmk-UT; Fri, 27 Jan 2023 09:36:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLL61-00DgFI-Ch
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2023 09:32:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so2989966wms.2
        for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYlyM6cSaKQ/uUkz/YEasKsMqzXxdWTQoyVNRCFZpLU=;
        b=HPbrPcaeE6aOk8pV/mFPNOoURR1ALIlUrtscI7xLlC7PsHF78Ze3s5Lf/T69U7XYfZ
         zPt7E1oCtuEFplHecvHSRt9kaWf13/d4VwAgpLn3w+DwevDheuR0eTeJ2lzhrwSeuTU2
         RgGKqLlEljMqYv+lsdcdnMPRVHzGFZwGNM1RnlVaaCQw9txB0Sajk628xpKABUsdRwep
         8myyh94Jo9wXSuAUhKeNth7mcgszq7zvnidxnAdQnHpnNtTpFL1yTcva/82FCGblWx7m
         vTeUlF7WRaTzcepsjZfhydotPDegyzeQjRAGek9hzDgkvtxhbEkYwam9TbGqnQBKoJPK
         Ivkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYlyM6cSaKQ/uUkz/YEasKsMqzXxdWTQoyVNRCFZpLU=;
        b=34faip4TisKUeneV1Sr+ixEbNbQMqz8yUxWv6IKJoOjbu9gtT6GSRM9rvT+cr/McKG
         Xo3eAWLACbb2Ffx0pXRmfD6zjj4uZKRug179WOdamzjUf78waAMyQAHjFxK4ucZtGBhf
         rpb+Ooabt6j4GF9LkvxEKX7EtLdgVHYZyea+o9vxRWU5Pjyw4PhWjwjnTI45DyHCt19z
         M7qdiEfKj9Jz5c6hatjQQ8EwqEefTTIBgyfYiyjNZiuhRYYG96G1ulQptS4G9VIyle+q
         roL1uhkbEw9ySxs6RuqwPM0hi5TTZCwzjcPGyWwLc2VjC4ggLqeTaB6JytmFQtaHBbtH
         /ooQ==
X-Gm-Message-State: AFqh2kqL7Uafo2QeAxIgmzvFP8bqZcTWcwBzdB2xWVhiLZjmPIpVLOah
	vb1K9//r1lGtTl6IptqA9AGl5Q==
X-Google-Smtp-Source: AMrXdXvU40EM79mlhyImuiNfOn7AB+1l3xFZ9Wdd8ja5wU7h9w454kh126G7hONXVwS785GL9ObqzA==
X-Received: by 2002:a05:600c:3b07:b0:3d1:cdf7:debf with SMTP id m7-20020a05600c3b0700b003d1cdf7debfmr37448422wms.26.1674811948019;
        Fri, 27 Jan 2023 01:32:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm3795265wmn.19.2023.01.27.01.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:32:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Marek Vasut <marex@denx.de>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: reference MC peripheral properties in relevant devices
Date: Fri, 27 Jan 2023 10:32:16 +0100
Message-Id: <20230127093217.60818-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_013233_499346_4C613EF2 
X-CRM114-Status: GOOD (  10.40  )
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

Several devices can be attached to memory controllers (or memory-mapped
buses), thus they can come with additional controller-specific
properties, e.g. devices wired under Intel IXP4XX bus: cfi-flash,
intel,ixp4xx-compact-flash, NS8250 serial and MAX6369 watchdog.

Referencing Memory Controller or IXP4XX bus peripheral properties fixes
few dtbs_check warnings like:

  intel-ixp42x-gateworks-gw2348.dtb: ide@1,0: Unevaluated properties are not allowed
    ('intel,ixp4xx-eb-ahb-split-transfers', 'intel,ixp4xx-eb-byte-access', ... ' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml      | 1 +
 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml           | 1 +
 Documentation/devicetree/bindings/serial/8250.yaml               | 1 +
 Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml    | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml b/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
index 52e18600ecff..378692010c56 100644
--- a/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
+++ b/Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
@@ -35,6 +35,7 @@ required:
 
 allOf:
   - $ref: pata-common.yaml#
+  - $ref: /schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 5df94953c34e..44cd4476d1d3 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -15,6 +15,7 @@ description: |
 
 allOf:
   - $ref: "mtd.yaml#"
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 2d0cac642427..4aeecd0abb68 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: serial.yaml#
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
   - if:
       anyOf:
         - required:
diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
index ab9641e845db..38079e1b6a44 100644
--- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
+++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
@@ -8,6 +8,7 @@ title: Maxim 63xx Watchdog Timers
 
 allOf:
   - $ref: "watchdog.yaml#"
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 maintainers:
   - Marc Zyngier <maz@kernel.org>
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
