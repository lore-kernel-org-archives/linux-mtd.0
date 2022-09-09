Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600E2ECAAD3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQ8TREVuubpU80AzZaICALkAwOazKrREZb1gxVa15l4=; b=1683mmR4ilhV4x
	mXsqD84B6o2OiByG5LQ6ZDqwVoGrYgiSDTJq6mDKannihusMuh4CbxYGmlcIlaQsvAoEye0x75PGd
	9uD5XZEXHrGxthXHVUIOzIDsSsYJ4voHEXE1vG+T6GV6pJKDp2Pwv5s8ZMUH3CDD9UyXryBz2qrXw
	PAPE3ksyrN6kf00r9el976kwGfadPioahYFtwNHwfdQ6hZs/hNtH7H0KhxcOVVV1MRqNJ1CZculNm
	JFFXqOpTdLaYv5EQUt9jCq7E6PsNKfVV1TCx6adSnDFjsa/U3fGHZ/LwkAcHR23KRfmDzd1hFhoTv
	sOFH8wSd/Qw1TgV5bjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm6Z-003JL1-Dz; Fri, 09 Sep 2022 22:04:07 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4R-003Hrc-9h; Fri, 09 Sep 2022 22:01:56 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lz22so7158014ejb.3;
        Fri, 09 Sep 2022 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=aCUkhjCPKv8heAlooNOpe4JIMarq0xiaCBe6KjrLZV4=;
        b=EHsa2gWl9rcNc3s7TTLzOhBv3nPPoCv1uAixUF+0ckqk88oxO2j2fM/kJtiuEzy9gP
         jGp/iPSdx4taMq42TH1sXqG6aOhprmoXL6KHXZtv6kcA507RXwKqA6XK4QTMyPMm6XBb
         Y0da22uIw5aJfiPs8h8NKkjMkyjGu/QMMZ8PYP09nRXFBDkdeWce+PbnuffrR0r/lj/r
         LhsHfsieXaEorDiO1XaZvNOf6TRn+Wo4c9RuR//Ng1TI1hJ9xKuurokeyEaKSF0yXGca
         W3C0QttL050fmkF6kyFA8anosoYPv63P7pen1YadLoUpCtP2hJykKIIE/rCl7rUbqPmd
         o8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aCUkhjCPKv8heAlooNOpe4JIMarq0xiaCBe6KjrLZV4=;
        b=VjKgAppZrM1nDhfyx36sSyQAiDbq5MpdVV+dDWcgvgpAINihgeTAkxR8ImPPK7J2Gw
         czrMIah6em2VFQT+MR12qKYqLFw1iEhzj2wHJ6WZEaceJrtvFFV/cSb462abVna4UHrY
         +w005VGmBN2WCkkiXnhU+qmnVyXdWqTSBx0axh6jZIR7zXqYk1hendPG/P3YJW3RfzsQ
         B1L7Ex1x2aPkaMudpwmIijFyNyQofthNokAB5O0MliGgGBmuFnl67o88e87dm/r5+Hs5
         B/ZHwmy/7yXbEptlDbYjeeVW31Xfl/0ojlvWVMyJ3ccxoEVVhZSLtI6WzRecRKcXVQTa
         gp5A==
X-Gm-Message-State: ACgBeo3wHcqUHDLOTGQ/saspnEijFpOZMKEh6l6uUWntFO732vXNE67N
	5Wwa9lk/jr8/d/PdeXNB6FM=
X-Google-Smtp-Source: AA6agR4VJJ7NX/xzm7/ibx9Z/C+sYphKP2BcAfKYeR+D2A3OuXvIF9VUtkzELLARQ4rFQj9hPmyAWA==
X-Received: by 2002:a17:906:591:b0:73d:c3ef:84ae with SMTP id 17-20020a170906059100b0073dc3ef84aemr11261317ejn.155.1662760914101;
        Fri, 09 Sep 2022 15:01:54 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906681000b0072b13ac9ca3sm777833ejr.183.2022.09.09.15.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:53 -0700 (PDT)
Message-ID: <faf2b30e-1a1a-0dc1-04ce-f40e5d758718@gmail.com>
Date: Sat, 10 Sep 2022 00:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 08/11] dt-bindings: arm: rockchip: pmu: add
 rockchip,rk3128-pmu
To: kever.yang@rock-chips.com
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, ulf.hansson@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, kishon@ti.com,
 vkoul@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 gregkh@linuxfoundation.org, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, zhangqing@rock-chips.com, jamie@jamieiles.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220909212543.17428-1-jbx6244@gmail.com>
Content-Language: en-US
In-Reply-To: <20220909212543.17428-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_150155_414068_F27A6422 
X-CRM114-Status: UNSURE (   7.46  )
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

Add rockchip,rk3128-pmu compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 5ece38065..f5800f7cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -21,6 +21,7 @@ select:
         enum:
           - rockchip,px30-pmu
           - rockchip,rk3066-pmu
+          - rockchip,rk3128-pmu
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
@@ -35,6 +36,7 @@ properties:
       - enum:
           - rockchip,px30-pmu
           - rockchip,rk3066-pmu
+          - rockchip,rk3128-pmu
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
